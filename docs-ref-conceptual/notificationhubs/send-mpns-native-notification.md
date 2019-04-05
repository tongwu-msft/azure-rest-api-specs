---
title: "Send Microsoft Push Notification Services (MPNS) notification"
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


# Send a Microsoft Push Notification Services (MPNS) native notification
Sends an MPNS native notification through a notification hub.

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
<th><p>HTTP Version</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>POST</p></td>
<td><p>https://{namespace}.servicebus.windows.net/{NotificationHub}/messages/?api-version=2015-01</p></td>
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
<td><p>Authorization</p></td>
<td><p>Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS).</p></td>
</tr>
<tr class="even">
<td><p>Content-Type</p></td>
<td><p>Set to <strong>application/xml;charset=utf-8</strong>.</p></td>
</tr>
<tr class="odd">
<td><p>ServiceBusNotification-Tags</p></td>
<td><p>{single tag identifier} (optional)</p></td>
</tr>
<tr class="even">
<td><p>ServiceBusNotification-Format</p></td>
<td><p>Set to <strong>windows phone</strong></p></td>
</tr>
<tr class="odd">
<td><p>X-*</p></td>
<td><p>All headers starting with X- will be forwarded to MPNS. See, <a href="http://msdn.microsoft.com/library/windows/apps/hh202945.aspx">Push Notifications for Windows Phone 8</a>.</p></td>
</tr>
</tbody>
</table>


## Request Body

The request body is an XML document as [specified by MPNS](http://msdn.microsoft.com/library/windowsphone/develop/jj662933\(v=vs.105\).aspx). If the notification is a [raw notification](http://msdn.microsoft.com/library/windowsphone/develop/hh202977\(v=vs.105\).aspx), the body is any text up to 1 Kb. For example:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<wp:Notification xmlns:wp="WPNotification" Version="2.0">
  <wp:Tile Id="[Tile ID]" Template="IconicTile">
    <wp:SmallIconImage [Action="Clear"]>[small Tile size URI]</wp:SmallIconImage>
    <wp:IconImage Action="Clear">[medium/wide Tile size URI]</wp:IconImage>
    <wp:WideContent1 Action="Clear">[1st row of content]</wp:WideContent1>
    <wp:WideContent2 Action="Clear">[2nd row of content]</wp:WideContent2>
    <wp:WideContent3 Action="Clear">[3rd row of content]</wp:WideContent3>
    <wp:Count Action="Clear">[count]</wp:Count>
    <wp:Title Action="Clear">[title]</wp:Title>
    <wp:BackgroundColor Action="Clear">[hex ARGB format color]</wp:BackgroundColor>
  </wp:Tile>
</wp:Notification>
```

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
<td><p>Message successfully sent.</p></td>
</tr>
<tr class="even">
<td><p>400</p></td>
<td><p>The request is malformed (for example, not valid routing headers, not valid content-type, message exceeds size, bad message format).</p></td>
</tr>
<tr class="odd">
<td><p>401</p></td>
<td><p>Authorization failure. The access key was incorrect.</p></td>
</tr>
<tr class="even">
<td><p>403</p></td>
<td><p>Quota exceeded or message too large; message was rejected.</p></td>
</tr>
<tr class="odd">
<td><p>404</p></td>
<td><p>No message branch at the URI.</p></td>
</tr>
<tr class="even">
<td><p>413</p></td>
<td><p>Requested entity too large. The message size cannot be over 64 Kb.</p></td>
</tr>
</tbody>
</table>


For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/windowsazure/dd179382.aspx).

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
<td><p>Location</p></td>
<td><p>This header is only available for <a href="https://azure.microsoft.com/pricing/details/notification-hubs/">Standard tier Notification Hubs</a>.</p>
<p>This header will contain the Notification Message ID. It's used with <get-notification-message-telemetry.md">Get notification message telemetry</a> and correlating <a href="get-pns-feedback.md">PNS feedback</a>. The location header uses the following format:</p>
<pre><code>https://{your namespace}.servicebus.windows.net/{your hub name}/messages/{notification message id}?api-version=2015-04</code></pre></td>
</tr>
</tbody>
</table>


## Response Body

None.

## See Also
- [Direct send](direct-send.md)  
- [Send an APNS native notification](send-apns-native-notification.md)  
- [Send an GCM native notification](send-gcm-native-notification.md)  
- [Send a WNS native notification](send-wns-native-notification.md)
- [Send a template notification](send-template-notification.md)  

