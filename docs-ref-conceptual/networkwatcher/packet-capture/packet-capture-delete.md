---
title: "Delete a packet capture"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---

# Delete a packet capture

Delete removes a packet capture session. To ensure that a capture is saved to storage or the local file system the recommended course of action for deleting packet captures is:

1. Stop the packet capture session. POST /stop

2. Query the packet capture status until the session has successfully stopped (PacketCaptureStatus: Stopped)

3. Delete the Packet Capture session.

If Delete is called on a running packet capture session, there is no guarantee that data from the session will be retained.

During private preview, if you have started 5 packet captures and wish to start another, an existing capture session must be deleted due to the limits on the number of captures that can exist simultaneously.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| DELETE | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}/packetCaptures/{packetCaptureName}?api-version={api-version}` |

## Response  

The response includes an HTTP status code and a set of response headers.

### Success codes

| Code | Description |
| ---- | ----------- |
| **202 (Accepted)** | Operation running asynchronously. The result will be published to the location found in the response header. To get the status of the operation poll on Azure-AsyncOperation URI found in the response header. | 
| **204 (No Content)** | Resource does not exist or it was successfully deleted

No response body

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     



 