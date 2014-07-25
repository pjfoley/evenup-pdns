# == Class: pdns::config
#
# This class ensures config files are created for the PowerDNS service
# It is not intended to be directly called.
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
class pdns::config {
  case $::osfamily {
    'redhat' : {
        include pdns::config::redhat
    }
    default : {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
