#install nginx
package { 'nginx':
        ensure          => installed,
        provider        => 'apt',
        install_options => ['-y'],
}

# remove hmtl files
exec { 'delete html files':
        command => 'sudo rm -rf /var/www/html/*.html',
        path    => ['/usr/bin', '/usr/sbin', '/usr/bin/env'],
}

# start nginx
exec { 'start nginx':
        command => 'sudo service nginx start',
        path    => ['/usr/bin', '/usr/sbin', '/usr/bin/env'],
}

# defautl html content
file { '/var/www/html/index.html':
        ensure  => present,
        content =>
'Hello World!
',
}

# add error 404 file
file { '/var/www/html/error404.html':
    ensure  => present,
    content =>
'Ceci n\'est pas une page
',
}

exec { 'Remove header from sites enabled':
        command => 'sudo sed -i "s/add_header X-Served-By $hostname;//" /etc/nginx/sites-enabled/default',
        path    => ['/usr/bin', '/usr/sbin', '/usr/bin/env'],
}

exec { 'Remove header from sites available':
        command => 'sudo sed -i "s/add_header X-Served-By $hostname;//" /etc/nginx/sites-available/default',
        path    => ['/usr/bin', '/usr/sbin', '/usr/bin/env'],
}

exec { 'Add header to sites enabled':
        command => 'sudo sed -i "s/server_name _;/server_name _;\
\n\n\tadd_header X-Served-By $hostname;/" /etc/nginx/sites-enabled/default',
        path    => ['/usr/bin', '/usr/sbin', '/usr/bin/env'],
}

exec { 'Add header to sites available':
        command => 'sudo sed -i "s/server_name _;/server_name _;\
\n\n\tadd_header X-Served-By $hostname;/" /etc/nginx/sites-available/default',
        path    => ['/usr/bin', '/usr/sbin', '/usr/bin/env'],
}

#restart nginx
exec { 'restart nginx':
        command => 'sudo service nginx restart',
        path    => ['/usr/bin', '/usr/sbin', '/usr/bin/env'],
}
