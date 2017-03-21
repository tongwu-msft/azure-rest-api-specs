---
title: Network Interface Cards
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# Network Interface Cards

Network interface cards are virtual network cards that form the link between virtual machines and the virtual network. Each VM has at least 1 network interface card. Multiple subnets can be bound to the same network interface card and can have 1 or more IP addresses bound to it. Network interface cards must be associated with a public IP address to be accessible over the Internet.  

This table lists the operations included in the Topology REST API.  
  
| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Create or update a network interface card](create-or-update-a-network-interface-card.md)   |  PUT | Creates or updates a network interface card. |  
| [Delete a network interface card](delete-a-network-interface-card.md)  |  DELETE | Deletes a network interface card. |  
| [Get information about a network interface card](get-information-about-a-network-interface-card.md)    |  GET | Gets a network interface card. |  
| [List network interface cards within a resource group](list-network-interface-cards-within-a-resource-group.md)  |  GET | Gets all network interface cards in a resource group. |  
| [List network interface cards within a subscription](list-network-interface-cards-within-a-subscription.md) |  GET | Gets all network interface cards within a subscription. |  
| [Get effective network security group](get-effective-network-security-group.md)  |  GET | Gets the effective network security group for a network interface. |  
| [Get effective route table](get-effective-route-table.md)  |  GET | Gets the effective route table for a network interface |  
