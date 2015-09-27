# Define: clock::tz
#
# This define sets the Timezone
#
# Parameters:
#
#  timezone: 
#    Set the host timezone
#
# Actions:
#   - Set the timezone
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    clock::tz { 'default':
#      timezone => 'America/New_York'
#    }
#
define clock::tz (
  $timezone
) {
  include ::clock

  $prefix = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/usr/share/zoneinfo',
  }

  case $::osfamily {
    'redhat': {
      case $::lsbmajdistrelease {
        '6': {
          file { '/etc/sysconfig/clock':
            ensure  => present,
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            content => "ZONE=\"${timezone}\"\n",
          }
    
          file { '/etc/localtime': 
            ensure => present, 
            owner  => 'root', 
            group  => 'root', 
            mode   => '0644', 
            source => "${prefix}/${timezone}",
          }
        }
        default: {
          exec { 'timedatectl':
            path    => '/bin:/usr/bin',
            command => "timedatectl set-timezone ${timezone}",
          }
        }
      }
    }
    default: {
      notify { 'OS not supported by this module': }
    }
  }

}
