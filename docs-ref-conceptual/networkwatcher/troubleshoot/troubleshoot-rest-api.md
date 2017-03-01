---
title: "Troubleshoot REST API"
ms.date: 2016-06-29
ms.prod: azure
ms.service: network-watcher
ms.topic: reference
ms.assetid: 
author: gwallace
manager: timlt
---
# Troubleshoot REST API  

The Network Watcher troubleshoot API provides the ability to troubleshoot your networking resources in Azure. Troubleshoot returns the status of the resource with an explanation as well as mitigation and correction steps you can take to fix the issue you are encountering. You must configure a storage account and container to so that Network Watcher can upload log files relevant to the issue you are encountering.

This table lists the operations included in the Troubleshoot REST API.  
  
| Operation | REST Verb | Description | 
|---------|---------|-----------|
| [Intiate troubleshoot request](troubleshoot-initiate-post.md) |  POST | Initiates a troubleshoot request on the specified resource. |  
| [Query status of a troubleshoot request](troubleshoot-query-post.md) |  POST | Queries the status of the last completed troubleshoot request. |  

## Currently Supported Resources

- VirtualNetworkGateway
- Connection