# fix Too many open files error nginx

exec {'fix--for-nginx':
  command => 'sudo sed -i "s/nginx.pid;/nginx.pid;\nworker_rlimit_nofile 300000;/" /etc/nginx/nginx.conf',
  path    => '/bin/:/sbin/:/usr/bin/:/usr/sbin/',
}

exec {'Restart nginx':
  command => 'sudo service nginx restart',
  path    => '/bin/:/sbin/:/usr/bin/:/usr/sbin/'
}
