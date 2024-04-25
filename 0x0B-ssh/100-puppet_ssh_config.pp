# Setting up my client config file
include stdlib

file_line { 'Turn off passwrd auth':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => ' 	 PasswordAuthentication no',
  replace => true,
}

file_line { 'Declare identity file':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => '	  Identity ~/.ssh/school',
  replace => true,
}
