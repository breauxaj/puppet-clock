tz = '/etc/sysconfig/clock'

Puppet::Type.type(:timezone).provide(:ruby) do
  desc "Timezone control"

  confine :osfamily => :redhat
  confine :exists => tz

  
end