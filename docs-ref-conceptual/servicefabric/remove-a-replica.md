---
title: "Remove a Replica"
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
ms.assetid: 4af544b7-6f43-4a29-842f-579c6843ede8
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
# Remove a Replica
Removes a service fabric replica. This is a destructive operation and can cause loss of data.  
  
## Request  
 See [Common parameters and headers](replica.md#bk_common) for parameters and headers that are used by all requests related to replicas.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/Nodes/{node-name}/Partitions/{partition-id}/Replicas/{replica-id}/$/Delete?api-version={api-version}`|  
|POST|Force the removal of the replica without performing an API calls on the replica informing it.<br /><br /> `<URI>/Nodes/{node-name}/$/GetPartitions/{partition-id}/$/GetReplicas/{replica-id}/$/Delete?api-version={api-version}&ForceRemove=true`|  
  
The required information above can be found by performing a replica query.  See [Get a list of replicas](get-a-list-of-replicas.md).

An example request, where:
-	N0050 is the node name
-	6b4b0b0d-5332-472c-b5b0-e940c6208997 is the target partition id
-	131316019201647480 is the target replica

```
<URI>/Nodes/N0050/$/GetPartitions/6b4b0b0d-5332-472c-b5b0-e940c6208997/$/GetReplicas/131316019201647480/$/Delete?api-version=3.0?ForceRemove=true
```

## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).