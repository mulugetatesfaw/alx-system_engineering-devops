# install flask -v 2.5.0

exec { 'flask':
  command => '/usr/bin/apt-get -pip3 install flask -v 2.1.0',
}
