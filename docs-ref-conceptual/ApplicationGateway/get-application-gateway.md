---
title: "Get Application Gateway"
ms.custom: ""
ms.date: "2016-02-18"
ms.prod: "azure"
ms.reviewer: ""
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 7a8c98c4-2c5b-4bc4-825c-7eb6e0e7453d
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
# Get Application Gatewa
Retrieve an application gateway properties.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGateways/{applicationGatewayName}`|  
  
 *Replace {ApplicationGatewayName} with the name of the application gateway to get its properties.*  
  
## Request body  
 None  
  
### Response  
 **Status code:** If successful, the operation returns HTTP status code of 200(OK). 404 (Not Found) if resource does not exist.