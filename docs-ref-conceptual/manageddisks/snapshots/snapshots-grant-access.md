---
title: "Begin access to a blob associated with a snapshot"
ms.date: 2017-01-30
ms.prod: azure
ms.service: managed-disks
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: 
author: davidmu
manager: timt
---

# Begin access to a blob associated with a snapshot

Provides a SAS URL to a blob associated with a snapshot. You can use this operation to read the blob contents.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| POST | `/subscriptions/{subscriptionID}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/snapshots/{snapshotName}/BeginGetAccess?api-version={api-version}` |

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the snapshot is located. |
| resourceGroup | The name of the resource group that contains the snapshot. |
| snapshotName | The name of the snapshot that is associated with the blob being accessed. |
| api-version | The version of the API to use. The current version is 2017-03-30. |

```json
{  
  "access": "read", 
  "durationInSeconds": "3600" 
}
```

| Element name | Description |
| ------------ | ----------- |
| **access** | Specifies the type of access. Only read URIs are supported at this time. |
| **durationInSeconds** | Specifies the SAS timeout. If the SAS expires, you can call the operation again to get a new SAS. |

## Response

The response includes an HTTP status code and a set of response headers.  

### Success codes

| Code | Description |
| ---- | ----------- |
| **202 (Accepted)** | The operation was accepted. |  

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **404 NotFound** | Source not found. The source can be the platform image, the source disk, or the blob pointed to by the URL. |
| **409 Conflict** | Either another operation is changing the resource in an incompatible way, or the disk is in an incompatible state. Retry the operation. | 
| **429 Too Many Requests** | The operation is being throttled. |
| **500 Internal Server Error** | A server side error has happened. Retry the operation. |


```json
{  
  "accessSAS": "https://storageaccount.blob.core.windows.net/sasblob?sv=2012-02-12&se=2013-04-13T00%3A12%3A08Z&sr=c&sp=wl&sig=t%2BbzU9%2B7ry4okULN9S0wst%2F8MCUhTjrHyV9rDNLSe8g%3D" 
}  
```
 