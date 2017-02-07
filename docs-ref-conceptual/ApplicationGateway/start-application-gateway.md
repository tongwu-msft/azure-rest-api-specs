---
title: "Start Application Gateway"
ms.custom: ""
ms.date: "2016-02-18"
ms.prod: "azure"
ms.reviewer: ""
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: fe2a1d8b-41e9-4e1c-b67a-ff7e4110ef49
caps.latest.revision: 3
author: "georgewallace"
ms.author: "gwallace"
manager: "carmonm"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Start Application Gateway
Start an application gateway resource.  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.azure.com/subscriptions/{subscriptionId<subscription-id>/services/networking/applicationGateways/{applicationGatewayName}/Start`|  
  
 *Replace {ApplicationGatewayName} with the name of the application gateway you want to start.*  
  
### Response body  
 None.  
  
 **Status code:** If successful, the operation returns HTTP status code of 202 (Accepted).