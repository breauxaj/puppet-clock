require 'fileutils'

lt = "/etc/localtime"
tz = "/etc/sysconfig/clock"
zi = "/usr/share/zoneinfo"

Puppet::Type.type(:timezone).provide(:ruby) do
  desc "Timezone control"

  confine :osfamily => :redhat

  confine :exists => lt
  confine :exists => tz
  
  puts resource[:name]
  puts resource[:utc]

  # update the clock file with settings
  #if resource[:utc]
  #  File.open(tz, 'w') { |file| file.write("ZONE=resource[:name]\nUTC=resource[:utc]\n") }
  #else
  #  File.open(tz, 'w') { |file| file.write("ZONE=resource[:name]\n") }
  #end

  # copy the timezone to localtime
  #FileUtils.cd(zi) do
  #  FileUtils.cp resource[:name], lt
  #end 
end
