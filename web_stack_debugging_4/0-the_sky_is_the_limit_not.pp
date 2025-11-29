# Script that fixes Nginx to handle high load by increasing file descriptor limit
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/:/usr/bin/'
}

-> exec { 'nginx-restart':
  command => 'nginx restart',
  path    => '/etc/init.d/'
}

