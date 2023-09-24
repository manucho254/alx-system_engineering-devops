
file { 'Client config':
    ensure => present,
    path   => '.ssh/config',
    line   => '   IdentityFile ~/.ssh/school\n    PasswordAuthentication no\n',
}
