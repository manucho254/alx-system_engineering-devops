# Kill a process named killmenow

exec { 'kill process':
    path    => ['/usr/bin', '/usr/sbin'],
    command => 'pkill -15 killmenow',
}
