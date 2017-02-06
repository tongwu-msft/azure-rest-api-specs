---
title: "Delete Application Gateway (DELETE)"
ms.custom: ""
ms.date: "2016-02-18"
ms.prod: "azure"
ms.reviewer: ""
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: df397915-4520-42c3-a87c-8397a39cfae8
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
# Delete Application Gateway (DELETE)
Delete an application gateway resource.  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|*DELETE*|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{applicationGatewayName}`|  
  
 *Replace {ApplicationGatewayName} with the name of the application gateway you want to delete.*  
  
### Response body  
 None.  
  
 **Status code:** If successful, the operation returns HTTP status code of 202 (Accepted). The delete operation must be idempotent, will return 204 (No Content) if the resource with specified name does not exist.