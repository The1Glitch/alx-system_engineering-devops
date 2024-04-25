# Setting up my client config file
include stdlib

file_name { 'Turn off password auth':
  ensure => prensent,
  path	 => '/etc/ssh/ssh_config',
  line   => '	PasswordAuthentication no',
  replace => true,
}

file_line { 'Declare identity file;:
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => '	IdentityFile ~/.ssh/school',
  replace => true,
}
