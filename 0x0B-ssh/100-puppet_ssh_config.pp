# Create a client configuration

file {'/etc/ssh/ssh_config':
    ensure => present,
}

file_line {'Setup identity':
    ensure => present,
    path   => '/etc/ssh/ssh_config',
    line   => '   IdentityFile  ~/.ssh/school',
}

file_line {'Setup identity':
    ensure => present,
    path   => '/etc/ssh/ssh_config',
    line   => '    PasswordAuthentication no',
}
