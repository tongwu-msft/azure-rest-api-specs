---
title: "Network Security Group Flow Logs REST API"
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: mareat
manager: vitinnan
---
# Network Security Group flow logging REST API  

Network Security Group flow logs allow you to view information about ingress and egress IP traffic through a Network Security Group. These flow logs are written in json format and show outbound and inbound flows on a per rule basis, the NIC the flow applies to, 5-tuple information about the flow (Source/Destination IP, Source/Destination Port, Protocol), and if the traffic was allowed or denied. 

This table lists the operations included in the Network Security Group Flow Log REST API.  
  
| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Configure flow logging](configure-flow-log-post.md) |  POST | Configures flow logging on a Network Security Group. |  
| [Query the status of flow logging](flow-log-query-post.md) |  POST | Queries the status of flow loggin on a Network Security Group. |  
