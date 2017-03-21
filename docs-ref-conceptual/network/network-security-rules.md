---
title: Network Security Rules
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# Network Security Rules
Network security rules define a pattern of traffic to be enabled or denied. Network security rules are contained within a Network Security Group (NSG). NSGs can be applied at the subnet or NIC level.  
  
Default network security rules are created to protect your virtual network by default. It is not possible to edit or delete a default network security rule, but they can be overridden by creating a network security rule with a lower priority. Default network security rules have priorities of 65000 and greater. To override a default network security rule, create a network security rule with a priority of less than 65000.  

| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Create or update a network security group](create-or-update-a-network-security-group.md) |  PUT | Creates or updates a network security rule. |  
| [Delete a network security rule](delete-a-network-security-rule.md)       |  DELETE | Deletes a network security rule. |  
| [Get information about a default network security rule ](get-information-about-a-default-network-security-rule.md)       |  GET | Gets a default network security rule. |  
| [Get information about a network security rule ](get-information-about-a-network-security-rule.md)      |  GET | Gets a network security rule. |  
| [List default networks security rules within a network security group](list-default-networks-security-rules-within-a-network-security-group.md)      |  GET | Gets all default network security rules in a network security group. |  
| [List networks security rules within a network security group](list-networks-security-rules-within-a-network-security-group.md)|  GET | Gets all network security rules in a network security group. |  
| [Get effective route table](get-effective-route-table.md)|  GET | Gets the effective route table for a network interface card. |  
