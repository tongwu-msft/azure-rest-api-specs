---
title: Delete a load balancer
ms.date: 03/15/2017
ms.service: load-balancer
ms.topic: reference
ms.devlang: rest-api
author: georgewallace
ms.author: gwallace
manager: timlt
---
# Delete a load balancer

This operations deletes a load balancer.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/loadBalancers/{loadBalancerName}?api-version={api-version}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the Load balancer exists. |
| resourceGroup | The name of the resource group that contains the Load balancer. |
| loadBalancerName | The name of the Load balancer that contains the inbound NAT rule. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 **Status code:**  
  
-   202-Accepted if resource exists and the request is accepted.  
  
-   When asynchronous delete operation completes, GET \<Location header> returns 204.  
  
-   Returns 412-Precondition Failed if the resource's ETag doesn’t match one specified in If-Match header.  
  
-   Returns 204-No Content if resource does not exist.
