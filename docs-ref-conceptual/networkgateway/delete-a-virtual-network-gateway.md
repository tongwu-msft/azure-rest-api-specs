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
|DELETE|`/subscriptions/{subscriptionId}/resourceGroups/{resource-group-name}/providers/microsoft.network/virtualNetworkGateways/{virtual-network-gateway-name}?api-version={api-version}`|  
  
## Response  
 Status code: 200 (OK) if the virtual network gateway was successfully deleted; otherwise, 404 (Not Found). 409 (Conflict) can occur if the virtual network gateway is in a Provisioning or Deprovisioning state.
