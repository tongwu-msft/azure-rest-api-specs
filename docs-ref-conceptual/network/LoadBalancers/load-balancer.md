---
title: "Load balancer"
ms.custom: ""
ms.date: "2016-07-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
ms.assetid: 1c8ce3b6-5f64-4268-aa25-2bd57403e6fe
caps.latest.revision: 6
author: "georgewallace"
ms.author: "gwallace"
manager: "carmonm"
---
# Load balancer
Load balancer allows fine-grained configuration of how incoming traffic is distributed across VM instances hosted in Microsoft Azure. A load balancer has two main parts: a frontend and a backend configuration.  
  
 The frontend configuration describes the exposed IP address of the load balancer. The frontend IP address of a load balancer can be a public or private IP address.  
  
 The backend configuration of a load balancer describes how the traffic is distributed across VM instances and how health of a particular VM instance is determined.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks:  
  
-   Replace {api-version} with 2015-06-15.  
  
-   Replace {subscription-id} with your subscription identifier in the URI.  
  
-   Replace {resource-group-name} with the resource group. For more information, see [Manage your Azure resources](http://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/).  
  
-   Set the Content-Type header to **application/json**.  
  
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](../Topic/Authenticating%20Azure%20Resource%20Manager%20requests.md).  
  
## Tasks  
 You can do the following with load balancers:  
  
-   [Create or update a load balancer](../loadbalancers/create-or-update-a-load-balancer.md)  
  
-   [Delete a load balancer](../loadbalancers/delete-a-load-balancer.md)  
  
-   [Get information about a load balancer ](../loadbalancers/get-information-about-a-load-balancer .md)  
  
-   [List load balancers within a resource group](../loadbalancers/list-load-balancers-within-a-resource-group.md)  
  
-   [List load balancers within a subscription](../loadbalancers/list-load-balancers-within-a-subscription.md)  
  
-   [Load balancer inbound NAT rules](../loadbalancers/load-balancer-inbound-nat-rules.md)