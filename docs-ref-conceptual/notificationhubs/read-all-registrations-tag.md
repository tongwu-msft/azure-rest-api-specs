---
title: "Read all registrations with a tag"
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


# Read all registrations with a tag

 


Retrieves all registrations with a specific tag.

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
<td><p>GET</p></td>
<td><p>https://{namespace}.servicebus.windows.net/{NotificationHub}/tags/{tag}/registrations?api-version=2015-01</p></td>
<td><p>HTTP/1.1</p></td>
</tr>
</tbody>
</table>


Note the following points:

  - This call supports the $top query string parameter as specified in OData.

  - This call supports a **ContinuationToken** query string parameter to continue the enumeration.

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
<td><p>Authorization</p></td>
<td><p>Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS).</p></td>
</tr>
<tr class="even">
<td><p>x-ms-version</p></td>
<td><p><strong>2015-01</strong></p></td>
</tr>
</tbody>
</table>


## Request Body

None.

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
<td><p>200</p></td>
<td><p>Registrations retrieved successfully.</p></td>
</tr>
<tr class="even">
<td><p>401</p></td>
<td><p>Authorization failure. The access key was incorrect.</p></td>
</tr>
<tr class="odd">
<td><p>404</p></td>
<td><p>Not found. The channel hash does not exist.</p></td>
</tr>
<tr class="even">
<td><p>403</p></td>
<td><p>Quota exceeded. Request rejected because registration operations rate is too high.</p></td>
</tr>
</tbody>
</table>


For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/windowsazure/dd179357.aspx).

## Response Headers

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th><p>Response Header</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>Content-type</strong></p></td>
<td><p>application/atom+xml;type=entry;charset=utf-8</p></td>
</tr>
</tbody>
</table>


## Response Body

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

