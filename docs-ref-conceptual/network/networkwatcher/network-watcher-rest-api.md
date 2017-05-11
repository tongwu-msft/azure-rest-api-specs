---
title: "Network Watcher REST API"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---
# Network Watcher REST API  

Network Watcher is the resource that exposes networking diagnostic APIs in Azure. Before any calls can be made into the APIs below, you must create a Network Watcher resource. Network Watcher is a regional resource. You must create one Network Watcher resource per subscription per region. The simplest way to create a Network Watcher is from within the portal, but you can also manually create and manage your Network Watcher resources using the REST API below.

This table lists the operations included in the Network Watcher REST API.  
  
| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Create or update a Network Watcher](network-watcher-create-update.md) |  PUT | Creates a new Network Watcher. |  
| [Delete a Network Watcher](network-watcher-delete.md) | DELETE | Deletes a Network Watcher. | 
| [Get a Network Watcher](network-watcher-get.md) | GET | Gets a specific Network Watcher. |  
| [List all Network Watchers in a resource group](network-watcher-list-resource-group.md) | GET | Lists all Network Watchers in a resource group. |
| [List all Network Watchers in a subscription](network-watcher-list-subscription.md) | GET | Lists all Network Watchers in a subscription. |  
