---
title: "Update the properties of a task | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 052c432e-6e49-4a77-a482-bd8dd2cc6cd6
caps.latest.revision: 13
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Update the properties of a task
  Updates the properties of the specified task.  
  
## Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to tasks.  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/tasks/{task-id}?api-version={api-version}|  
  
 Replace {job-id} with the id of the job that contains the task. Replace {task-id} with the id of the task that you want to update.  
  
```  
{  
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#tasks/@Element",    
  "constraints": {  
    "maxWallClockTime":"PT1H",  
    "maxTaskRetryCount":0,  
    "retentionTime":"PT1H"  
  }  
}  
```  
  
### constraints  
  
||||  
|-|-|-|  
|Element name|Type|Notes|  
|maxWallClockTime|Time Interval|The maximum elapsed time that the job may run, measured from the time the job is created. If the job does not complete within the time limit, the Batch service terminates it (and any tasks that are still running).  In this case, the termination reason will be maxWallClockTimeExpiry. If this is not specified, there is no time limit on how long the job may run.|  
|maxTaskRetryCount|Int32|The maximum number of times each task may be retried. The Batch service retries a task if its exit code is nonzero.Note that this value specifically controls the number of retries. The Batch service will try each task once, and may then retry up to this limit. For example, if the maximum retry count is 3, Batch tries a task up to 4 times (one initial try and 3 retries).If the maximum retry count is 0, the Batch service does not retry tasks.If the maximum retry count is -1, the Batch service retries tasks without limit.The default value is 0 (no retries).|  
|retentionTime|Time Interval|The time in which the working directory for the task is retained. The default is infinite.<br /><br /> For multi-instance tasks, updating the retention time applies only to the primary task and not subtasks.|  
  
## Response  
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
  