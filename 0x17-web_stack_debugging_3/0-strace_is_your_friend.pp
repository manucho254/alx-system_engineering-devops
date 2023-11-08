# Puppet script to fix Apache, that is returning a 500 error.

exec{'fix-wordpress':
    command => 'sudo sed -i "s/phpp/php/g" var/www/html/wp-settings.php',
    path    => ['/usr/bin', '/usr/sbin', '/bin',],
}
