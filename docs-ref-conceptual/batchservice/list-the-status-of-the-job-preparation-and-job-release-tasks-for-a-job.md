---
title: "List the status of the job preparation and job release tasks for a job | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 4cc37b2a-0623-427e-9f8a-ac12fc243932
caps.latest.revision: 10
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# List the status of the job preparation and job release tasks for a job
  Lists the execution status of the Job Preparation and Job Release task for the specified job across the compute nodes where the job has run.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to jobs.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/jobpreparationandreleasetaskstatus?$skiptoken={skiptoken}&$filter={filter}&$select={select-list}&maxresults={result-number}&api-version={api-version}`|

 Replace {job\-id} with the id of the job.

 The value for {filter} can be the following, or any AND-ed or OR-ed combination of the following:

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|poolId|eq, ne|String|
|nodeId|eq, ne|String|
|jobPreparationTaskExecutionInfo/state|eq|String|
|jobPreparationTaskExecutionInfo/startTime|eq, ne, ge, gt, le , lt|DateTime|
|jobPreparationTaskExecutionInfo/endTime|eq, ne, ge, gt, le , lt|DateTime|
|jobPreparationTaskExecutionInfo/exitCode|eq, ne, ge, gt, le , lt|Int|
|jobReleaseTaskExecutionInfo/state|eq|String|
|jobReleaseTaskExecutionInfo /startTime|eq, ne, ge, gt, le , lt|DateTime|
|jobReleaseTaskExecutionInfo /endTime|eq, ne, ge, gt, le , lt|DateTime|
|jobReleaseTaskExecutionInfo /exitCode|eq, ne, ge, gt, le , lt|Int|

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

```

{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#jobpreparationandreleasestatuslist",
  "value": [ {
    "poolId":"mypool1",
    "nodeId":"tvm-2167304207_1-20140905t174658z",
    "nodeUrl":"https://myaccount.myregion.batch.azure.com/pools/mypool1/nodes/tvm-2167304207_1-20140905t174658z",
    "jobPreparationTaskExecutionInfo":{
      "state":"completed",
      "startTime":"2015-05-01T10:20:31Z",
      "endTime":"2015-05-02T20:12:42Z",
      "taskRootDirectory":"tasks/myjob/job-1/myjobpreptask",
      "taskRootDirectoryUrl":"https://myaccount.myregion.batch.azure.com/pools/mypool1/nodes/tvm-2167304207_1-20140905t174658z/files/tasks/myjob/job-1/myjobpreptask",
      "exitCode":0,
      "retryCount":0
    },
    "jobReleaseTaskExecutionInfo":{
      "state":"completed",
      "startTime":"2015-05-01T10:20:31Z",
      "endTime":"2015-05-02T20:12:42Z",
      "taskRootDirectory":"tasks/myjob/job-1/myjobreleasetask",
      "taskRootDirectoryUrl":"https://myaccount.myregion.batch.azure.com/pools/mypool1/nodes/tvm-2167304207_1-20140905t174658z/files/tasks/myjob/job-1/myjobreleasetask",
      "exitCode":0,
      "retryCount":0
      }
  } ],
  "odata.nextLink":"https://myaccount.myregion.batch.azure.com/jobs/myjob/jobpreparationandreleasestatus?$skipToken=tvm-2167304207_1-20140905t174658z&api-version=2016-02-01.3.0"
}

```

|Element name|Type|Notes|
|------------------|----------|-----------|
|poolId|String|The id of the pool containing the compute node to which this entry refers.|
|nodeId|String|The id of the compute node to which this entry refers.|
|nodeUrl|String|The URL of the compute node to which this entry refers.|
|[jobPreparationTaskExecutionInfo](../batchservice/list-the-status-of-the-job-preparation-and-job-release-tasks-for-a-job.md#jobPreparationTaskExecutionInfo)|Complex Type|Contains information about the execution status of the Job Preparation task on this compute node.|
|[jobReleaseTaskExecutionInfo](../batchservice/list-the-status-of-the-job-preparation-and-job-release-tasks-for-a-job.md#jobReleaseTaskExecutionInfo)|Complex Type|Contains information about the execution status of the Job Release task on this compute node. This element is present only if the Job Release task has run on the node.|

###  <a name="jobPreparationTaskExecutionInfo"></a> jobPreparationTaskExecutionInfo

|Element name|Type|Notes|
|------------------|----------|-----------|
|state|String|The current running state of the Job Preparation task on the compute node.  Possible values are:<br /><br /> **running** – the task is currently running \(including retrying\)<br /><br /> **completed** – the task has exited with exit code 0, or the task has exhausted its retry limit, or the Batch service was unable to start the task due to scheduling errors|
|startTime|DateTime|The time at which the Job Preparation task started running. If the task has been restarted or retried, this is the most recent time at which the task started running.|
|endTime|DateTime|The time at which the Job Preparation task completed. This element is present only if the task is in the completed state.|
|taskRootDirectory|String|The root directory for the Job Preparation task on the compute node.|
|taskRootDirectoryUrl|String|The URL to the root directory of the Job Preparation task on the compute node. You can use this URL to retrieve files created by the task such as log files.|
|exitCode|Int32|The exit code of the Job Preparation task. This element is present only if the task is in the completed state.|
|[failureInfo](#taskFailureInformation)|String|Information describing the task failure, if any.<br /><br /> This property is set only if the task failed and is now in the completed state.
|retryCount|Int32|The number of times the Job Preparation task has been retried by the Batch service. The task is retried if it exits with a nonzero exit code, up to the specified MaxTaskRetryCount.|
|lastRetryTime|DateTime|The most recent time at which a retry of the Job Preparation task started running.<br /><br /> This element is present only if the task was retried \(i.e. retryCount is nonzero\). If present, this is typically the same as startTime, but may be different if the task has been restarted for reasons other than retry; for example, if the compute node was rebooted during a retry, then the startTime is updated but the lastRetryTime is not.|
|result|String|The result of task execution. Possible values include:<br /><br />- **success**: The task ran successfully.<br /><br />- **failure**: There was an error during processing of the task. The failure may have occurred before the task process was launched, while the task process was executing, or after the task process exited.<br /><br /> If the value is 'failure', then the details of the failure can be found in the failureInfo property.|

###  <a name="jobReleaseTaskExecutionInfo"></a> jobReleaseTaskExecutionInfo

|Element name|Type|Notes|
|------------------|----------|-----------|
|state|String|The current running state of the Job Release task on the compute node.  Possible values are:<br /><br /> **running** – the task is currently running \(including retrying\)<br /><br /> **completed** – the task has exited, or the Batch service was unable to start the task due to scheduling errors|
|startTime|DateTime|The time at which the Job Release task started running. If the task has been restarted or retried, this is the most recent time at which the task started running.|
|endTime|DateTime|The time at which the Job Release task completed. This element is present only if the task is in the completed state.|
|taskRootDirectory|String|The root directory for the Job Release task on the compute node.|
|taskRootDirectoryUrl|String|The URL to the root directory of the Job Release task on the compute node. You can use this URL to retrieve files created by the task such as log files.|
|exitCode|Int32|The exit code of the Job Release task. This element is present only if the task is in the completed state.|
|[failureInfo](#taskFailureInformation)|String|Information describing the task failure, if any.<br /><br /> This property is set only if the task failed and is now in the completed state.
|result|String|The result of task execution. Possible values include:<br /><br />- **success**: The task ran successfully.<br /><br />- **failure**: There was an error during processing of the task. The failure may have occurred before the task process was launched, while the task process was executing, or after the task process exited.<br /><br /> If the value is 'failure', then the details of the failure can be found in the failureInfo property.|

###  <a name="taskFailureInformation"></a> taskFailureInformation

|Element name|Type|Notes|
|------------------|----------|-----------|
|category|String|The category of the task error.|
|code|String|An identifier for the task error. Codes are invariant and are intended to be consumed programmatically.|
|message|String|A message describing the task error, intended to be suitable for display in a user interface.|
|values|Collection|A list of additional details related to the error.|

## Remarks

-   This API returns the Job Preparation and Job Release task status on all compute nodes that have run the Job Preparation or Job Release task.  This includes nodes which have since been removed from the pool.

-   To get the status of the Job Preparation and Job Release tasks on a specific compute node, use the $filter query string parameter, passing the filter "nodeId eq '{desired\-node\-id}'".

-   If this API is invoked on a job which has no Job Preparation or Job Release task, the Batch service returns HTTP status code 409 \(Conflict\) with an error code of JobPreparationTaskNotSpecified.

