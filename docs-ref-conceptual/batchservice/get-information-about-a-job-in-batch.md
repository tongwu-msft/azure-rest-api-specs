---
title: "Get information about a job in Batch | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 038ee458-bf76-4464-a9e2-60a00c6ca120
caps.latest.revision: 24
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Get information about a job in Batch
  Gets information about the specified job.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to jobs.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.{region-id}.batch.azure.com//jobs/{job-id}?$select={select-list}&$expand=stats&api-version={api-version}`|

 Replace {job-id} with the id of the job that you want to get information about.

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md)

 The following example shows information about a completed job.

```
{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#jobs/@Element",
  "id":"job-0000000001",
  "url":"https://myaccount.myregion.batch.azure.com/jobs/job-0000000001",
  "eTag":"#################",
  "lastModified":"2014-09-16T21:01:28.6991541Z",
  "creationTime":"2014-09-16T20:04:26.9472515Z",
  "state":"completed",
  "stateTransitionTime":"2014-09-16T21:01:28.8768771Z",
  "previousState":"active",
  "previousStateTransitionTime":"2014-09-16T20:56:21.9203427Z",
  "priority":100,
  "constraints": {
    "maxWallClockTime":"PT1H",
    "maxTaskRetryCount":-1
  },
  "jobManagerTask": {
    "id":"mytask1",
    "commandLine":"myprogram.exe",
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
    "environmentSettings": [
    {
      "name":"myvariable",
      "value":"myvalue"
    } ],
    "constraints": {
      "maxWallClockTime":"PT1H",
      "retentionTime":"PT1H",
      "maxTaskRetryCount":0
    },
    "userIdentity": {
      "autoUser": {
        "scope":"task",
        "elevationLevel":"nonAdmin"
      }
    },
    "runExclusive":true,
    "killJobOnCompletion":true
  },
  "poolInfo":{
    "poolId":"mypool1"
  },
  "executionInfo": {
    "poolId":"mypool1",
    "startTime":"2014-09-16T20:04:27.0107175Z",
    "endTime":"2014-09-16T21:01:28.8768771Z",
    "terminateReason":"JMComplete"
  }
}

```

|Element|Type|Notes|
|-------------|----------|-----------|
|id|String|The id of the job.|
|displayName|String|The display name of the job.|
|url|String|The URL of the job.|
|eTag|String|The ETag of the job. This is an opaque string. You can use it to detect whether the job has changed between requests.  In particular, you can be pass the ETag with an Update Job request to specify that your changes should take effect only if nobody else has modified the job in the meantime.|
|lastModified|DateTime|The last modified time of the job.  This is the last time at which the job level data, such as the job state or priority, changed.  It does not factor in task\-level changes such as adding new tasks or tasks changing state.|
|creationTime|DateTime|The creation time of the job.|
|state|String|The current state of the job.<br /><br /> Possible values are:<br /><br /> **active** – the job is available to have tasks scheduled<br /><br /> **disabling** –a user has requested that the job be disabled, but the disable operation is still in progress \(for example, waiting for tasks to terminate\)<br /><br /> **disabled** – a user has disabled the job. No tasks are running, and no new tasks will be scheduled. For more information, see Disable a job.<br /><br /> **enabling** – a user has requested that the job be enabled, but the enable operation is still in progress<br /><br /> **terminating** –the job is about to complete, either because a Job Manager task has completed or because the user has terminated the job, but the terminate operation is still in progress \(for example, because Job Release tasks are running\).<br /><br /> **completed** – all tasks have terminated, and the system will not accept any more tasks or any further changes to the job.<br /><br /> **deleting** – a user has requested that the job be deleted, but the delete operation is still in progress \(for example, because the system is still terminating running tasks\). For more information, see [Delete a job from an account](../batchservice/delete-a-job-from-an-account.md).|
|stateTransitionTime|DateTime|The time at which the job entered its current state.|
|previousState|String|The previous state of the job. This property is not present if the job is in its initial active state.|
|previousStateTransitionTime|DateTime|The time at which the job entered its previous state.<br /><br /> This property is not present if the job is in its initial active state.|
|priority|Int32|The priority of the job. Priority values can range from \-1000 to 1000, with \-1000 being the lowest priority and 1000 being the highest priority.|
|[constraints](../batchservice/get-information-about-a-job-in-batch.md#bk_jobexeinf)|Complex Type|The execution constraints for the job.|
|[jobManagerTask](../batchservice/get-information-about-a-job-in-batch.md#bk_jobscherr)|Complex Type|The details of the Job Manager task, if any.  The Job Manager is a special task run when the job starts.<br /><br /> This property is not present if a Job Manager is not associated with the job.|
|[jobPreparationTask](../batchservice/get-information-about-a-job-in-batch.md#bk_jobsta)|Complex Type|The details of the Job Preparation task associated with the job, if any.  The Job Preparation task is a special task run on each node before any other task of the job.|
|[jobReleaseTask](../batchservice/get-information-about-a-job-in-batch.md#jobReleaseTask)|Complex Type|The details of the Job Release task associated with the job, if any.  The Job Release task is a special task run at the end of the job on each node that has run any other task of the job.|
|commonEnvironmentSettings|Collection|A list of common environment variable settings for all tasks in the job.|
|[poolInfo](../batchservice/get-information-about-a-job-in-batch.md#poolInfo)|Complex Type|The pool settings associated with the job.|
|[executionInfo](../batchservice/get-information-about-a-job-in-batch.md#executionInfo)|Complex Type|The execution information for the job.|
|usesTaskDependencies|Boolean|Specifies whether tasks in the job can define dependencies on each other.|
|onAllTasksComplete|String|Specifies an action the Batch service should take when all tasks in the job are in the completed state.<br /><br /> Permitted values are:<br /><br /> **noaction** – do nothing. The job remains active unless terminated or disabled by some other means.<br /><br /> **terminatejob** – terminate the job. The job’s terminateReason is set to "AllTasksComplete".<br /><br /> The default is **noaction**.|
|onTaskFailure|String|Specifies an action the Batch service should take when any task in the job fails. A task is considered to have failed if it completes with a nonzero exit code and has exhausted its retry count, or if it had a scheduling error. Permitted values are:<br /><br /> **noaction** – do nothing.<br /><br /> **performexitoptionsjobaction** – take the action associated with the task exit condition in the task's exitConditions collection. (This may still result in no action being taken, if that is what the task specifies.)<br /><br />The default is **noaction**.|
|metadata|Collection|A list of name\-value pairs associated with the job as metadata.<br /><br /> The Batch service does not assign any meaning to metadata; it is solely for the use of user code.|
|[stats](../batchservice/get-information-about-a-job-in-batch.md#stats)|Complex Type|Contains resource usage statistics for the entire lifetime of the job.|

###  <a name="bk_jobexeinf"></a> constraints

|Element name|Type|Notes|
|------------------|----------|-----------|
|maxWallClockTime|Time Interval|The maximum elapsed time that the task may run, measured from the time the task starts. If the task does not complete within the time limit, the Batch service terminates it.<br /><br /> If this is not specified, there is no time limit on how long the task may run.|
|maxTaskRetryCount|Int32|The maximum number of times the task may be retried. The Batch service retries a task if its exit code is nonzero.<br /><br /> Note that this value specifically controls the number of *retries*. The Batch service will *try* the task once, and may then retry up to this limit. For example, if the maximum retry count is 3, Batch tries the task up to 4 times \(one initial try and 3 retries\).<br /><br /> If the maximum retry count is 0, the Batch service does not retry the task.If the maximum retry count is \-1, the Batch service retries the task without limit.|

###  <a name="bk_jobscherr"></a> jobManagerTask

|Element name|Type|Notes|
|------------------|----------|-----------|
|id|String|A string that uniquely identifies the Job Manager task within the job. The id can contain any combination of alphanumeric characters including hyphens and underscores and cannot contain more than 64 characters.|
|displayName|String|A display name for the Job Manager task. It need not be unique and can contain any Unicode characters up to a maximum length of 1024.|
|commandLine|String|The command line of the Job Manager task.|
|[resourceFiles](../batchservice/get-information-about-a-job-in-batch.md#resourceFiles)|Collection|A list of files that Batch will download to the compute node before running the command line.<br /><br /> Files that listed under this element are located in the task’s **wd** directory. For more information, see [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md).|
|[applicationPackageReferences](../batchservice/get-information-about-a-job-in-batch.md#applicationPackageReferences)|Collection|A list of application packages that the Batch service will deploy to the compute node before running the command line.<br /><br /> Application packages are downloaded to a shared directory, not the task directory.  Therefore, if a referenced package is already on the compute node, and is up to date, then it is not re-downloaded; the existing copy on the compute node is used.<br /><br /> If a referenced application package cannot be installed, for example because the package has been deleted or because download failed, the task fails with a scheduling error.|
|[authenticationTokenSettings](#authenticationTokenSettings)|Complex Type|The settings for an authentication token that the task can use to perform Batch service operations.<br /><br /> If this property is set, the Batch service provides the task with an authentication token which can be used to authenticate Batch service operations without requiring an account access key. The token is provided via the AZ_BATCH_AUTHENTICATION_TOKEN environment variable. The operations that the task can carry out using the token depend on the settings. For example, a task can request job permissions in order to add other tasks to the job, or check the status of the job or of other tasks under the job.|
|[environmentSettings](../batchservice/get-information-about-a-job-in-batch.md#environmentSettings)|Collection|A list of environment variable settings for the Job Manager task.|
|[constraints](../batchservice/get-information-about-a-job-in-batch.md#constraints1)|Complex Type|Specifies constraints that apply to the Job Manager task.|
|killJobOnCompletion|Boolean|Specifies whether completion of the Job Manager task signifies completion of the entire job.<br /><br /> If true, when the Job Manager task completes, the Batch service marks the job as complete.  If any tasks are still running at this time \(other than Job Release\), those tasks are terminated.<br /><br /> If false, the completion of the Job Manager task does not affect the job status. In this case, you should either use the onAllTasksComplete attribute to terminate the job, or have a client or user terminate the job explicitly. An example of this is if the Job Manager creates a set of tasks but then takes no further role in their execution.<br /><br /> The default value is true.|
|[userIdentity](#userIdentity)|Complex Type|The user identity under which the task runs. If absent, the task runs as a non-administrative user unique to the task.|
|runExclusive|Boolean|Specifies whether the Job Manager task requires exclusive use of the compute node where it runs.<br /><br /> If true, no other tasks will run on the same compute node for as long as the Job Manager is running.<br /><br /> If false, other tasks can run simultaneously with the Job Manager on a compute node. \(The Job Manager task counts normally against the node’s concurrent task limit, so this is only relevant if the node allows multiple concurrent tasks.\)<br /><br /> The default value is true.|

###  <a name="bk_jobsta"></a> jobPreparationTask

|Element name|Type|Notes|
|------------------|----------|-----------|
|id|String|A string that uniquely identifies the job preparation task within the job. The id can contain any combination of alphanumeric characters including hyphens and underscores and cannot contain more than 64 characters.<br /><br /> If you do not specify this property, the Batch service assigns a default value of "jobpreparation".<br /><br /> No other task in the job can have the same id as the Job Preparation task. If you try to submit a task with the same id, the Batch service rejects the request with HTTP status code 409 \(Conflict\) and error code TaskIdSameAsJobPreparationTask.|
|commandLine|String|The command line of the Job Preparation task.|
|[resourceFiles](../batchservice/get-information-about-a-job-in-batch.md#resourceFiles)|Collection|A list of files that Batch will download to the compute node before running the command line.<br /><br /> If you are providing the executable for the task, at least one instance of this element is required to specify the source location and target location of the executable file.<br /><br /> If the task requires additional supporting files, add additional instances of this element to list these files.<br /><br /> Files that listed under this element are located in the task’s **wd** directory. For more information, see [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md).<br /><br /> If the command line is a default server program, and requires no additional supporting files, you do not need to include this element.|
|[environmentSettings](../batchservice/get-information-about-a-job-in-batch.md#environmentSettings)|Collection|A list of environment variable settings for the Job Preparation task.|
|[constraints](../batchservice/get-information-about-a-job-in-batch.md#constraints1)|Complex Type|Specifies constraints that apply to the Job Preparation task.|
|waitForSuccess|Boolean|Specifies whether the Batch Service should wait for the Job Preparation task to complete successfully \(that is, to exit with exit code 0\) before scheduling any other tasks of the job on the compute node.<br /><br /> The default is true.<br /><br /> If true and the Job Preparation task fails on a compute node, the Batch service retries the Job Preparation task up to its maximum retry count \(as specified in the constraints element\).  If the task has still not completed successfully after all retries, then the Batch service will not schedule tasks of the job to the compute node.  The compute node remains active and eligible to run tasks of other jobs.<br /><br /> If false, the Batch service will not wait for the Job Preparation task to complete. In this case, other tasks can start executing on the compute node while the Job Preparation task is still running; and even if the Job Preparation task fails, new tasks will continue to be scheduled on the node.|
|[userIdentity](#userIdentity)|Complex Type|The user identity under which the task runs. If absent, the task runs as a non-administrative user unique to the task.|
|rerunOnNodeRebootAfterSuccess|Boolean|Specifies whether the Batch service should rerun the Job Preparation task after a compute node reboots. The default value is true.<br /><br /> The Job Preparation task is always rerun if a compute node is reimaged, or if the Job Preparation task did not complete \(e.g. because the reboot occurred while the task was running\). Therefore, you should always write a Job Preparation task to be idempotent and to behave correctly if run multiple times.|

###  <a name="jobReleaseTask"></a> jobReleaseTask

|Element name|Type|Notes|
|------------------|----------|-----------|
|id|String|A string that uniquely identifies the Job Release task within the job. The id can contain any combination of alphanumeric characters including hyphens and underscores and cannot contain more than 64 characters.<br /><br /> If you do not specify this property, the Batch service assigns a default value of "jobrelease".<br /><br /> No other task in the job can have the same id as the Job Release task. If you try to submit a task with the same id, the Batch service rejects the request with HTTP status code 409 \(Conflict\) and error code TaskIdSameAsJobReleaseTask.|
|commandLine|String|The command line of the Job Release task.|
|[resourceFiles](../batchservice/get-information-about-a-job-in-batch.md#resourceFiles)|Collection|A list of files that Batch will download to the compute node before running the command line.<br /><br /> If you are providing the executable for the task, at least one instance of this element is required to specify the source location and target location of the executable file.<br /><br /> If the task requires additional supporting files, add additional instances of this element to list these files.<br /><br /> Files that listed under this element are located in the task’s **wd** directory. For more information, see [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md).<br /><br /> If the command line is a default server program, and requires no additional supporting files, you do not need to include this element.|
|[environmentSettings](../batchservice/get-information-about-a-job-in-batch.md#environmentSettings)|Collection|A list of environment variable settings for the Job Release task.|
|maxWallClockTime|TimeInterval|The maximum elapsed time that the Job Release task may run on a given compute node, measured from the time the task starts. If the task does not complete within the time limit, the Batch service terminates it.<br /><br /> The default value is 15 minutes.<br /><br /> You may not specify a timeout longer than 15 minutes. If you do, the Batch service rejects it with HTTP status code 400 \(Bad Request\).|
|retentionTime|TimeInterval|Specifies the minimum time to retain the working directory for the Job Release task on the compute node.  After this time, the Batch service may delete the working directory and all its contents.<br /><br /> The default is infinite, i.e. the working directory will be retained until the compute node is removed or reimaged.|
|[userIdentity](#userIdentity)|Complex Type|The user identity under which the task runs. If absent, the task runs as a non-administrative user unique to the task.|

###  <a name="resourceFiles"></a> resourceFiles

|Element name|Type|Notes|
|------------------|----------|-----------|
|blobSource|String|The URL of a blob in Azure storage. The Batch service downloads the blob to the specified file path.<br /><br /> The URL must be readable using anonymous access; that is, the Batch service does not present any credentials when downloading the blob.  There are two ways to get such a URL for a blob in Azure storage: use a Shared Access Signature \(SAS\) granting read permissions on the blob, set the ACL for the blob’s container to allow public access.|
|filePath|String|The location on the compute node to which the file should be downloaded.|
|fileMode|String|The file permission mode attribute in octal format. This property is applicable only if the resourceFile is downloaded to a Linux node. This property will be ignored if it is specified for a resourceFile which is downloaded to a Windows node.<br /><br /> If this property is not specified for a Linux node, then a default value of 0770 is applied to the file.|

### <a name="applicationPackageReferences"></a> applicationPackageReferences

|Element name|Type|Notes|
|------------------|--------------|----------|
|applicationId|String|The id of the application to install.|
|version|String|The version of the application to install.<br /><br />If omitted, the default version is installed. If no default version is specified for this application, the task on which the package is specified will fail when scheduled, with a scheduling error.|

### <a name="authenticationTokenSettings"></a> authenticationTokenSettings

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|access|Required|Collection|The authentication token grants access to a limited set of Batch service operations.<br /><br /> Currently the only supported value for the access property is **job**, which grants access to all operations related to the job which contains the task.|


###  <a name="environmentSettings"></a> environmentSettings

|Element name|Type|Notes|
|------------------|----------|-----------|
|name|String|The name of the environment variable.|
|Value|String|The value of the environment variable.|

###  <a name="constraints1"></a> constraints

|Element name|Type|Notes|
|------------------|----------|-----------|
|maxWallClockTime|Time Interval|The maximum elapsed time that the task may run, measured from the time the task starts. If the task does not complete within the time limit, the Batch service terminates it.<br /><br /> If this is not specified, there is no time limit on how long the task may run.|
|maxTaskRetryCount|Int32|The maximum number of times the task may be retried. The Batch service retries a task if its exit code is nonzero.<br /><br /> Note that this value specifically controls the number of retries. The Batch service will try the task once, and may then retry up to this limit. For example, if the maximum retry count is 3, Batch tries the task up to 4 times \(one initial try and 3 retries\).<br /><br /> If the maximum retry count is 0, the Batch service does not retry the task.<br /><br /> If the maximum retry count is \-1, the Batch service retries the task without limit.|
|retentionTime|Time Interval|Specifies the minimum time to retain the working directory for the task on the compute node where it ran.  After this time, the Batch service may delete the working directory and all its contents.<br /><br /> The default is infinite, i.e. the working directory will be retained until the compute node is removed or reimaged.|

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

###  <a name="poolInfo"></a> poolInfo

|Element name|Type|Notes|
|------------------|----------|-----------|
|poolId|String|Specifies the id of an existing pool. All the tasks of the job will run on the specified pool. To find the ids of existing pools, see [List the pools in the account](../batchservice/list-the-pools-in-the-account.md).<br /><br /> You must specify *either* poolId *or* autoPoolSpecification, but not both.|
|[autoPoolSpecification](../batchservice/get-information-about-a-job-in-batch.md#autoPoolSpecification)|Complex Type|Specifies characteristics for a temporary ‘auto pool.’ The Batch service will create this auto pool and run all the tasks of the job will run on it, and will delete the pool once the job has completed.<br /><br /> You must specify *either* poolId *or* autoPoolSpecification, but not both.|

###  <a name="autoPoolSpecification"></a> autoPoolSpecification

|Element name|Type|Notes|
|------------------|----------|-----------|
|autoPoolIdPrefix|String|The Batch service assigns each auto pool a unique identifier on creation. To distinguish between pools created for different purposes, you can specify this element to add a prefix to the id that is assigned. The prefix can be up to 20 characters long.|
|poolLifetimeOption|String|Specifies the minimum lifetime of created auto pools, and how multiple jobs on a schedule are assigned to pools.  Possible values are:<br /><br /> **job**: the pool exists for the lifetime of the job to which it is dedicated.  The Batch service creates the pool when it creates the job. If applied to a job schedule, the Batch service creates a new auto pool for every job created on the schedule.<br /><br /> **jobschedule** – the pool exists for the lifetime of the job schedule. The Batch Service creates the pool when it creates the first job on the schedule.  You may apply this option only to job schedules, not to jobs.|
|keepAlive|Boolean|Specifies whether to keep an auto pool alive after its lifetime expires.<br /><br /> If false, the Batch service deletes the pool once its lifetime \(as determined by the poolLifetimeOption setting\) expires; that is, when the job or job schedule completes.<br /><br /> If true, the Batch service does not delete the pool automatically. It is up to the user to delete auto pools created with this option.<br /><br /> The default value is false.|
|pool|Complex Type|Contains the pool specification for the auto pool.|

### pool

|Element name|Type|Notes|
|------------------|----------|-----------|
|displayName|String|Display name for the auto pool. It need not be unique and can contain any Unicode characters up to a maximum length of 1024.|
|vmSize|String|The size of the virtual machines in the pool. All virtual machines in a pool are the same size. <br/><br/> For information about available sizes of virtual machines for Cloud Services pools (pools created with cloudServiceConfiguration), see [Sizes for Cloud Services](http://azure.microsoft.com/documentation/articles/cloud-services-sizes-specs/). Batch supports all Cloud Services VM sizes except `ExtraSmall`, `Standard_A1_v2`, and `Standard_A2_v2`.<br/><br/> For information about available VM sizes for pools using images from the Virtual Machines Marketplace (pools created with virtualMachineConfiguration) see [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-linux-sizes/) (Linux) or [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-windows-sizes/) (Windows). Batch supports all Azure VM sizes except `STANDARD_A0` and those with premium storage (`STANDARD_GS`, `STANDARD_DS`, and `STANDARD_DSV2` series).|
|[cloudServiceConfiguration](../batchservice/get-information-about-a-job-in-batch.md#bk_csconf)|Complex Type|The cloud service configuration for the pool.|
|[virtualMachineConfiguration](../batchservice/get-information-about-a-job-in-batch.md#bk_vmconf)|Complex Type|The virtual machine configuration for the pool.|
|[networkConfiguration](../batchservice/get-information-about-a-job-in-batch.md#bk_netconf)|Complex Type|The network configuration for the pool.|
|resizeTimeout|Time|Specifies the timeout for allocation of compute nodes to the pool.<br /><br /> This timeout applies only to manual scaling; it has no effect when enableAutoScale is set to true.<br /><br /> The default value is 15 minutes.<br /><br /> The minimum value is 5 minutes. If you specify a value less than 5 minutes, the Batch service returns a Bad Request \(400\).|
|targetDedicated|Int32|Specifies the desired number of compute nodes in the pool.<br /><br /> This property must not be specified if enableAutoScale is set to true.  It is required if enableAutoScale is set to false.|
|maxTasksPerNode|Int32|The maximum number of tasks that can run concurrently on a single compute node in the pool.<br /><br /> The default value is 1.<br /><br /> The maximum value of this setting depends on the size of the compute nodes in the pool \(the vmSize setting\).|
|taskSchedulingPolicy|Complex Type|Defines how the Batch service distributes tasks between compute nodes in the pool.|
|autoScaleFormula|String|Specifies a formula for the desired number of compute nodes in the pool.<br /><br /> This property must not be specified if enableAutoScale is set to false. It is required if enableAutoScale is set to true.<br /><br /> The formula is checked for validity before the pool is created. If the formula is not valid, the Batch service rejects the request with detailed error information.|
|autoScaleEvaluationInterval|Time|Specifies a time interval at which to automatically adjust the pool size according to the AutoScale formula.<br />The default value is 15 minutes.<br /><br /> The minimum and maximum value are 5 minutes and 168 hours respectively. If you specify a value less than 5 minutes or greater than 168 hours, the Batch service returns a Bad Request \(400\).|
|enableAutoScale|Boolean|Specifies whether the pool size should automatically adjust over time.<br /><br /> If false, the targetDedicated element is required.<br /><br /> If true, the autoScaleFormula element is required. The pool automatically resizes according to the formula.<br /><br /> The default value is false.|
|enableInterNodeCommunication|Boolean|Specifies whether the pool permits direct communication between nodes.<br /><br /> The default value is false.|
|startTask|Complex Type|Specifies a task to run on each compute node as it joins the pool. The task runs when the node is added to the pool or when the node is restarted.|
|certificateReferences|Collection|A list of certificates to be installed on each compute node in the pool.<br /><br /> Each certificate in the list must have been previously added to the Batch account.|
|metadata|Collection|A list of name\-value pairs associated with the pool as metadata.<br /><br /> The Batch service does not assign any meaning to metadata; it is solely for the use of user code.|

###  <a name="bk_csconf"></a> cloudServiceConfiguration

|Element name|Type|Notes|
|------------------|----------|-----------|
|osFamily|String|The Azure Guest OS family to be installed on the virtual machines in the pool.<br /><br /> Possible values are:<br /><br /> **2** – OS Family 2, equivalent to Windows Server 2008 R2 SP1.<br /><br /> **3** – OS Family 3, equivalent to Windows Server 2012.<br /><br /> **4** – OS Family 4, equivalent to Windows Server 2012 R2.<br /><br /> **5** – OS Family 5, equivalent to Windows Server 2016.<br /><br /> For more information, see [Azure Guest OS Releases](https://azure.microsoft.com/documentation/articles/cloud-services-guestos-update-matrix/#releases).|
|targetOSVersion|String|The Azure Guest OS version to be installed on the virtual machines in the pool.<br /><br /> The default value is * which specifies the latest operating system version for the specified family.<br /><br /> For other permitted values, see [Azure Guest OS Releases](https://azure.microsoft.com/documentation/articles/cloud-services-guestos-update-matrix/#releases).|

###  <a name="bk_vmconf"></a> virtualMachineConfiguration

|Element name|Type|Notes|
|------------------|----------|-----------|
|[imageReference](../batchservice/get-information-about-a-job-in-batch.md#bk_imgref)|Complex Type|Specifies information about the platform or Marketplace image to use.|
|nodeAgentSKUId|String|The SKU of the Batch node agent that needs to be provisioned on the compute node. An appropriate node agent SKU which matches the selected image reference must be provided.<br /><br /> To get the list of supported node agent SKUs along with their list of verified image references, see [List supported node agent SKUs](../batchservice/list-supported-node-agent-skus.md).|
|[windowsConfiguration](../batchservice/get-information-about-a-job-in-batch.md#bk_winconf)|Complex Type|Specifies Windows operating system settings on the virtual machine. This property must not be specified if the imageReference is referencing a Linux OS image.|

###  <a name="bk_imgref"></a> imageReference

|Element name|Type|Notes|
|------------------|----------|-----------|
|publisher|String|The publisher of the image.<br /><br /> To get the list of all imageReferences verified by Azure Batch, see [List supported node agent SKUs](../batchservice/list-supported-node-agent-skus.md).|
|offer|String|The offer of the image.|
|sku|String|The SKU of the image.|
|version|String|The version of the image. A value of ‘latest’ can be specified to select the latest version of an image. The default value is 'latest'.|

###  <a name="bk_winconf"></a> windowsConfiguration

|Element name|Type|Notes|
|------------------|----------|-----------|
|enableAutomaticUpdates|Boolean|Indicates whether the virtual machine is enabled for automatic updates. If this property is not specified, the default value is true.|

###  <a name="bk_netconf"></a> networkConfiguration

|Element name|Type|Notes|
|------------------|--------------|----------|
|subnetId|String|Specifies the resource identifier of the subnet in which the pool's compute nodes are created.|


###  <a name="executionInfo"></a> executionInfo

|Element name|Type|Notes|
|------------------|----------|-----------|
|startTime|DateTime|The start time of the job. The job ‘starts’ when the first task starts running on any compute node.  \(This includes Job Manager and Job Preparation tasks.\)|
|endTime|DateTime|The completion time of the job. This property is present only if the job is in the **completed** state.|
|poolId|String|The id of the pool to which this job is assigned.  This depends on the *poolInfo* you specified when creating or updating the job.<br /><br /> If you specified a *poolId*, this is that poolId.<br /><br /> If you specified an  *autoPoolSpecification*, this is the id of the auto pool that Batch created for this job.<br /><br /> \(Note: this element contains the *actual* pool where the job is assigned. The Get Job response also contains a poolInfo element, which contains the pool configuration data from Add/Update Job. This may also contain a poolId element.  If it does, the two ids are the same.  If it does not, it means the job ran on an auto pool, and this element contains the id of that auto pool.\)|
|schedulingError|Complex Type|If there was an error starting the job, this element contains the error details.<br /><br /> Otherwise, this element is not present.|
|terminateReason|String|If the job has completed, a string describing the reason the job ended.<br /><br /> The Batch service sets the reason as following:<br /><br /> **JMComplete** – the Job Manager task completed, and killJobOnCompletion was set to true<br /><br /> **MaxWallClockTimeExpiry** – the job reached its *maxWallClockTime* constraint<br /><br /> **TerminateJobSchedule** – the job ran as part of a schedule, and the schedule terminated<br /><br /> **AllTasksComplete** – the job's onAllTasksComplete attribute is set to **terminatejob**, and all tasks in the job are complete<br /><br /> **TaskFailed** – the job's onTaskFailure attribute is set to **performexitoptionsjobaction**, and a task in the job failed with an exit condition that specified a jobAction of **terminatejob**<br /><br /> Any other string is a user\-defined reason specified in a call to the [Terminate a job](../batchservice/terminate-a-job.md) operation.<br /><br /> If the job has not completed, this element is not present.|

### schedulingError

|Element name|Type|Notes|
|------------------|----------|-----------|
|category|String|The category of the job scheduling error.|
|code|String|An identifier for the job scheduling error.  Codes are invariant and are intended to be consumed programmatically.|
|message|String|A message describing the job scheduling error, intended to be suitable for display in a user interface.|
|details|Collection|A list of additional error details related to the scheduling error.|

###  <a name="stats"></a> stats

|Element name|Type|Notes|
|------------------|----------|-----------|
|url|String|The URL for the job statistics resource.|
|startTime|DateTime|The start time of the time range covered by the statistics.|
|lastUpdateTime|DateTime|The time at which the statistics were last updated. All statistics are limited to the range between startTime and lastUpdateTime.|
|userCPUTime|Time|The total user mode CPU time \(summed across all cores and all compute nodes\) consumed by all the tasks in the job.|
|kernelCPUTime|Time|The total kernel mode CPU time \(summed across all cores and all compute nodes\) consumed by all the tasks in the job.|
|wallClockTime|Time|The total wall clock time of all the tasks in the job. The wall clock time is the elapsed time from when the task started running on a compute node to when it finished \(or to the last time the statistics were updated, if the task had not finished by then\).<br /><br /> If a task was retried, this includes the wall clock time of all the task retries.|
|readIOps|Int64|The total number of disk read operations made by all tasks in the job.|
|writeIOps|Int64|The total number of disk write operations made by all tasks in the job.|
|readIOGiB|Double|The total gibibytes read from disk by all tasks in the job.|
|writeIOGiB|Double|The total gibibytes written to disk by all tasks in the job.|
|numSucceededTasks|Int64|The total number of tasks successfully completed in the job during the given time range.  A task completes successfully if it returns exit code 0.|
|numFailedTasks|Int64|The total number of tasks in the job that failed during the given time range. A task fails if it exhausts its maximum retry count without returning exit code 0.|
|numTaskRetries|Int64|The total number of retries on all the tasks in the job during the given time range.|
|waitTime|Time|The total wait time of all the tasks in the job.  The *wait time* for a task is defined as the elapsed time between the creation of the task creation and the start of task execution.  \(If the task is retried due to failures, the wait time is the time to the *most recent* task execution.\)  This value is only reported in the account lifetime statistics; it is not included in the job statistics.|

