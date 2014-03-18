class clock (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'tzdata'
  }
  
  package { $required: ensure  => $ensure }

}
