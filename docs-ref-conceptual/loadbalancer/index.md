---
title: Load Balancers REST API | Microsoft Docs
ms.date: 03/15/2017
ms.service: load-balancer
ms.topic: reference
ms.devlang: rest-api
author: georgewallace
ms.author: gwallace
manager: timlt
---
# Load Balancers

Load balancer allows fine-grained configuration of how incoming traffic is distributed across VM instances hosted in Microsoft Azure. A load balancer has two main parts: a frontend and a backend configuration. The frontend configuration describes the exposed IP address of the load balancer. The frontend IP address of a load balancer can be a public or private IP address. The backend configuration of a load balancer describes how the traffic is distributed across VM instances and how health of a particular VM instance is determined.  For a more detailed overview see the [Azure Load Balancer product page](https://azure.microsoft.com/services/load-balancer). 
  
## REST Operation Groups

|Operation Group|Description|
|---|---|
|[Load balancer](load-balancer.md)   |Provides operations for load balancers.|
|[Load balancer inbound NAT rules](load-balancer-inbound-nat-rules.md)   | Provides operations for managing inbound NAT rules|

