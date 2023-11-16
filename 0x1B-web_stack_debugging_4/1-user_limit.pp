# fixing error in user opening files

exec {'change-os-configuration-for-holberton-user':
  command => 'sudo useradd -m holberton',
  path    => '/bin/:/sbin/:/usr/bin/:/usr/sbin/',
}

# Increase hard file limit for user holberton
exec { 'increase hard file limit':
  command => 'sed -i "/holberton hard/s/4/100000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}

# Increase soft file limit for user holberton
exec { 'increase sof file limit':
  command => 'sed -i "/holberton soft/s/5/100000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}
