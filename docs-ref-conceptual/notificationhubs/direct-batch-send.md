---
title: "Direct batch send"
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

# Direct batch send
Sends a batch of notifications directly to a collection of device handles (a valid token as expressed by the Notification type). This API is available for [Basic and Standard tier Notification Hub namespaces](https://azure.microsoft.com/pricing/details/notification-hubs/). Users of this API do not need to use Registrations or Installations. Instead, users of this API manage all devices on their own and use Azure Notification Hub solely as a pass through service to communicate with the various Push Notification Services.

At this time, Direct Batch Send supports up to 1000 devices per request.

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
<td><p>https://{namespace}.servicebus.windows.net/{NotificationHub}/messages/$batch?direct&amp;api-version=2015-08</p></td>
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
<td><p>Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). For more information, see <a href="common-concepts.md">Common Concepts</a>.</p></td>
</tr>
<tr class="even">
<td><p>Content-Type</p></td>
<td><p>multipart/mixed; boundary=&quot;boundary-string&quot;</p>
<p>The boundary string is used to separate each part according to the multipart content type defined in <a href="https://www.w3.org/protocols/rfc1341/7_2_multipart.html">RFC1341</a>. Each part starts with an encapsulation boundary, and then contains a body part consisting of header area, a blank line, and a body area.</p></td>
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

The request body is multipart as defined in [RFC1341](https://www.w3.org/protocols/rfc1341/7_2_multipart.html). Each part starts with an encapsulation boundary, and then contains a body part consisting of header area, a blank line, and a body area. The blank link must not contain any whitespace. See the request examples below.

Based on the target platform type, the body format of a notification part will change to be compliant with each individual platform as covered in the native Send APIs below.

  - [Send an APNS Native Notification](send-apns-native-notification.md)

  - [Send a GCM Native Notification](send-gcm-native-notification.md)

  - [Send a MPNS Native Notification](send-mpns-native-notification.md)

  - [Send a WNS Native Notification](send-wns-native-notification.md)

The devices part of the request body must be a JSON array of the device handles that will receive the notification.

## Request Examples

Here is a WNS example:

    POST https://{namespace}.servicebus.windows.net/{Notification Hub}/messages/$batch?direct&api-version=2015-08 HTTP/1.1
    Content-Type: multipart/mixed; boundary = "simple-boundary"
    Authorization: SharedAccessSignature sr=https%3a%2f%2f{Namespace}.servicebus.windows.net%2f{Notification Hub}%2fmessages%2f%24batch%3fdirect%26api-version%3d2015-08&sig={Signature}&skn=DefaultFullSharedAccessSignature
    ServiceBusNotification-Format: windows
    X-WNS-Type: wns/toast
    Host: {Namespace}.servicebus.windows.net
    Content-Length: 514
    Expect: 100-continue
    Connection: Keep-Alive
    
    
    --simple-boundary
    Content-type: text/xml
    Content-Disposition: inline; name=notification
    
    <toast><visual><binding template="ToastText01"><text id="1">Hello there!</text></binding></visual></toast>
    --simple-boundary
    Content-type: application/json
    Content-Disposition: inline; name=devices
    
    ['https://db5.notify.windows.com/?token={Token1}','https://db5.notify.windows.com/?token={Token2}','https://db5.notify.windows.com/?token={Token3}']
    --simple-boundary--

  
Here is a GCM example:

    POST https://{Namespace}.servicebus.windows.net/{Notification Hub}/messages/$batch?direct&api-version=2015-08 HTTP/1.1
    Content-Type: multipart/mixed; boundary="simple-boundary"
    Authorization: SharedAccessSignature sr=https%3a%2f%2f{Namespace}.servicebus.windows.net%2f{Notification Hub}%2fmessages%2f%24batch%3fdirect%26api-version%3d2015-08&sig={Signature}&skn=DefaultFullSharedAccessSignature
    ServiceBusNotification-Format: gcm
    Host: {Namespace}.servicebus.windows.net
    Content-Length: 431
    Expect: 100-continue
    Connection: Keep-Alive
    
    
    --simple-boundary
    Content-Type: application/json
    Content-Disposition: inline; name=notification
    
    {"data":{"message":"Hello via Direct Batch Send!!!"}}
    --simple-boundary
    Content-Type: application/json
    Content-Disposition: inline; name=devices
    
    ['Device Token1','Device Token2','Device Token3']
    --simple-boundary--

  
Here is an APNS example.

    POST https://{Namespace}.servicebus.windows.net/{Notification Hub}/messages/$batch?direct&api-version=2015-08 HTTP/1.1
    Content-Type: multipart/mixed; boundary="simple-boundary"
    Authorization: SharedAccessSignature sr=https%3a%2f%2f{Namespace}.servicebus.windows.net%2f{Notification Hub}%2fmessages%2f%24batch%3fdirect%26api-version%3d2015-08&sig={Signature}&skn=DefaultFullSharedAccessSignature
    ServiceBusNotification-Format: apple
    Host: {Namespace}.servicebus.windows.net
    Content-Length: 511
    Expect: 100-continue
    Connection: Keep-Alive
    
    
    --simple-boundary
    Content-Type: application/json
    Content-Disposition: inline; name=notification
    
    {"aps":{"alert":"Hello using APNS via Direct Batch Send!!!"}}
    --simple-boundary
    Content-Type: application/json
    Content-Disposition: inline; name=devices
    
    ['Device Token1','Device Token2','Device Token3']
    --simple-boundary--

## Response

The response includes an HTTP status code and a set of response headers. No response body is returned on success.

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
<td><p>Created.</p></td>
</tr>
<tr class="even">
<td><p>400</p></td>
<td><p>Could not find a part of the multipart content supplied.</p></td>
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
<p>This header will contain the Notification Message ID. It is used with <a href="get-notification-message-telemetry.md">Per Message Telemetry: Get Notification Message Telemetry</a> and correlating <a href="get-notification-message-telemetry.md">PNS Feedback</a>. The location header uses the following format:</p>
<pre><code>https://{your namespace}.servicebus.windows.net/{your hub name}/messages/{notification message id}?api-version=2015-04</code></pre></td>
</tr>
</tbody>
</table>


## Response Body

None

## See Also

[Direct send](direct-send.md)  
[Send an APNS native notification](send-apns-native-notification.md)  
[Send a GCM native notification](send-gcm-native-notification.md)  
[Send an MPNS native notification](send-mpns-native-notification.md)  
[Send a WNS native notification](send-wns-native-notification.md)

