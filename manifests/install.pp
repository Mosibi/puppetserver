class puppetserver::install {
  include ::apt

  apt::source { 'puppetlabs':
    location => 'http://apt.puppetlabs.com',
    repos => 'PC1',
    key => '47B320EB4C7C375AA9DAE1A01054B7A24BD6EC30',
    key_server => 'pgp.mit.edu',
  }

  package { 'puppetserver':
    ensure => 'latest',
    require => Apt::Source['puppetlabs'],
  }
  
  package { 'deep_merge':
    provider => 'puppet_gem',
    require  => Package['puppetserver'],
  }
}
#package {
#   [
#     'puppet',
#     'puppet-server',
#     'httpd',
#     'httpd-devel',
#     'mod_ssl',
#     'libcurl-devel',
#     'ruby-devel',
#     'rubygems',
#     'gcc',
#     'gcc-c++',
#     'openssl-devel',
#     'zlib-devel',
#     'make',
#   ]:
#   ensure => installed
# }
