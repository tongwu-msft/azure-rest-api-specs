---
title: "Network Interface Cards"
ms.custom: ""
ms.date: "2016-07-07"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 317eec5b-0a28-4a21-b068-a0f452a30711
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
# Network Interface Cards
Network interface cards are virtual network cards that form the link between virtual machines and the virtual network. Each VM has at least 1 network interface card. Multiple subnets can be bound to the same network interface card and can have 1 or more IP addresses bound to it. Network interface cards must be associated with a public IP address to be accessible over the Internet.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with 2016-03-30.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Manage Azure resources.](http://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups),  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](../../index.md).  
  
## Tasks  
 You can do the following with network interface cards:  
  
-   [Create or update a network interface card](create-or-update-a-network-interface-card.md)  
  
-   [Delete a network interface card](delete-a-network-interface-card.md)  
  
-   [Get information about a network interface card](get-information-about-a-network-interface-card.md)  
  
-   [List network interface cards within a resource group](list-network-interface-cards-within-a-resource-group.md)  
  
-   [List network interface cards within a subscription](list-network-interface-cards-within-a-subscription.md)

-   [Get effective network security group](get-effective-network-security-group.md)

-   [Get effective route table](get-effective-route-table.md)