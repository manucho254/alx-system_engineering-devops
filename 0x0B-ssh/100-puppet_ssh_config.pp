file { 'Setup identity':
    ensure => present,
    path   => '/etc/ssh/ssh_config',
    line   => '    PasswordAuthentication no',
}

file { 'Setup no Password':
    ensure => present,
    path   => '/etc/ssh/ssh_config',
    line   => '   IdentityFile  ~/.ssh/school',
}
