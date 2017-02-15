---
title: "Virtual Networks"
ms.custom: ""
ms.date: "2016-07-08"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: bba929d8-8cb0-42fb-8804-05df47a7b912
caps.latest.revision: 9
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
# Virtual Networks
A virtual network represents a computer network in which networking objects can be created. The virtual network reserves an address space and defines subnets in this address space. The DHCP options defined on a virtual network by default get applied to the NICs connected to this network.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with 2016-03-30.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups).  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information,  see [Authenticating Azure Resource Manager requests](../../index.md).  
  
## Tasks  
 You can do the following with Virtual Networks:  
  
-   [Create or update a virtual network](create-or-update-a-virtual-network.md)  
  
-   [List virtual networks within a resource group](list-virtual-networks-within-a-resource-group.md)  
  
-   [List virtual networks within a subscription](list-virtual-networks-within-a-subscription.md)  
  
-   [Get information about a virtual network](get-information-about-a-virtual-network.md)  
  
-   [Delete a virtual network](delete-a-virtual-network.md)

-   [Check private IP address availability in a virtual network](check-private-ip-address-availability.md)
