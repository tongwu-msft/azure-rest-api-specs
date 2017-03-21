---
title: Public IP Addresses
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# Public IP Addresses
Public IP addresses can be used to acquire a static or dynamic public IP address. Public IP addresses can be used to publish your applications for access over the Internet. A static public IP address gets its value when the public IP address resource is created, and it keeps its value even if it is not associated with a running VM. Static public IP addresses are guaranteed to retain the same IP when that public IP address is transferred across load balancers or network interface cards. A dynamic public IP address gets its value when it is associated with a VM, and it loses its value in certain scenarios. For example, a dynamic public IP address will change its value when it is disassociated from one VM and assigned to another VM.  
  
Public IP addresses can be assigned to a load balancer, or directly to a network interface of a VM. Associating a public IP address directly with the network interface of a VM makes it an instance-level public IP address. This means that all ports can be used for communication, except if traffic is controlled via security groups. When a public IP address is assigned to a load balancer, traffic flow to and through the public IP address is defined by the rules of the load balancer. Security groups to control traffic can be used in this scenario as well  

| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Create or update a public IP address ](create-or-update-a-public-ip-address.md)  |  PUT | Creates or updates a public IP address. |  
| [Delete a public IP address ](delete-a-public-ip-address.md)      |  DELETE | Deletes a public IP address. |  
| [Get information about a public IP address ](get-information-about-a-public-ip-address.md)         |  GET | Gets a public IP address. |  
| [List public IP addresses within a resource group ](list-public-ip-addresses-within-a-resource-group.md)     |  GET | Gets all public IP address in a resource group. |  
| [List public IP addresses within a subscription ](list-public-ip-addresses-within-a-subscription.md)     |  GET | Gets all public IP addresses in a subscription. |  