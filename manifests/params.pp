class puppetserver::params {
  $java_min_memory_heap_size = '2g'
  $java_max_memory_heap_size = '2g'

  if $::operatingsystem == 'Redat' or $::operatingsystem == 'CentOS' {
    $puppetserver_package = 'puppetserver'
    $packages_required  = ["${puppetserver_package}"]
  } elsif $::operatingsystem == 'Ubuntu' {
    $puppetserver_package = 'puppetserver'
    $packages_required  = ["${puppetserver_package}"]
  } else {
    fail("OS family $::osfamily is not supported by this Puppet module")
  }
}
