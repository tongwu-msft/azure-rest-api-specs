---
title: "Update an installation"
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


# Update an installation
Azure Notification Hubs supports partial updates to an installation using the JSON-Patch standard in [RFC6902](https://tools.ietf.org/html/rfc6902).

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
<td><p>PATCH</p></td>
<td><p>https://{namespace}.servicebus.windows.net/{NotificationHub}/installations/{id}?api-version=2015-01</p></td>
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
<td><p>application/json-patch+json</p></td>
</tr>
<tr class="even">
<td><p>Authorization</p></td>
<td><p>Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS).</p></td>
</tr>
<tr class="odd">
<td><p>x-ms-version</p></td>
<td><p><strong>2015-01</strong></p></td>
</tr>
</tbody>
</table>


## Request Body

The following patch operations are allowed:

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th><p>JSON-Patch operation</p></th>
<th><p>Installation Property</p></th>
<th><p>Description and sample</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>add</p></td>
<td><p>PushChannel</p></td>
<td><p>Update the channel of an installation.</p>
<pre><code>[ { &quot;op&quot;: &quot;add&quot;, &quot;path&quot;: &quot;/pushChannel&quot;, &quot;value&quot;: &quot;aaaaaaa&quot;} ]</code></pre>
<p>Put expiredPushChannel to true if pushChannel is changed.</p></td>
</tr>
<tr class="even">
<td><p>add</p></td>
<td><p>User/AppId/AdvertisingId</p></td>
<td><p>Update or add user, AppId, AdvId value.</p>
<pre><code>[ { &quot;op&quot;: &quot;add&quot;, &quot;path&quot;: &quot;/user&quot;, &quot;value&quot;: &quot;elio&quot;} ] </code></pre></td>
</tr>
<tr class="odd">
<td><p>add</p></td>
<td><p>Tag</p></td>
<td><p>If value is array, add all tags in array to existing tags (even if not present). If value is a string, add tag to current array (or create a new array with single value, if not tags are currently present).</p>
<pre><code>[ { &quot;op&quot;: &quot;add&quot;, &quot;path&quot;: &quot;/tags&quot;, &quot;value&quot;: &quot;tag&quot;} ]</code></pre></td>
</tr>
<tr class="even">
<td><p>add</p></td>
<td><p>Template (P2)</p></td>
<td><p>Update or add whole template.</p>
<pre><code>[ { &quot;op&quot;: &quot;add&quot;, &quot;path&quot;: &quot;/templates/myTemplate&quot;, &quot;value&quot;: &#39;{&quot;body&quot;: &quot;…&quot;, &quot;tags&quot;: [&quot;tag&quot;]}&#39;} ]</code></pre></td>
</tr>
<tr class="odd">
<td><p>add</p></td>
<td><p>Template body/header/expiry/tags</p></td>
<td><p>Update or add parts of template (note that ‘add’ on headers replaces current headers object). Add on tags has the same semantics as native tags.</p>
<pre><code>[ { &quot;op&quot;: &quot;add&quot;, &quot;path&quot;: &quot;/templates/myTemplate/body&quot;, &quot;value&quot;: &#39;{&quot;aps&quot;: …}&#39;} ]</code></pre>
<pre><code>[ { &quot;op&quot;: &quot;add&quot;, &quot;path&quot;: &quot;/templates/myTemplate/headers&quot;, &quot;value&quot;: &#39;{&quot;X-WNS-Type&quot;: &quot;wns/toast&quot;}&#39;} ]</code></pre></td>
</tr>
<tr class="even">
<td><p>add</p></td>
<td><p>secondaryTile channel</p></td>
<td><p>Updates the secondaryTile channel.</p>
<pre><code>[ { &quot;op&quot;: &quot;add&quot;, &quot;path&quot;: &quot;/secondaryTiles/myTile/pushChannel&quot;, &quot;value&quot;: &quot;aaaaaaa&quot;} ]</code></pre></td>
</tr>
<tr class="odd">
<td><p>add</p></td>
<td><p>secondaryTile tag</p></td>
<td><p>Same as tags update but path refers to secondary tile.</p>
<pre><code>[ { &quot;op&quot;: &quot;add&quot;, &quot;path&quot;: &quot;/secondaryTiles/myTile/tags&quot;, &quot;value&quot;: &#39;[&quot;fooTag&quot;]&#39;} ]</code></pre></td>
</tr>
<tr class="even">
<td><p>add</p></td>
<td><p>secondaryTile template</p></td>
<td><p>Same as normal templates but path refers to tileId.</p></td>
</tr>
<tr class="odd">
<td><p>add</p></td>
<td><p>secondaryTile template body/header/expiry/tags</p></td>
<td><p>Same as normal templates but path refers to tileId.</p></td>
</tr>
<tr class="even">
<td><p>Remove</p></td>
<td><p>As above</p></td>
<td><p>Deletes a property or an element of the tags array. If the last tag of the tags property is removed the whole property is removed.</p>
<pre><code>[ { &quot;op&quot;: &quot;remove&quot;, &quot;path&quot;: &quot;/tags/myTag&quot;} ]</code></pre></td>
</tr>
<tr class="odd">
<td><p>Replace</p></td>
<td><p>As above</p></td>
<td><p>Semantically equivalent to remove+add.</p></td>
</tr>
</tbody>
</table>


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
<td><p>The installation was patched successfully</p></td>
</tr>
<tr class="even">
<td><p>400</p></td>
<td><p>The installation could not be patched because the request was malformed.</p></td>
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
<td><p>403</p></td>
<td><p>Request rejected because API call rate is too high.</p></td>
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
<td><p>application/json-patch+json</p></td>
</tr>
<tr class="even">
<td><p><strong>Content-Location</strong></p></td>
<td><p>The location of the installation in the format:</p>
<p>https://{namespace}.servicebus.windows.net/{NotificationHub}/installations/&lt;installationId&gt;</p></td>
</tr>
</tbody>
</table>


## Response Body

None.

## See Also

[Create or Overwrite Installation](mt621153\(v=azure.100\).md)  
[Read Installation](mt621172\(v=azure.100\).md)  
[Delete Installation](mt621170\(v=azure.100\).md)

