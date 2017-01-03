---
title: "Delete a route table"
ms.custom: ""
ms.date: "2015-11-04"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: e300137f-3a1f-4def-a4aa-10c56368bee1
caps.latest.revision: 12
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
# Delete a route table
## Request  
 See [Common parameters and headers](../NetworkREST/route-tables.md#bk_common) for headers and parameters that are used by all requests related to route table.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/routeTables/{routeTableName}?api-version={api-version}`|  
  
 Replace {routeTableName} with the name of the route table which you want to delete  
  
## Response  
 **Status code:**  
  
 Returns status code 200 (OK), if the operation to delete was accepted.  
  
 Returns status code 202 synchronously, if the route table was not found  
  
 Returns status code 202 asynchronously, if the route table was deleted.  
  
 Returns 404 if resource not found