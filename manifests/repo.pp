# == Class transmission_daemon::repo
#
# This class is called from transmission_daemon for setup of repos.
#
class transmission_daemon::repo {
  case $::osfamily {
    'Debian': {
      transmission_daemon::repo::ppa {
        [$::transmission_daemon::repo_names]:
      }
    }
    'RedHat': {
      transmission_daemon::repo::yum {
        [$::transmission_daemon::repo_names]:
      }
    }
    'Suse': {
      transmission_daemon::repo::zyp {
        [$::transmission_daemon::repo_names]:
      }
    }
    default: { }
  }
}
