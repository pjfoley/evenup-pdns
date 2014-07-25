# == Class: pdns::config::redhat
#
# This class ensures config files are created for the PowerDNS service
# It is not intended to be directly called.
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
class pdns::config::redhat {

  File {
    notify  => Class['pdns::service']
  }

  file { ['/etc/pdns', '/etc/pdns-recursor', '/etc/pdns/zones']:
    ensure  => directory,
    owner   => 'pdns',
    group   => 'pdns',
    mode    => '0555',
  }

  file { '/etc/pdns/pdns.conf':
    ensure  => file,
    owner   => 'pdns',
    group   => 'pdns',
    mode    => '0444',
    content => template('pdns/redhat/pdns.conf.erb'),
  }

  file { '/etc/pdns/puppetdb.yaml':
    ensure  => file,
    owner   => 'pdns',
    group   => 'pdns',
    mode    => '0444',
    content => template('pdns/redhat/puppetdb.yaml.erb'),
  }

  file { '/etc/pdns-recursor/recursor.conf':
    ensure  => file,
    owner   => 'pdns',
    group   => 'pdns',
    mode    => '0444',
    content => template('pdns/redhat/recursor.conf.erb'),
  }

  concat { '/etc/named.conf':
    owner => 'pdns',
    group => 'pdns',
    mode  => '0444',
  }
}
