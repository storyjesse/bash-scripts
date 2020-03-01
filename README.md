# bash-scripts
A collection of my bash scripts written for various tasks

[TOC]

- [check_vpn_is_connected](#check_vpn_is_connected)
- [waitforpid](#waitforpid)

## check_vpn_is_connected

I connect to a VPN from my household router. This causes any device I connect to my home network to go through the VPN when accessing the internet. However, my router **does not** connect automatically and when the connection drops out for any reason the VPN connection is lost. I wrote this script to alert me of when this happens so I can reconnect the VPN manually.

## waitforpid

I wrote this script to ensure that some startup applications were not run until other's had started successfully. Such as ensuring that my email client didn't start until AFTER my local email server had started.
