---
title: "Query packet capture status"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---

# Query packet capture status

Queries the status of a packet capture session.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| POST | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}/packetCaptures/{packetCaptureName}/querystatus?api-version={api-version}` |

## Response  

The response includes an HTTP status code, a set of response headers, and a response body containing the status of a packet capture session.

### Success codes

| Code | Description |
| ---- | ----------- |
| **200 (OK)** | Operation completed immediately. | 
| **202 (Accepted)** | Operation running asynchronously. The result will be published to the location found in the response header. To get the status of the operation poll on Azure-AsyncOperation URI found in the response header. | 

#### Response Body
```json
{ 
"name": "vm1PacketCapture",
"id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}/packetCaptures/{packetCaptureName}", 
"captureStartTime" : "9/7/2016 12:35:24PM", 
"packetCaptureStatus" : "Stopped", 
"stopReason" : "TimeExceeded", 
"packetCaptureError" : [] 
}
```

| Element name | Type | Description |
| ---- | ----------- |-----------|
|Name |String |The name of the packet capture session|
|id |string |The id of the packet capture resource|
|captureStartTime |String |The DateTime when the packet capture session was created.|
|packetCaptureStatus |String |The current status of the packet capture session.|
|stopReason |String |The reason the current packet capture session was stopped.|
|packetCaptureError| Array |If an error occurred during the packet capture session, then the error(s) are listed within this array.|

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **404 NotFound** | Resource does not exist. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     



 
