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

For a specified VM resource and a packet with specified direction using local and remote, IP addresses and ports, returns whether the packet is allowed or denied.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| POST | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}/ipFlowVerify?api-version={api-version}` |

| Element name | Required | Type | Description |
| --- | --- | --- | --- |
| targetResourceId | Yes | String | The resource identifier of the target resource against which the action is to be performed. For IP Flow Verify the supported target resource type is Microsoft.Compute/virtualMachines/ (Required) |
| direction | Yes | String | The direction of the packet represented by the 5-tuple. Allowed values are "Inbound" and "Outbound". (Required) |
| protocol | Yes | String | The protocol. Allowed values are "TCP" and "UDP". (Required) |
| localPort | Yes | String | The local port. Allowed values are single integer (0-65535). (Required) |
| remotePort | Yes| String | The remote port. Allowed values are single integer (0-65535). (Required) |
| localIPAddress | Yes | String | The local IP address. Allowed values are valid IPv4 addresses. (Required) |
| remoteIPAddress | Yes | String | The remote IP address. Allowed values are valid IPv4 addresses. (Required) |
| targetNicResourceId | Optional* | String | The Nic id. (If VM has multiple nics and IP forwarding is enabled on any of the nics, then this parameter must be specified. Otherwise optional.) |

```json
{ 
"targetResourceId": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.compute/virtualMachine/{vmName}", 
"direction": "Outbound", 
"protocol": "TCP", 
"localPort": "80", 
"remotePort": "80", 
"localIPAddress": "10.1.1.2", 
"remoteIPAddress": "10.2.1.2", 
"targetNicResourceId" : "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkInterfaces/{vmNICName}" 
}
```

## Response  

The response includes an HTTP status code and a response body containing the result of the operation.
If a flow is allowed or denied by a security group, provides the rule name. If no security group rule matches the input, it returns "Deny" and "RuleName" is not displayed. If you have not applied any security group on subnet or a NIC, it reports "error".

### Success codes

| Code | Description |
| ---- | ----------- |
|200(OK) | Operation successful|
|202 (Accepted) | Operation running asynchronously. The result will be published to the location found in the response header. To get the status of the operation poll on Azure-AsyncOperation URI found in the response header.|

```json
{ 
"access": "Allow | Deny", 
"ruleName" : "Name of the rule" 
}
```

|Element name |Type |Description|
|---|---|---|
|access |String| Access type. Expected values are Allow and Deny.|
|ruleName |String| Name of the rule. If input is not matched against any security rule, it is not displayed.|

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **412 Precondition Failed** | No matching resource |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     



 
