---
title: "Set the shared key of a connection&#160;"
ms.custom: ""
ms.date: "05/03/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a59766d3-25e2-46a2-9871-e1bccd742585
caps.latest.revision: 4
author: "yushwang"
ms.author: "yushwang"
manager: "rossort"
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
# Set the shared key of a connection&#160;
Sets the shared key for the virtual network gateway connection.  
  
## Request  
 See [Connections](connections.md) for headers and parameters that are used by all requests related to  connections.  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`/subscriptions/{subscriptionId}/resourceGroups/{resource-group-name}/providers/microsoft.network/connections/{connection-name}/sharedkey?api-version={api-version}`|  
  
```json  
{  
  "value": {shared-key-value}  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|value|Yes|String|The value of the shared key.|  
  
## Response  
 Status code: 200 (OK) if the action is successful; otherwise, 404 (Not Found).
