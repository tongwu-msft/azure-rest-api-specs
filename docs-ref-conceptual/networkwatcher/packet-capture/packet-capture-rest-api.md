---
title: Packet Capture REST API
ms.date: 2017-01-30
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---
# Packet Capture REST API  

Packet capture allows you to capture packets destined to or from a VM. The Packet Capture implementation in Network Watcher allows you to remotely control packet capture sessions on their VMs.

The length of the Packet Capture sessions can be configured via a time constraint or a size constraint. The amount of data captured for each packet can also be configured. This allows you to limit the size of the payload stored for each packet. For example, setting bytesToCapturePerPacket = 54 would typically capture the TCP, IPv4, and Ethernet headers without capturing the remaining packet contents.

Filters can be applied to a given packet capture session, allowing you to customize the type of packets captured. Filters can restrict packets on local and remote IP addresses & address ranges, local and remote ports & port ranges, and the session level protocol to be captured. Filters are composable, and multiple filters can be applied to provide you with granularity of capture.

This table lists the operations included in the Packet Capture REST API.  
  
| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Create and start a packet capture](packet-capture-create.md) |  PUT | Creates a packet capture resource and starts a capture session |  
| [Query packet capture status](packet-capture-query-status.md) |  POST | Queries the status of a packet capture. |  
| [Stop a packet capture](packet-capture-stop.md) |  POST | Stops a running packet capture. |  
| [Delete a packet capture](packet-capture-delete.md) |  DELETE | Deletes a packet capture. | 
| [Get packet capture session](packet-capture-get.md) |  GET | Get details on a packet capture. |  
| [List all existing packet capture sessions](packet-capture-list.md) |  GET | List all packet captures. |    
