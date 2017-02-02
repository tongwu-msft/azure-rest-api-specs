---
title: "End access to a blob associated with a managed disk"
ms.date: 2017-01-30
ms.prod: azure
ms.service: managed-disks
ms.topic: reference
ms.assetid: 
author: davidmu
manager: timt
---

# End access to a blob associated with a managed disk

Ends the access to a blob that was started by the begin access operation.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| PUT | `/subscriptions/{subscriptionID}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/disks/{diskName}/EndGetAccess?api-version={api-version}` |

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the managed disk is located. |
| resourceGroup | The name of the resource group that contains the managed disk. |
| diskName | The name of the disk that is associated with the blob being accessed. |
| api-version | The version of the API to use. The current version is 2017-03-30. |

## Response  

The response includes an HTTP status code and a set of response headers. 

### Success codes

| Code | Description |
| ---- | ----------- |
| **202 (Accepted)** - The disk manager creates a SAS with the requested rights and timeout and returns it. | 

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. |
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **404 NotFound** | Source not found. The source can be the platform image, the source disk, or the blob pointed to by the URL. |
| **409 Conflict** | Either another operation is changing the resource in an incompatible way, or the disk is in an incompatible state. Retry the operation. | 
| **429 Too Many Requests** | The operation is being throttled. |
| **500 Internal Server Error** | A server side error has happened. Retry the operation. |