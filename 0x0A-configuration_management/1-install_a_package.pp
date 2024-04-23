#!/usr/bin/pup
# Install a specifc version of flask (2.1.0)
package {'flask':
	ensure	=> '2.1.0',
	provder	=> 'pip3'
}
