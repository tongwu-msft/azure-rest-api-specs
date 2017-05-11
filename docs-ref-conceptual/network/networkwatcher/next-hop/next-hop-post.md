---
title: "Get Next Hop"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---

# Get Next Hop

View the next hop from a VM. Using Next Hop, you can investigate where outbound traffic from your VM is heading first after it leaves the VM. Next hop allows you to view the type of Azure resource, the associated IP address of that resource, and the routing table rule that is responsible for the route.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| POST | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}/nextHop?api-version={api-version}` |

| Element name | Required | Type | Description |
| --- | --- | --- | --- |
| targetResourceId | Yes | String | The resource identifier of the target resource against which the action is to be performed. For Next Hop the supported target resource type is Microsoft.Compute/virtualMachines/ |
| sourceIPAddress | Yes | String | The local IP address. Allowed values are valid IPv4 addresses. |
| destinationIPAddress | Yes | String | The remote IP address. Allowed values are valid IPv4 addresses. |
| targetNicResourceId | Optional* | String | The Nic id. (*If VM has multiple nics and IP forwarding is enabled on any of the nics, then this parameter must be specified. Otherwise optional.) |

```json
{ 
"targetResourceId": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.compute/virtualMachine/{vmName}", 
"sourceIpAddress": "10.0.0.5", 
"destinationIpAddress": "10.0.0.10", 
"targetNicResourceId" : "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/{vmNICName}"  
}
```

## Response  

####Status Code: 200.
```json
{ 
    "nextHopType": "Internet | VirtualAppliance | VirtualNetworkGateway | VnetLocal | HyperNetGateway | None", 
    "nextHopIpAddress": "10.0.0.1", 
    "routeTableId": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/routeTables/{routeTableName}" }
```

### Success codes

| Code | Description |
| ---- | ----------- |
|200(OK) | Operation successful|
|202 (Accepted) | Operation running asynchronously. The result will be published to the location found in the response header. To get the status of the operation poll on Azure-AsyncOperation URI found in the response header.|



|Element name |Type |Description|
|---|---|---|
|nextHopType| String| Next hop type. Possible values are: Internet, VirtualAppliance, VirtualNetworkGateway, VnetLocal, HyperNetGateway and None.|
|nextHopIpAddress |String| Next hop IP address.|
|routeTableId| String| The resource identifier for the route table associated with the route being returned. If the route being returned does not correspond to any user created routes, then this field will be the string "System Route".|

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **412 Precondition Failed** | Resource doesn't match the one specified. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     



 
