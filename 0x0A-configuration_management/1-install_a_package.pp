# install flask -v 2.1.0

exec { 'flask':
  command => '/usr/bin/apt-get -pip3 install puppet-lint -v 2.1.0',
}
