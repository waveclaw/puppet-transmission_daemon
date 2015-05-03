# == Class transmission_daemon::install
#
# This class is called from transmission_daemon for install.
#
class transmission_daemon::install {

  package { $::transmission_daemon::package_names:
    ensure => present,
  }
}
