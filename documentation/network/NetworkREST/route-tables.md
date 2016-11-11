---
title: "Route Tables"
ms.custom: ""
ms.date: "2016-04-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: d324ffa8-6244-444f-b18e-98769548789c
caps.latest.revision: 11
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
# Route Tables
Route table resource is associated with a subnet. The route table resource enables addition of user defined routes.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with 2016-03-30.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups).  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](../Topic/Authenticating%20Azure%20Resource%20Manager%20requests.md).  
  
## Tasks  
 You can do the following with route table:  
  
-   [Create or update a route table](../NetworkREST/create-or-update-a-route-table.md)  
  
-   [Delete a route table](../NetworkREST/delete-a-route-table.md)  
  
-   [Get information about a route table](../NetworkREST/get-information-about-a-route-table.md)  
  
-   [List route tables within a resource group](../NetworkREST/list-route-tables-within-a-resource-group.md)