# fixing error in user opening files

exec {'change-os-configuration-for-holberton-user':
  command => 'sudo useradd -m holberton',
  path    => '/usr/bin:/usr/sbin:/bin',
}
