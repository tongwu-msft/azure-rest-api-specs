---
title: "Read all registrations with a tag"
description: Use this API reference documentation to retrieve all registrations with a specific tag.
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


# Read all registrations with a tag
Retrieves all registrations with a specific tag.

## Request

| Method | Request URI | HTTP version |
| ------ | ----------- | ------------ | 
| GET | `https://{namespace}.servicebus.windows.net/{NotificationHub}/tags/{tag}/registrations?api-version=2015-01` | HTTP/1.1 |

Note the following points:

  - This call supports the $top query string parameter as specified in OData.
  - This call supports a **ContinuationToken** query string parameter to continue the enumeration.

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

| Code | Description |
| ---- | ----------- | 
| 200 | Registrations retrieved successfully. |
| 401 | Authorization failure. The access key was incorrect. |
| 404 | Not found. The channel hash does not exist. |
| 403 | Quota exceeded. Request rejected because registration operations rate is too high. |

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

| Response header | Description |
| --------------- | ----------- |
| Content-type | `application/atom+xml;type=entry;charset=utf-8` |


## Response body

Atom feed that wraps the list of registrations in the xml format specified in **Create Registration**. For example:

``` xml
<?xml version="1.0" encoding="utf-8" ?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <title type="/{NotificationTopic}/channels/{channel hash}" />
  <id> https://{tenant}.windows.net/{NotificationTopic}/channels/{channel hash}</id>
  <updated>2012-08-17T17:32:00Z</updated>
  <entry xmlns:m=”http://schemas.microsoft.com/ado/2007/08/dataservices/metadata” m:etag=”W/&quot;1234567890&quot;”>
    <id>https://{tenant}.windows.net/{NotificationTopic}/registrations/{registrationId}</id>
    <title type="text"> /{NotificationTopic}/registrations/{registrationId}</title>
    <updated>2012-08-17T17:32:00Z</updated>
    <content type="application/xml">
    <WindowsRegistrationDescription xmlns:i="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.com/netservices/2010/10/servicebus/connect">
            <ETag>{ETag}</ETag>
        <ExpirationTime>2012-07-16T19:20+01:00</ExpirationTime>
        <RegistrationId>{RegistrationId}</RegistrationId>
            <Tags>myTag, myOtherTag</Tags>
            <ChannelUri>{ChannelUri}</ChannelUri>
        </WindowsRegistrationDescription>
    </content>
  </entry>
  <entry>
    …
  </entry>
</feed>
```

