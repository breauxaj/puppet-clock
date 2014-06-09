require 'fileutils'

lt = '/etc/localtime'
tz = '/etc/sysconfig/clock'
zi = '/usr/share/zoneinfo'

Puppet::Type.type(:timezone).provide(:ruby) do
  desc "Timezone control"

  confine :osfamily => :redhat

  confine :exists => lt
  confine :exists => tz

  # update the clock file with settings
  if resource[:utc]
    File.open(tz, 'w') { |file| file.write("ZONE=resource[:zone]\nUTC=resource[:utc]\n") }
  else
    File.open(tz, 'w') { |file| file.write("ZONE=resource[:zone]\n") }
  end

  # copy the timezone to localtime
  FileUtils.cd(zi) do
    FileUtils.cp resource[:zone], lt
  end 
end
