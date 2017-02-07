---
title: "Get a Network Watcher"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timt
---

# Get a Network Watcher

Gets information about the specified Network Watcher.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| GET | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}?api-version={api-version}` |

## Response  

The response includes an HTTP status code and a set of response headers.

### Success codes

| Code | Description |
| ---- | ----------- |
| **200 (OK)** | The operation was accepted. | 

```json
{ 
"name": "NetworkWatcher", 
"id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}", 
"etag": "W/\"00000000-0000-0000-0000-000000000000\"", 
"type": "Microsoft.Network/networkWatchers", 
"location": "westcentralus", 
"tags": { 
    "key1": "value1" 
    }, 
"properties": { 
    "provisioningState": "Succeeded | Updating | Failed" 
    } 
}
```
### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **412 Precondition Failed** | The operation is being throttled. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     



 