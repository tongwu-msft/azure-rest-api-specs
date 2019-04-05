---
title: Send a WNS Native Notification
TOCTitle: Send a WNS Native Notification
ms:assetid: 7672297a-5a4b-4c67-a016-69315646b747
ms:mtpsurl: https://msdn.microsoft.com/en-us/library/Dn223272(v=Azure.100)
ms:contentKeyID: 54432117
ms.date: 07/28/2016
mtps_version: v=Azure.100
dev_langs:
- xml
---

# Send a WNS Native Notification

 


Sends a WNS native notification through a notification hub.

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
<td><p>Set to <strong>application/json;charset=utf-8</strong> or <strong>application/xml</strong>. If the notification type (X-WNS-Type) is “wns/raw”, set to <strong>application/octet-stream</strong>.</p></td>
</tr>
<tr class="odd">
<td><p>ServiceBusNotification-Tags</p></td>
<td><p>{single tag identifier} (optional)</p></td>
</tr>
<tr class="even">
<td><p>ServiceBusNotification-Format</p></td>
<td><p>Set to <strong>windows</strong></p></td>
</tr>
<tr class="odd">
<td><p>X-WNS-*</p></td>
<td><p>All headers starting with X-WNS will be forwarded to WNS. See, <a href="https://msdn.microsoft.com/library/windows/apps/hh465435.aspx">X-WNS-* Reference</a></p></td>
</tr>
</tbody>
</table>


## Request Body

The request body is an XML document as [specified by WNS](http://msdn.microsoft.com/library/windows/apps/hh465460.aspx). If the notification is of type “wns/raw”, the body is any text up to 5Kb. For example:

``` xml
<?xml version="1.0" encoding="utf-8" ?>
<toast>
    <visual lang="en-US">
        <binding template="ToastText01">
            <text id="1”>
                This is my toast message for Win8!
            </text>
        </binding>
    </visual>
</toast>
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
<td><p>Requested entity too large. The message size cannot be over 64Kb.</p></td>
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
<p>This header will contain the Notification Message ID. This is used with <a href="mt608135(v=azure.100).md">Per Message Telemetry: Get Notification Message Telemetry</a> and correlating <a href="mt705560(v=azure.100).md">PNS Feedback</a>. The location header uses the following format:</p>
<pre><code>https://{your namespace}.servicebus.windows.net/{your hub name}/messages/{notification message id}?api-version=2015-04</code></pre></td>
</tr>
</tbody>
</table>


## Response Body

None.

## See Also

[Send an APNS Native Notification](dn223266\(v=azure.100\).md)  
[Send a GCM Native Notification](dn223266\(v=azure.100\).md)  
[Send an MPNS Native Notification](dn383737\(v=azure.100\).md)  
[Send a Template Notification](dn223267\(v=azure.100\).md)  
[Direct Send](mt608572\(v=azure.100\).md)

