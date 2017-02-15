---
title: "Security group view REST API"
ms.date: 2016-06-29
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---
# Security group view REST API  

Security Group View enables you to view configured and effective network security groups rule applied on a VM. 

Using Security Group View, you can conduct security audits by programmatically verifying that the current state of all your NSG rules applied on a VM matches your desired state. If you have many NSGs in your network, Security Group View will also give you the effective security group rules applied to your VM so you can better understand your deployments.

This table lists the operations included in the Security Group View REST API.  
  
| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [View security group view of a VM](security-group-view-post.md) |  POST | View the configured and effective network security groups applied on a VM |  
