---
title: "Update an installation"
description: Use this API reference documentation to update an installation using the JSON-Patch standard in RFC6902.
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


# Update an installation
Azure Notification Hubs supports partial updates to an installation using the JSON-Patch standard in [RFC6902](https://tools.ietf.org/html/rfc6902).

## Request

| Method | Request URI | HTTP version |
| ------ | ----------- | ------------ | 
| PATCH | `https://{namespace}.servicebus.windows.net/{NotificationHub}/installations/{id}?api-version=2015-01` | HTTP/1.1 |

## Request headers

The following table describes required and optional request headers.

| Request header | Description |
| -------------- | ----------- | 
| Content-Type | `application/json-patch+json` |
| Authorization | Token generated as specified in Shared Access Signature Authentication with Service Bus, or Service Bus authentication and authorization with Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS). |
| x-ms-version | 2015-01 |


## Request body
The following patch operations are allowed:

| JSON-Patch operation | Installation Property | Description and sample |
| -------------------- | --------------------- | ---------------------- |
| add | PushChannel | Update the channel of an installation.<p>`[ { "op": "add", "path": "/pushChannel", "value": "aaaaaaa"} ]`</p><p>Put expiredPushChannel to true if pushChannel is changed.</p>
| add | UserId | Update or add user ID value.<p>`[ { "op": "add", "path": "/userId", "value": "Bob"}  ]`</p> 
| add | Tag | If value is array, add all tags in array to existing tags (even if not present). If value is a string, add tag to current array (or create a new array with single value, if not tags are currently present).<p>`[ { "op": "add", "path": "/tags", "value": "tag"} ]` |
| add | Template (P2) | Update or add whole template.<p>`[ { "op": "add", "path": "/templates/myTemplate", "value": '{"body": "…", "tags": ["tag"]}'} ]`|
| add | Template body/header/expiry/tags | Update or add parts of template (note that ‘add’ on headers replaces current headers object). Add on tags has the same semantics as native tags.<p>`[ { "op": "add", "path": "/templates/myTemplate/body", "value": '{"aps": …}'} ]`</p><p>`[ { "op": "add", "path": "/templates/myTemplate/headers", "value": '{"X-WNS-Type": "wns/toast"}'} ]`</p> |
| add | secondaryTile channel | Updates the secondaryTile channel.<p>`[ { "op": "add", "path": "/secondaryTiles/myTile/pushChannel", "value": "aaaaaaa"} ]`</p> |
| add | secondaryTile tag | Same as tags update but path refers to secondary tile.<p>`[ { "op": "add", "path": "/secondaryTiles/myTile/tags", "value": '["fooTag"]'} ]`</p> |
| add | secondaryTile template | Same as normal templates but path refers to tileId. |
| add | secondaryTile template body/header/expiry/tags | Same as normal templates but path refers to tileId. |
| Remove | As above | Deletes a property, such as userID, or an element of the tags array. If the last tag of the tags property is removed the whole property is removed. <p>`[ { "op": "remove", "path": "/tags/myTag"} ]`</p> |
| Replace | As above | Semantically equivalent to remove+add. |


## Response

The response includes an HTTP status code and a set of response headers.

## Response codes

| Code | Description |
|---|---|
| 204 | The installation was patched successfully |
| 400 | The installation could not be patched because the request was malformed. |
| 401 | Authorization failure. The access key was incorrect. |
| 403 | Quota exceeded; too many registrations in this namespace. Registration not created. |
| 403 | Request rejected because API call rate is too high. |

For information about status codes, see [Status and Error Codes](/rest/api/storageservices/Common-REST-API-Error-Codes).

## Response headers

| Response header | Description |
| --------------- | ----------- | 
| Content-type | `application/json-patch+json` |
| Content-Location | The location of the installation in the format: `https://{namespace}.servicebus.windows.net/{NotificationHub}/installations/<installationId>` |

## Response body

None.

## See Also

[Create or overwrite an installation](create-overwrite-installation.md)  
[Read an installation](read-installation.md)  
[Delete an installation](delete-installation.md)

