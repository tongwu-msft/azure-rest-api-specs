---
title: "Update a notification hub"
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


# Update a notification hub
Updates notification hubs.

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
<tr class="even">
<td><p>If-Match</p></td>
<td><p>Set this header to “*” to update the notification hub. You must provide all the property values that are desired on the updated notification hub. Any values not provided will be set to the service default values. If this header is missing, then the update call returns an error indicating that this notification hub already exists.</p></td>
</tr>
</tbody>
</table>


## Request Body

A NotificationHubDescription element. For an example, see the request body for [Create a notification hub](create-notification-hub.md).

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
<td><p>Notifications hub updated successfully.</p></td>
</tr>
<tr class="even">
<td><p>400</p></td>
<td><p>Invalid request body. The notification topic could not be updated because the request was malformed (or the validation failed).</p></td>
</tr>
<tr class="odd">
<td><p>401</p></td>
<td><p>Authorization failure. The access key was incorrect.</p></td>
</tr>
<tr class="even">
<td><p>404</p></td>
<td><p>Not found. The node does not contain a notification hub.</p></td>
</tr>
</tbody>
</table>


For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/windowsazure/dd179357.aspx).

## Response Headers

None.

## Response Body

A NotificationHubDescription element with all policies defined in the current node. For an example, see [Create Notification Hub](create-notification-hub.md).

