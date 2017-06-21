---
title: "Get the task counts for a job | Microsoft Docs"
ms.custom: ""
ms.date: "2017-07-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a10f9921-f8c0-4bc9-a6d9-a3f8d3b976a9
caps.latest.revision: 6
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Get the task counts for a job
 Gets the task counts for the specified job. Task counts provide a count of the tasks by active, running, or completed task state, and a count of tasks which succeeded or failed.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to nodes.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/taskcounts?api-version={api-version}`|

 Replace {job\-id} with the id of the job to get task counts for.

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

 The following example shows the task counts for a job:

```

{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#taskcounts/@Element",
  "active": 0,
  "running": 1,
  "completed": 5,
  "succeeded": 2,
  "failed": 3,
  "validationStatus": "validated"
}

```

|Element name|Type|Notes|
|------------------|----------|-----------|
|active|Int32|The number of tasks in the active state.|
|running|Int32|The number of tasks in the running or preparing state.|
|completed|Int32|The number of tasks in the completed state.|
|succeeded|Int32|The number of tasks which succeeded. A task succeeds if its result (found in the [executionInfo](../batchservice/get-information-about-a-task.md#executionInfo) property) is 'success'.|
|failed|Int32|The number of tasks which failed. A task fails if its result (found in the [executionInfo](../batchservice/get-information-about-a-task.md#executionInfo) property) is 'failure'.|
|validationStatus|String|Whether the task counts have been validated. If the validationStatus is unvalidated, then the Batch service has not been able to check state counts against the task states as reported in the List Tasks API. The validationStatus may be unvalidated if the job contains more than 200,000 tasks.<br /><br /> Possible values are:<br /><br /> **validated** - The task counts have been validated.<br /><br /> **unvalidated** - The task counts have not been validated.|


## Remarks
 Tasks in the 'preparing' state are counted as running tasks in this API.
