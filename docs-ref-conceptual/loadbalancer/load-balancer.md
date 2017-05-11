---
title: Operations on Load balancers
ms.date: 03/15/2017
ms.service: load-balancer
ms.topic: reference
ms.devlang: rest-api
author: georgewallace
ms.author: gwallace
manager: timlt
---
# Operations on Load balancers

Load balancer allows fine-grained configuration of how incoming traffic is distributed across VM instances hosted in Microsoft Azure. A load balancer has two main parts: a frontend and a backend configuration. The frontend configuration describes the exposed IP address of the load balancer. The frontend IP address of a load balancer can be a public or private IP address. The backend configuration of a load balancer describes how the traffic is distributed across VM instances and how health of a particular VM instance is determined.  

| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Create or update a load balancer](create-or-update-a-load-balancer.md)   |  PUT | Creates or updates a Load balancer. | 
| [Delete a load balancer](delete-a-load-balancer.md)    |  DELETE | Deletes an existing Load balancer |  
| [Get information about a load balancer ](get-information-about-a-load-balancer.md)    |  GET | Gets a Load balancer. | 
| [List load balancers within a resource group](list-load-balancers-within-a-resource-group.md)   |  GET | Lists all Load balancers in a resource group. |  
| [List load balancers within a subscription](list-load-balancers-within-a-subscription.md) |  GET | Lists all Load balancers in a subscription. |    