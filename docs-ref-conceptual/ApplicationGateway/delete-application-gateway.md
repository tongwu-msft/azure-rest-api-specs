---
title: Delete an application gateway | Microsoft Docs
ms.date: 03/29/2017
ms.service: application-gateway
ms.devlang: rest-api
ms.topic: reference
author: amitsriva
ms.author: amsriva
manager: rossort
---
# Delete Application Gateway (DELETE)

Delete an application gateway resource.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{applicationGatewayName}?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the Application Gateway exists. |
| resourceGroupName | The name of the resource group that contains the Application Gateway. |
| applicationGatewayName | The name of the Application Gateway. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 
  
### Response body  
 None.  
  
 **Status code:** If successful, the operation returns HTTP status code of 202 (Accepted). The delete operation must be idempotent, will return 204 (No Content) if the resource with specified name does not exist.
