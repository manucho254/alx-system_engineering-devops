# create file tmp

file {'/tmp':
    mode    => '0744',
    owner   => 'www-data',
    group   => 'www-data',
    path    => '/tmp/school',
    content => 'I love Puppet';
}
