---
title: "Remove the state of a node"
ms.custom: ""
ms.date: "2017-02-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-fabric"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows 10"
  - "Windows 8"
  - "Windows 8.1"
  - "Windows Server 2012 R2"
dev_langs: 
  - "CSharp"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
ms.assetid: 67936d6a-a71e-4be9-97fa-d5936c10b9f4
caps.latest.revision: 11
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Remove the state of a node
Indicate to Service Fabric that a specific node (which is down) has been lost and that any services or state on that node are lost and unrecoverable.  
  
 For persistent services, Service Fabric will wait for state and services on a down node to be recovered, particularly persistent services. In some cases, the administrator knows that a node (and its state) has been permanently lost. In these cases this operation should be called in order to get Service Fabric to stop waiting for that node to recover.  
  
## Request  
 See [Node](node.md) for headers and parameters that are used by all requests related to nodes.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/Nodes/{node-name}/$/RemoveNodeState?api-version={api-version}`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).