# Increase the ULIMIT of the default file

# Increase the ULIMIT of the default file
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => ['/usr/local/bin/', '/bin/'],
  unless  => 'grep -q "4096" /etc/default/nginx',
  require => Package['nginx'],
  notify  => Exec['nginx-restart'],
}

# Restart Nginx
exec { 'nginx-restart':
  command     => 'service nginx restart',
  path        => '/etc/init.d/',
  refreshonly => true,
}
