---
title: "Delete a job from an account | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b5333b8f-e566-4c7e-bbe9-df04b9a6970d
caps.latest.revision: 11
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Delete a job from an account
  Deletes a job from the specified  account.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to jobs.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}?api-version={api-version}`|  
  
 Replace {job-id} with the job that you want to delete.  
  
## Response  
 Status code: 202. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md)  
  
## Remarks  
 Deleting a job also deletes all tasks that are part of that job, and all job statistics.  This also overrides the retention period for task data; that is, if the job contains tasks which are still retained on compute nodes, the Batch services deletes those tasks’ working directories and all their contents.  
  
 When a Delete Job request is received, the Batch service sets the job to the deleting state.  All update operations on a job that is in **deleting** state will fail with status code 409 (Conflict), with additional information indicating that the job is being deleted.  
  
  