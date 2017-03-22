---
title: Start an application gateway
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: amitsriva
ms.author: amsriva
manager: rossort
---
# Start Application Gateway

Start an application gateway resource.  
  
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`/subscriptions/{subscriptionId/services/networking/applicationGateways/{applicationGatewayName}/Start?api-version={api-version}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the Application Gateway exists. |
| resourceGroupName | The name of the resource group that contains the Application Gateway. |
| applicationGatewayName | The name of the Application Gateway. The application gateway name must be unique within the resource group and be in its own empty virtual network subnet.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 
  
### Response body  
 None.  
  
 **Status code:** If successful, the operation returns HTTP status code of 202 (Accepted).
