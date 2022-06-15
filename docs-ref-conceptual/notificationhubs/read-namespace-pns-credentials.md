---
title: "Read namespace Platform Notification Services (PNS) credentials"
description: Use this API reference documentation to read the unified PNS credentials for a namespace.
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

# Read name Platform Notification Services (PNS) credentials
The namespace level Push Notification Services (PNS) APIs are designed for large apps that span across multiple hubs. They enable developers to easily read and update unified PNS settings for multiple hubs under the same namespace at once. When PNS credentials have been set at namespace level using this endpoint, all hubs in the namespace will use the credentials provided with the namespace settings. Hub creations in the namespace with PNS credentials won’t be allowed. When PNS credentials are set at hub level first, this endpoint will no longer be available.

This topic is a reference for getting the unified PNS credentials for a namespace. When PNS credentials are set at hub level first, this endpoint will no longer be available.

## Request

| Method | Request URI | HTTP version |
| ------ | ----------- | ------------ |
| GET | `https://management.core.windows.net/{subscription ID}/services/ServiceBus/Namespaces/{namespace name}/NotificationHubPnsCredentials/?api-version=2015-01` | HTTP/1.1 |

## Request headers

The following table describes required and optional request headers.

| Request header | Description |
| -------------- | ----------- |
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| x-ms-version | 2015-01 |

## Request body

None.

## Response

The response includes an HTTP status code and a set of response headers.

## Response codes

| Code |  Description |
| ---- | ------------ |
| 400 | Invalid request body. The settings could not be read because the request was malformed (or the validation failed). |
| 401 | Authorization failure. The access key was incorrect. |
| 403 | Quota exceeded. |
| 404 | Namespace Not found. |

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

None.

## Response body

A NotificationHubPnsCredentials element that defines the credentials for all hubs in the namespace.

```xml
<NotificationHubPnsCredentials xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">

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

</NotificationHubPnsCredentials>
```
## See Also

[Create or update namespace PNS credentials](create-update-namespace-pns-credentials.md)  
[REST API methods](rest-api-methods.md)

