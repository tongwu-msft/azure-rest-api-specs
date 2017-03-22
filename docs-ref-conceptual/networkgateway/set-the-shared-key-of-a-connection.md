---
title: Set the shared key of a connection
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: yushwang
ms.author: yushwang
manager: rossort
---
# Set the shared key of a connection&#160;
Sets the shared key for the virtual network gateway connection.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|PUT|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/microsoft.network/connections/{connectionName}/sharedkey?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the connection exists. |
| resourceGroup | The name of the resource group that contains the connection. |
| connectionName | The name of the connection.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 
 
```json  
{  
  "value": {shared-key-value}  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|value|Yes|String|The value of the shared key.|  
  
## Response  
 Status code: 200 (OK) if the action is successful; otherwise, 404 (Not Found).
