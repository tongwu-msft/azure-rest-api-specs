---
title: Delete a virtual network peering
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# Delete a virtual network peering

This operations deletes a virtual network peering.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/virtualNetworks/{virtualNetworkName}/virtualNetworkPeerings/{virtualNetworkPeeringName}?api-version={api-version}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the virtual network peering exists. |
| resourceGroup | The name of the resource group that contains the virtual network peering. |
| virtualNetworkName | The name of the virtual network. |
| virtualNetworkPeeringName | The name of the virtual network peering. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 
  
## Response  
 **Status code:**  
  
 202-Accepted if resource exists and the request is accepted. When asynchronous delete operation completes, GET \<Location header> returns 204.  
  
 Returns 412-Precondition Failed if the resource's ETag doesn’t match one specified in If-Match header.  
  
 Returns 204-No Content if resource does not exist.
## Remarks  
 For more information about Virtual Network Peering, see [Create or update a virtual network peering](create-or-update-a-virtual-network-peering.md).
