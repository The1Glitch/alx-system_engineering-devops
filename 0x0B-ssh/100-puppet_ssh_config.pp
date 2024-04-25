#!/usr/bin/env bash
# using puppet to make changes to our config file

file { 'etc/ssh/ssh_config':
	ensure => prensent,

content =>"
	#SSH client configuration
	host*
	IdentityFile ~/.ssh/school
	PasswordAuthentication no
}
