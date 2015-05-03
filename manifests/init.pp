# == Class: transmission_daemon
#
# Full description of class transmission_daemon here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class transmission_daemon (
  $repo_names    = $::transmission_daemon::defaults::repo_names,
  $package_names = $::transmission_daemon::defaults::package_names,
  $service_names = $::transmission_daemon::defaults::service_names,
  $user_name     = $::transmission_daemon::defaults::user_name,
  $group_name    = $::transmission_daemon::defaults::group_name,
  $blocklist_url = $::transmission_daemon::defaults::blocklist_url,
  $download_dir  = $::transmission_daemon::defaults::download_dir,
  $incomplete_dir= $::transmission_daemon::defaults::incomplete_dir,
  $rpc_password  = $::transmission_daemon::defaults::rpc_password,
  $rpc_whitelist = $::transmission_daemon::defaults::rpc_whitelist,
) inherits ::transmission_daemon::defaults {

  validate_array($repo_names)
  validate_array($package_names)
  validate_array($service_names)
  validate_string($user_name)
  validate_string($group_name)
  validate_string($blocklist_url)
  validate_string($download_dir)
  validate_string($incomplete_dir)
  validate_string($rpc_password)
  validate_array($rpc_whitelist)

  class { '::transmission_daemon::users': } ->
  class { '::transmission_daemon::repo': } ->
  class { '::transmission_daemon::install': } ->
  class { '::transmission_daemon::config': } ~>
  class { '::transmission_daemon::service': } ->
  Class['::transmission_daemon']
}
