---
title: "Reactivate a task | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 4637d491-be3b-435d-8fe4-51ff81b74c13
caps.latest.revision: 2
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Reactivate a task
Reactivates a task, allowing it to run again even if its retry count has been exhausted.

##  <a name="bk_lifetime"></a> Request
See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to tasks.

|Method|Request URI|
|------------|-----------------|
|POST|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/tasks/{task-id}/reactivate?api-version={api-version}`|

Replace {job-id} with the id of the job containing the task. Replace {task-id} with the id of the task to be reactivated.

The request body is empty.

## Response

Status code: 204. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

The response body is empty.

## Remarks

The task's state is changed to **active**. As the task is no longer in the **completed** state, any previous
exit code or scheduling error is no longer available after reactivation.

Each time a task is reactivated, its retry count is reset to 0. This makes it eligible to be retried again
up to its maximum retry count. For example, if a task has a maximum retry count of 3, and has failed after
exhausting that retry count, then when it is reactivated, it will get up to 4 more tries (1 try plus 3 retries)
before being marked as completed again. (The number of times it was retried before reactivation is not retained.)

If the task is not in the **completed** state, the request fails and the Batch service returns status code 409 (Conflict)
with the error code "TaskNotCompleted". Furthermore, you cannot reactivate tasks which completed successfully:
if the task completed with exit code 0, the request fails and Batch returns status code 409 (Conflict) with
the error code "TaskSucceeded". 

You cannot reactivate a task if the job has completed (or is terminating or deleting). If the job is in one
of these states, the request fails and Batch returns status code 409 (Conflict) with the error code
"JobCompleted", "JobBeingTerminated" or "JobBeingDeleted" as appropriate.
