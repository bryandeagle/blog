+++
title = "An Overview of the HTTPS Protocol"
date = "2020-08-14"
+++

## How HTTPS Works

Type facebook.com into your web browser, and you'll see a little lock appear to the left of the URL. That lock means you are using *HTTPS* and signifies that your connection to facebook.com is secure.

Using HTTPS over the older, not secure, HTTP has two benefits:

1. The website your browser is talking to has proven itself to be facebook.com and is not just pretending to be.
2. The communications your browser sends to the website are encrypted so that no-one except your browser and the website can read them.

Those communications can include usernames, passwords, credit card numbers, and other critical information you wouldn't want in the hands of anyone but the real facebook.com.

## Ensuring Identity

Your browser trusts that the website truly is facebook.com because it has presented us with a *certificate* stating it is facebook.com. If you click the lock on your browser, you can view it yourself.

"But why should you trust that certificate, you ask?" Great question. Because, like real-world certificates, someone you should trust has signed it.

Inspecting facebook.com's certificate shows that DigiCert signed it.

"Hold on. Who is DigiCert, and why should I trust them?" you ask. Another great question. I like where your head's at.

Digicert is a *Certificate Authority*. That means they are an organization able to sign certificates to prove that they are valid.

I trust DigiCert because Microsoft trusts them, and because I run Windows, I have no choice but to trust Microsoft. Because Microsoft trusts DigiCert as a Certificate Authority, Windows trusts certificates signed by DigiCert.

You can view this information by searching for **Manage computer certificates** in your start menu. From there, click on **Trusted Root Certification Authorities &raquo;  Certificates**, and in that long list, you should see DigiCert.

Microsoft also publishes the list of Certificate Authorities [here](https://ccadb-public.secure.force.com/microsoft/IncludedCACertificateReportForMSFT). On that page, you can find DigiCert as well.

And so that's the chain of trust. You trust Microsoft because you run their operating system. Microsoft has said you can trust what DigiCert says. And finally, DigiCert has said, you can trust the server you're talking to is facebook.com.

You can rest easy knowing you're not sending private information to somebody pretending to be facebook.com.

## Ensuring Privacy

Even though that's the real facebook.com, who might be able to intercept those communications and read your private data? That's an easy enough question to answer. On Windows, open up a command prompt and type:

```
tracert facebook.com
```

On Linux or Mac OS, type:

```
traceroute facebook.com
```

That command displays all the intermediate servers your communications go through before making it to facebook.com. Each line is a different server, and the first line is likely your router. 

Each item between your router and facebook.com is another server capable of reading all the unencrypted information you send to facebook.com. That can sometimes be dozens of servers that are not you, or facebook.com, in a position to read all communications between you and facebook.com.

## Upgrading to HTTPS

I hope you understand the value that HTTPS provides and the meaning behind that little lock symbol. There's really no downside to using HTTPS, so you should try to use it everywhere it's available.

How did it know to use HTTPS and not the regular old, unsafe HTTP when I typed in facebook.com?

Not all websites support HTTPS. So, when you type in facebook.com, your browser requested the HTTP version of facebook.com (http://facebook.com). Facebook's servers then responded by redirecting you to the HTTPS version of the site (https://facebook.com).

If you care to inspect the network traffic, you can see something like what's shown below. That's facebook telling your browser, "We support HTTPS, and you're going to want to use that instead of regular old HTTP."

```
General
  Request URL: http://facebook.com/
  Request Method: GET
  Status Code: 307 Internal Redirect
  Referrer Policy: no-referrer-when-downgrade
Response Headers:
  Location: https://facebook.com/
  Non-Authoritative-Reason: HSTS
...
```

That's very nice of Facebook to be looking out for my privacy and security. But we should be taking this into our own hands, and not depending on websites to upgrade us to HTTPS, and encrypt our communications.

Enter HTTPS Everywhere.

## HTTPS Everywhere

[HTTPS Everywhere](https://www.eff.org/https-everywhere) is a Firefox, Chrome, and Opera extension that encrypts your communications with many major websites, which makes your browsing more secure.

By using HTTPS Everywhere, you can rest easy knowing that your browser is doing everything it can, upgrade communications to HTTPS wherever possible, and not depend on websites themselves to secure communications.