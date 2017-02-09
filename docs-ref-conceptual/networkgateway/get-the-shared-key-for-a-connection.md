---
title: "Get the shared key for a connection&#160;"
ms.custom: ""
ms.date: "05/03/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 3050fc8a-af43-4b16-bae6-9c9005e3f95b
caps.latest.revision: 4
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
# Get the shared key for a connection&#160;
Gets the shared key for the connection.  
  
## Request  
 See [Connections](../NetworkGatewayREST/connections.md) for headers and parameters that are used by all requests related to connections.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/microsoft.network/connections/{connection-name}/sharedkey?api-version={api-version}`|  
  
## Response  
 Status code: 200 (OK) if the connection exists; otherwise, 404 (Not Found).  
  
```  
{  
  "value": {shared-key-value}  
}  
```  
  
 The value element contains the shared key of the connection.
