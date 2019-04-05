---
title: "Updates a registration"
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


# Update a registration
Updates an existing registration.

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
<td><p>https://{namespace}.servicebus.windows.net/{NotificationHub}/registrations/&lt;registrationId&gt;?api-version=2015-01</p></td>
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
<td><p>application/atom+xml;type=entry;charset=utf-8</p></td>
</tr>
<tr class="even">
<td><p>Authorization</p></td>
<td><p>Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS).</p></td>
</tr>
<tr class="odd">
<td><p>If-Match</p></td>
<td><p>ETag as returned by creation, update, and retrieval, or ‘*’ (overwrite).</p></td>
</tr>
<tr class="even">
<td><p>x-ms-version</p></td>
<td><p><strong>2015-01</strong></p></td>
</tr>
</tbody>
</table>


## Request Body

Atom entry with the description embedded in the content, as in [Create Registration](dn223265\(v=azure.100\).md).

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
<td><p>Registration updated successfully.</p></td>
</tr>
<tr class="even">
<td><p>400</p></td>
<td><p>Invalid request body. The registration could not be created because the request was malformed.</p></td>
</tr>
<tr class="odd">
<td><p>401</p></td>
<td><p>Authorization failure. The access key was incorrect.</p></td>
</tr>
<tr class="even">
<td><p>403</p></td>
<td><p>Quota exceeded; too many registrations in this namespace. Registration not created.</p></td>
</tr>
<tr class="odd">
<td><p>404</p></td>
<td><p>No registration exists at this location.</p></td>
</tr>
<tr class="even">
<td><p>409</p></td>
<td><p>Request rejected because registration operations rate is too high.</p></td>
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
<tr class="even">
<td><p><strong>ETag</strong></p></td>
<td><p>{weak ETag}</p></td>
</tr>
</tbody>
</table>


## Response Body

Upon success, a validated Atom entry is returned, as in [Create Registration](dn223265\(v=azure.100\).md).

