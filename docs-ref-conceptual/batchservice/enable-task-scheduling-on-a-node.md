---
title: "Enable task scheduling on a node | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 6ab67da8-7db8-4934-8270-970fcb6d4fce
caps.latest.revision: 6
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Enable task scheduling on a node
  Enables task scheduling on the specified node.  
  
## Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to nodes.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/nodes/{node-id}/enablescheduling?api-version={api-version}`|  
  
 Replace {pool-id} with the id of the pool that contains the node. Replace {node-id} with the id of the node on which you want to enable scheduling.  
  
## Response  
 Status code: 200. For more information, see Status and Error Codes.  
  
## Remarks  
 You can enable task scheduling on a node only if its current schedulingState is disabled. Otherwise, the request fails with status code 409 (Conflict).  
  
  