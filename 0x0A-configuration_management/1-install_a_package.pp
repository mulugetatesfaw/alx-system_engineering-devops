# install puppet-lint -v 2.5.0

exec { 'flask':
  command => '/usr/bin/apt-get -pip3 install flask flask_restful -v 2.5.0',
}
