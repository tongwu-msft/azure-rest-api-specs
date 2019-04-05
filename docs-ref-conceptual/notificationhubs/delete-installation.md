---
title: Delete Installation
TOCTitle: Delete Installation
ms:assetid: f9374ed1-358b-4d2b-af38-c0cd2e12488c
ms:mtpsurl: https://msdn.microsoft.com/en-us/library/Mt621170(v=Azure.100)
ms:contentKeyID: 71717572
ms.date: 03/08/2016
mtps_version: v=Azure.100
---

# Delete Installation

 


Updated: March 8, 2016

Deletes an installation.

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
<td><p>DELETE</p></td>
<td><p>https://{namespace}.servicebus.windows.net/{NotificationHub}/installations/installationId?api-version=2015-01</p></td>
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
<td><p>204</p></td>
<td><p>The installation was deleted successfully.</p>

> [!NOTE]
> <P>Even if the installation did not exist, and therefore was not found, the service will return 204.</P>


</td>
</tr>
<tr class="even">
<td><p>400</p></td>
<td><p>The installation could not be created/overwritten because the request was malformed.</p></td>
</tr>
<tr class="odd">
<td><p>401</p></td>
<td><p>Authorization failure. The access key was incorrect.</p></td>
</tr>
<tr class="even">
<td><p>403</p></td>
<td><p>Quota exceeded. Request rejected because registration operations rate is too high.</p></td>
</tr>
</tbody>
</table>


For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/windowsazure/dd179357.aspx).

## Response Headers

None.

## Response Body

None.

## See Also

[Create or Overwrite Installation](mt621153\(v=azure.100\).md)  
[Read Installation](mt621172\(v=azure.100\).md)  
[Update Installation by Installation ID](mt621169\(v=azure.100\).md)

