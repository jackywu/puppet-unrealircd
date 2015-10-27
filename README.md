# puppet-unrealircd
=======
# unrealircd

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with unrealircd](#setup)
    * [What unrealircd affects](#what-unrealircd-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with unrealircd](#beginning-with-unrealircd)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

A puppet module including RPM pre-built packages for installing UnrealIRCd 4.0.0-rc1.

## Module Description

This module will install RPM pre-built packages in `files` directory to `/opt/unrealircd` and copy configuration file to
`/opt/unrealircd/conf`, init.d file to `/etc/init.d/unrealircd`.

You can install UnrealIRCd by one shell command.

## Setup

### What unrealircd affects

* This module will automatically create a system user `irc` and group `irc`
* and Bring up service automatically under user `irc`.

### Setup Requirements

No requirements.

### Beginning with unrealircd

1. install puppet on your system, and run these command under `root`, because you will install RPM package to your system.
2. mkdir ~/puppet_module; cd ~/puppet_module
3. git clone git@github.com:jackywu/puppet-unrealircd.git
4. cd ~
5. puppet  apply  --modulepath=puppet_module/ --verbose -e "include unrealircd"

## Usage

`include unrealircd` in your `node.pp` file.

## Limitations

only supoort CentOS-6 and CentOS-7 x86_64 system.

## Development

contribute https://github.com/jackywu/puppet-unrealircd

