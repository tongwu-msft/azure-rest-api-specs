---
title: Stop Application Gateway
ms.date: 03/09/2017
ms.service: application-gateway
ms.devlang: rest-api
ms.topic: reference
author: amitsriva
ms.author: amsriva
manager: rossort
---
# Stop Application Gateway

Stop an application gateway resource.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`/subscriptions/{subscriptionId<subscription-id>/services/networking/applicationGateways/{applicationGatewayName}/stop?api-version={api-version}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the Application Gateway exists. |
| resourceGroupName | The name of the resource group that contains the Application Gateway. |
| applicationGatewayName | The name of the Application Gateway. The application gateway name must be unique within the resource group and be in its own empty virtual network subnet.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 

### Response body  
 None.
