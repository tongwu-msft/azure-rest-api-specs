---
title: "Delete a task from a job | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a232959a-3bc7-4c91-8105-ae22bd259ac8
caps.latest.revision: 12
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Delete a task from a job
  Delete a task from the specified job.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to tasks.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/tasks/{task-id}?api-version={api-version}`|  
  
 Replace {job-id} with the id of the job that is associated with the task. Replace {task-id} with the id of the task that you want to delete.  
  
## Response  
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
## Remarks  
 When a task is deleted, all of the files in its directory on the compute node where it ran are also deleted (regardless of the retention time).  
  
 For multi-instance tasks, the delete task operation applies synchronously to the primary task; subtasks and their files are then deleted asynchronously in the background.  
  
  