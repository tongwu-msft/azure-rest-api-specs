---
title: "Load balancer inbound NAT rules"
ms.custom: ""
ms.date: "2016-07-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
ms.assetid: be68ab6e-83d2-4910-b82e-1fecf00ff69f
caps.latest.revision: 8
author: "georgewallace"
ms.author: "gwallace"
manager: "carmonm"
---
# Load balancer inbound NAT rules
Inbound NAT Rules control how inbound traffic coming to frontend IP (VIP) of the load balancer is forwarded to private IP (DIP) of a VM behind the load balancer. These rules are often used for setting up RDP connection to a VM. Each rule has a reference to a frontend IP configuration of the load balancer and a reference to a private IP on a network interface of the VM. Reference to the private IP is read-only, it gets updated using Update Network Interface Card operation.  
  
## Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with 2016-06-01.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Manage your Azure resources](http://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).  
  
-   Set the Content-Type header to **application/json**.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).  
  
## Tasks  
 You can do the following with load balancer inbound NAT rules:  
  
-   [Create or update a load balancer inbound NAT rule](../loadbalancers/create-or-update-a-load-balancer-inbound-nat-rule.md)  
  
-   [List inbound NAT rules of a load balancer](../loadbalancers/list-inbound-nat-rules-of-a-load-balancer.md)  
  
-   [Get information about a load balancer inbound NAT rule](../loadbalancers/get-information-about-a-load-balancer-inbound-nat-rule.md)  
  
-   [Delete a load balancer inbound NAT rule](../loadbalancers/delete-a-load-balancer-inbound-nat-rule.md)