+++
title = "Hands-On with TLS/SSL Certificates"
date = "2020-08-18"
categories = ["Web"]
+++

## Introduction

In this post, I'll discuss TLS/SSL certificates. To learn more than just the theory, I'll be acting as my own Certificate Authority, which will allow me to generate all the required files for TLS/SSL communication.

## What is SSL/TLS?

SSL and TLS are both cryptographic protocols used to increase security by encrypting communication over computer networks. SSL stands for **Secure Sockets Layer** while TLS stands for **Transport Layer Security**. TLS is the successor of SSL 3.0 and is now the standard (although both methods are still commonly referred to as SSL).

## Becoming a Certificate Authority

### Step 1. Generate a key

```
openssl genrsa -des3 -out ca.key 2048
```

In this command, we're using the **openssl** tool to generate an RSA key (**genrsa**). With the **-des3** option, we're using the [triple DES](https://en.wikipedia.org/wiki/Triple_DES) engine to encrypt the key. This option requires us to use a password whenever we want to use this key, which adds an essential layer of security.

We're telling the openssl tool to generate a key **2048** bits long, and output to **ca.key**.

### Step 2. Generate a Root Certificate

```
openssl req -new -x509 -key ca.key -sha256 -days 365000 -out ca.pem
```

The **openssl req** command creates and processes certificate requests. It can also create self-signed certificates, which is what we're using it for, by giving it the **-new -x509** options.

We're using the **sha256** digest to sign this certificate with our previously generated key, **ca.key**.

We're also making this certificate valid for 1,000 years (365000 days) because it's self-signed, so expiry isn't too important.

Congratulations! You are now officially a **Certificate Authority**.

## Getting People to Trust Your Authority

Being a Certificate Authority doesn't mean much if nobody respects your authority.

The real Certificate Authorities will join, for example, [Microsoft's Trusted Root Program](https://docs.microsoft.com/en-us/security/trusted-root/program-requirements) and have their certificates automatically installed on all Windows distributions.

Because we're just generating these for personal use, we'll have to manually install them on every device we want to trust us.

### 1. Installation on Windows
- Double-click on the **certificate.crt** file
- Click on **Install Certificate…** then **Current User**
- Select **Place all certificates in the following store**
- Browse to **Trusted Root Certificate Authorities**
- Click **Next** and then click **Finish**

### 2. Installation on Android
- Go to **Settings** » **Security** » **Encryption & credentials**
- Go to **Install from storage** and select your certificate
- Give the certificate a memorable name and select **Wi-Fi**

### 3. Installation on MacOS
- Open the macOS Keychain app, and go to **File > Import Items…**
- Select your private key file, then search for the Common Name name
- Double click on your certificate and expand the Trust section
- Change **When using this certificate** to **Always Trust**

```
sudo security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" certificate.crt
```

### 4. Installation on iOS
- Go to **Settings** » **Profile Downloaded** » **Install**
- Go to **Settings** » **General** » **About**
- Scroll to the bottom and select **Certificate Trust Settings**
- Select **Enable Full Trust for Root Certificates**

## Signing Certificates as a Certificate Authority

For SSL/TLS, web servers need two things:
1. A private key, to encrypt traffic
2. A certificate, which serves as a public key and proof the webserver in question owns the domain.

### Step 1. Generate a Private Key

It's helpful (but not necessary) to name the key, and all files we generate, based on the webserver we're running. In our example, we'll use *example.com*.

```
openssl genrsa -out example.com.key 2048
```

This time we won't be password-protecting this key with the **-des3** option, like we did with our Root CA key.

### Step 2. Generate a Certificate Signing Request

Even though we're the ones signing our certificate, in most situations, a different entity will be signing our certificate, so the workflow is:
1. Generate a certificate signing request
2. Fulfill the certificate signing request with our ca private key

We generate the certificate signing request (CSR) with the following command:

```
openssl req -new -key example.com.key -out example.com.csr
```

We'll also need to configure the proper extensions for the certificate to work with most protocols. For that we'll create an extension config file, named example.com.ext, with the following contents:

```
authorityKeyIdentifier=keyid
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = example.com
```

### Step 3. Fulfill the Certificate Signing Request

We fulfill our certificate signing process by generating our new certificate, signed with our Root Certificate Authority key.

```
openssl x509 -req -in example.com.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out example.com.crt -days 825 -sha256 -extfile example.com.ext
```

We should now have **example.com.crt** to go along with our **example.com.key**, which is all we need to enable TLS/SSL on our website. Below is an example of an Apache configuration that utilizes our newly generated certificate and key.

```
<VirtualHost *:80>
        ServerName example.com
        ...
</VirtualHost>

<VirtualHost *:443>
        ServerName example.com
        ...
        SSLCertificateFile /opt/cert/example.com.crt
        SSLCertificateKeyFile /opt/cert/example.com.key
</VirtualHost>
```
