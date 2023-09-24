file { 'Client config':
    ensure => present,
    path   => '/etc/ssh/ssh_config',
    line   => '   IdentityFile ~/.ssh/school\n    PasswordAuthentication no\n',
}
