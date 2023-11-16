# fix Too many open files error nginx

exec {'fix--for-nginx':
  command => 'sudo sed -i "s/nginx.pid;/nginx.pid;\nworker_rlimit_nofile 300000;/"',
  path    => '/usr/bin:/usr/sbin:/bin',
}
