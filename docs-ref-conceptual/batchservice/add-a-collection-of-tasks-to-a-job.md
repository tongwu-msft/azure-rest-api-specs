---
title: "Add a collection of tasks to a job | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 6f89725d-4325-4de0-a99c-5946f483c3c8
caps.latest.revision: 11
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Add a collection of tasks to a job
Add a collection of tasks to the specified job.

##  <a name="bk_lifetime"></a> Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to tasks.

|Method|Request URI|
|------------|-----------------|
|POST|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/addtaskcollection?api-version={api-version}`|

Replace {job-id} with the id of the job to which the tasks are to be added.

The following example shows the optional elements for adding a collection of tasks:

```
{
  "value": [ {
    "id":"mytask1",
    "commandLine":"myprogram.exe param1",
    "resourceFiles": [ {
      "blobSource":"http://mystorage1.blob.core.windows.net/scripts/myprogram.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
      "filePath":"myprogram.exe"
    },
    {
      "blobSource":"http://mystorage1.blob.core.windows.net/scripts/test.txt?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
      "filePath":"test.txt"
    } ],
    "authenticationTokenSettings" : [ {
      "access":"job"
    } ]
    "environmentSettings": [ {
      "name":"myvariable",
      "value":"myvalue"
    } ],
    "affinityInfo": {
      "affinityId":"TVM:tv-2167304207_2-20140917t221319z"
    },
    "constraints": {
      "maxWallClockTime":"PT1H",
      "maxTaskRetryCount":0,
      "retentionTime":"PT1H"
    },
    "userIdentity": {
      "autoUser": {
        "scope":"task",
        "elevationLevel":"nonAdmin"
      }
    }
  },
  {
    "id":"mytask2",
    "commandLine":"myprogram.exe param2",
    "resourceFiles": [ {
      "blobSource":"http://mystorage1.blob.core.windows.net/scripts/myprogram.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
      "filePath":"myprogram.exe"
    },
    {
      "blobSource":"http://mystorage1.blob.core.windows.net/scripts/test.txt?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
      "filePath":"test.txt"
    } ],
    "authenticationTokenSettings" : [ {
      "access":"job"
    } ]    
    "environmentSettings": [ {
      "name":"myvariable",
      "value":"myvalue"
    } ],
    "affinityInfo": {
      "affinityId":"TVM:tv-2167304207_2-20140917t221319z"
    },
    "constraints": {
      "maxWallClockTime":"PT1H",
      "maxTaskRetryCount":0,
      "retentionTime":"PT1H"
    },
    "userIdentity": {
      "autoUser": {
        "scope":"task",
        "elevationLevel":"nonAdmin"
      }
    }
  }]
}

```

The following details must be considered when submitting a request to add a collection of tasks:

- A request can include a maximum of 100 tasks. If a request with more than 100 tasks is submitted, the Batch service returns 400 (Bad Request).

- Each task must have a unique id.

- The Batch service returns an HTTP Status Code 400 (Bad Request) if any request contains an invalid set of properties which are not supported.

- The Batch service returns an HTTP Status Code 200 (OK) for a valid request. The server will then stream the results of individual operations.

- The response contains the status of an add task operation for each task id in the request. Status indicates whether the task is successfully added or if there were any errors encountered while adding the task.

- The Batch service can re-order the responses of the requests. The taskId property in the response must to be used by the client to match the request to the corresponding response. The response contains the status and error information for each operation.

- If the response contains any failed tasks, a client can retry the request. It is recommended that the client resubmit only failed tasks, and remove any successfully added tasks.

- If the server times out or the connection is closed during the request, the request may have been partially or fully processed, or not at all. In such cases, the user should re-issue the request. Note that it is up to the user to correctly handle failures when re-issuing a request. For example, you should use the same task ids during a retry so that if the prior operation succeeded, the retry will not create extra tasks unexpectedly.

Each task in the request has the following schema:

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|id|Yes|String|A string that uniquely identifies the task within the job. The id can contain any combination of alphanumeric characters including hyphens and underscores, and cannot contain more than 64 characters. The id is case\-preserving and case\-insensitive \(that is, you may not have two ids within a job that differ only by case\).|
|displayName|No|String|A display name for the task. It need not be unique and can contain any Unicode characters up to a maximum length of 1024.|
|commandLine|Yes|String|The command line of the task.|
|[resourceFiles](../batchservice/add-a-collection-of-tasks-to-a-job.md#resourceFiles)|No|Collection|A list of files that Batch will download to the compute node before running the command line.<br /><br /> If you are providing the executable for the task, at least one instance of this element is required to specify the source location and target location of the executable file.<br /><br /> If the task requires additional supporting files, add additional instances of this element to list these files.<br /><br /> Files that listed under this element are located in the task’s **wd** directory. For more information, see [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md).<br /><br /> If the command line is a default server program, and requires no additional supporting files, you do not need to include this element.|
|[outputFiles](#outputFile)|No|Collection|A list of files that the Batch service will upload from the compute node after running the command line. For multi-instance tasks, the files will only be uploaded from the compute node on which the primary task is executed.|
|[authenticationTokenSettings](#authenticationTokenSettings)|Optional|Complex Type|The settings for an authentication token that the task can use to perform Batch service operations.<br /><br /> If this property is set, the Batch service provides the task with an authentication token which can be used to authenticate Batch service operations without requiring an account access key. The token is provided via the AZ_BATCH_AUTHENTICATION_TOKEN environment variable. The operations that the task can carry out using the token depend on the settings. For example, a task can request job permissions in order to add other tasks to the job, or check the status of the job or of other tasks under the job.|
|[environmentSettings](../batchservice/add-a-collection-of-tasks-to-a-job.md#environmentSettings)|No|Collection|A list of environment variable settings for the task.|
|affinityInfo|No|Complex Type|Specifies a locality hint that can be used by the Batch service to select a node on which to start the new task.|
|[constraints](../batchservice/add-a-collection-of-tasks-to-a-job.md#constraints)|No|Complex Type|Specifies constraints that apply to this task.<br /><br /> If you do not specify constraints, the maxTaskRetryCount is the maxTaskRetryCount specified for the job, and the maxWallClockTime and retentionTime are infinite.|
|[userIdentity](#userIdentity)|No|Complex Type|The user identity under which the task runs. If omitted, the task runs as a non-administrative user unique to the task.|
|[multiInstanceSettings](../batchservice/add-a-collection-of-tasks-to-a-job.md#multiInstanceSettings)|No|Complex Type|Specifies that the task is a Multi\-Instance Task requiring multiple compute nodes.  See [multiInstanceSettings](../batchservice/add-a-collection-of-tasks-to-a-job.md#multiInstanceSettings) for details.|
|[dependsOn](../batchservice/add-a-collection-of-tasks-to-a-job.md#dependsOn)|No|Complex Type|Specifies that the task depends on other tasks.  The task will not be scheduled until all depended\-on tasks have completed successfully.  \(If any depended\-on tasks fail and exhaust their retry counts, the task will never be scheduled.\)<br /><br /> If the job does not have usesTaskDependencies set to true, and this element is present, the request fails with error code TaskDependenciesNotSpecifiedOnJob.|
|[exitConditions](#exitConditions)|Optional|Complex Type|Specifies how the Batch service should respond to task exit codes and other ways in which the task could complete.|

###  <a name="multiInstanceSettings"></a> multiInstanceSettings

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|numberOfInstances|Yes|Int|The number of compute nodes required by the task.|
|coordinationCommandLine|No|String|The command line to run on all compute nodes to enable them to coordinate when the primary runs the main task command.  A typical coordination command line launches a background service and verifies that the service is ready to process inter node messages.|
|commonResourceFiles|No|Collection|A list of files that Batch will download before running the coordination command line.<br />The difference between common resource files and task resource files is that common resource files are downloaded for all subtasks including the primary, whereas task resource files are downloaded only for the primary.|

###  <a name="resourceFiles"></a> resourceFiles

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|blobSource|Yes|String|The URL of the file within Azure Blob Storage. The Batch service downloads the blob to the specified file path.<br /><br /> The URL must be readable using anonymous access; that is, the Batch service does not present any credentials when downloading the blob.  There are two ways to get such a URL for a blob in Azure storage: use a Shared Access Signature \(SAS\) granting read permissions on the blob, set the ACL for the blob’s container to allow public access.|
|filePath|Yes|String|The location on the compute node to which the file should be downloaded, relative to the task's working directory.|
|fileMode|No|String|The file permission mode attribute in octal format. This property is applicable only if the resourceFile is downloaded to a Linux node. This property will be ignored if it is specified for a resourceFile which is downloaded to a Windows node.<br /><br /> If this property is not specified for a Linux node, then a default value of 0770 is applied to the file.|

###  <a name="outputFiles"></a> outputFiles

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|filePattern|Yes|String|A pattern indicating which file(s) to upload.<br /><br /> Both relative and absolute paths are supported. Relative paths are relative to the task working directory.<br /><br /> For wildcards, use * to match any character and ** to match any directory. For example, **\\*.txt matches any file ending in .txt in the task working directory or any subdirectory.<br /><br /> Note that \\ and / are treated interchangeably and mapped to the correct directory separator on the compute node operating system.|
|[destination](#outputFileDestination)|Yes|Complex Type|The destination for the output file(s).|
|[uploadOptions](#outputFileUploadOptions)|Yes|Complex Type|Additional options for the upload operation, including under what conditions to perform the upload.|

###  <a name="outputFileDestination"></a> outputFileDestination

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|[container](#outputFileBlobContainerDestination)|Yes|ComplexType|A location in Azure blob storage to which files are uploaded.|

###  <a name="outputFileBlobContainerDestination"></a> outputFileBlobContainerDestination

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|path|No|String|The destination blob or virtual directory within the Azure Storage container. If filePattern contains one or more wildcards, then path is the name of the blob virtual directory (blob name prefix). If filePattern contains no wildcards, then path is the name of the blob.|
|containerUrl|Yes|String|A SAS URL granting write access to the Azure storage container. The Batch service uses the SAS URL to authenticate to Azure Storage in order to write the output files to the container.|

###  <a name="outputFileUploadOptions"></a> outputFileUploadOptions

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|uploadCondition|Yes|String|The conditions under which the task output file or set of files should be uploaded. Possible values include:<br /><br /> - **taskSuccess**: Upload the file(s) only after the task process exits with an exit code of 0.<br /><br /> - **taskFailure**: Upload the file(s) only after the task process exits with a nonzero exit code.<br /><br /> **taskCompletion**: Upload the file(s) after the task process exits, no matter what the exit code was.<br /><br /> 
The default is taskCompletion.|

### <a name="authenticationTokenSettings"></a> authenticationTokenSettings

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|access|Required|Collection|The authentication token grants access to a limited set of Batch service operations.<br /><br /> Currently the only supported value for the access property is **job**, which grants access to all operations related to the job which contains the task.|


###  <a name="environmentSettings"></a> environmentSettings

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|name|Yes|String|The name of the environment variable.|
|value|No|String|The value of the environment variable.|

###  <a name="constraints"></a> constraints

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|maxWallClockTime|No|Time Interval|The maximum elapsed time that the task may run, measured from the time the task starts. If the task does not complete within the time limit, the Batch service terminates it. If this is not specified, there is no time limit on how long the task may run.|
|maxTaskRetryCount|No|Int32|The maximum number of times the task may be retried. The Batch service retries a task if its exit code is nonzero. Note that this value specifically controls the number of retries. The Batch service will try the task once, and may then retry up to this limit. For example, if the maximum retry count is 3, Batch tries the task up to 4 times \(one initial try and 3 retries\).<br /><br /> If the maximum retry count is 0, the Batch service does not retry the task.<br /><br /> If the maximum retry count is \-1, the Batch service retries the task without limit.|
|retentionTime|No|Time Interval|Specifies the minimum time to retain the working directory for the task on the compute node where it ran.  After this time, the Batch service may delete the working directory and all its contents.<br /><br /> The default is infinite, i.e. the working directory will be retained until the compute node is removed or reimaged.|

###  <a name="userIdentity"></a> userIdentity

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|userName|No|String|The name of the user identity under which the task is run. The userName and autoUser properties are mutually exclusive; you must specify one but not both. |
|[autoUser](#autoUser)|No|Complex Type|The auto user under which the task is run. The userName and autoUser properties are mutually exclusive; you must specify one but not both.|

###  <a name="autoUser"></a> autoUser

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|scope|No|Complex Type|The scope for the auto user.<br /><br />**pool** - specifies that the task runs as the common auto user account which is created on every node in a pool.<br /><br /> **task** - specifies that the service should create a new user for the task.<br /><br />The default value is **task**.|
|elevationLevel|No|Complex Type|The elevation level of the auto user.<br /><br />**nonAdmin** - The auto user is a standard user without elevated access.<br /><br />**admin** - The auto user is a user with elevated access and operates with full Administrator permissions.<br /><br />The default value is **nonAdmin**.|

###  <a name="affinityInfo"></a> affinityInfo

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|affinityId|Yes|String|An opaque string representing the location of compute node or a task that has run previously.  You can pass the affinityId of a compute node or task to indicate that this task needs to be placed close to the node or task.<br /><br /> You can obtain the affinityId for a node or a task via a GET request for that resource.|

###  <a name="dependsOn"></a> dependsOn

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|taskIds|No|Collection|A list of task ids that this task depends on.  All tasks in this list must complete successfully before the dependent task can be scheduled.<br /><br /> The taskIds collection is limited to 64000 characters total \(i.e. the combined length of all task ids\). If the taskIds collection exceeds the maximum length, the Add Task request fails with error code TaskDependencyListTooLong. In this case consider using task id ranges instead.|
|taskIdRanges|No|Collection|A list of task id ranges that this task depends on.  All tasks in all ranges must complete successfully before the dependent task can be scheduled.<br /><br /> Because it is not possible to usefully specify a range of strings, tasks specified in a range must have ids that can be parsed as integers.  For example, a task can depend on task ids 9 to 12, but cannot depend on task ids "mytask" to "yourtask".|

### <a name="taskIdRange"></a> taskIdRange

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|start|Yes|Int32|The first id in the range.|
|end|Yes|Int32|The last id in the range.|

 The start and end of the range are inclusive.  For example, if a range has start 9 and end 12, then it represents tasks "9", "10", "11" and "12".

###  <a name="exitConditions"></a> exitConditions

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|[exitCodes](#exitCodeMapping)|Optional|Collection|A list of task exit codes and how the Batch service should respond to them.|
|[exitCodeRanges](#exitCodeRangeMapping)|Optional|Collection|A list of task exit code ranges and how the Batch service should respond to them.|
|[preProcessingError](#exitOptions)|Optional|Complex Type|Specifies how the Batch service should respond if the task fails to start due to an error.|
|[fileUploadError](#exitOptions)|Optional|Complex Type|Specifies how the Batch service should respond if a file upload error occurs.|
|[default](#exitOptions)|Optional|Complex Type|Specifies how the Batch service should respond if the task fails with an exit condition not covered by any of the other properties. <br /><br />This value is used if the task exits with any nonzero exit code not listed in the exitCodes or exitCodeRanges collection, with a pre-processing error if the preProcessingError property is not present, or with a file upload error if the fileUploadError property is not present. For non-default behaviour on exit code 0, list it explicitly using the exitCodes or exitCodeRanges collection.|

###  <a name="exitCodeMapping"></a> exitCodeMapping

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|code|Required|Int32|A process exit code.|
|[exitOptions](#exitOptions)|Required|Complex Type|An exitOptions specifying how the Batch service should respond if the task exits with this exit code.|

###  <a name="exitCodeRangeMapping"></a> exitCodeRangeMapping

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|start|Required|Int32|The first exit code in the range.|
|end|Required|Int32|The last exit code in the range.|
|[exitOptions](#exitOptions)|Required|Complex Type|An exitOptions specifying how the Batch service should respond if the task exits with an exit code in the range *start* to *end* (inclusive).|

###  <a name="exitOptions"></a> exitOptions

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|jobAction|Optional|String|An action to take on the job containing the task, if the task completes with the given exit condition and the job's onTaskFailed property is "performexitoptionsjobaction".<br /><br /> Permitted values are:<br /><br /> **none** – take no action.<br /><br />	**disable** – disable the job. This is equivalent to calling the "Disable a job" API, with a disableTasks value of **requeue**.<br /><br /> **terminate** – terminate the job. The terminateReason in the job's executionInfo is set to "TaskFailed".<br /><br />The default is **none** for exit code 0 and **terminate** for all other exit conditions.<br /><br />It is an error to specify this if the job's onTaskFailed is **noaction**. The add task request fails with status code 400 (Bad Request) and an invalid property value error response.|
|dependencyAction|Optional|String|An action that the Batch service performs on tasks that depend on this task.<br /><br /> The default is **satisfy** for exit code 0, and **block** for all other exit conditions.<br /><br />If the job's **usesTaskDependencies** property is set to false, then specifying the dependencyAction property returns an error. The add task request fails with an invalid property value error; if you are calling the REST API directly, the HTTP status code is 400 (Bad Request).|


## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

 The following example shows the result of two tasks added successfully and one task with an error "TaskExists":

 ```
 {
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#taskaddresult",
  "value":[
    {
      "status":"Success",
      "taskId":"mytask2",
      "eTag":"0x8D36A45A1235905",
      "lastModified":"2016-04-22T00:32:47.8107909Z",
      "location":"https://myaccount.region.batch.azure.com/jobs/testjob/tasks/mytask2"
    },
    {
      "status":"Success",
      "taskId":"mytask1",
      "eTag":"0x8D36A45A123A6E9",
      "lastModified":"2016-04-22T00:32:47.8127849Z",
      "location":"https://myaccount.region.batch.azure.com/jobs/testjob/tasks/mytask1"
    },
    {
      "error@odata.navigationLinkUrl":"https://myaccount.region.batch.azure.com/jobs/testjob/tasks/mytask3/error",
      "error":
      {
        "code":"TaskExists",
        "message":
        {
          "lang":"en-US","value":"The specified task already exists.\nRequestId:5b5c5921-a74e-4fdc-8893-cdd2a67333b8\nTime:2016-04-22T00:32:47.8667877Z"
        }
      },
      "status":"ClientError",
      "taskId":"mytask3"
    }
  ]
}
```

|Element name|Type|Notes|
|------------------|----------|-----------|
|Status|String|Status of the task request, which can be one of the following:<br/><br/>**Success** - Task was added successfully.<br/>**ClientError** - Task failed to add due to a client error and should not be retried without modifying the request as appropriate.<br/>**ServerError** - Task failed to add due to a server error and can be retried without modification.|
|taskId|String|The id of the task.|
|eTag|String|The ETag of the task. This is an opaque string. You can use it to detect whether the task has changed between requests. In particular, you can be pass the ETag with an Update Task request to specify that your changes should take effect only if nobody else has modified the job in the meantime.|
|lastModified|DateTime|The last modified time associated with the successfully added task.|
|location|String|Url of the successfully added task.|
|[error](../batchservice/add-a-collection-of-tasks-to-a-job.md#error)|Complex Type|Error encountered while attempting to add the task.|

###  <a name="error"></a> error
|Element name|Type|Notes|
|------------------|----------|-----------|
|code|String|Error code encountered while adding the task.|
|message|Complex Type|An error message which contains the following fields:<br/><br/>**lang** - Language of the error message.<br/>**value** - The error message.|
|value|Complex Type|Additional error details associated with the request. Each additional detail contains the following fields:<br/><br/>**key** - Key of the additional error detail.<br/>**value** - Value of the additional error detail.|
