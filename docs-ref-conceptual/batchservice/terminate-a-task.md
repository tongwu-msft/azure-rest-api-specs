---
title: "Terminate a task | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b7355d75-5483-480e-be47-7a9598ebca44
caps.latest.revision: 13
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Terminate a task
  Terminates the specified task.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to tasks.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/tasks/{task-id}/terminate?api-version={api-version}`|  
  
 Replace {job-id} with the id of the job that contains the task. Replace {task-id} with the id of the task that you want to terminate.  
  
## Response  
 Status code: 204. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
## Remarks  
 When the task has been terminated, it moves to the completed state.  
  
 For multi-instance tasks, the terminate task operation applies synchronously to the primary task; subtasks are then terminated asynchronously in the background.  
  
  