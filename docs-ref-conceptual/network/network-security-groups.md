---
title: Network Security Groups
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# Network Security Groups
A network security group (NSG) resource contains a list of network security rules. NSGs enable inbound or outbound traffic to be enabled or denied.  
  
NSGs are created with a set of default network security rules which are designed to enable all communications from and within a virtual network, but deny external access to same.  
  
NSGs can be assigned to subnets or individual NICs. Where NSGs are assigned to both a subnet and a NIC, the combination of both NSGs applies to that NIC.  

| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Create or update a network security group](create-or-update-a-network-security-group.md)     |  PUT | Creates or updates a network security group. |  
| [Delete a network security group](delete-a-network-security-group.md)    |  DELETE | Deletes a network security group. |  
| [Get information about a network security group](get-information-about-a-network-security-group.md)    |  GET | Gets a network security group. |  
| [List network security groups within a resource group](list-network-security-groups-within-a-resource-group.md)|  GET | Gets all network security groups within a resource group. |  
| [Get effective network security group](get-effective-network-security-group.md) |  GET | Gets the effective network security group for a network interface card. |  
