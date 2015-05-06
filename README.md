#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with transmission_daemon](#setup)
    * [What transmission_daemon affects](#what-transmission_daemon-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with transmission_daemon](#beginning-with-transmission_daemon)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Install Transmission-daemon, part of Transmission from [https://trac.transmissionbt.com].


## Module Description

Configures and runs the transmission-daemon bittorrent service with a web UI on port 9091.

## Setup

### What transmission_daemon affects

 * Updates /var/lib/transmission/.config.

### Setup Requirements 

Requires access to a package repository containing at least version 0.21 of transission-daemon.


### Beginning with transmission_daemon


## Usage

Accepts various default overrides in hiera or as parameters to the base class.

 * repo\_name - list of repositories to pull packages from
 * package\_name - list of packages to install
 * service\_name - name of services to start
 * user\_name - the user to setup everything under; defaults to 'transmission'
 * group\_name - the group used for the running user; defaults to 'nogroup'
 * blocklist\_url - a URL to obtain new blocklist files; defaults to the biglist.p2p archive on bitsurge.net
 * download\_dir - where to keep downloaded files
 * incomplete\_dir - where to work on partial files
 * rpc\_password - the RPC password is one is used
 * rpc\_whitelist - a whitelist, defaulting to the IPv4 localhost address, for accesping connections

The rpc\_whitelist must contain the IP address of desktops, laptops, server or other systems that want to use the Web UI.  This is a comma-delimited string value in the configuration file but conversion from array is handled by the module.

The two download directories are forced to be absolute paths from the filesystem root.  No elipsis shenanigans allowed.

For more configuration details, consider providing a custom configuration file.  See [https://trac.transmissionbt.com/wiki/ConfigFiles] for the configuration format.

## Reference

Contains

 * repo - custom repositories for obtaining packages
 * user - customizable users and groups for running the service
 * package, config, service trifecta as expected fo a service module

## Limitations

OS Comatibilty is currently limited to Suse family (SLED, SLES and openSUSE).

## Development

Apache 2.0 licensed. Forks welcome.  Contributions more welcome.

## Release Notes/Contributors/Etc 

See CHANGLOG
