---
title: "List application gateways (GET)"
ms.custom: ""
ms.date: "2016-02-18"
ms.prod: "azure"
ms.reviewer: ""
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 2ee13e10-92fe-4961-8aa1-799800aa3d0b
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
# List application gateways (GET)
Lists all application gateways that belong to a subscription.  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways`|  
  
### Response body  
 A collection of results of the GET on Application Gateway  
  
 **Status code:** If successful, the operation returns HTTP status code of 200(OK).