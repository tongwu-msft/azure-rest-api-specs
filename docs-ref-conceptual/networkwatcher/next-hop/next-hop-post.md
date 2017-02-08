---
title: "View IP flow"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---

# View IP flow

For a specified VM resource and a packet with specified direction using local and remote, IP addresses and ports, returns whether the packet is allowed or denied. If allowed or denied by a security group, provides the rule name. If no security group rule matches with input, it returns "Deny" and "RuleName" is not displayed. If you have not applied any security group on subnet or NIC, it reports "error".

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| POST | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}/ipFlowVerify?api-version={api-version}` |

| Element name | Required | Type | Description |
| --- | --- | --- | --- |
| targetResourceId | Yes | String | The resource identifier of the target resource against which the action is to be performed. For IP Flow Verify the supported target resource type is Microsoft.Compute/virtualMachines/ (Required) |
| sourceIPAddress | Yes | String | The local IP address. Allowed values are valid IPv4 addresses. (Required) |
| destinationIPAddress | Yes | String | The remote IP address. Allowed values are valid IPv4 addresses. (Required) |
| targetNicResourceId | Optional* | String | The Nic id. (If VM has multiple nics and IP forwarding is enabled on any of the nics, then this parameter must be specified. Otherwise optional.) |

```json
{ 
"targetResourceId": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.compute/virtualMachine/{vmName}", 
"sourceIpAddress": "10.0.0.5", 
"destinationIpAddress": "10.0.0.10", 
"targetNicResourceId" : "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/{vmNICName}"  
}
```

## Response  

The response includes an HTTP status code and a set of response headers.

### Success codes

| Code | Description |
| ---- | ----------- |
|200(OK) | Operation successful|
|202 (Accepted) | Operation running asynchronously. The result will be published to the location found in the response header. To get the status of the operation poll on Azure-AsyncOperation URI found in the response header.|

```json
{ 
    "nextHopType": "Internet | VirtualAppliance | VirtualNetworkGateway | VnetLocal | HyperNetGateway | None", 
    "nextHopIpAddress": "10.0.0.1", 
    "routeTableId": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/{routeTableName}" }
```

|Element name |Type |Description|
|---|---|---|
|nextHopType| String| Next hop type. Acceptable values are Internet, VirtualAppliance, VirtualNetworkGateway, VnetLocal, HyperNetGateway and None.|
|nextHopIpAddress |String| Next hop IP address.|
|routeTableId| String| The resource identifier for the route table associated with the route being returned. If the route being returned does not correspond to any user created routes, then this field will be the string "System Route".|

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **412 Precondition Failed** | The operation is being throttled. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     



 