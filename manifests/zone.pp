# == Define: pdns::zone
#
# This define installs BIND zonefiles for the bind backend in PowerDNS
#
#
# === Parameters
#
# [*source*]
#   String. Source of the zonefile
#
# [*ensure*]
#   String.  Controls if the file exists or is absent.  Default is present.
#
#
# === Examples
#
#   pdns::zone {
#     'corp.example.com':
#       source => 'puppet:///data/bind/crop.example.com.zone'
#   }
#
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
class pdns::zone (
  $source,
  $ensure = 'present',
) {
  case $::osfamily {
    'redhat' : {
        include pdns::zone::redhat
    }
    default : {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
