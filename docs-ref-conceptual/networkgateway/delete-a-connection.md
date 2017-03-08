---
title: "Delete a connection&#160;"
ms.custom: ""
ms.date: "05/03/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 01d138e1-e7ad-4ec1-b4ca-2932c397d564
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
# Delete a connection&#160;
Delete the specified gateway connection.  
  
## Request  
 See [Connections](connections.md) for headers and parameters that are used by all requests related to connections.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroup/{resource-group-name}/providers/microsoft.network/connections/{connection-name}?api-version={api-version}`|  
  
## Response  
 Status code: 200 (OK) if the connection can be deleted. 404 (Not Found) if the connection doesn’t exist.
