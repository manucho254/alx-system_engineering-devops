# fix Too many open files error nginx
#
exec {'update file max':
  command =>  'sudo echo -e "fs.file-max = 100000" | tee -a /etc/sysctl.conf',
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
}

exec { 'fix--for-nginx':
  command => '/bin/sed -i "s/15/10000/" /etc/default/nginx',
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
}

-> exec { 'Restart nginx':
  command => '/etc/init.d/nginx restart',
  path    => '/etc/init.d/'
}
