# This puppet manifets optimizes the Nginx to hanlde the concurrency
exec { 'fix--for-nginx':
  command => '/usr/sbin/nginx -s reload',
  path    => '/usr/bin:/usr/sbin:/bin:/sbin',
}
file { '/etc/nginx/nginx.conf':
  ensure  => file,
  content => template('nginx/nginx.conf.erb'),
  notify  => Exec['fix--for-nginx'],
}
