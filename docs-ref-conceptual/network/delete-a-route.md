---
title: "Delete a route"
ms.custom: ""
ms.date: "2015-11-04"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a9bf032e-d922-4254-b33e-c653be3ec355
caps.latest.revision: 10
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
# Delete a route
## Request  
 See [Common parameters and headers](../NetworkREST/routes.md#bk_common) for headers and parameters that are used by all requests related to Routes.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/routeTables/{routeTableName}/routes/{routeName}?api-version={api-version}`|  
  
 Replace {routeName} with the name of the route you want to delete.  
  
## Response  
 **Response code:**  
  
 Returns status code 200 (OK), if the operation was accepted.  
  
 Returns status code 204 (asynchronously) if the route was deleted. Also returns 204, if the route entry is not found.  
  
 Returns 412 (Precondition Failed) if the resource's ETag doesn’t match one specified in If-Match header.