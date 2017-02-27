---
title: "Query Network Security Group Flow Logs status"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: mareat
manager: vitinnan
---

# Query Network Security Group Flow Logs status

The command to query the status of Network Security Group flow logs is shown below.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| POST | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}/queryFlowLogStatus?api-version={api-version}` |

| Element name | Required | Type | Description |
| --- | --- | --- | --- |
| targetResourceId | Yes | String | The target resource to query flow logging status. Currently NetworkSecurityGroup is the only supported resource. |

```json
{
  "targetResourceId": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/networkSecurityGroups/{nsgName}",
}
```

## Response  

#### Status Code: 200
```json
{
  "targetResourceId": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/networkSecurityGroups/{nsgName}",
  "properties": {
    "storageId": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Storage/storageAccounts/{storageName}",
    "enabled": true,
    "retentionPolicy": {
      "days": 0,
      "enabled": false
    }
  }
}
```

### Success codes

| Code | Description |
| ---- | ----------- |
|200(OK) | Operation successful|
|202 (Accepted) | Operation running asynchronously. The result will be published to the location found in the response header. To get the status of the operation poll on Azure-AsyncOperation URI found in the response header.|

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. |
| **412 Precondition Failed** | Resource doesn't match the one specified. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |     