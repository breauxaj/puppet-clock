define clock::tz (
  $timezone
) {
  if $::osfamily == 'RedHat' {
    file { '/etc/sysconfig/clock':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => "ZONE=\"${timezone}\"\n",
    }
  }

}
