# fix Too many open files error nginx

exec {'fix--for-nginx':
  command => 'sudo sed -i "s/nginx.pid;/nginx.pid;\nworker_rlimit_nofile 300000;/" /etc/nginx/nginx.conf',
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
}

exec {'update file max':
  command =>  'sudo echo -e "fs.file-max = 100000" | tee -a /etc/sysctl.conf',
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
}

exec {'update limits':
  command => 'sudo echo -e "nginx       soft    nofile   10000\nnginx       hard    nofile  300000" | tee -a /etc/security/limits.conf',
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
}

exec {'update limits':
  command => 'sudo sysctl -p',
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
}

exec {'Restart nginx':
  command => 'sudo service nginx restart',
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
}
