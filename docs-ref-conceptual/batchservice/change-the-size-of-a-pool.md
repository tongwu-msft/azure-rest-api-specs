---
title: "Change the size of a pool | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 2200d102-edd9-47af-9440-d7be681601a9
caps.latest.revision: 14
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Change the size of a pool
  Changes the number of compute nodes that are assigned to a pool.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to pools.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/resize?api-version={api-version}`|  
  
 Replace {pool-id} with the id of the pool that you want to resize.  
  
 The following example requests that the pool be resized to 5 nodes, terminating any excess tasks without re queuing them:  
  
```  
  
{  
  "resizeTimeout":"PT5M",  
  "nodeDeallocationOption":"terminate",  
  "targetDedicatedNodes":5  
}  
  
```  
  
|Element name|Required|Type|Notes|  
|------------------|--------------|----------|-----------|  
|resizeTimeout|No|Time|Specifies the timeout for allocation of compute nodes to the pool or removal of compute nodes from the pool.<br /><br /> The default value is 15 minutes.<br /><br /> The minimum value is 5 minutes. If you specify a value less than 5 minutes, the Batch service returns a Bad Request (400).|  
|nodeDeallocationOption|No|String|Specifies when nodes may be removed from the pool, if the pool size is decreasing.<br /><br /> Possible values are:<br /><br /> **requeue** – Terminate running tasks and requeue them. The tasks will run again when the job is enabled. Remove nodes as soon as tasks have been terminated.<br /><br /> **terminate** – Terminate running tasks. The tasks will not run again. Remove nodes as soon as tasks have been terminated.<br /><br /> **taskcompletion** – Allow currently running tasks to complete. Schedule no new tasks while waiting. Remove nodes when all tasks have completed.<br /><br /> **Retaineddata** -  Allow currently running tasks to complete, then wait for all task data retention periods to expire. Schedule no new tasks while waiting. Remove nodes when all task retention periods have expired.<br /><br /> The default value is requeue.|  
|targetDedicatedNodes|Yes|Int32|Specifies the number of compute nodes that should be in the pool.<br /><br /> This property must not be specified if enableAutoScale is set to true.  If enableAutoScale is set to false, then you must set either targetDedicatedNodes, targetLowPriorityNodes, or both.|  
|targetLowPriorityNodes|Optional|Int32|Specifies the desired number of low-priority compute nodes in the pool.<br /><br /> This property must not be specified if enableAutoScale is set to true.  If enableAutoScale is set to false, then you must set either targetDedicatedNodes, targetLowPriorityNodes, or both.|

## Response  
 Status code: 202. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
## Remarks  
 You can only resize a pool when its allocationState is steady. If the pool is already resizing, the request fails with status code 409 (Conflict). When you resize a pool, the pool’s allocationState changes from steady to resizing.  
  
 You cannot resize pools which are configured for automatic scaling (that is, the enableAutoScale property of the pool is true).  If you try to do this, the Batch service returns an error 409 (Conflict).  
  
 If you resize a pool downwards, the Batch service chooses which nodes to remove.  To remove specific nodes, use [Remove compute nodes from a pool](../batchservice/remove-compute-nodes-from-a-pool.md).  
  
  