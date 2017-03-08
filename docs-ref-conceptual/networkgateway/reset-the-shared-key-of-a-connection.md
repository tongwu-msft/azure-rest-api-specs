---
title: "Reset the shared key of a connection&#160;"
ms.custom: ""
ms.date: "05/03/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: cc1da6eb-f348-47ce-9a4e-fbd419e27c51
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
# Reset the shared key of a connection&#160;
Resets the shared key for the virtual network gateway connection.  
  
## Request  
 See [Connections](connections.md) for headers and parameters that are used by all requests related to connections.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`/subscriptions/{subscriptionId}/resourceGroups/{resource-group-name}/providers/microsoft.network/connections/{connection-name}/sharedkey/reset?api-version={api-version}`|  
  
```json  
{  
   "KeyLength": {shared-key-length}  
}  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|KeyLength|Yes|String|The length of the shared key.|  
  
## Response  
 Status code: 200 (OK) if the action is successful; otherwise, 404 (Not Found).
