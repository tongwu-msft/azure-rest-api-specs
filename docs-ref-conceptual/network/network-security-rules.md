---
title: "Network Security Rules"
ms.custom: ""
ms.date: "2016-04-27"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 36faa348-6a8f-4c00-b078-63149d571c73
caps.latest.revision: 8
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
# Network Security Rules
Network security rules define a pattern of traffic to be enabled or denied. Network security rules are contained within a Network Security Group (NSG). NSGs can be applied at the subnet or NIC level.  
  
 Default network security rules are created to protect your virtual network by default. It is not possible to edit or delete a default network security rule, but they can be overridden by creating a network security rule with a lower priority. Default network security rules have priorities of 65000 and greater. To override a default network security rule, create a network security rule with a priority of less than 65000.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with 2016-03-30.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups).  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](../../index.md).  
  
## Tasks  
 You can do the following with Network Security Rules:  
  
-   [Create or update a network security rule](create-or-update-a-network-security-rule.md)  
  
-   [Delete a network security rule](delete-a-network-security-rule.md)  
  
-   [Get information about a default network security rule ](get-information-about-a-default-network-security-rule.md)  
  
-   [Get information about a network security rule ](get-information-about-a-network-security-rule.md)  
  
-   [List default networks security rules within a network security group](list-default-networks-security-rules-within-a-network-security-group.md)  
  
-   [List networks security rules within a network security group](list-networks-security-rules-within-a-network-security-group.md)
