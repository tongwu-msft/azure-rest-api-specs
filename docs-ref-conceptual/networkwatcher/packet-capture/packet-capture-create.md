---
title: "Create and start a packet capture"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---

# Create and start a packet capture

In order to create and start a packet capture session you invoke a PUT call containing the required and optional parameters required.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| PUT | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}/packetCaptures/{packetCaptureName}?api-version={api-version}` |

| Parameter | Description |
| --------- | ----------- |
| target |	The ID of the target resource, only VM is currently supported (required). |
| storageLocation |	The data structure holds both the storage blob connection information (storage account id and storage path) and/or the local file path. If both the storageID and the filePath are provided, then the capture will be saved in both locations (at least one is required). |
| storageLocation.storageId |	storageId must be a resource ID of an existing storage account. (optional) Private containers not supported. VM outbound traffic to storage account must be allowed. |
| storageLocation.storagePath |	storagePath must be a well-formed URI describing the location to save the packet capture. (optional) Ex. "https://storageact1.blob.core.windows.net/packetcaptures/pcapture.cap" |
| storageLocation.filePath |	filePath should be valid local or UNC path on the target VM. (optional) Ex. "C:\Folder\pcapture.cap" |
| bytesToCapturePerPacket |	Number of bytes captured per packet. The remaining bytes are truncated. (optional). </br>Default = 0 (Entire Packet Captured) |
| totalBytesPerSession |	Maximum size of the capture (optional) </br>Default = 1073741824 (1 GiB, current default) |
| timeLimitInSeconds |	Maximum duration of the capture session in seconds. (optional). </br>Default = 18000 (5 hours, current maximum) |
| filters |	Packet capture filtering definitions. Multiple filters can be used (optional). |
| filters.protocol |	Protocol to be filtered on. </br>Options: "TCP", "UDP", "Any" </br>Default = "Any" |
| filters.localIPAddress |	Local IP address to be filtered on. </br>Notation: </br>"127.0.0.1" for single address entry. </br>"127.0.0.1-127.0.0.255" for range. </br>"127.0.0.1;127.0.0.5;" for multiple entries. </br>Multiple ranges not currently supported. </br>Mixing ranges with multiple entries not currently supported Default = null |
| filters.remoteIPAddress |	Remote IP address to be filtered on. </br>Notation: </br>"127.0.0.1" for single address entry. </br>"127.0.0.1-127.0.0.255" for range. "127.0.0.1;127.0.0.5;" for multiple entries.</br>Multiple ranges not currently supported. </br>Mixing ranges with multiple entries not currently supported Default = null |
| filters.localPort |	Local port to be filtered on.</br> Notation: </br>"80" for single port entry. </br>"80-85" for range. </br>"80;443;" for multiple entries. </br>Multiple ranges not currently supported. </br>Mixing ranges with multiple entries not currently supported </br>Default = null |
| filters.remotePort |	Remote port to be filtered on.</br> Notation:</br> "80" for single port entry. </br>"80-85" for range. </br>"80;443;" for multiple entries. </br>Multiple ranges not currently supported. </br>Mixing ranges with multiple entries not currently supported </br>Default = null |
 
## Response  

The response includes an HTTP status code and a set of response headers.

### Success codes

| Code | Description |
| ---- | ----------- |
| **201 (Created)** | Packet Capture session has been created. | 

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
| **404 NotFound** | A requisite resource does not exist. |
| **409 Conflict** | A resource with the same name already exists. (Attempts to overwrite existing Packet Captures will result in this error.) |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     



 