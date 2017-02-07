---
title: "Create or update a Network Watcher"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---

# Create or update a Network Watcher

Creates or updates a Network Watcher.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| PUT | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}?api-version={api-version}` |

| Parameter | Description |
| --------- | ----------- |
| location |	Specifies the location of the Network Watcher |

```json
{
"location": "West Central US"
}
```

## Response  

The response includes an HTTP status code and a set of response headers.

### Success codes

| Code | Description |
| ---- | ----------- |
| **200 (OK)** | The operation was accepted. | 

There is no response body.

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **412 Precondition Failed** | The operation is being throttled. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     



 