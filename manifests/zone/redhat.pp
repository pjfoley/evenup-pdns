# == Define: pdns::zone::redhat
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
define pdns::zone::redhat {

  include pdns
  Class['pdns::install'] ->
  Pdns::Zone[$pdns::zone::name] ~>
  Class['pdns::service']

  $file_ensure = $pdns::zone::ensure ? {
    'present' => 'file',
    default   => 'absent'
  }

  file {
    "/etc/pdns/zones/${pdns::zone::name}.zone":
      ensure  => $file_ensure,
      owner   => 'pdns',
      group   => 'pdns',
      mode    => '0444',
      source  => $pdns::zone::source,
  }

  concat::fragment{"${pdns::zone::name}_zone":
    ensure  => $pdns::zone::ensure,
    target  => '/etc/named.conf',
    content => "zone \"${pdns::zone::name}\" IN { type master; file \"/etc/pdns/zones/${pdns::zone::name}.zone\"; };",
  }
}

