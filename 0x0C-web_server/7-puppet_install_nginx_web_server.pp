package { 'nginx':
        ensure          => installed,
        provider        => 'apt',
        install_options => ['-y'],
}


exec { 'start nginx':
        command => 'sudo service nginx start',
        path    => ['/usr/bin', '/usr/sbin', '/usr/bin/env'],
}


file { '/etc/nginx/sites-enabled/default':
        ensure  => present,
        path    => '/etc/nginx/sites-enabled/default',
        content =>
'server {
    listen 80 default_server;
    listen [::]:80 default_server;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

    # 404 error file
    error_page 404 /error404.html;

    location / {
             # First attempt to serve request as file, then
             # as directory, then fall back to displaying a 404.
             try_files \$uri \$uri/ =404;
    }

    location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }
}
',
}
