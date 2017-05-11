---
title: Delete a connection
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: yushwang
ms.author: yushwang
manager: rossort
---
# Delete a connection&#160;
Delete the specified gateway connection.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroup/{resourceGroup}/providers/microsoft.network/connections/{connectionName}?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the connection exists. |
| resourceGroup | The name of the resource group that contains the connection. |
| connectionName | The name of the connection.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 
   
## Response  
 Status code: 200 (OK) if the connection can be deleted. 404 (Not Found) if the connection doesn’t exist.
