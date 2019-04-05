---
title: "Direct send"
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

# Direct send
Sends a notification directly to a device handle (a valid token as expressed by the Notification type). Users of this API do not need to use Registrations or Installations. Instead, users of this API manage all devices on their own and use Azure Notification Hub solely as a pass through service to communicate with the various Push Notification Services.

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
<td><p>https://{namespace}.servicebus.windows.net/{NotificationHub}/messages/?direct&amp;api-version=2015-04</p></td>
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
<td><p>Set the Content-Type header based on the target platform notification service below:</p>
<ul>
<li><p>WNS: Set to <strong>application/json;charset=utf-8</strong> or <strong>application/xml</strong>. If the notification type (X-WNS-Type) is “wns/raw”, set to <strong>application/octet-stream</strong>.</p></li>
<li><p>GCM and APNS: Set to <strong>application/json;charset=utf-8</strong>.</p></li>
<li><p>MPNS: Set to <strong>application/xml;charset=utf-8</strong>.</p></li>
</ul></td>
</tr>
<tr class="odd">
<td><p>ServiceBusNotification-DeviceHandle</p></td>
<td><p>The PNS device handle.</p></td>
</tr>
<tr class="even">
<td><p>ServiceBusNotification-Tags</p></td>
<td><p>{single tag identifier} (optional)</p></td>
</tr>
<tr class="odd">
<td><p>ServiceBusNotification-Format</p></td>
<td><p>Set to a valid PlatformType value</p>
<ul>
<li><p>windows</p></li>
<li><p>apple</p></li>
<li><p>gcm</p></li>
<li><p>windows phone</p></li>
<li><p>adm</p></li>
<li><p>nokiax</p></li>
<li><p>baidu</p></li>
</ul></td>
</tr>
<tr class="even">
<td><p>x-ms-version</p></td>
<td><p><strong>2015-04</strong> (Supported by <strong>2015-01</strong> and later)</p></td>
</tr>
</tbody>
</table>


## Request Body

Based on the platform type, the request body formats will change. Refer to the body formats for each individual platform in native Send REST APIs.

  - [Send an APNS native notification](send-apns-native-notification.md)

  - [Send a GCM native notification](send-gcm-native-notification.md)

  - [Send a MPNS native notification](send-mpns-native-notification.md)

  - [Send a WNS native notification](send-wns-native-notification.md)

## Response

The response includes an HTTP status code and a set of response headers. Response body is returned on success.

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
<td><p>Content-Type</p></td>
<td><p>application/xml; charset=utf-8</p></td>
</tr>
<tr class="even">
<td><p>Location</p></td>
<td><p>This header is only available for <a href="https://azure.microsoft.com/pricing/details/notification-hubs/">Standard tier Notification Hubs</a>.</p>
<p>This header will contain the Notification Message ID. It is used with <a href="get-notification-message-telemetry.md">Per Message Telemetry: Get Notification Message Telemetry</a> and correlating <a href="get-pns-feedback.md">PNS Feedback</a>. The location header uses the following format:</p>
<pre><code>https://{your namespace}.servicebus.windows.net/{your hub name}/messages/{notification message id}?api-version=2015-04</code></pre></td>
</tr>
</tbody>
</table>


## Response Body

None.

## See Also
[Direct batch send](direct-batch-send.md)  
[Send an APNS native notification](send-apns-native-notification.md)  
[Send a GCM native notification](send-gcn-native-notification.md)  
[Send an MPNS native notification](send-mpns-native-notification.md)  
[Send a WNS native notification](send-wns-native-notification.md)


