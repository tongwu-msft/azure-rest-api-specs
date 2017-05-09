---
title: "List the job schedules in an account | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 7e559580-c15a-409c-8c53-2b50e40ed6c7
caps.latest.revision: 17
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# List the job schedules in an account
  Lists all of the job schedules in the specified account.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to accounts.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.{region-id}.batch.azure.com/jobschedules?$skiptoken={skiptoken}&$filter={filter}&$select={select-list}&$expand=stats&maxresults={result-number}&api-version={api-version}`|

 The value for {filter} can be the following or any AND-ed or OR-ed combination of the following:

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|id|startswith, eq, ne, ge, gt, le, lt|String|
|state|eq|String|
|stateTransitionTime|eq, ne, ge, gt, le, lt|DateTime|
|creationTime|eq, ne, ge, gt, le, lt|DateTime|
|lastModified|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/endTime|eq, ne, ge, gt, le, lt|DateTime|
|schedule/doNotRunUntil|eq, ne, ge, gt, le, lt|DateTime|
|schedule/doNotRunAfter|eq, ne, ge, gt, le, lt|DateTime|

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

```

{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#jobschedules",
  "value": [ {
    "id":"schedule1",
    "url":"https://myaccount.myregion.batch.azure.com/jobschedules/schedule1",
    "eTag":"#################",
    "lastModified":"2011-06-12T21:12:58.236Z",
    "creationTime":"2011-06-04T21:53:58.236Z",
    "state":"active",
    "stateTransitionTime":"2011-06-04T21:53:58.236Z",
    "schedule": {
      "startWindow":"PT12M",
      "doNotRunUntil":"2013-06-04T23:53:58.236Z",
      "doNotRunAfter":"2013-12-05T23:53:58.236Z",
      "recurrenceInterval":"PT1H"
    },
    "jobSpecification": {
      "priority":-1000,
      "constraints": {
        "maxWallClockTime":"PT15M",
        "maxTaskRetryCount":5
      },
      "jobManagerTask": {
        "id":"jmTask",
        "commandLine":"myapp1.exe",
        "resourceFiles":[ {
          "blobSource":"http://mystorageaccount1.blob.core.windows.net/container/myapp1.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
          "filePath":"myapp1.exe"
        } ],
        "constraints": {
          "maxWallClockTime":"PT1H",
          "retentionTime":"PT1H",
          "maxTaskRetryCount":0
        },
        "killJobOnCompletion":true,
        "userIdentity": {
          "autoUser": {
            "scope":"task",
            "elevationLevel":"nonAdmin"
          }
        },
        "runExclusive":true
      },
      "poolInfo": {
        "poolId":"mypool1"
      }
    },
    "executionInfo": {
      "nextRunTime":"2011-12-05T03:53:58.236Z",
      "recentJob": {
        "id":"schedule1:job-6",
        "url":"https://myaccount.myregion.batch.azure.com/jobs/schedule1:job-6"
      }
    }
  } ]
}

```

|Element|Type|Notes|
|-------------|----------|-----------|
|id|String|The id of the job schedule.|
|displayName|String|The display name of the job schedule.|
|url|String|The URL of the job schedule.|
|eTag|String|The ETag of the job schedule. This is an opaque string. You can use it to detect whether the job schedule has changed between requests.  In particular, you can be pass the ETag with an Update Job Schedule request to specify that your changes should take effect only if nobody else has modified the schedule in the meantime.|
|lastModified|DateTime|The last modified time of the job schedule. This is the last time at which the schedule level data, such as the job specification or recurrence information, changed.  It does not factor in job\-level changes such as new jobs being created or jobs changing state.|
|creationTime|DateTime|The creation time of the job schedule.|
|state|String|The current state of the job schedule. Possible values are:<br /><br /> **active** – The job schedule is active and will create jobs as per its schedule.<br /><br /> **disabled** – The user has disabled the schedule.  The scheduler will not initiate any new jobs will on this schedule, but any existing active job will continue to run.<br /><br /> **terminating** – The schedule has no more work to do, or has been explicitly terminated by the user, but the termination operation is still in progress.  The scheduler will not initiate any new jobs for this schedule, nor is any existing job active.<br /><br /> **completed** – The schedule has terminated, either by reaching its end time or by the user terminating it explicitly.<br /><br /> **deleting** – The user has requested that the schedule be deleted, but the delete operation is still in progress.  The scheduler will not initiate any new jobs for this schedule, and will delete any existing jobs and tasks under the schedule, including any active job.  The schedule will be deleted when all jobs and tasks under the schedule have been deleted.|
|stateTransitionTime|DateTime|The time at which the job schedule entered its current state.|
|previousState|String|The previous state of the job schedule. This property is not present if the job schedule is in its initial active state.|
|previousStateTransitionTime|DateTime|The time at which the job schedule entered its previous state. This property is not present if the job schedule is in its initial active state.|
|[schedule](../batchservice/list-the-job-schedules-in-an-account.md#schedule)|Complex Type|The schedule according to which jobs will be created.|
|[jobSpecification](../batchservice/list-the-job-schedules-in-an-account.md#jobSpecification)|Complex Type|The configuration of the jobs to be created on this schedule.|
|[executionInfo](../batchservice/list-the-job-schedules-in-an-account.md#executionInfo)|Complex Type|Contains information about jobs that have been and will be run under this schedule. This excludes task\-level information; you can obtain task data via the usual job APIs such as List Tasks.|
|[stats](../batchservice/list-the-job-schedules-in-an-account.md#stats)|Complex Type|Contains resource usage statistics for the entire lifetime of the job schedule.|

###  <a name="schedule"></a> schedule

|Element name|Type|Notes|
|------------------|----------|-----------|
|doNotRunUntil|DateTime|Specifies the earliest time at which any job may be created under this job schedule.If you do not specify a doNotRunUntil time, the schedule becomes ready to create jobs immediately.|
|doNotRunAfter|DateTime|Specifies a time after which no job will be created under this job schedule. The schedule will move to the **completed** state as soon as this deadline is past and there is no active job under this job schedule.If you do not specify a doNotRunAfter time, and you are creating a recurring job schedule, the job schedule will remain active until you explicitly terminate it.|
|startWindow|Time|Specifies the time interval, starting from the time at which the schedule indicates a job should be created, within which a job must be created.  If a job is not created within the startWindow interval, then the ‘opportunity’ is lost; no job will be created until the next recurrence of the schedule.<br /><br /> If the schedule is recurring, and the startWindow is longer than the recurrence interval, then this is equivalent to an infinite startWindow, because the job that is ‘due’ in one recurrence interval is not carried forward into the next recurrence interval.<br /><br /> The default is infinite.  The minimum value is 1 minute; if you specify a lower value, the Batch service rejects the schedule with HTTP status code 400 \(Bad Request\).|
|recurrenceInterval|Time|Specifies the time interval between the start times of two successive jobs under the job schedule.<br /><br /> A job schedule can have at most one active job under it at any given time.  So if it is time to create a new job under a job schedule, but the previous job is still running, the Batch service will not create the new job until the previous job finishes.  If the previous job does not finish within the startWindow period of the new recurrence interval, then no new job will be scheduled for that interval.<br /><br /> For recurring jobs, you should normally specify a jobManagerTask in the jobSpecification. If you do not use jobManagerTask, you will need an external process to monitor when jobs are created, add tasks to the jobs and terminate the jobs ready for the next recurrence.<br /><br /> The default is that the schedule does not recur: one job is created, within the startWindow after the doNotRunUntil time, and the schedule is complete as soon as that job finishes.<br /><br /> The minimum value is 1 minute; if you specify a lower value, the Batch service rejects the schedule with HTTP status code 400 \(Bad Request\).|

###  <a name="jobSpecification"></a> jobSpecification

|Element name|Type|Notes|
|------------------|----------|-----------|
|priority|Int32|The priority of jobs created under this schedule. Priority values can range from \-1000 to 1000, with \-1000 being the lowest priority and 1000 being the highest priority.<br /><br /> The default value is 0.|
|displayName|String|A display name for jobs created under this schedule. It need not be unique and can contain any Unicode characters up to a maximum length of 1024.|
|[constraints](../batchservice/list-the-job-schedules-in-an-account.md#constraints)|Complex Type|Specifies the execution constraints for jobs created under this schedule.|
|[jobManagerTask](../batchservice/list-the-job-schedules-in-an-account.md#jobManagerTask)|Complex Type|Specifies details of a Job Manager task to be launched when a job is started under this schedule.<br /><br /> If the job does not specify a Job Manager task, the user must explicitly add tasks to the job using the Task API.<br /><br /> If the job does specify a Job Manager task, the Batch service creates the Job Manager task when the job is created, and will try to schedule the Job Manager task before scheduling other tasks in the job.|
|[jobPreparationTask](../batchservice/list-the-job-schedules-in-an-account.md#jobPreparationTask)|Complex Type|Specifies the Job Preparation task for jobs created under this schedule.<br /><br /> If a job has a Job Preparation task, the Batch service will run the Job Preparation task on a compute node before starting any tasks of that job on that compute node.|
|[jobReleaseTask](../batchservice/list-the-job-schedules-in-an-account.md#jobReleaseTask)|Complex Type|Specifies the Job Release task for jobs created under this schedule.<br /><br /> A Job Release task cannot be specified without also specifying a Job Preparation task for the job.<br /><br /> The Batch service runs the Job Release task on the compute nodes that have run the Job Preparation task.<br /><br /> The primary purpose of the Job Release task is to undo changes to compute nodes made by the Job Preparation task. Example activities include deleting local files, or shutting down services that were started as part of job preparation.|
|commonEnvironmentSettings|Collection|A list of common environment variable settings. These environment variables are set for all tasks in jobs created under this schedule \(including the Job Manager, Job Preparation and Job Release tasks\). Individual tasks can override an environment setting specified here by specifying the same setting name with a different value.|
|[poolInfo](../batchservice/list-the-job-schedules-in-an-account.md#poolInfo)|Complex Type|Specifies the pool on which the Batch service runs the tasks of jobs created under this schedule.|
|usesTaskDependencies|Boolean|Specifies whether tasks in jobs created under this schedule can define dependencies on each other.|
|onAllTasksComplete|String|Specifies an action the Batch service should take when all tasks in the job are in the completed state.<br /><br /> Permitted values are:<br /><br /> **noaction** – do nothing. The job remains active unless terminated or disabled by some other means.<br /><br /> **terminatejob** – terminate the job. The job’s terminateReason is set to "AllTasksComplete".<br /><br /> The default is **noaction**.|
|onTaskFailure|String|Specifies an action the Batch service should take when any task in the job fails. A task is considered to have failed if it completes with a nonzero exit code and has exhausted its retry count, or if it had a scheduling error. Permitted values are:<br /><br /> **noaction** – do nothing.<br /><br /> **performexitoptionsjobaction** – take the action associated with the task exit condition in the task's exitConditions collection. (This may still result in no action being taken, if that is what the task specifies.)<br /><br />The default is **noaction**.|
|metadata|Collection|A list of name\-value pairs associated with each job created under this schedule as metadata.<br /><br /> The Batch service does not assign any meaning to metadata; it is solely for the use of user code.|

###  <a name="constraints"></a> constraints

|Element name|Type|Notes|
|------------------|--------------|----------|
|maxWallClockTime|Time Interval|The maximum elapsed time that the task may run, measured from the time the task starts. If the task does not complete within the time limit, the Batch service terminates it.<br /><br /> If this is not specified, there is no time limit on how long the task may run.|
|maxTaskRetryCount|Int32|The maximum number of times the task may be retried. The Batch service retries a task if its exit code is nonzero.<br /><br /> Note that this value specifically controls the number of retries. The Batch service will try the task once, and may then retry up to this limit. For example, if the maximum retry count is 3, Batch tries the task up to 4 times \(one initial try and 3 retries\).<br /><br /> If the maximum retry count is 0, the Batch service does not retry the task.<br /><br /> If the maximum retry count is \-1, the Batch service retries the task without limit.|

###  <a name="jobManagerTask"></a> jobManagerTask

|Element name|Type|Notes|
|------------------|--------------|----------|
|id|String|A string that uniquely identifies the Job Manager task within the job. The id can contain any combination of alphanumeric characters including hyphens and underscores and cannot contain more than 64 characters.|
|displayName|String|A display name for the Job Manager task. It need not be unique and can contain any Unicode characters up to a maximum length of 1024.|
|commandLine|String|The command line of the Job Manager task.|
|[resourceFiles](../batchservice/list-the-job-schedules-in-an-account.md#resourceFiles)|Collection|A list of files that Batch will download to the compute node before running the command line.<br /><br /> Files that listed under this element are located in the task’s **wd** directory. For more information, see [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md).|
|[outputFiles](#outputFile)|Collection|A list of files that the Batch service will upload from the compute node after running the command line. For multi-instance tasks, the files will only be uploaded from the compute node on which the primary task is executed.|
|[applicationPackageReferences](../batchservice/list-the-job-schedules-in-an-account.md#applicationPackageReferences)|Collection|A list of application packages that the Batch service will deploy to the compute node before running the command line.<br /><br /> Application packages are downloaded to a shared directory, not the task directory.  Therefore, if a referenced package is already on the compute node, and is up to date, then it is not re-downloaded; the existing copy on the compute node is used.<br /><br /> If a referenced application package cannot be installed, for example because the package has been deleted or because download failed, the task fails to start due to an error.|
|[environmentSettings](../batchservice/list-the-job-schedules-in-an-account.md#environmentSettings)|Collection|A list of environment variable settings for the Job Manager task.|
|[constraints](../batchservice/list-the-job-schedules-in-an-account.md#constraints2)|Complex Type|Specifies constraints that apply to the Job Manager task.|
|killJobOnCompletion|Boolean|Specifies whether completion of the Job Manager task signifies completion of the entire job.<br /><br /> If true, when the Job Manager task completes, the Batch service marks the job as complete.  If any tasks are still running at this time \(other than Job Release\), those tasks are terminated.<br /><br /> If false, the completion of the Job Manager task does not affect the job status. In this case, you should either use the onAllTasksComplete attribute to terminate the job, or have a client or user terminate the job explicitly. An example of this is if the Job Manager creates a set of tasks but then takes no further role in their execution.<br /><br /> The default value is true.|
|[userIdentity](#userIdentity)|Complex Type|The user identity under which the task runs. If absent, the task runs as a non-administrative user unique to the task.|
|runExclusive|Boolean|Specifies whether the Job Manager task requires exclusive use of the compute node where it runs.<br /><br /> If true, no other tasks will run on the same compute node for as long as the Job Manager is running.<br /><br /> If false, other tasks can run simultaneously with the Job Manager on a compute node. \(The Job Manager task counts normally against the node’s concurrent task limit, so this is only relevant if the node allows multiple concurrent tasks.\)<br /><br /> The default value is true.|
|allowLowPriorityNode|Boolean|Specifies whether the Job Manager task may run on a low-priority compute node. The default value is false.|

###  <a name="jobPreparationTask"></a> jobPreparationTask

|Element name|Type|Notes|
|------------------|--------------|----------|
|id|String|A string that uniquely identifies the job preparation task within the job. The id can contain any combination of alphanumeric characters including hyphens and underscores and cannot contain more than 64 characters.<br /><br /> If you do not specify this property, the Batch service assigns a default value of "jobpreparation".<br /><br /> No other task in the job can have the same id as the Job Preparation task. If you try to submit a task with the same id, the Batch service rejects the request with HTTP status code 409 \(Conflict\) and error code TaskIdSameAsJobPreparationTask.|
|commandLine|String|The command line of the Job Preparation task.|
|[resourceFiles](../batchservice/list-the-job-schedules-in-an-account.md#resourceFiles)|Collection|A list of files that Batch will download to the compute node before running the command line.<br /><br /> If you are providing the executable for the task, at least one instance of this element is required to specify the source location and target location of the executable file.<br /><br /> If the task requires additional supporting files, add additional instances of this element to list these files.<br /><br /> Files that listed under this element are located in the task’s **wd** directory. For more information, see [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md).<br /><br /> If the command line is a default server program, and requires no additional supporting files, you do not need to include this element.|
|[environmentSettings](../batchservice/list-the-job-schedules-in-an-account.md#environmentSettings)|Collection|A list of environment variable settings for the Job Preparation task.|
|[constraints](../batchservice/list-the-job-schedules-in-an-account.md#constraints2)|Complex Type|Specifies constraints that apply to the Job Preparation task.|
|waitForSuccess|Boolean|Specifies whether the Batch Service should wait for the Job Preparation task to complete successfully \(that is, to exit with exit code 0\) before scheduling any other tasks of the job on the compute node.<br /><br /> The default is true.<br /><br /> If true and the Job Preparation task fails on a compute node, the Batch service retries the Job Preparation task up to its maximum retry count \(as specified in the constraints element\).  If the task has still not completed successfully after all retries, then the Batch service will not schedule tasks of the job to the compute node.  The compute node remains active and eligible to run tasks of other jobs.<br /><br /> If false, the Batch service will not wait for the Job Preparation task to complete. In this case, other tasks can start executing on the compute node while the Job Preparation task is still running; and even if the Job Preparation task fails, new tasks will continue to be scheduled on the node.|
|[userIdentity](#userIdentity)|Complex Type|The user identity under which the task runs. If absent, the task runs as a non-administrative user unique to the task.|
|rerunOnNodeRebootAfterSuccess|Boolean|Specifies whether the Batch service should rerun the Job Preparation task after a compute node reboots. The default value is true.<br /><br /> The Job Preparation task is always rerun if a compute node is reimaged, or if the Job Preparation task did not complete \(e.g. because the reboot occurred while the task was running\). Therefore, you should always write a Job Preparation task to be idempotent and to behave correctly if run multiple times.|

###  <a name="jobReleaseTask"></a> jobReleaseTask

|Element name|Type|Notes|
|------------------|----------|-----------|
|id|String|A string that uniquely identifies the Job Release task within the job. The id can contain any combination of alphanumeric characters including hyphens and underscores and cannot contain more than 64 characters.<br /><br /> If you do not specify this property, the Batch service assigns a default value of "jobrelease".<br /><br /> No other task in the job can have the same id as the Job Release task. If you try to submit a task with the same id, the Batch service rejects the request with HTTP status code 409 \(Conflict\) and error code TaskIdSameAsJobReleaseTask.|
|commandLine|String|The command line of the Job Release task.|
|[resourceFiles](../batchservice/list-the-job-schedules-in-an-account.md#resourceFiles)|Collection|A list of files that Batch will download to the compute node before running the command line.<br /><br /> If you are providing the executable for the task, at least one instance of this element is required to specify the source location and target location of the executable file.If the task requires additional supporting files, add additional instances of this element to list these files.<br /><br /> Files that listed under this element are located in the task’s **wd** directory. For more information, see [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md).<br /><br /> If the command line is a default server program, and requires no additional supporting files, you do not need to include this element.|
|[environmentSettings](../batchservice/list-the-job-schedules-in-an-account.md#environmentSettings)|Collection|A list of environment variable settings for the Job Release task.|
|maxWallClockTime|TimeInterval|The maximum elapsed time that the Job Release task may run on a given compute node, measured from the time the task starts. If the task does not complete within the time limit, the Batch service terminates it.<br /><br /> The default value is 15 minutes.<br /><br /> You may not specify a timeout longer than 15 minutes. If you do, the Batch service rejects it with HTTP status code 400 \(Bad Request\).|
|retentionTime|TimeInterval|Specifies the minimum time to retain the working directory for the Job Release task on the compute node.  After this time, the Batch service may delete the working directory and all its contents.<br /><br /> The default is infinite, i.e. the working directory will be retained until the compute node is removed or reimaged.|
|[userIdentity](#userIdentity)|Complex Type|The user identity under which the task runs. If absent, the task runs as a non-administrative user unique to the task.|


###  <a name="resourceFiles"></a> resourceFiles

|Element name|Type|Notes|
|------------------|--------------|----------|
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
|------------------|--------------|----------|
|name|String|The name of the environment variable.|
|value|String|The value of the environment variable.|

###  <a name="constraints2"></a> constraints

|Element name|Type|Notes|
|------------------|--------------|----------|
|maxWallClockTime|Time Interval|The maximum elapsed time that the task may run, measured from the time the task starts. If the task does not complete within the time limit, the Batch service terminates it.<br /><br /> If this is not specified, there is no time limit on how long the task may run.|
|maxTaskRetryCount|Int32|The maximum number of times the task may be retried. The Batch service retries a task if its exit code is nonzero.<br /><br /> Note that this value specifically controls the number of retries. The Batch service will try the task once, and may then retry up to this limit. For example, if the maximum retry count is 3, Batch tries the task up to 4 times \(one initial try and 3 retries\).<br /><br /> If the maximum retry count is 0, the Batch service does not retry the task.If the maximum retry count is \-1, the Batch service retries the task without limit.|
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
|------------------|--------------|----------|
|poolId|String|Specifies the id of an existing pool. All the tasks of the job will run on the specified pool. To find the ids of existing pools, see [List the pools in the account](../batchservice/list-the-pools-in-the-account.md).<br /><br /> You must specify either poolId or autoPoolSpecification, but not both.|
|[autoPoolSpecification](../batchservice/list-the-job-schedules-in-an-account.md#autoPoolSpecification)|Complex Type|Specifies characteristics for a temporary ‘auto pool.’ The Batch service will create this auto pool and run all the tasks of the job will run on it, and will delete the pool once the job has completed.<br /><br /> You must specify either poolId or autoPoolSpecification, but not both.|

###  <a name="autoPoolSpecification"></a> autoPoolSpecification

|Element name|Type|Notes|
|------------------|--------------|----------|
|autoPoolIdPrefix|String|The Batch service assigns each auto pool a unique identifier on creation. To distinguish between pools created for different purposes, you can specify this element to add a prefix to the id that is assigned. The prefix can be up to 20 characters long.|
|poolLifetimeOption|String|Specifies the minimum lifetime of created auto pools, and how multiple jobs on a schedule are assigned to pools.  Possible values are:<br /><br /> **job**: the pool exists for the lifetime of the job to which it is dedicated.  The Batch service creates the pool when it creates the job. If applied to a job schedule, the Batch service creates a new auto pool for every job created on the schedule.<br /><br /> **jobschedule** – the pool exists for the lifetime of the job schedule. The Batch Service creates the pool when it creates the first job on the schedule.  You may apply this option only to job schedules, not to jobs.|
|keepAlive|Boolean|Specifies whether to keep an auto pool alive after its lifetime expires.<br /><br /> If false, the Batch service deletes the pool once its lifetime \(as determined by the poolLifetimeOption setting\) expires; that is, when the job or job schedule completes.<br /><br /> If true, the Batch service does not delete the pool automatically. It is up to the user to delete auto pools created with this option.<br /><br /> The default value is false.|
|pool|Complex Type|Contains the pool specification for the auto pool.|

###  <a name="pool"></a> pool

|Element name|Type|Notes|
|------------------|--------------|----------|
|displayName|String|Display name for the auto pool. It need not be unique and can contain any Unicode characters up to a maximum length of 1024.|
|vmSize|String|The size of the virtual machines in the pool. All virtual machines in a pool are the same size. <br/><br/> For information about available sizes of virtual machines for Cloud Services pools (pools created with cloudServiceConfiguration), see [Sizes for Cloud Services](http://azure.microsoft.com/documentation/articles/cloud-services-sizes-specs/). Batch supports all Cloud Services VM sizes except `ExtraSmall`, `Standard_A1_v2`, and `Standard_A2_v2`.<br/><br/> For information about available VM sizes for pools using images from the Virtual Machines Marketplace (pools created with virtualMachineConfiguration) see [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-linux-sizes/) (Linux) or [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-windows-sizes/) (Windows). Batch supports all Azure VM sizes except `STANDARD_A0` and those with premium storage (`STANDARD_GS`, `STANDARD_DS`, and `STANDARD_DSV2` series).|
|[cloudServiceConfiguration](../batchservice/list-the-job-schedules-in-an-account.md#bk_csconf)|Complex Type|The cloud service configuration for the pool. This property must be specified if the pool needs to be created with Azure PaaS VMs.<br />Note that the cloudServiceConfiguration and virtualMachineConfiguration properties are mutually exclusive and only one of the properties can be specified. If neither is specified then the Batch service returns Bad Request \(400\).<br /><br />This property cannot be specified if the Batch account was created with its poolAllocationMode property set to 'UserSubscription'.|
|[virtualMachineConfiguration](../batchservice/list-the-job-schedules-in-an-account.md#bk_vmconf)|Complex Type|The virtual machine configuration for the pool. This property must be specified if the pool needs to be created with Azure IaaS VMs.<br />Note that the cloudServiceConfiguration and virtualMachineConfiguration properties are mutually exclusive and only one of the properties can be specified. If neither is specified then the Batch service returns Bad Request \(400\).|
|[networkConfiguration](../batchservice/list-the-job-schedules-in-an-account.md#bk_netconf)|Complex Type|The network configuration for the pool.|
|resizeTimeout|Time|Specifies the timeout for allocation of compute nodes to the pool.<br /><br /> This timeout applies only to manual scaling; it has no effect when enableAutoScale is set to true.<br /><br /> The default value is 15 minutes.<br /><br /> The minimum value is 5 minutes. If you specify a value less than 5 minutes, the Batch service returns a Bad Request \(400\).|
|targetDedicatedNodes|Int32|The number of compute nodes that are requested for the pool.|
|targetLowPriorityNodes|Int32|The number of low-priority compute nodes in the pool.|
|maxTasksPerNode|Int32|The maximum number of tasks that can run concurrently on a single compute node in the pool.<br /><br /> The default value is 1.<br /><br /> The maximum value of this setting depends on the size of the compute nodes in the pool \(the vmSize setting\).|
|taskSchedulingPolicy|Complex Type|Defines how the Batch service distributes tasks between compute nodes in the pool.|
|autoScaleFormula|String|Specifies a formula for the desired number of compute nodes in the pool.<br /><br /> This property must not be specified if enableAutoScale is set to false. It is required if enableAutoScale is set to true.<br /><br /> The formula is checked for validity before the pool is created. If the formula is not valid, the Batch service rejects the request with detailed error information.|
|autoScaleEvaluationInterval|Time|Specifies a time interval at which to automatically adjust the pool size according to the AutoScale formula.<br /><br /> The default value is 15 minutes.<br /><br /> The minimum and maximum value are 5 minutes and 168 hours respectively. If you specify a value less than 5 minutes or greater than 168 hours, the Batch service returns a Bad Request \(400\).|
|enableAutoScale|Boolean|Specifies whether the pool size should automatically adjust over time.<br /><br /> If false, the targetDedicatedNodes element is required.<br /><br /> If true, the autoScaleFormula element is required. The pool automatically resizes according to the formula.<br /><br /> The default value is false.|
|enableInterNodeCommunication|Boolean|Specifies whether the pool permits direct communication between nodes<br /><br /> The default value is false.|
|startTask|Complex Type|Specifies a task to run on each compute node as it joins the pool. The task runs when the node is added to the pool or when the node is restarted.|
|certificateReferences|Collection|A list of certificates to be installed on each compute node in the pool.<br /><br /> Each certificate in the list must have been previously added to the Batch account.|
|applicationPackageReferences|Collection|A list of application packages to be installed on each compute node in the pool.|
|applicationLicenses|Collection| The list of application licenses the Batch service will make available on each compute node in the pool.<br /><br /> The list of application licenses must be a subset of available Batch service application licenses. If a license is requested which is not supported, pool creation will fail.|
|metadata|Collection|A list of name\-value pairs associated with the pool as metadata.<br /><br /> The Batch service does not assign any meaning to metadata; it is solely for the use of user code.|

###  <a name="bk_csconf"></a> cloudServiceConfiguration

|Element name|Type|Notes|
|------------------|--------------|----------|
|osFamily|String|The Azure Guest OS family to be installed on the virtual machines in the pool.<br /><br /> Possible values are:<br /><br /> **2** – OS Family 2, equivalent to Windows Server 2008 R2 SP1.<br /><br /> **3** – OS Family 3, equivalent to Windows Server 2012.<br /><br /> **4** – OS Family 4, equivalent to Windows Server 2012 R2.<br /><br /> **5** – OS Family 5, equivalent to Windows Server 2016.<br /><br /> For more information, see [Azure Guest OS Releases](https://azure.microsoft.com/documentation/articles/cloud-services-guestos-update-matrix/#releases).|
|targetOSVersion|String|The Azure Guest OS version to be installed on the virtual machines in the pool.<br /><br /> The default value is * which specifies the latest operating system version for the specified family.<br /><br /> For other permitted values, see [Azure Guest OS Releases](https://azure.microsoft.com/documentation/articles/cloud-services-guestos-update-matrix/#releases).|

###  <a name="bk_vmconf"></a> virtualMachineConfiguration

|Element name|Type|Notes|
|------------------|--------------|----------|
|[imageReference](../batchservice/list-the-job-schedules-in-an-account.md#bk_imgref)|Complex Type|Specifies information about the platform or Marketplace image to use.|
|nodeAgentSKUId|String|The SKU of the Batch node agent that needs to be provisioned on the compute node. An appropriate node agent SKU which matches the selected image reference must be provided.<br /><br /> To get the list of supported node agent SKUs along with their list of verified image references, see [List supported node agent SKUs](../batchservice/list-supported-node-agent-skus.md).|
|[windowsConfiguration](../batchservice/list-the-job-schedules-in-an-account.md#bk_winconf)|Complex Type|Specifies Windows operating system settings on the virtual machine. This property must not be specified if the imageReference is referencing a Linux OS image.|

###  <a name="bk_imgref"></a> imageReference

|Element name|Type|Notes|
|------------------|--------------|----------|
|publisher|String|The publisher of the image.<br /><br /> To get the list of all imageReferences verified by Azure Batch, see [List supported node agent SKUs](../batchservice/list-supported-node-agent-skus.md).|
|offer|String|The offer of the image.|
|sku|String|The SKU of the image.|
|version|String|The version of the image. A value of ‘latest’ can be specified to select the latest version of an image. The default value is 'latest'.|

###  <a name="bk_winconf"></a> windowsConfiguration

|Element name|Type|Notes|
|------------------|--------------|----------|
|enableAutomaticUpdates|Boolean|Indicates whether the virtual machine is enabled for automatic updates. If this property is not specified, the default value is true.|

###  <a name="bk_netconf"></a> networkConfiguration

|Element name|Type|Notes|
|------------------|--------------|----------|
|subnetId|String|Specifies the resource identifier of the subnet in which the pool's compute nodes are created.|

###  <a name="executionInfo"></a> executionInfo

|Element name|Type|Notes|
|------------------|----------|-----------|
|nextRunTime|DateTime|The next time at which a job will be created under this schedule.<br /><br /> This property is meaningful only if the schedule is in the **active** state when the time comes around. For example, if the schedule is disabled, no job will be created at nextRunTime unless the job is enabled before then.|
|recentJob|Complex Type|Information about the most recent job to run under the job schedule.<br /><br /> This property is present only if the at least one job has run under the schedule.<br /><br /> This element contains the following sub\-elements:<br /><br /> **id** – The id of the job.<br /><br /> **url** – The URL of the job.<br /><br /> You can use this information to retrieve further details via the job APIs.|
|endTime|DateTime|The time at which the schedule ended.  This property is present only if the job schedule is in the **completed** state.|

###  <a name="stats"></a> stats

|Element name|Type|Notes|
|------------------|----------|-----------|
|url|String|The URL for the job schedule statistics resource.|
|startTime|DateTime|The start time of the time range covered by the statistics.|
|lastUpdateTime|DateTime|The time at which the statistics were last updated. All statistics are limited to the range between startTime and lastUpdateTime.|
|userCPUTime|Time|The total user mode CPU time \(summed across all cores and all compute nodes\) consumed by all the tasks in all the jobs created under the schedule.|
|kernelCPUTime|Time|The total kernel mode CPU time \(summed across all cores and all compute nodes\) consumed by all the tasks in all the jobs created under the schedule.|
|wallClockTime|Time|The total wall clock time of all the tasks in all the jobs created under the schedule. The wall clock time is the elapsed time from when the task started running on a compute node to when it finished \(or to the last time the statistics were updated, if the task had not finished by then\).<br /><br /> If a task was retried, this includes the wall clock time of all the task retries.|
|readIOps|Int64|The total number of disk read operations made by all tasks in all jobs created under the schedule.|
|writeIOps|Int64|The total number of disk write operations made by all tasks in all jobs created under the schedule.|
|readIOGiB|Int64|The total gibibytes read from disk by all tasks in all jobs created under the schedule.|
|writeIOGiB|Int64|The total gibibytes written to disk by all tasks in all jobs created under the schedule.|
|numSucceededTasks|Int64|The total number of tasks successfully completed during the given time range in jobs created under the schedule.  A task completes successfully if it returns exit code 0.|
|numFailedTasks|Int64|The total number of tasks that failed during the given time range in jobs created under the schedule. A task fails if it exhausts its maximum retry count without returning exit code 0.|
|numTaskRetries|Int64|The total number of retries during the given time range on all the tasks in jobs created under the schedule.|
|waitTime|Time|The total wait time of all the tasks in jobs created under the schedule.  The wait time for a task is defined as the elapsed time between the creation of the task creation and the start of task execution.  \(If the task is retried due to failures, the wait time is the time to the most recent task execution.\)  This value is only reported in the account lifetime statistics; it is not included in the job statistics.|

