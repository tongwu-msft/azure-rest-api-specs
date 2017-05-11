---
title: List all packet capture sessions
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---

# List all packet capture sessions

Lists all existing Packet Capture Sessions

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| GET | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}/packetCaptures?api-version={api-version}` |

## Response  

The response includes an HTTP status code, a set of response headers, and a request body containing a list of existing packet capture sessions in the specified resource group.

### Success codes

| Code | Description |
| ---- | ----------- |
| **200 (OK)** | Operation successful. | 

```json
{ 
    [ 
        { 
        "name" : "vm1PacketCapture", 
        "id": "/subscriptions/{subscriptionId}/resourceGroups/mygroup1/providers/Microsoft.Network/networkWatchers/westUsWatcher/packetCaptures/vm1PacketCapture", 
        "etag": "W/\"00000000-0000-0000-0000-000000000000\" ", 
        "properties": { 
            "target": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.compute/virtualMachine/vm1", 
            "storageLocation": { 
                "storageURI": "https://mytestaccountname.blob.core.windows.net/capture/vm1Capture.cap", 
                "filePath": "d:\capture\vm1Capture.cap" 
                }, 
            "bytesToCapturePerPacket": 40, 
            "totalBytesPerSession": 252144000, 
            "timeLimitInSeconds": 60, 
            "filters": { 
                "protocol": "Any", 
                "localIP": "10.100.1.10", 
                "localPort": "80", 
                "remotePort": "100-120" 
            } 
        } 
        },
    ...
    ] 
}
```

| Element name | Type | Description |
| ---- | ----------- |-----------|
|packetCaptureName |String |Name of the Packet Capture resource.|
|Id |string |Id of the resource.|

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **404 NotFound** | Resource does not exist. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     



 
