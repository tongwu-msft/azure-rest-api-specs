---
title: "Topology REST API"
ms.date: 2016-06-29
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---
# Topology REST API  

Topology represents a graph of network resources and their relationship in a subscription. Topology currently shows the relationships of Networking resources, VMs, and VM Scale Sets within a resource group. Note: since Network Watcher is a regional service, if resources from multiple regions reside in the resource group, only the resources in the same region as the Network Watcher will be included in the output. 

This table lists the operations included in the Topology REST API.  
  
| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Get current topology](topology-post.md) |  POST | Creates a new Network Watcher. |  
