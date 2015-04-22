Exec {
  path => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin'
}

# By default all nodes will use the 'node default', but if in a
# special situation it is needed to bypass this default node definition
# (so it is possible to exclude roles::common) or for other situations, you 
# can/should specify a node definition for that certname/fqdn in
# /etc/puppetlabs/code/manifests/<fqdn>.pp
#
# Example:
#   cat /etc/puppetlabs/code/manifests/my.node.tld.pp
#
#     node 'my.node.tld' {
#       include some_class
#     }
#
#     or..... if you also want the 'default'...
#
#     node 'my.node.tld' inherits default {
#       include some_class
#     }

node default {
  include roles::common

  # First we check if role exists.
  # If the role is "none" or "CMDB_ERROR" we notify you.
  # Finally if the role is fine we use it to call the class.
  if ( $::role ) {
    if ( $::role == 'none') or ( $::role == 'CMDB_ERROR') {
      notify { 'Warn for odd role':
        message => "Your role is ${::role}, this is not a valid role.",
      }
    }
    else {
      include "roles::${::role}"
    }
  }
}
