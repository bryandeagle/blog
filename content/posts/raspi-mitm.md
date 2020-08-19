+++
title = "Man-in-the-Middle attacks"
description = ""
draft = "True"
type = ["posts","post"]
tags = [
    "https",
    "personal",
    "web"
]
date = "2020-12-31"
[ author ]
  name = "Bryan Deagle"
+++

## Getting a raspberry pi together

Download the Raspberry Pi image from [the official site](https://www.raspberrypi.org/downloads/)

## Securing the Raspberry pi

Follow [this article](https://www.raspberrypi.org/documentation/configuration/security.md) to secure your raspberry pi.

If you've installed ufw, you'll want to allow HTTP and HTTPS.

```
ufw allow HTTP
ufw allow HTTPS
```

## Installing MITM Proxy

```
apt install mitmproxy
```
