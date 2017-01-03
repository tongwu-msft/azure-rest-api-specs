---
title: "Subnets"
ms.custom: ""
ms.date: "2016-04-28"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 861774d8-d096-41b9-a928-078b7028bc84
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
# Subnets
Subnets represent network segments within the IP space defined by the virtual network.  
  
 Subnets are child resources of a virtual network. Subnets have names unique within a VNET and they can be addressed via URIs. Subnets can be added and deleted by updating VNET or via PUT/DELETE against individual subnets.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with 2016-03-30.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups).  
  
-   Replace {virtual-network-name} with the name of the virtual network that contains the subnet.  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](../Topic/Authenticating%20Azure%20Resource%20Manager%20requests.md).  
  
## Tasks  
 You can do the following with subnets:  
  
-   [Create or update a subnet](../NetworkREST/create-or-update-a-subnet.md)  
  
-   [Delete a subnet](../NetworkREST/delete-a-subnet.md)  
  
-   [Get information about a subnet](../NetworkREST/get-information-about-a-subnet.md)  
  
-   [List subnets within a virtual network](../NetworkREST/list-subnets-within-a-virtual-network.md)