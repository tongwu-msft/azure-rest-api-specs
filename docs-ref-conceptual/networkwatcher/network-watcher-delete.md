---
title: "Delete a Network Watcher"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---

# Delete a Network Watcher

Deletes a Network Watcher

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| DELETE | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}?api-version={api-version}` |
 
## Response  

The response includes an HTTP status code and a set of response headers.

### Success codes

| Code | Description |
| ---- | ----------- |
| **204 (OK)** | The resource does not exists or it was successfully deleted. | 

There is no response body.

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     




 