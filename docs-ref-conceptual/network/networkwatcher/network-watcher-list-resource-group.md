---
title: "Get a list of Network Watchers in a resource group"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---

# List Network Watchers in a resource group.

Lists all Network Watchers in a resource group.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| GET | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers?api-version={api-version}` |

## Response  

The response includes an HTTP status code and a set of response headers.

### Success codes

| Code | Description |
| ---- | ----------- |
| **200 (OK)** | The operation was accepted. | 

```json
{ "value": [ 
    { 
    "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName} ", 
    "location": "westcentralus", 
    "tags": { 
        "key": "value" 
    } , 
    "etag": "W/\"00000000-0000-0000-0000-000000000000\"", 
    "properties": { 
        "provisioningState": "Succeeded | Updating | Failed", 
        }

}, 
{ 
    "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName} ", 
    "location": "East US", 
    "tags": { "key": "value" 
    } , 
    "etag": "W/\"00000000-0000-0000-0000-000000000000\"", 
    "properties": { "provisioningState": "Succeeded | Updating | Failed", 
    } 
},
...
]}
```
### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     


 
