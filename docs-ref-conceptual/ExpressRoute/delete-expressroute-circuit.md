---
title: Delete ExpressRoute Circuit
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
ms.assetid: a5cf7b54-c74d-490b-80a1-21e064f4c1b5
author: georgewallace
ms.author: gwallace
manager: timlt
---
# Delete ExpressRoute Circuit
The DELETE operation deletes an Express Route circuit.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request   
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/expressRouteCircuits/{circuitName}?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the ExpressRoute Circuit exists. |
| resourceGroup | The name of the resource group that contains the ExpressRoute Circuit. |
| circuitName | The name of an ExpressRoute circuit already created.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 Status code: 202  
  
 The response returns 202 Accepted with a ‘Disabling’ provisioningState till the operation completes. The header also contains ‘Azure-AsyncOperation’ header pointing to an operations resource. The URI for Azure-AsyncOperation header is of the form - [https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Network/locations/{location}/operations/{operationId}&api-version={api-version}](https://management.azure.com/subscriptions/%7BsubscriptionId%7D/providers/Microsoft.Network/locations/%7Blocation%7D/operations/%7BoperationId%7D&api-version=%7Bapi-version%7D.).  
  
 The operation URI can be queried to find the current state of the operation.