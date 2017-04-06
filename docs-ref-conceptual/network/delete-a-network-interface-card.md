---
title: Delete a network interface card
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# Delete a network interface card

This operations deletes a network interface card.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/networkInterfaces/{networkInterfaceName}?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the network interface exists. |
| resourceGroup | The name of the resource group that contains the network interface card. |
| networkInterfaceName | The name of the network interface card. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 **Status code:**  
  
 202-Accepted if resource exists and the request is accepted. When asynchronous delete operation completes, GET \<Location header> returns 204.  
  
 Returns 412-Precondition Failed if the resource's ETag doesn’t match one specified in If-Match header.  
  
 Returns 204-No Content if resource does not exist.
