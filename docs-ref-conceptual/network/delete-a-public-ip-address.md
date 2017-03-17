---
title: Delete a public IP address
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---

# Delete a public IP address

This operations deletes a public IP address.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/publicIPAddresses/{publicIPAddressName}?api-version={api-version}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the public IP address exists. |
| resourceGroup | The name of the resource group that contains the public IP address. |
| publicIPAddressName | The name of the public IP address. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 
 
## Response  
 **Status code:**  
  
 202-Accepted if resource exists and the request is accepted.   
When asynchronous delete operation completes, GET \<Location header> returns 204.   
Returns 412-Precondition Failed if the resource's ETag doesn’t match one specified in If-Match header.   
Returns 204-No Content if resource does not exist.
