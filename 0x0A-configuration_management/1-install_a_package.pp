# install flask -v 2.1.0

exec { 'flask':
  command => '/usr/bin/apt-get -pip install flask -v 2.1.0',
}
