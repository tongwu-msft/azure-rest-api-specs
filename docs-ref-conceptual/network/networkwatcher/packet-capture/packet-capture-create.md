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

In order to create and start a packet capture session you invoke a PUT call containing the required and optional parameters.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| PUT | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}/packetCaptures/{packetCaptureName}?api-version={api-version}` |

#### Request Body
```json
{
  "properties": {
  "target": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.compute/virtualMachines/vm1",
  "bytesToCapturePerPacket": 40,
  "totalBytesPerSession": 252144000,
  "timeLimitInSeconds": 60,
  "storageLocation":  {
                         "storageId": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/pcstore", 
                         "storagePath": "https://{storageaccountname}.blob.core.windows.net/capture/{packetCapturenName}", 
                         "filePath" : "d:\capture\{packetCaptureName}"
                      },
  "filters": [
              {
                  "protocol": "Any",
                  "localIPAddress": "10.100.1.10",
                  "localPort": "80",
                  "remoteIPAddress" : "20.147.11.23"
                  "remotePort": "100-120"
              }
            ],
      }
}
```

| Parameter | Required | Type | Description |
| --------- | --------- | --------- |----------- |
| target | Yes	| String |The ID of the target resource, only VM is currently supported. |
| storageLocation | Yes	| String | The data structure holds both the storage blob connection information (storage account id and storage path) and/or the local file path. If both the storageID and the filePath are provided, then the capture will be saved in both locations (at least one is required). |
| storageLocation.storageId | Optional	| String |	storageId must be a resource ID of an existing storage account. Private containers not supported. VM outbound traffic to storage account must be allowed. |
| storageLocation.storagePath | Optional	| String |	storagePath must be a well-formed URI describing the location to save the packet capture. Ex. "https://storageact1.blob.core.windows.net/packetcaptures/pcapture.cap" |
| storageLocation.filePath |	Optional	| String | filePath should be valid path on the target VM. Ex. "C:\Folder\pcapture.cap" for Windows VMs, Linux VM filepath must start with "/var/captures/" Ex. "/var/captures/pcapture.cap" |
| bytesToCapturePerPacket | Optional	| String |	Number of bytes captured per packet. The remaining bytes are truncated. </br>Default = 0 (Entire Packet Captured) |
| totalBytesPerSession | Optional	| Int |	Maximum size of the capture </br>Default = 1073741824 (1 GiB, current default) |
| timeLimitInSeconds | Optional	| Int |	Maximum duration of the capture session in seconds. </br>Default = 18000 (5 hours, current maximum) |
| filters | Optional	| |	Packet capture filtering definitions. Multiple filters can be used . |
| filters.protocol | Optional	| String |	Protocol to be filtered on. </br>Options: "TCP", "UDP", "Any" </br>Default = "Any" |
| filters.localIPAddress | Optional	| String |	Local IP address to be filtered on. </br>Notation: </br>"127.0.0.1" for single address entry. </br>"127.0.0.1-127.0.0.255" for range. </br>"127.0.0.1;127.0.0.5;" for multiple entries. </br>Multiple ranges not currently supported. </br>Mixing ranges with multiple entries not currently supported Default = null |
| filters.remoteIPAddress | Optional	| String |	Remote IP address to be filtered on. </br>Notation: </br>"127.0.0.1" for single address entry. </br>"127.0.0.1-127.0.0.255" for range. "127.0.0.1;127.0.0.5;" for multiple entries.</br>Multiple ranges not currently supported. </br>Mixing ranges with multiple entries not currently supported Default = null |
| filters.localPort | Optional	| String |	Local port to be filtered on.</br> Notation: </br>"80" for single port entry. </br>"80-85" for range. </br>"80;443;" for multiple entries. </br>Multiple ranges not currently supported. </br>Mixing ranges with multiple entries not currently supported </br>Default = null |
| filters.remotePort | Optional	| String |	Remote port to be filtered on.</br> Notation:</br> "80" for single port entry. </br>"80-85" for range. </br>"80;443;" for multiple entries. </br>Multiple ranges not currently supported. </br>Mixing ranges with multiple entries not currently supported </br>Default = null |
 
## Response  

The response includes an HTTP status code and a response body.

### Success codes

| Code | Description |
| ---- | ----------- |
| **201 (Created)** | Packet Capture session has been created. | 

#### Response Body
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



 
