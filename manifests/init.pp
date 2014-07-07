# Class: clock
#
# This class installs tzdata package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the tzdata package
#
# Actions:
#   - Install tzdata
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'clock':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'clock':
#      ensure => 'absent'
#    }
#
class clock (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'tzdata'
  }
  
  package { $required: ensure  => $ensure }

}
