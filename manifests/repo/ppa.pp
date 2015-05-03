# == Defined Type transmission_daemon::repo::ppa
#
# This class is called from transmission_daemon for setup of repos.
#
define transmission_daemon::repo::ppa {
  $repo = regsubst(regsubst($title,'/','_'),':','')
  ensure_resource('apt::source', $repo,
    {'ensure' => 'present', 'location' => $title, 'repos' => 'main' })
}
