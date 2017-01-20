---
title: "Restart a node"
ms.custom: ""
ms.date: "2016-03-30"
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
ms.assetid: f4bb42ee-edbf-4f47-b083-56d6ac2c1d75
caps.latest.revision: 3
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
# Restart a node
Restarts a Service Fabric cluster node that is in a start state.  
  
## Request  
 See [Cluster](cluster.md) for headers and parameters that are used by all requests related to the cluster  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/Nodes/{node-name}/$/Restart?api-version={api-version}`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).