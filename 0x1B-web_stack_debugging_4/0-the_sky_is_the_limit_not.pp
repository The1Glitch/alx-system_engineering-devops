# The function increases the amount of traffic an Nginx server can handle.

# It increaes the ULIMIT of the default file.
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/defalut/nginx',
  path    => '/usr/local/bin/:bin/'
} ->

# Restarts the Nginx
exec {'nginx-restart':
  command => 'nginx restart',
  path    => '/etc/init.d/'
}
