---
title: Delete ExpressRoute Circuit BGP Peering
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
ms.assetid: 9e8762e5-ad43-4e3b-9153-302df957f952
author: georgewallace
ms.author: gwallace
manager: timlt
---
# Delete ExpressRoute Circuit BGP Peering
The DELETE peering operation deletes the specified peering for a given circuit.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/expressRouteCircuits/{circuitName}/peerings/{peeringName}?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the ExpressRoute Circuit exists. |
| resourceGroup | The name of the resource group that contains the ExpressRoute Circuit. |
| circuitName | The name of an ExpressRoute circuit already created.|
| peeringName | The name of the BGP Peering of the existing ExpressRoute circuit|
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 **Status code: 202**  
  
 The response returns 202 Accepted with a ‘Deleting’ provisioningState till the operation completes. The header also contains ‘Azure-AsyncOperation’ header pointing to an operations resource. The URI for Azure-AsyncOperation header is of the form - https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Network/locations/{location}/operations/{operationId}&api-version={api-version}.   
The operation URI can be queried to find the current state of the operation.