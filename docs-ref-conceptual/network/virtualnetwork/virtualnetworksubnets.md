---
title: Subnets
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# Subnets

Subnets represent network segments within the IP space defined by the virtual network.  
  
Subnets are child resources of a virtual network. Subnets have names unique within a VNET and they can be addressed via URIs. Subnets can be added and deleted by updating VNET or via PUT/DELETE against individual subnets.  

| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Create or update a subnet](create-or-update-a-subnet.md)       |  PUT | Creates or updates a subnet. |  
| [Delete a subnet](delete-a-subnet.md)            |  DELETE | Deletes a subnet. |  
| [Get information about a subnet](get-information-about-a-subnet.md)             |  GET | Gets a subnet. |  
| [List subnets within a virtual network](list-subnets-within-a-virtual-network.md)    |  GET | Gets all subnets in a virtual network. |  
