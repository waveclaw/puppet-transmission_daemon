# == Class transmission_daemon::config
#
# This class is called from transmission_daemon for service config.
#
class transmission_daemon::config {
  $_dirs = ['/var/lib/transmission/.config/transmission',
    '/var/lib/transmission/.config/',
    '/var/lib/transmission/',
    $transmission_daemon::download_dir,
    $transmission_daemon::incomplete_dir,
  ]
  $_blocklist_url  =  $transmission_daemon::blocklist_url
  $_download_dir   =  $transmission_daemon::download_dir
  $_incomplete_dir =  $transmission_daemon::incomplete_dir
  $_rpc_password   =  $transmission_daemon::rpc_password
  $_rpc_whitelist  =  join(flatten($transmission_daemon::rpc_whitelist), ',')
  File {
    owner  => $transmission::user_name,
    group  => $transmission::group_name,
    mode   => '0750',
  }
  file { $_dirs:
    ensure => directory,
  }
  file { '/var/lib/transmission/.config/transmission/settings.json':
    ensure  => present,
    content => template('transmission_daemon/settings.json.erb')
  }
}
