+++
title = "Learning About Man-in-the-Middle Attacks with a Raspberry Pi"
date = "2020-12-31"
categories = ["Web"]
+++

## Setting up the Raspberry Pi

I download the Raspberry Pi image from [the official site](https://www.raspberrypi.org/downloads/)

I followed [this article](https://www.raspberrypi.org/documentation/configuration/security.md) to add some reasonable security to the pi.

Since I've installed the firewall ufw, I'll be allowing SSH, HTTP and HTTPS with the following commands

```
ufw allow SSH
ufw allow HTTP
ufw allow HTTPS
```

## Configuring the Raspberry Pi as a Gateway



## Installing MITM Proxy

```
apt update && apt install mitmproxy
```
