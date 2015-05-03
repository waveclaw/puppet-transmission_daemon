# == Defined Type transmission_daemon::repo::yum
#
# This class is called from transmission_daemon for setup of yum.
#
define transmission_daemon::repo::yum {
  $repo = regsubst(regsubst($title,'/','_','G'),':','','G')
  ensure_resource('yumrepo', $repo,
    {'ensure' => 'present', 'baseurl' => $title })
}
