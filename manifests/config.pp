class puppetserver::config inherits ::puppetserver {
 file {
    [
      '/etc/puppetlabs/code/manifests',
      '/etc/puppetlabs/code/hieradata',
      '/etc/puppetlabs/code/hieradata/environments',
    ]:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

  file { '/etc/default/puppetserver':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('puppetserver/etc/default/puppetserver.erb'),
    notify  => Class['::puppetserver::service'],
  }

  file { '/etc/puppetlabs/code/hiera.yaml':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('puppetserver/etc/puppetlabs/code/hiera.yaml.erb'),
  }

  file { '/etc/puppetlabs/code/manifests/site.pp':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/puppetserver/etc/puppetlabs/code/manifests/site.pp',
  }

  if ! defined(File['/etc/puppetlabs/puppet/puppet.conf']) { 
    file { '/etc/puppetlabs/puppet/puppet.conf':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('puppetserver/etc/puppetlabs/puppet/puppet.conf.erb'),
      notify  => Class['::puppetserver::service'],
    }
  }
}
