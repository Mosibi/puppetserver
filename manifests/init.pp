# == Class: puppetserver
#
# Full description of class puppetserver here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the function of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'puppetserver':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class puppetserver (
  $packages_required         = $::puppetserver::params::packages_required,
  $puppetserver              = $::fqdn,
  $environment               = 'production',
  $java_min_memory_heap_size = '2g',
  $java_max_memory_heap_size = '2g',
) inherits ::puppetserver::params {

  if ( $domain == undef ) {
    fail('Please first fix your domain name, it is empty now. Hint: DNS or /etc/hosts')
  }

  class { '::puppetserver::install': } ->
  class { '::puppetserver::config': } ->
  class { '::puppetserver::service': }
}
