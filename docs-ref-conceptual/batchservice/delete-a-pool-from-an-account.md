---
title: "Delete a pool from an account | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c125666f-d613-4fc0-a52d-b666a2a42ca7
caps.latest.revision: 10
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Delete a pool from an account
  Deletes a pool from the specified account.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to pools.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}?api-version={api-version}`|  
  
 Replace {pool-id} with the id of the pool that you want to delete.  
  
## Response  
 Status code: 202. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
## Remarks  
 When you request that a pool be deleted, the following actions occur:  
  
-   The pool state is set to deleting.  
  
-   Any ongoing resize operation on the pool is stopped  
  
-   The Batch service starts resizing the pool to zero nodes.  Any tasks running on existing nodes are terminated and requeued (as if a Resize Pool operation had been requested with the default requeue option).  
  
-   The pool is removed from the system.  
  
 Because running tasks are requeued, the user can rerun these tasks by updating their job with a different pool (see the Update Job API).  The tasks can then run on the new pool.  If you want to override the requeue behavior, then you should call Resize Pool explicitly to shrink the pool to zero size before calling DeletePool.  
  
 If you call an Update, Patch or Delete API on a pool in the deleting state, it will fail with HTTP status code 409 (Conflict), with error code PoolBeingDeleted.  
  
  