---
title: "Terminate a job | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ef8c0593-9531-49f8-9bd4-09778acbd485
caps.latest.revision: 7
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Terminate a job
  Terminates the specified job, marking it as completed.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to jobs.

|Method|Request URI|
|------------|-----------------|
|POST|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/terminate?api-version={api-version}`|

 Replace {job\-id} with the id of the job that you want to update.

 You may optionally provide a reason:

```
{
  "terminateReason":"Did not need the job any longer."
}

```

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|terminateReason|No|String|The text you want to appear as the job’s terminateReason.<br /><br /> The default is "UserTerminate".|

## Response
 Status code: 202. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

## Remarks
 When a Terminate Job request is received, the Batch service sets the job to the **terminating** state.  The Batch service then terminates any active or running tasks associated with the job, and runs any required Job Release tasks.  The job then moves into the **completed** state.

