---
title: "Restart a Replica"
ms.custom: ""
ms.date: "2017-03-16"
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
ms.assetid: 521d61d5-793a-4557-b28b-9baea30478a1
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
# Restart a Replica
Restarts a service fabric replica. This is only applicable for replicas belonging to a persisted service. It invokes the CloseAsync and OpenAsync methods on them.  
  
## Request  
 See [Common parameters and headers](replica.md#bk_common) for parameters and headers that are used by all requests related to replicas.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/Nodes/{node-name}/$/GetPartitions/{partition-id}/$/GetReplicas/{replica-id}/$/Restart?api-version={api-version}`|  

The required information above can be found by performing a replica query.  See [Get a list of replicas](get-a-list-of-replicas.md).
An example request, where:
-	N0050 is the node name
-	6b4b0b0d-5332-472c-b5b0-e940c6208997 is the target partition id
-	131316019201647480 is the target replica

```
<URI>/Nodes/N0050/$/GetPartitions/6b4b0b0d-5332-472c-b5b0-e940c6208997/$/GetReplicas/131316019201647480/$/Restart?api-version=3.0
```
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).