---
title: Operations on Load balancer inbound NAT rules
ms.date: 03/15/2017
ms.service: load-balancer
ms.topic: reference
ms.devlang: rest-api
author: georgewallace
ms.author: gwallace
manager: timlt
---
# Operations on Load balancer inbound NAT rules

Inbound NAT Rules control how inbound traffic coming to frontend IP (VIP) of the load balancer is forwarded to private IP (DIP) of a VM behind the load balancer. These rules are often used for setting up RDP connection to a VM. Each rule has a reference to a frontend IP configuration of the load balancer and a reference to a private IP on a network interface of the VM. Reference to the private IP is read-only, it gets updated using Update Network Interface Card operation.  

| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Create or update a load balancer inbound NAT rule](create-or-update-a-load-balancer-inbound-nat-rule.md)    |  PUT | Creates or updates a Load balancer inbound NAT rule. | 
| [List inbound NAT rules of a load balancer](list-inbound-nat-rules-of-a-load-balancer.md)      |  GET | Lists all inbound NAT rules on a Load balancer. |  
| [Get information about a load balancer inbound NAT rule](get-information-about-a-load-balancer-inbound-nat-rule.md)      |  GET | Gets an inbound NAT rule. | 
| [Delete a load balancer inbound NAT rule](delete-a-load-balancer-inbound-nat-rule.md)   |  DELETE | Deletes an inbound NAT rule.|  
