# == Class transmission_daemon::config
#
# This class is called from transmission_daemon for service config.
#
class transmission_daemon::config(
  $config_file_source       = undef,
  $config_file_content      = undef,
  $config_file_template     = undef,
){
  $_config_file = '/var/lib/transmission/.config/transmission/settings.json'
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
  if $config_file_source != undef {
    file { $_config_file:
      ensure => file,
      source => $config_file_source,
    }
  } elsif $config_file_content != undef {
    file { $_config_file:
      ensure  => file,
      content => $config_file_content,
    }
  } elsif $config_file_template != undef {
    file { $_config_file:
      ensure  => file,
      content => $config_file_template,
    }
  } else {
    file { $_config_file:
      ensure  => file,
      content => template('transmission_daemon/settings.json.erb'),
    }
  }
}
