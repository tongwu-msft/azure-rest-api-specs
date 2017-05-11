---
title: Get the shared key for a connection
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: yushwang
ms.author: yushwang
manager: rossort
---
# Get the shared key for a connection&#160;
Gets the shared key for the connection.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/microsoft.network/connections/{connectionName}/sharedkey?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the connection exists. |
| resourceGroup | The name of the resource group that contains the connection. |
| connectionName | The name of the connection.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 
 
## Response  
 Status code: 200 (OK) if the connection exists; otherwise, 404 (Not Found).  
  
```json 
{  
  "value": {shared-key-value}  
}  
```  
  
 The value element contains the shared key of the connection.
