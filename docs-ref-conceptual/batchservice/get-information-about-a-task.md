---
title: "Get information about a task | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 512e4f27-b5b5-4d96-a1ad-165853edf1ea
caps.latest.revision: 24
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Get information about a task
  Get information about the specified task.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to tasks.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/tasks/{task-id}?$select={select-list}&$expand=stats&api-version={api-version}`|

 Replace {job-id} with the id of the job that contains the task. Replace {task-id} with the id of the task that you want to get information about.

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

 The following example shows information about a completed task:

```
{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#tasks/@Element",
  "id":"mytask1",
  "url":"https://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks/mytask1",
  "eTag":"#################",
  "creationTime":"2014-09-18T05:01:37.328969Z",
  "lastModified":"2014-09-18T05:01:37.328969Z",
  "state":"completed",
  "stateTransitionTime":"2014-09-18T05:06:45.4878775Z",
  "previousState":"running",
  "previousStateTransitionTime":"2014-09-18T05:01:45.1637009Z",
  "commandLine":"myprogram.exe",
  "resourceFiles": [ {
    "blobSource":"http://mystorage1.blob.core.windows.net/scripts/myprogram.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
    "filePath":"myprogram.exe"
  },
  {
      "blobSource":"http://mystorage1.blob.core.windows.net/scripts/test.txt?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
      "filePath":"test.txt"
    } ],
  "environmentSettings": [ {
    "name":"myvariable",
    "value":"myvalue"
  } ],
  "affinityInfo": {
    "affinityId":"TVM:tv-2167304207_2-20140917t221319z"
  },
  "userIdentity": {
    "autoUser": {
      "scope":"task",
      "elevationLevel":"nonAdmin"
    }
  },
  "constraints": {
    "maxWallClockTime":"PT1H",
    "retentionTime":"PT1H",
    "maxTaskRetryCount":0
  },
  "executionInfo":{
    "startTime":"2014-09-18T05:01:45.1637009Z",
    "endTime":"2014-09-18T05:06:45.4878775Z",
    "exitCode":0,
    "retryCount":0,
    "requeueCount":0
  },
  "nodeInfo": {
    "affinityId":"TVM:tvm-2167304207_4-20140918t045748z",
    "nodeUrl":"https://myaccount.batch.core.windows.net/pools/mypool_3FA95161-1349-44F6-86FC-52FC13BDAAE4/nodes/tvm-2167304207_4-20140918t045748z",
    "poolId":"mypool_3FA95161-1349-44F6-86FC-52FC13BDAAE4",
    "nodeId":"tvm-2167304207_4-20140918t045748z",
    "taskRootDirectory":"tasks/myjob/job-1/mytask1/wd",
    "taskRootDirectoryUrl":"https://myaccount.myregion.batch.azure.com/pools/mypool_3FA95161-1349-44F6-86FC-52FC13BDAAE4/nodes/tvm-2167304207_4-20140918t045748z/files/tasks/myjob/job-1/mytask1/wd"
  }
}
```

The following example shows additional information in case of a multi-instance task:

```
{
  "multiInstanceSettings" : {
    "numberOfInstances": 3,
    "coordinationCommandLine" : "cmd /c start cmd /c \"%MSMPI_BIN%\\smpd.exe\" -d",
    "commonResourceFiles": [ {
     "blobSource":"http://mystorage1.blob.core.windows.net/scripts/multiprogram.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
     "filePath":"multiprogram.exe"
   },
   {
     "blobSource":"http://mystorage1.blob.core.windows.net/scripts/multitest.txt?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
     "filePath":"multitest.txt"
   } ]
  }
}
```

|Element|Type|Notes|
|-------------|----------|-----------|
|id|String|The id of the task.|
|displayName|String|The display name of the task|
|url|String|The URL of the task.|
|eTag|String|The ETag of the task. This is an opaque string. You can use it to detect whether the task has changed between requests. In particular, you can be pass the ETag with an Update Task request to specify that your changes should take effect only if nobody else has modified the job in the meantime.|
|lastModified|DateTime|The last modified time of the task.|
|creationTime|DateTime|The creation time of the task.|
|state|String|The current state of the task.<br /><br /> Possible values are:<br /><br /> **active** – The task is queued and able to run, but is not currently assigned to a compute node. A task enters this state when it is created, when it is enabled after being disabled, or when it is awaiting a retry after a failed run.<br /><br /> **preparing** – The task has been assigned to a compute node, but is waiting for a required Job Preparation task to complete on the node. If the Job Preparation task succeeds, the task will move to **running**. If the Job Preparation task fails, the task will return to **active** and will be eligible to be assigned to a different node.<br /><br /> **running** – The task is running on a compute node.  This includes task-level preparation such as downloading resource files or deploying application packages specified on the task – it does not necessarily mean that the task command line has started executing.<br /><br /> **completed** – The task is no longer eligible to run, usually because the task has finished successfully, or the task has finished unsuccessfully and has exhausted its retry limit.  A task is also marked as completed if an error occurred launching the task, or when the task has been terminated \(see [Terminate a task](../batchservice/terminate-a-task.md)\).|
|stateTransitionTime|DateTime|The time at which the task entered its current state.|
|previousState|String|The previous state of the task. This property is not present if the task is in its initial active state.|
|previousStateTransitionTime|DateTime|The time at which the task entered its previous state. This property is not present if the task is in its initial active state.|
|commandLine|String|The command line of the task.|
|[resourceFiles](../batchservice/get-information-about-a-task.md#resourceFiles)|Collection|A list of files that Batch will download to the compute node before running the command line.|
|[outputFiles](#outputFile)|Collection|A list of files that the Batch service will upload from the compute node after running the command line. For multi-instance tasks, the files will only be uploaded from the compute node on which the primary task is executed.|
|[applicationPackageReferences](../batchservice/get-information-about-a-task.md#applicationPackageReferences)|Collection|A list of application packages that the Batch service will deploy to the compute node before running the command line.<br /><br /> Application packages are downloaded to a shared directory, not the task directory.  Therefore, if a referenced package is already on the compute node, and is up to date, then it is not re-downloaded; the existing copy on the compute node is used.<br /><br /> If a referenced application package cannot be installed, for example because the package has been deleted or because download failed, the task fails to start due to an error.|
|[environmentSettings](../batchservice/get-information-about-a-task.md#environmentSettings)|Collection|A list of environment variable settings for the task.|
|[affinityInfo](../batchservice/get-information-about-a-task.md#affinityInfo)|Complex Type|A locality hint that can be used by the Batch service to select a node on which to start the new task.|
|[constraints](../batchservice/get-information-about-a-task.md#constraints)|Complex Type|The execution constraints that apply to this task.|
|[userIdentity](#userIdentity)|Complex Type|The user identity under which the task runs. If absent, the task runs as a non-administrative user unique to the task.|
|[executionInfo](../batchservice/get-information-about-a-task.md#executionInfo)|Complex Type|Contains information about the execution of the task.|
|nodeInfo|Complex Type|Contains information about the compute node on which the task ran.|
|[stats](../batchservice/get-information-about-a-task.md#stats)|Complex Type|Contains resource usage statistics for the task.|
|[multiInstanceSettings](../batchservice/get-information-about-a-task.md#multiInstanceSettings)|Complex Type|Specifies that the task  is Multi\-Instance Task requiring multiple compute nodes.  See [multiInstanceSettings](../batchservice/get-information-about-a-task.md#multiInstanceSettings) for details.|
|[dependsOn](../batchservice/get-information-about-a-task.md#dependsOn)|Complex Type|Specifies that the task depends on other tasks. The task will not be scheduled until all depended\-on tasks have completed successfully. \(If any depended\-on tasks fail and exhaust their retry counts, the task will never be scheduled.\)|
|[exitConditions](../batchservice/get-information-about-a-task.md#exitConditions)|Complex Type|Specifies how the Batch service should respond to task exit codes and other ways in which the task could complete.|

###  <a name="resourceFiles"></a> resourceFiles

|Element name|Type|Notes|
|------------------|----------|-----------|
|blobSource|String|The URL of a blob in Azure storage. The Batch service downloads the blob to the specified file path.<br /><br /> The URL must be readable using anonymous access; that is, the Batch service does not present any credentials when downloading the blob.  There are two ways to get such a URL for a blob in Azure storage: use a Shared Access Signature \(SAS\) granting read permissions on the blob, set the ACL for the blob’s container to allow public access.|
|filePath|String|The location on the compute node to which the file should be downloaded.|
|fileMode|String|The file permission mode attribute in octal format. This property is applicable only if the resourceFile is downloaded to a Linux node. This property will be ignored if it is specified for a resourceFile which is downloaded to a Windows node.<br /><br /> If this property is not specified for a Linux node, then a default value of 0770 is applied to the file.|

###  <a name="outputFile"></a> outputFile

|Element name|Type|Notes|
|------------------|--------------|----------|-----------|
|filePattern|String|A pattern indicating which file(s) to upload.<br /><br /> Both relative and absolute paths are supported. Relative paths are relative to the task working directory.<br /><br /> For wildcards, use * to match any character and ** to match any directory. For example, **\\*.txt matches any file ending in .txt in the task working directory or any subdirectory.<br /><br /> Note that \\ and / are treated interchangeably and mapped to the correct directory separator on the compute node operating system.|
|[destination](#outputFileDestination)|Complex Type|The destination for the output file(s).|
|[uploadOptions](#outputFileUploadOptions)|Complex Type|Additional options for the upload operation, including under what conditions to perform the upload.|

###  <a name="outputFileDestination"></a> outputFileDestination

|Element name|Type|Notes|
|------------------|--------------|----------|-----------|
|[container](#outputFileBlobContainerDestination)|ComplexType|A location in Azure blob storage to which files are uploaded.|

###  <a name="outputFileBlobContainerDestination"></a> outputFileBlobContainerDestination

|Element name|Type|Notes|
|------------------|--------------|----------|-----------|
|path|String|The destination blob or virtual directory within the Azure Storage container. If filePattern refers to a specific file (i.e. contains no wildcards), then path is the name of the blob to which to upload that file. If filePattern contains one or more wildcards (and therefore may match multiple files), then path is the name of the blob virtual directory (which is prepended to each blob name) to which to upload the file(s). If omitted, file(s) are uploaded to the root of the container with a blob name matching their file name.|
|containerUrl|String|The URL of the container within Azure Blob Storage to which to upload the file(s). The URL must include a Shared Access Signature (SAS) granting write permissions to the container.|

###  <a name="outputFileUploadOptions"></a> outputFileUploadOptions

|Element name|Type|Notes|
|------------------|--------------|----------|-----------|
|uploadCondition|String|The conditions under which the task output file or set of files should be uploaded. Possible values include:<br /><br /> - **taskSuccess**: Upload the file(s) only after the task process exits with an exit code of 0.<br /><br /> - **taskFailure**: Upload the file(s) only after the task process exits with a nonzero exit code.<br /><br /> **taskCompletion**: Upload the file(s) after the task process exits, no matter what the exit code was.<br /><br /> 
The default is taskCompletion.|

### <a name="applicationPackageReferences"></a> applicationPackageReferences

|Element name|Type|Notes|
|------------------|--------------|----------|
|applicationId|String|The id of the application to install.|
|version|String|The version of the application to install.<br /><br />If omitted, the default version is installed. If no default version is specified for this application, the task on which the package is specified will fail when scheduled, with a scheduling error.|

###  <a name="environmentSettings"></a> environmentSettings

|Element name|Type|Notes|
|------------------|----------|-----------|
|name|String|The name of the environment variable.|
|value|String|The value of the environment variable.|

###  <a name="affinityInfo"></a> affinityInfo

|Element name|Type|Notes|
|------------------|----------|-----------|
|affinityId|String|An opaque string representing the location of compute node or a task that has run previously.  You can pass the affinityId of a compute node or task to indicate that this task needs to be placed close to the node or task.<br /><br /> You can obtain the affinityId for a node or a task via a GET request for that resource.|

###  <a name="constraints"></a> constraints

|Element name|Type|Notes|
|------------------|----------|-----------|
|maxWallClockTime|Time Interval|The maximum elapsed time that the job may run, measured from the time the job is created. If the job does not complete within the time limit, the Batch service terminates it \(and any tasks that are still running\).  In this case, the termination reason will be *maxWallClockTimeExpiry*.<br /><br /> If this is not specified, there is no time limit on how long the job may run.|
|maxTaskRetryCount|Int32|The maximum number of times each task may be retried. The Batch service retries a task if its exit code is nonzero.<br /><br /> Note that this value specifically controls the number of retries. The Batch service will try each task once, and may then retry up to this limit. For example, if the maximum retry count is 3, Batch tries a task up to 4 times \(one initial try and 3 retries\).<br /><br /> If the maximum retry count is 0, the Batch service does not retry tasks.<br /><br /> If the maximum retry count is \-1, the Batch service retries tasks without limit.<br /><br /> The default value is 0 \(no retries\).|
|retentionTime|Time Interval|The time in which the working directory for the task is retained. The default is infinite.|

###  <a name="userIdentity"></a> userIdentity

|Element name|Type|Notes|
|------------------|--------------|----------|-----------|
|userName|String|The name of the user identity under which the task is run.|
|[autoUser](#autoUser)|Complex Type|The auto user under which the task is run.|

###  <a name="autoUser"></a> autoUser

|Element name|Type|Notes|
|------------------|--------------|----------|-----------|
|scope|Complex Type|The scope for the auto user.<br /><br />**pool** - specifies that the task runs as the common auto user account which is created on every node in a pool.<br /><br /> **task** - specifies that the service should create a new user for the task.<br /><br />The default value is **task**.|
|elevationLevel|Complex Type|The elevation level of the auto user.<br /><br />**nonAdmin** - The auto user is a standard user without elevated access.<br /><br />**admin** - The auto user is a user with elevated access and operates with full Administrator permissions.<br /><br />The default value is **nonAdmin**.|


###  <a name="executionInfo"></a> executionInfo

|Element name|Type|Notes|
|------------------|----------|-----------|
|startTime|DateTime|The time at which the task started running.  'Running' corresponds to the **running** state, so if the task specifies resource files or application packages, then the start time reflects the time at which the task started downloading or deploying these.  If the task has been restarted or retried, this is the most recent time at which the task started running.  This property is present only for tasks that are in the **running** or **completed** state.|
|endTime|DateTime|The time at which the task completed. This property is only returned if the task is in **completed** state.|
|exitCode|Int32|The exit code of the task. This property is only returned if the task is in **completed** state.|
|[failureInfo](#taskFailureInformation)|String|Information describing the task failure, if any.<br /><br /> This property is set only if the task failed and is now in the completed state.|
|retryCount|Int32|The number of times the task has been retried by the Batch service. Task application failures (non-zero exit code) are retried, while pre-processing errors (e.g., the task could not be run) and file upload errors are not retried. The Batch service will retry the task up to the limit specified by the constraints.|
|lastRetryTime|DateTime|The most recent time at which a retry of the task started running.<br /><br /> This element is present only if the task was retried \(i.e. retryCount is nonzero\). If present, this is typically the same as startTime, but may be different if the task has been restarted for reasons other than retry; for example, if the compute node was rebooted during a retry, then the startTime is updated but the lastRetryTime is not.|
|requeueCount|Int32|The number of times the task has been requeued by the Batch service as the result of a user request.<br /><br /> When the user removes nodes from a pool \(by resizing or shrinking the pool\) or when the job is being disabled, the user can specify that running tasks on the nodes be requeued for execution. This count tracks how many times the task has been requeued for these reasons.|
|lastRequeueTime|DateTime|The most recent time at which the task has been requeued by the Batch service as the result of a user request.<br /><br /> This property is present only if the requeueCount is nonzero.|
|result|String|The result of task execution. Possible values include:<br /><br />- **success**: The task ran successfully.<br /><br />- **failure**: There was an error during processing of the task. The failure may have occurred before the task process was launched, while the task process was executing, or after the task process exited.<br /><br /> If the value is 'failure', then the details of the failure can be found in the failureInfo property.|

###  <a name="taskFailureInformation"></a> taskFailureInformation

|Element name|Type|Notes|
|------------------|----------|-----------|
|category|String|The category of the task error.|
|code|String|An identifier for the task error. Codes are invariant and are intended to be consumed programmatically.|
|message|String|A message describing the task error, intended to be suitable for display in a user interface.|
|values|Collection|A list of additional details related to the error.|

###  <a name="nodeInfo"></a> nodeInfo

|Element name|Type|Notes|
|------------------|----------|-----------|
|affinityId|String|An identifier for the compute node on which the task ran, which can be passed in the Add Task API to request that the task be scheduled close to this compute node.|
|nodeUrl|String|The URL of the node on which the task ran.|
|poolId|String|The id of the pool on which the task ran.|
|nodeId|String|The id of the node on which the task ran|
|taskRootDirectory|String|The root directory for the task on the node where the task ran.|
|taskRootDirectoryUrl|String|The URL for the root directory for the task on the node where the task ran. This URL can be used for retrieving the task files.|

###  <a name="multiInstanceSettings"></a> multiInstanceSettings

|Element name|Type|Notes|
|------------------|--------------|----------|
|numberOfInstances|Int|The number of compute nodes required by the task.|
|coordinationCommandLine|String|The command line to run on all the compute nodes to enable them to coordinate when the primary runs the main task command. A typical coordination command line launches a background service and verifies that the service is ready to process inter\-node messages.|
|commonResourceFiles|Collection|A list of files that Batch will download before running the coordination command line.<br />The difference between common resource files and task resource files is that common resource files are downloaded for all subtasks including the primary, whereas task resource files are downloaded only for the primary.|

###  <a name="stats"></a> stats

|Element name|Type|Notes|
|------------------|----------|-----------|
|url|String|The URL for the task statistics resource.|
|startTime|DateTime|The start time of the time range covered by the statistics.|
|lastUpdateTime|DateTime|The time at which the statistics were last updated. All statistics are limited to the range between startTime and lastUpdateTime.|
|userCPUTime|Time|The total user mode CPU time \(summed across all cores and all compute nodes\) consumed by the task.|
|kernelCPUTime|Time|The total kernel mode CPU time \(summed across all cores and all compute nodes\) consumed by the task.|
|wallClockTime|Time|The total wall clock time of the task.<br /><br /> The wall clock time is the elapsed time from when the task started running on a compute node to when it finished \(or to the last time the statistics were updated, if the task had not finished by then\).<br /><br /> If the task was retried, this includes the wall clock time of all the task retries.|
|readIOps|Int64|The total number of I/O read operations performed by the task.|
|writeIOps|Int64|The total number of I/O write operations performed by the task.|
|readIOGiB|Double|The total amount of data \(in GiB\) of I/O read by the task.|
|writeIOGiB|Double|The total  amount of data \(in GiB\) of I/O written by the task.|
|waitTime|Time|The elapsed time between the creation of the task creation and the start of task execution.  \(If the task is retried due to failures, the wait time is the time to the most recent task execution.\)|

###  <a name="dependsOn"></a> dependsOn

|Element name|Type|Notes|
|------------------|----------|-----------|
|taskIds|Collection|A list of task ids that this task depends on. All tasks in this list must complete successfully before the dependent task can be scheduled.|
|taskIdRanges|Collection|A list of task id ranges that this task depends on. All tasks in all ranges must complete successfully before the dependent task can be scheduled.|

### taskIdRange

|Element name|Type|Notes|
|------------------|----------|-----------|
|start|Int32|The first id in the range.|
|end|Int32|The last id in the range.|

 The start and end of the range are inclusive.  For example, if a range has start 9 and end 12, then it represents tasks "9", "10", "11" and "12".

###  <a name="exitConditions"></a> exitConditions

|Element name|Type|Notes|
|------------------|----------|-----------|
|[exitCodes](#exitCodeMapping)|Collection|A list of task exit codes and how the Batch service should respond to them.|
|[exitCodeRanges](#exitCodeRangeMapping)|Collection|A list of task exit code ranges and how the Batch service should respond to them.|
|[preProcessingError](#exitOptions)|Complex Type|Specifies how the Batch service should respond if the task fails to start due to an error.|
|[fileUploadError](#exitOptions)|Complex Type|Specifies how the Batch service should respond if a file upload error occurs. If the task exited with an exit code that was specified via exitCodes or exitCodeRanges, and then encountered a file upload error, then the action specified by the exit code takes precedence.|
|[default](#exitOptions)|Complex Type|Specifies how the Batch service should respond if the task fails with an exit condition not covered by any of the other properties. <br /><br />This value is used if the task exits with any nonzero exit code not listed in the exitCodes or exitCodeRanges collection, with a pre-processing error if the preProcessingError property is not present, or with a file upload error if the fileUploadError property is not present. For non-default behaviour on exit code 0, list it explicitly using the exitCodes or exitCodeRanges collection.|

###  <a name="exitCodeMapping"></a> exitCodeMapping

|Element name|Type|Notes|
|------------------|----------|-----------|
|code|Int32|A process exit code.|
|[exitOptions](../batchservice/get-information-about-a-task.md#exitOptions)|Complex Type|An exitOptions specifying how the Batch service should respond if the task exits with this exit code.|

###  <a name="exitCodeRangeMapping"></a> exitCodeRangeMapping

|Element name|Type|Notes|
|------------------|----------|-----------|
|start|Int32|The first exit code in the range.|
|end|Int32|The last exit code in the range.|
|[exitOptions](../batchservice/get-information-about-a-task.md#exitOptions)|Complex Type|An exitOptions specifying how the Batch service should respond if the task exits with an exit code in the range *start* to *end* (inclusive).|

###  <a name="exitOptions"></a> exitOptions

|Element name|Type|Notes|
|------------------|----------|-----------|
|jobAction|String|An action to take on the job containing the task, if the task completes with the given exit condition and the job's onTaskFailed property is "performexitoptionsjobaction".<br /><br /> Permitted values are:<br /><br /> **none** – take no action.<br /><br />	**disable** – disable the job. This is equivalent to calling the "Disable a job" API, with a disableTasks value of "requeue".<br /><br /> **terminate** – terminate the job. The terminateReason in the job's executionInfo is set to "TaskFailed".|
|dependencyAction|String|An action that the Batch service performs on tasks that depend on this task.<br /><br /> The default is **satisfy** for exit code 0, and **block** for all other exit conditions.|


## Remarks
 For multi\-instance tasks, information such as affinityId, executionInfo and nodeInfo refer to the primary task.  Use the List the subtasks of a task API to retrieve information for subtasks.

