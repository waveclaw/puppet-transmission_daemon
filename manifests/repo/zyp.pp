# == Defined Type transmission_daemon::repo::zyp
#
# This class is called from transmission_daemon for setup of repos.
#
define transmission_daemon::repo::zyp {
    $repo = regsubst(regsubst($title,'/','_','G'),':','','G')
    ensure_resource('zypprepo', $repo, { baseurl => $title })
}
