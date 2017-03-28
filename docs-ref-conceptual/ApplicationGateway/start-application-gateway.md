---
title: Start Application Gateway
ms.date: 03/09/2017
ms.service: application-gateway
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
|POST|`/subscriptions/{subscriptionId<subscription-id>/services/networking/applicationGateways/{applicationGatewayName}/Start?api-version={api-version}`|  
  
 *Replace {ApplicationGatewayName} with the name of the application gateway you want to start.*  
  
### Response body  
 None.  
  
 **Status code:** If successful, the operation returns HTTP status code of 202 (Accepted).
