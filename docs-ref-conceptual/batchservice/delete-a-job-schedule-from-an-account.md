---
title: "Delete a job schedule from an account | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 1946d1d0-6d89-4ed6-ade8-30cb8b22c9e0
caps.latest.revision: 5
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Delete a job schedule from an account
  Deletes a job schedule from the specified account.  
  
## Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to job schedules.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://{account-name}.{region-id}.batch.azure.com/jobschedules/{jobschedule-id}?api-version={api-version}`|  
  
 Replace {jobschedule-id} with the id of the job schedule that you want to delete.  
  
## Response  
 Status code: 202. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
## Remarks  
 When you delete a job schedule, this also deletes all jobs and tasks under that schedule.  When tasks are deleted, all the files in their working directories on the compute nodes are also deleted (the retention period is ignored). The job schedule statistics are no longer accessible once the job schedule is deleted, though they are still counted towards account lifetime statistics.  
  
 The job schedule moves into the **deleting** state while deletion is in progress.  All modification requests (update, disable, enable and terminate) on a job schedule that is in the **deleting** state will fail with status code 409 (Conflict), with additional information indicating that the job schedule is being deleted.  
  
  