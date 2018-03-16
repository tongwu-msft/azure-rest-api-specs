---
title: "Stop changing the size of a pool | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 86f9913e-6d15-4180-bd6b-b3b433061e63
caps.latest.revision: 11
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Stop changing the size of a pool
  Stops an ongoing resize operation on the pool. Note that this does not restore the pool to its previous state before the resize operation.  It will only stop the on-going resize transaction on the pool, and the pool will maintain its current state.  
  
## Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to pools.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/stopresize?api-version={api-version}`|  
  
 Replace {pool-id} with the id of the pool who resize operation you want to stop.  
  
## Response  
 Status code: 202. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
## Remarks  
 A Stop Pool Resize operation stops the ongoing resize operation on the pool.  The pool size will stabilize at the number of nodes it is at when the stop operation is done.  During the stop operation, the pool allocation state changes first to stopping and then to steady.  
  
 A resize operation need not be an explicit Resize Pool request; this API can also be used to halt the initial sizing of the pool when it is created.  
  
 If you call Stop Resize Pool on a pool which is not in the resizing state, the request fails with HTTP status code 409 (Conflict).  
  
 Example  
  
 At 1:00 pm, a user sends a request to create a pool of 100 dedicated compute nodes. The Batch service creates the pool, marks the pool allocation state as resizing, and starts assigning nodes to the pool.  
  
 At 1:05 pm, the Batch service has allocated 25 nodes to the pool. The pool is still resizing, as Batch has not yet acquired all 100 requested nodes, and currentDedicated is 25.  
  
 At this point, the user stops the pool resize operation with the Stop Resize Pool API. When the Batch service receives this request, it stops attempting to acquire more nodes for the pool, updates the pool’s resizeError to indicate that the user cancelled resizing, and changed the the pool’s allocation state to steady. The pool’s currentDedicated remains at 25, and targetDedicatedNodes remains at 100.  
  
  