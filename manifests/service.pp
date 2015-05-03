# == Class transmission_daemon::service
#
# This class is meant to be called from transmission_daemon.
# It ensure the service is running.
#
class transmission_daemon::service {

  service { $::transmission_daemon::service_names:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
