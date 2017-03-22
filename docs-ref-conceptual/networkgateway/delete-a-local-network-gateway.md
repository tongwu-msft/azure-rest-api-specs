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
|DELETE|`/subscriptions/{subscriptionId}/resourceGroups/{resource-group-name}/providers/microsoft.network/localnetworkgateways/{local-network-gateway-name}?api-version={api-version}`|  
  
## Response  
  
 Status code: 200 (OK) if the action ws successful; otherwise, 404 (Not Found).
