---
title: "Public IP Addresses"
ms.custom: ""
ms.date: "2016-07-07"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a4180f72-6387-413d-b217-189189bc7f37
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
# Public IP Addresses
Public IP addresses can be used to acquire a static or dynamic public IP address. Public IP addresses can be used to publish your applications for access over the Internet. A static public IP address gets its value when the public IP address resource is created, and it keeps its value even if it is not associated with a running VM. Static public IP addresses are guaranteed to retain the same IP when that public IP address is transferred across load balancers or network interface cards. A dynamic public IP address gets its value when it is associated with a VM, and it loses its value in certain scenarios. For example, a dynamic public IP address will change its value when it is disassociated from one VM and assigned to another VM.  
  
 Public IP addresses can be assigned to a load balancer, or directly to a network interface of a VM. Associating a public IP address directly with the network interface of a VM makes it an instance-level public IP address. This means that all ports can be used for communication, except if traffic is controlled via security groups. When a public IP address is assigned to a load balancer, traffic flow to and through the public IP address is defined by the rules of the load balancer. Security groups to control traffic can be used in this scenario as well  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with 2016-03-30.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups).  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](../Topic/Authenticating%20Azure%20Resource%20Manager%20requests.md).  
  
## Tasks  
 You can do the following with public IP address:  
  
-   [Create or update a public IP address ](create-or-update-a-public-ip-address .md)  
  
-   [Delete a public IP address ](delete-a-public-ip-address .md)  
  
-   [Get information about a public IP address ](get-information-about-a-public-ip-address .md)  
  
-   [List public IP addresses within a resource group ](list-public-ip-addresses-within-a-resource-group .md)  
  
-   [List public IP addresses within a subscription ](list-public-ip-addresses-within-a-subscription .md)
