---
title: Delete a virtual network gateway
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: yushwang
ms.author: yushwang
manager: rossort
---
# Delete a virtual network gateway
Delete an existing virtual network gateway.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/microsoft.network/virtualNetworkGateways/{virtualNetworkGatewayName}?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the virtual network gateway exists. |
| resourceGroup | The name of the resource group that contains the virtual network gateway. |
| virtualNetworkGatewayName | The name of the virtual network gateway.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 
  
## Response  
 Status code: 200 (OK) if the virtual network gateway was successfully deleted; otherwise, 404 (Not Found). 409 (Conflict) can occur if the virtual network gateway is in a Provisioning or Deprovisioning state.
