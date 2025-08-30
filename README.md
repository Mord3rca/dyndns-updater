# DynDNS-updater

A BASH script to update a DynDNS entry

## Installation

Run `make install` to install everything in your system.

If you want to use this script without installing it, use:
`LIBPATH=lib/ ./dyndns-updater`

## Usage

Run `dyndns-updater` script.

Default configuration path is located in **${HOME}/.keys/dyndns** but can be overwritten by *SECRETFILE* env variable.

**SECRETFILE** must contain the following variables:

* DYNDNS_PROVIDER
* DYNDNS_HOST
* DYNDNS_USER
* DYNDNS_PASSWD

## Supported DynDNS

List of supported DynDNS provider, will expand following usage / need.

* [OVH](https://www.ovhcloud.com)
