---
title: "Load Balancers REST"
ms.custom: ""
ms.date: "2016-07-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: be539976-05d1-4ff1-b187-8c8822b75225
caps.latest.revision: 18
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
# Load Balancers REST
## Load balancer  
 Load balancer allows fine-grained configuration of how incoming traffic is distributed across VM instances hosted in Microsoft Azure. A load balancer has two main parts: a frontend and a backend configuration. The frontend configuration describes the exposed IP address of the load balancer. The frontend IP address of a load balancer can be a public or private IP address. The backend configuration of a load balancer describes how the traffic is distributed across VM instances and how health of a particular VM instance is determined.  
  
 You can do the following with [Load balancer](../Load_Balancers/load-balancer.md):  
  
-   [Create or update a load balancer](../Load_Balancers/create-or-update-a-load-balancer.md)  
  
-   [Delete a load balancer](../Load_Balancers/delete-a-load-balancer.md)  
  
-   [Get information about a load balancer ](../Load_Balancers/get-information-about-a-load-balancer .md)  
  
-   [List load balancers within a resource group](../Load_Balancers/list-load-balancers-within-a-resource-group.md)  
  
-   [List load balancers within a subscription](../Load_Balancers/list-load-balancers-within-a-subscription.md)  
  
## Load balancer inbound NAT rules  
 Inbound NAT Rules control how inbound traffic coming to frontend IP (VIP) of the load balancer is forwarded to private IP (DIP) of a VM behind the load balancer. These rules are often used for setting up RDP connection to a VM. Each rule has a reference to a frontend IP configuration of the load balancer and a reference to a private IP on a network interface of the VM. Reference to the private IP is read-only, it gets updated using Update Network Interface Card operation.  
  
 You can do the following with [Load balancer inbound NAT rules](../Load_Balancers/load-balancer-inbound-nat-rules.md):  
  
-   [Create or update a load balancer inbound NAT rule](../Load_Balancers/create-or-update-a-load-balancer-inbound-nat-rule.md)  
  
-   [List inbound NAT rules of a load balancer](../Load_Balancers/list-inbound-nat-rules-of-a-load-balancer.md)  
  
-   [Get information about a load balancer inbound NAT rule](../Load_Balancers/get-information-about-a-load-balancer-inbound-nat-rule.md)  
  
-   [Delete a load balancer inbound NAT rule](../Load_Balancers/delete-a-load-balancer-inbound-nat-rule.md)