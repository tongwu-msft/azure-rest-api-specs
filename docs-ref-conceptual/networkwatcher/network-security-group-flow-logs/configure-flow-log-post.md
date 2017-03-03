---
title: "Configure Network Security Group Flow Logs"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: mareat
manager: vitinnan
---

# Configure Network Security Group Flow Logs

The command to enable and disable Network Security Group flow logs is shown below.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| POST | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/networkWatchers/{networkWatcherName}/configureFlowLog?api-version={api-version}` |

| Element name | Required | Type | Description |
| --- | --- | --- | --- |
| targetResourceId | Yes | String | The target resource to enable flow logging on. Currently NetworkSecurityGroup is the only supported resource. |
| properties | Yes | | Properties to configure storage and retention policies |
| properties.storageId | Yes | String | The id of the storage account to save the flow logs |
| properties.enabled | Yes | String | The flag to set whether the logging is enabled or disabled |
| Properties. retentionPolicy. days | Optional | String | The retention policy of the logs in days |
| Properties. retentionPolicy.enabled | Optional | String | The flag to set whether the retention policy is enabled or disabled

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