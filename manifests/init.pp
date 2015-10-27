# == Class: unrealircd
#
# Full description of class unrealircd here.
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
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'unrealircd':
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
class unrealircd {

    if $operatingsystem == 'CentOS' {
        $package_name = "unrealircd-4.0.0-el${operatingsystemmajrelease}.x86_64.rpm"
    } else {
        fail('only support centos6 and centos7')
    }

    $packages_dir = "/tmp/packages"
    file {$packages_dir:
        ensure  => directory,
        source  => "puppet:///modules/unrealircd",
        recurse => true,
        purge   => true,
    }

    package {'unrealircd':
      source => "$packages_dir/$package_name",
      provider => "rpm",
      require => File[$packages_dir],
      ensure => installed,
    }

    file {"/opt/unrealircd/conf/unrealircd.conf":
      content => template("unrealircd/unrealircd.conf.erb"),
      ensure  => file,
      require => Package['unrealircd'],
    }

    file {"/etc/init.d/unrealircd":
      content => template("unrealircd/unrealircd.erb"),
      ensure  => file,
      mode    => "755",
      require => Package['unrealircd'],
    }

    user {'irc':
      ensure => present,
    }

    service {"unrealircd-service":
      name       => "unrealircd",
      enable     => true,
      ensure     => true,
      subscribe  => Package['unrealircd'],
      hasrestart => true,
      hasstatus  => false,
      #start     => "/etc/init.d/unrealircd start",
      #stop      => "/etc/init.d/unrealircd stop",
      require    => User['irc'],
      
    }

}
