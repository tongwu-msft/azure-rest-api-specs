---
title: "Get a packet capture session"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timt
---

# Get a packet capture session

Returns information of an existing packet capture session.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| GET | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}/packetCaptures/{packetCaptureName}?api-version={api-version}` |

## Response  

The response includes an HTTP status code and a set of response headers.

### Success codes

| Code | Description |
| ---- | ----------- |
| **200 (OK)** | Operation successful. | 

```json
{ 
"name": "vm1PacketCapture", 
"id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/westUsWatcher/packetCaptures/vm1PacketCapture", 
"etag": "W/\"00000000-0000-0000-0000-000000000000\" ", 
"properties": { 
    "provisioningState": "Updating", 
    "target": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.compute/virtualMachine/vm1", 
    "bytesToCapturePerPacket": 40, 
    "totalBytesPerSession": 252144000, 
    "timeLimitInSeconds": 60, 
    "storageLocation": { 
        "storageId": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/pcstore",
            "storagePath": "https://mytestaccountname.blob.core.windows.net/capture/vm1Capture.cap", 
            "filePath": "d:\capture\vm1Capture.cap" 
    }, 
"filters": [ 
    { 
        "protocol": "Any", 
        "localIPAddress": "10.100.1.10", 
        "localPort": "80", 
        "remoteIPAddress" : "20.147.11.23",
        "remotePort": "100-120" 
    } 
] 
}
}
```

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **404 NotFound** | Resource does not exist. |
| **409 Conflict** | A resource with the same name already exists. (Attempts to overwrite existing Packet Captures will result in this error.) |
| **412 Precondition Failed** | The operation is being throttled. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     



 