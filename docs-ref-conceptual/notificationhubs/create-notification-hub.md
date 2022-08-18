---
title: "Create a notification hub"
description: Learn how this method creates a new notification hub, which contains credentials for the supported Platform Notification Services (WNS, APNS, GCM).
ms.custom: ""
ms.date: 04/05/2019
ms.reviewer: ""
ms.service: "notification-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
author: "spelluru"
ms.author: "spelluru"
manager: "timlt"

---

# Create a notification hub
Creates a new notification hub, which contains credentials for the supported Platform Notification Services (WNS, APNS, GCM).

## Request

| Method | Request URI | HTTP version |
| ------ | ----------- | ------------ | 
| PUT | `https://{namespace}.servicebus.windows.net/{Notification Hub}?api-version=2015-01` | HTTP/1.1 | 

## Request headers

The following table describes required and optional request headers.

| Request header | Description | 
| -------------- | ---------- | 
| Content-Type | `application/xml;type=entry;charset=utf-8` |
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| x-ms-version | 2015-01 |

## Request body

The request body contains an Atom entry with a NotificationHubDescription element. For example:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<entry xmlns="http://www.w3.org/2005/Atom">
<content type="application/xml">
    <NotificationHubDescription xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
        <ApnsCredential>
            <Properties>
                <Property>
                    <Name>Endpoint</Name> 
                    <Value>gateway.push.apple.com</Value> 
                </Property>
                <Property>
                    <Name>ApnsCertificate</Name> 
                    <Value>{APNS certificate in Base64}</Value> 
                </Property>
                <Property>
                    <Name>CertificateKey</Name> 
                    <Value>{APNS certificate key}</Value> 
                </Property>
            </Properties>
        </ApnsCredential>
        <RegistrationTtl>P39D</RegistrationTtl> 
        <WnsCredential>
            <Properties>
                <Property>
                    <Name>PackageSid</Name> 
                    <Value>{PackageSid}</Value> 
                </Property>
                <Property>
                    <Name>SecretKey</Name> 
                    <Value>{SecretKey}</Value> 
                </Property>
            </Properties>
        </WnsCredential>
        <GcmCredential>
            <Properties>
                <Property>
                    <Name>GoogleApiKey</Name> 
                    <Value>{ApiKey}</Value> 
                </Property>
            </Properties>
        </GcmCredential>
        <MpnsCredential>
            <Properties>
                <Property>
                    <Name>MpnsCertificate</Name> 
                    <Value>{MPNS certificate in Base64}</Value> 
                </Property>
                <Property>
                    <Name>CertificateKey</Name> 
                    <Value>{MPNS certificate key}</Value> 
                </Property>
            </Properties>
        </MpnsCredential>
    </NotificationHubDescription>
</content></entry>
```

The endpoint property of ApnsCredential can be either `gateway.push.apple.com` (for production servers) or `gateway.sandbox.push.apple.com` (for sandbox servers).

All child elements of NotificationHubDescription are optional.

WNS, APNS, and GCM credentials must contain all properties shown above. MPNS credentials can also contain no properties, which enable unauthenticated push for MPNS.

## Response

The response includes an HTTP status code and a set of response headers.

## Response codes

| Code | Description |
| ---- | ----------- |
| 201 | Notification topic created successfully. |
| 400 | Invalid request body. The notification topic could not be created because the request was malformed (or the validation failed). |
| 401 | Authorization failure. The access key was incorrect. |
| 403 | Quota exceeded; too many notification hubs in this namespace. Notification hub not created. | 
| 409 | The node already contains another entity. | 

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes?redirectedfrom=MSDN).

## Response headers

None.

## Response body

A NotificationHubDescription element with all policies defined in the current node.

