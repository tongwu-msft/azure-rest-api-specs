---
title: "Create a notification hub"
ms.custom: ""
ms.date: "2019-04-05"
ms.prod: "azure"
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

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Method</p></th>
<th><p>Request URI</p></th>
<th><p>HTTP version</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>PUT</p></td>
<td><p>https://{namespace}.servicebus.windows.net/{Notification Hub}?api-version=2015-01</p></td>
<td><p>HTTP/1.1</p></td>
</tr>
</tbody>
</table>


## Request Headers

The following table describes required and optional request headers.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Request Header</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Content-Type</p></td>
<td><p>application/xml;type=entry;charset=utf-8</p></td>
</tr>
<tr class="even">
<td><p>Authorization</p></td>
<td><p>Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS).</p></td>
</tr>
<tr class="odd">
<td><p>x-ms-version</p></td>
<td><p><strong>2015-01</strong></p></td>
</tr>
</tbody>
</table>


## Request Body

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

The endpoint property of ApnsCredential can be either “gateway.push.apple.com” (for production servers) or “gateway.sandbox.push.apple.com” (for sandbox servers).

All child elements of NotificationHubDescription are optional.

WNS, APNS, and GCM credentials must contain all properties shown above. MPNS credentials can also contain no properties, which enable unauthenticated push for MPNS.

## Response

The response includes an HTTP status code and a set of response headers.

## Response Codes

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Code</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>201</p></td>
<td><p>Notification topic created successfully.</p></td>
</tr>
<tr class="even">
<td><p>400</p></td>
<td><p>Invalid request body. The notification topic could not be created because the request was malformed (or the validation failed).</p></td>
</tr>
<tr class="odd">
<td><p>401</p></td>
<td><p>Authorization failure. The access key was incorrect.</p></td>
</tr>
<tr class="even">
<td><p>403</p></td>
<td><p>Quota exceeded; too many notification hubs in this namespace. Notification hub not created.</p></td>
</tr>
<tr class="odd">
<td><p>409</p></td>
<td><p>The node already contains another entity.</p></td>
</tr>
</tbody>
</table>


For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/windowsazure/dd179357.aspx).

## Response Headers

None.

## Response Body

A NotificationHubDescription element with all policies defined in the current node.

