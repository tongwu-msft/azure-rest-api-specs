---
title: Delete a local network gateway
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: yushwang
ms.author: yushwang
manager: rossort
---
# Delete a local network gateway
Delete the specified local network gateway.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/microsoft.network/localnetworkgateways/{localNetworkGatewayName}?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the local network gateway exists. |
| resourceGroup | The name of the resource group that contains the local network gateway. |
| localNetworkGatewayName | The name of the local network gateway.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 
   
## Response  
  
 Status code: 200 (OK) if the action ws successful; otherwise, 404 (Not Found).
