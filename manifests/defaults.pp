# == Class transmission_daemon::defaults
#
# This class is meant to be called from transmission_daemon.
# It sets variables according to platform.
#
class transmission_daemon::defaults {
  case $::osfamily {
    'Suse': {
      $repo_names     = [ 'http://download.opensuse.org/repositories/home:/ghostlyrat/SLE_12/', ]
      $package_names  = [ 'transmission-daemon', 'libminiupnpc10', ]
      $service_names  = [ 'transmission-daemon', ]
      $user_name      = 'transmission'
      $group_name     = 'transmission'
      # the current as of May 2015 most popular combined list
      $blocklist_url  = 'http://john.bitsurge.net/public/biglist.p2p.gz'
      $download_dir   = '/var/lib/transmission/complete'
      $incomplete_dir = '/var/lib/transmission/incomplete'
      # blank password
      $rpc_password   = '{f5e73955cc60993887318365ac3cd2fe4db48ef3GVpGdg0B'
      # should remain a string (e.g. "127.0.0.1,1.2.3.4,10.9.8.7")
      $rpc_whitelist  = [ "127.0.0.1" ]
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
