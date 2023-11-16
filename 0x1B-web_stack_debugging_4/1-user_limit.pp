# fixing error in user opening files

exec {'change-os-configuration-for-holberton-user':
  command => 'sudo useradd -m holberton',
  path    => '/bin/:/sbin/:/usr/bin/:/usr/sbin/',
}
