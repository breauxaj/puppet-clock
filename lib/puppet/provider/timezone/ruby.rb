Puppet::Type.type(:timezone).provide(:ruby) do
  desc "Timezone control"

  confine :osfamily => :redhat


end