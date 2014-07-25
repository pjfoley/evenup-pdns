# == Class: pdns::service
#
# This class installs the files and packages needed for the PowerDNS services.
# It is not intended to be directly called.
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
class pdns::service {
  case $::osfamily {
    'redhat' : {
        include pdns::service::redhat
    }
    default : {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
