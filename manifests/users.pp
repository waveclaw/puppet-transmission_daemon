# == Class transmission_daemon::users
#
# This class is called from transmission_daemon for pre-install user setup.
#
class transmission_daemon::users {
  group { $::transmission_daemon::group_name:
    ensure => present,
  }

  user { $::transmission_daemon::user_name:
    ensure           => present,
    comment          => 'Transmission daemon',
    groups           => $::transmission_daemon::group_name,
    home             => '/var/cache/transmission',
    password         => '!',
    password_max_age => '-1',
    password_min_age => '-1',
    shell            => '/bin/false',
  }

  Group[ $::transmission_daemon::group_name ] -> 
  User[ $::transmission_daemon::user_name ]
}
