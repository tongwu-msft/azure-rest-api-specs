---
title: "Disable a job | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: f050a39f-05e0-466e-94af-e8c0b088437d
caps.latest.revision: 12
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Disable a job
  Disables the specified job, preventing new tasks from running.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to jobs.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/disable?api-version={api-version}`|  
  
 Replace {job-id} with the id of the job that you want to update.  
  
 You must specify what to with active tasks that are associated with the job:  
  
```  
{  
  "disableTasks":"requeue"  
}  
  
```  
  
|Element name|Required|Type|Notes|  
|------------------|--------------|----------|-----------|  
|disableTasks|Yes|String|Specifies what to do with active tasks associated with the job.<br /><br /> Possible values are:<br /><br /> **requeue** – Terminate running tasks and requeue them. The tasks will run again when the job is enabled.<br /><br /> **terminate** – Terminate running tasks. The tasks will not run again.<br /><br /> **wait** – Allow currently running tasks to complete.|  
  
## Response  
 Status code: 202. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md)  
  
## Remarks  
 On a Disable Job request, the Batch Service immediately moves the job to the disabling state.  Batch then uses the disableTasks parameter to determine what to do with the currently running tasks of the job. The job remains in the disabling state until the disable operation (requeue/terminate/wait) is completed; the job then moves to the disabled state.  No new tasks are started under the job until it moves back to active state.  
  
 If you try to disable a job that is in any state other than active,  disabling, or disabled, the request fails and Batch returns status code 409 (Conflict).  
  
  