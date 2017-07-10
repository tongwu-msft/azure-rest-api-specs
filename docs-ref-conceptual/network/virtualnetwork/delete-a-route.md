---
title: Delete a route
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# Delete a route

This operations deletes a route.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/routeTables/{routeTableName}/routes/{routeName}?api-version={api-version}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the route exists. |
| resourceGroup | The name of the resource group that contains the route. |
| routeTableName | The name of the route table. |
| routeName | The name of the route. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 **Response code:**  
  
 Returns status code 200 (OK), if the operation was accepted.  
  
 Returns status code 204 (asynchronously) if the route was deleted. Also returns 204, if the route entry is not found.  
  
 Returns 412 (Precondition Failed) if the resource's ETag doesn’t match one specified in If-Match header.
