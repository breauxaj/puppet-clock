define clock::tz (
  $timezone
) {
  file { '/etc/sysconfig/clock':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "ZONE=\"${timezone}\"\n",
  }

}
