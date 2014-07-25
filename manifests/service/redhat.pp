# == Class: pdns::service::redhat
#
# This class manages the PowerDNS services
# It is not intended to be directly called.
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
class pdns::service::redhat {

  service { 'pdns':
    ensure  => running,
    enable  => true,
    restart => '/etc/init.d/pdns restart',
  }

  service { 'pdns-recursor':
    ensure  => running,
    enable  => true,
  }

}
