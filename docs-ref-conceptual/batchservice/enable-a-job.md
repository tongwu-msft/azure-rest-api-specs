---
title: "Enable a job | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: aa9fe3ac-b680-46a7-b409-3d17fdb423fc
caps.latest.revision: 7
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Enable a job
  Enables the specified job, allowing new tasks to run.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to jobs.

|Method|Request URI|
|------------|-----------------|
|POST|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/enable?api-version={api-version}`|

 Replace {job\-id} with the id of the job that you want to update.

 The request body is empty.

## Response
 Status code: 202. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md)

## Remarks
 On an Enable Job request, the Batch service sets a disabled job to the **enabling** state. After the Enable Job operation is completed, the job moves to the **active** state, and scheduling of new tasks under the job resumes.

 If you try to enable a job that is in any state other than **active**, **disabling**, or **disabled**, the request fails and Batch returns status code 409 \(Conflict\).

The Batch service does not allow a task to remain in the **active** state for more than
7 days. Therefore, if you enable a job containing active tasks which were added more
than 7 days ago, those tasks will not run. 
