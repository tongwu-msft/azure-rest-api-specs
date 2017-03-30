---
title: "List the subtasks of a task | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: dae76b85-0809-4131-a738-b5b169fde33f
caps.latest.revision: 9
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# List the subtasks of a task
  Gets information about the subtasks of the specified multi\-instance task. If the task is not a multi\-instance task then this returns an empty collection.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to tasks.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.batch.core.windows.net/jobs/{job-id}/tasks/{task-id}/subtasksinfo?$select={select-list}&api-version={api-version}`|

 Replace {job\-id} with the id of the job that contains the task. Replace {task\-id} with the id of the task that you want to get information about.

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

## Remarks
 This API lists only the subtasks of a multi\-instance task.  To retrieve information about the primary task, use the [Get information about a task](../batchservice/get-information-about-a-task.md) API.

 The following example shows information about a completed task:

```
{
"odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#subtasksinfo",
  "value": [
{
"id":"1",
"startTime":"0001-01-01T00:03:10.3549701",
"endTime":"0001-01-01T00:03:25.8378887",
"state":"completed",
"stateTransitionTime":"0001-01-01T00:03:25.8378887",
"previousState":"running",
"previousStateTransitionTime":"0001-01-01T00:03:10.3549701",
"exitCode":0,
"nodeInfo": {
    		"affinityId":"TVM:tvm-2167304207_3-20140918t045746z",
    		"nodeUrl":"https://myaccount.batch.core.windows.net/pools/mypool_3FA95161-1349-44F6-86FC-52FC13BDAAE4/tvms/tvm-2167304207_3-20140918t045746z",
    		"poolId":"mypool_3FA95161-1349-44F6-86FC-52FC13BDAAE4",
    		"nodeId":"tvm-2167304207_3-20140918t045746z",
    		"taskRootDirectory":"tasks/myjob/job-1/mytask1/1/wd",
    		"taskRootDirectoryUrl":" https://myaccount.myregion.batch.azure.com/pools/mypool_A0DBA2F6-DB8E-49CC-A6FD-8E8845AE4E52/nodes/tvm-2167304207_3-20140918t045746z/files/tasks/myjob/job-1/mytask1/1/wd"
}
        },
{
"id":"2",
"startTime":"0001-01-01T00:03:10.3549701",
"endTime":"0001-01-01T00:03:25.8378887",
"state":"completed",
"stateTransitionTime":"0001-01-01T00:03:25.8378887",
"previousState":"running",
"previousStateTransitionTime":"0001-01-01T00:03:10.3549701",
"exitCode":0,
  	"nodeInfo": {
    		"affinityId":"TVM:tvm-2167304207_4-20140918t045748z",
    		"nodeUrl":"https://myaccount.batch.core.windows.net/pools/mypool_3FA95161-1349-44F6-86FC-52FC13BDAAE4/tvms/tvm-2167304207_4-20140918t045748z",
    		"poolId":"mypool_3FA95161-1349-44F6-86FC-52FC13BDAAE4",
    		"nodeId":"tvm-2167304207_4-20140918t045748z",
    		"taskRootDirectory":"tasks/myjob/job-1/mytask1/2/wd",
    		"taskRootDirectoryUrl":" https://myaccount.myregion.batch.azure.com/pools/mypool_A0DBA2F6-DB8E-49CC-A6FD-8E8845AE4E52/nodes/tvm-2167304207_4-20140918t045748z/files/tasks/myjob/job-1/mytask1/2/wd"
}
  }]
}

```

|Element|Type|Notes|
|-------------|----------|-----------|
|id|Int32|The id of the subtask|
|state|String|The current state of the subtask.<br />Possible values are:<br /><br /> **preparing** – The task has been assigned to a compute node, but is waiting for a required Job Preparation task to complete on the node. If the Job Preparation task succeeds, the task will move to running. If the Job Preparation task fails, the task will be eligible to be assigned to a different node.<br /><br /> **running** – The subtask is running on a compute node.<br /><br /> **completed** – The subtask is no longer eligible to run, usually because the subtask has finished successfully, or the subtask has finished unsuccessfully and has exhausted its retry limit.  A subtask is also marked as completed if an error occurred launching the subtask, or when the task has been terminated \(see [Terminate a task](../batchservice/terminate-a-task.md)\).|
|stateTransitionTime|DateTime|The time at which the subtask entered its current state.|
|previousState|String|The previous state of the subtask. This property is not present if the subtask is in its initial running state.|
|previousStateTransitionTime|DateTime|The time at which the subtask entered its previous state.  Note that this property not returned if the subtask is in its initial running state.|
|startTime|DateTime|The time at which the subtask started running. If the subtask has been restarted or retried, this is the most recent time at which the subtask started running.|
|endTime|DateTime|The time at which the subtask completed. This property is only returned if the subtask is in **completed** state.|
|exitCode|Int32|The exit code of the subtask. This property is only returned if the subtask is in **completed** state.|
|schedulingError|Complex Type|If there was an error scheduling the subtask, and the subtask is now in a **completed** state, this element contains the error details,|
|[nodeInfo](../batchservice/list-the-subtasks-of-a-task.md#nodeInfo)|Complex Type|Contains information about the compute node on which the subtask ran.|

###  <a name="nodeInfo"></a> nodeInfo

|Element name|Type|Notes|
|------------------|----------|-----------|
|affinityId|String|An identifier for the compute node on which the subtask ran.|
|nodeUrl|String|The URL of the node on which the subtask ran.|
|poolId|String|The id of the pool on which the task ran.|
|nodeId|String|The id of the node on which the subtask ran.|
|taskRootDirectory|String|The root directory for the subtask on the node where the task ran.|
|taskRootDirectoryUrl|String|The URL for root directory for the subtask where task ran. This URL can be used for retrieving the task files.|

