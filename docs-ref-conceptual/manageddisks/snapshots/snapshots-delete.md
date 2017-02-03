---
title: "Delete a snapshot"
ms.date: 2017-01-30
ms.prod: azure
ms.service: managed-disks
ms.topic: reference
ms.assetid: 
author: davidmu
manager: timt
---

# Delete a snapshot

Deletes the specified snapshot.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).
  
## Request

| HTTP Method | URI|  
| ----------- |----|  
| DELETE | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/snapshots/{snapshotName}?api-version={api-version}` |

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the snapshot is located. |
| resourceGroup | The name of the resource group that contains the snapshot. |
| snapshotName | The name of the snapshot that you want to delete. |
| api-version | The version of the API to use. The current version is 2017-03-30. |

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
| **409 Conflict** | Either another operation is changing the resource in an incompatible way, or the disk is in an incompatible state. Retry the operation. |
| **429 Too Many Requests** | The operation is being throttled. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |   