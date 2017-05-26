---
title: "Add a job to an account | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: bb17fdaf-a791-4251-baaf-ae23832d59cd
caps.latest.revision: 20
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Add a job to an account
  Adds a job to the specified account.

> [!IMPORTANT]
>  When naming jobs, avoid including sensitive information such as user names or secret project names. This information may appear in telemetry logs accessible to Microsoft Support engineers.

> [!NOTE]
>  The Batch service supports two ways to control the work done as part of a job.  These in turn determine the lifecycle of the job.
>
>  In the first approach, the user specifies a Job Manager task.  The Batch service launches this task when it is ready to start the job. The Job Manager task controls all other tasks that run under this job, by using the Task API.  As part of the Job Manager specification, the user can specify whether the system should terminate the job when the Job Manager task completes.  If the user specifies that the job should not terminate when the Job Manager task completes, then the job completes only when explicitly terminated by the user unless configured to automatically complete.
>
>  In the second approach, the user directly controls the execution of tasks under an active job, by using the Task API. In this case, the job will stay active until explicitly terminated by the user unless configured to automatically complete.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to jobs.

|Method|Request URI|
|------------|-----------------|
|POST|`https://{account-name}.{region-id}.batch.azure.com/jobs?api-version={api-version}`|

```
{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#jobs/@Element",
  "id":"myjob1",
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
    "environmentSettings": [ {
      "name":"myvariable",
      "value":"myvalue"
    } ],
    "constraints": {
      "maxWallClockTime":"PT1H",
      "maxTaskRetryCount":0,
      "retentionTime":"PT1H"
    },
    "killJobOnCompletion":false,
    "userIdentity": {
      "autoUser": {
        "scope":"task",
        "elevationLevel":"nonAdmin"
      }
    },
    "runExclusive":true
  },
  "poolInfo": {
    "autoPoolSpecification": {
      "autoPoolIdPrefix":"mypool",
      "poolLifetimeOption":"job",
      "pool": {
        "vmSize":"small",
        "cloudServiceConfiguration": {
          "osFamily":"4",
          "targetOSVersion":"*"
        },
        "resizeTimeout":"PT15M",
        "targetDedicatedNodes":3,
        "maxTasksPerNode":2,
        "taskSchedulingPolicy": {
          "nodeFillType":"Spread"
        },
        "enableAutoScale":false,
        "enableCommunication":true,
        "startTask": {
          "commandLine":"myprogram2.exe",
          "resourceFiles": [ {
            "blobSource":"http://mystorage1.blob.core.windows.net/scripts/myprogram2.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
            "filePath":"myprogram2.exe"
          } ],
          "environmentSettings": [ {
            "name":"myvariable",
            "value":"myvalue"
          } ],
          "userIdentity": {
            "autoUser": {
              "scope":"task",
              "elevationLevel":"admin"
            }
          },
          "maxTaskRetryCount":2,
          "waitForSuccess":true
        },
        "certificateReferences": [ {
          "thumbprint":"#############################################",
          "thumbprintAlgorithm":"sha1",
          "storeLocation":"LocalMachine",
          "storeName":"Root",
          "visibility":["task"]
        } ],
        "metadata": [ {
          "name":"myproperty",
          "value":"myvalue"
        } ]
      }
    }
  },
  "metadata": [ {
    "name":"myproperty",
    "value":"myvalue"
  } ]
}

```

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|id|Yes|String|A string that uniquely identifies the job within the account. The id can contain any combination of alphanumeric characters including hyphens and underscores, and cannot contain more than 64 characters. It is common to use a GUID for the id. The id is case\-preserving and case\-insensitive \(that is, you may not have two ids within an account that differ only by case\).|
|displayName|No|String|A display name for the job. It need not be unique and can contain any Unicode characters up to a maximum length of 1024.|
|priority|No|Int32|The priority of the job. Priority values can range from \-1000 to 1000, with \-1000 being the lowest priority and 1000 being the highest priority.<br /><br /> The default value is 0.|
|[constraints](../batchservice/add-a-job-to-an-account.md#constraints2)|No|Complex Type|Specifies the execution constraints for the job.|
|[jobManagerTask](../batchservice/add-a-job-to-an-account.md#jobManagerTask)|No|Complex Type|Specifies details of a Job Manager task to be launched when the job is started.<br /><br /> If the job does not specify a Job Manager task, the user must explicitly add tasks to the job.<br /><br /> If the job does specify a Job Manager task, the Batch service creates the Job Manager task when the job is created, and will try to schedule the Job Manager task before scheduling other tasks in the job.<br /><br /> Its typical purpose is to control and/or monitor job execution, for example by deciding what additional tasks to run, determining when the work is complete, etc.  \(However, a Job Manager task is not restricted to these activities – it is a fullyfledged task in the system and perform whatever actions are required for the job.\)  For example, a Job Manager task might download a file specified as a parameter, analyze the contents of that file and submit additional tasks based on those contents.|
|[jobPreparationTask](../batchservice/add-a-job-to-an-account.md#jobPreparationTask)|No|Complex Type|Specifies the Job Preparation task.<br /><br /> If a job has a Job Preparation task, the Batch service will run the Job Preparation task on a compute node before starting any tasks of that job on that compute node.|
|[jobReleaseTask](../batchservice/add-a-job-to-an-account.md#jobReleaseTask)|No|Complex Type|Specifies the Job Release task.<br /><br /> A Job Release task cannot be specified without also specifying a Job Preparation task for the job.<br /><br /> The Batch service runs the Job Release task on the compute nodes that have run the Job Preparation task.<br /><br /> The primary purpose of the Job Release task is to undo changes to compute nodes made by the Job Preparation task.  Example activities include deleting local files, or shutting down services that were started as part of job preparation.|
|commonEnvironmentSettings|No|Collection|A list of common environment variable settings.  These environment variables are set for all tasks in the job \(including the Job Manager, Job Preparation and Job Release tasks\). Individual tasks can override an environment setting specified here by specifying the same setting name with a different value.|
|[poolInfo](../batchservice/add-a-job-to-an-account.md#poolInfo)|Yes|Complex Type|Specifies the pool on which the Batch service runs the job’s tasks.|
|usesTaskDependencies|No|Boolean|Specifies whether tasks in the job can define dependencies on each other. The default is false.|
|onAllTasksComplete|No|String|Specifies an action the Batch service should take when all tasks in the job are in the completed state.<br /><br /> Note that if a job contains no tasks, then all tasks are considered complete. This option is therefore most commonly used with a job manager task; if you want to use automatic job termination without a job manager, you should initially set onAllTasksComplete to **noaction** and update the job properties to set onAllTasksComplete to **terminatejob** once you have finished adding tasks.<br /><br /> Permitted values are:<br /><br /> **noaction** – do nothing. The job remains active unless terminated or disabled by some other means.<br /><br /> **terminatejob** – terminate the job. The job’s terminateReason is set to "AllTasksComplete".<br /><br /> The default is **noaction**.|
|onTaskFailure|No|String|Specifies an action the Batch service should take when any task in the job fails. A task is considered to have failed if it completes with a nonzero exit code and has exhausted its retry count, or if it had a scheduling error. Permitted values are:<br /><br /> **noaction** – do nothing.<br /><br /> **performexitoptionsjobaction** – take the action associated with the task exit condition in the task's exitConditions collection. (This may still result in no action being taken, if that is what the task specifies.)<br /><br />The default is **noaction**.|
|[metadata](#bk_meta)|No|Collection|A list of name\-value pairs associated with the job as metadata.<br /><br /> The Batch service does not assign any meaning to metadata; it is solely for the use of user code.|

###  <a name="constraints2"></a> constraints

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|maxWallClockTime|No|Time Interval|The maximum elapsed time that the job may run, measured from the time the job is created. If the job does not complete within the time limit, the Batch service terminates it \(and any tasks that are still running\).  In this case, the termination reason will be *maxWallClockTimeExpiry*.<br /><br /> If this is not specified, there is no time limit on how long the job may run.|
|maxTaskRetryCount|No|Int32|The maximum number of times each task may be retried. The Batch service retries a task if its exit code is nonzero.<br /><br /> Note that this value specifically controls the number of *retries*. The Batch service will *try* each task once, and may then *retry* up to this limit. For example, if the maximum retry count is 3, Batch tries a task up to 4 times \(one initial try and 3 retries\).<br /><br /> If the maximum retry count is 0, the Batch service does not retry tasks.If the maximum retry count is \-1, the Batch service retries tasks without limit.The default value is 0 \(no retries\).|

###  <a name="jobManagerTask"></a> jobManagerTask
 A Job Manager task is special in the following ways:

-   The Batch service automatically creates it when the job is created.

-   The Batch service always tries to schedule the job manager task before other tasks in the job.

-   When shrinking a pool, the Batch service tries to preserve compute nodes where Job Manager tasks are running for as long as possible.  That is, nodes running ‘normal’ tasks are removed before nodes running Job Manager tasks.

-   When a Job Manager task fails and needs to be restarted, the system tries to schedule this Job Manager task at the highest priority.  If there is no idle compute node available, the system may terminate one of the running tasks in the pool and return it to the queue in order to make room for the Job Manager task to restart.

    -   A Job Manager task in one job does not have priority over tasks in other jobs. Across jobs, only job level priorities are observed.  For example, if a Job Manager in a priority 0 job needs to be restarted, it will not displace tasks of a priority 1 job.

-   Users can specify if they want to terminate the job when the Job Manager task terminates \(either by completing successfully, or by running out of retries\).  In this case, if other tasks are running when the Job Manager terminates, those tasks are terminated too.

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|id|Yes|String|A string that uniquely identifies the Job Manager task within the job. The id can contain any combination of alphanumeric characters including hyphens and underscores and cannot contain more than 64 characters.|
|displayName|No|String|A display name for the Job Manager task. It need not be unique and can contain any Unicode characters up to a maximum length of 1024.|
|commandLine|Yes|String|The command line of the Job Manager task.|
|[resourceFiles](../batchservice/add-a-job-to-an-account.md#resourceFiles)|No|Collection|A list of files that Batch will download to the compute node before running the command line.<br /><br /> Files listed under this element are located in the task’s **wd** directory. For more information, see [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md).|
|[outputFiles](#outputFile)|No|Collection|A list of files that the Batch service will upload from the compute node after running the command line. For multi-instance tasks, the files will only be uploaded from the compute node on which the primary task is executed.|
|[applicationPackageReferences](../batchservice/add-a-job-to-an-account.md#applicationPackageReferences)|No|Collection|A list of application packages that the Batch service will deploy to the compute node before running the command line.<br /><br /> Application packages are downloaded and deployed to a shared directory, not the task directory. Therefore, if a referenced package is already on the compute node, and is up to date, then it is not re-downloaded; the existing copy on the compute node is used.<br /><br /> If a referenced application package cannot be installed, for example because the package has been deleted or because download failed, the task fails to start due to an error.<br /><br /> This property is currently not supported on jobs running on pools created using the virtualMachineConfiguration (IaaS) property. If a task specifying the applicationPackageReferences property runs on a pool created with the Virtual Machine Configuration, the task fails with a scheduling error with error code TaskSchedulingConstraintFailed.|
|[environmentSettings](../batchservice/add-a-job-to-an-account.md#environmentSettings)|No|Collection|A list of environment variable settings for the Job Manager task.|
|[constraints](../batchservice/add-a-job-to-an-account.md#constraints1)|No|Complex Type|Specifies constraints that apply to the Job Manager task.|
|killJobOnCompletion|No|Boolean|Specifies whether completion of the Job Manager task signifies completion of the entire job.<br /><br /> If true, when the Job Manager task completes, the Batch service marks the job as complete.  If any tasks are still running at this time \(other than Job Release\), those tasks are terminated.<br /><br /> If false, the completion of the Job Manager task does not affect the job status. In this case, you should either use the onAllTasksComplete attribute to terminate the job, or have a client or user terminate the job explicitly. An example of this is if the Job Manager creates a set of tasks but then takes no further role in their execution.<br /><br /> The default value is true. If you are using the onAllTasksComplete and onTaskFailure attributes to control job lifetime, and using the job manager task only to create the tasks for the job (not to monitor progress), then it is important to set killJobOnCompletion to false.|
|[userIdentity](#userIdentity)|No|Complex Type|The user identity under which the task runs. If omitted, the task runs as a non-administrative user unique to the task.|
|runExclusive|No|Boolean|Specifies whether the Job Manager task requires exclusive use of the compute node where it runs.<br /><br /> If true, no other tasks will run on the same compute node for as long as the Job Manager is running.<br /><br /> If false, other tasks can run simultaneously with the Job Manager on a compute node. \(The Job Manager task counts normally against the node’s concurrent task limit, so this is only relevant if the node allows multiple concurrent tasks.\)<br /><br /> The default value is true.|
|allowLowPriorityNode|No|Boolean|Specifies whether the Job Manager task may run on a low-priority compute node. The default value is false.|

###  <a name="jobPreparationTask"></a> jobPreparationTask
 A Job Preparation task is special in the following ways:

-   The Job Preparation runs on each compute node on which any other tasks of the job run, before those other tasks do so. This means you can use Job Preparation to prepare a compute node to run tasks for the job. Activities commonly performed in Job Preparation include:

    -   Downloading common resource files used by all the tasks in the job. The Job Preparation task can download these common resource files to the shared location on the compute node. \(AZ\_BATCH\_NODE\_ROOT\_DIR\\shared\).

    -   Starting a local service on the compute node so that all tasks of that job can communicate with it.

-   If a job has a Job Preparation task, the Batch service runs the Job Preparation task on a compute node before scheduling any task of that job on the compute node.

    -   Note, however, that if the Job Preparation task’s *waitForSuccess* setting is false, the Batch service may launch tasks of the job before preparation is complete, and will continue to schedule tasks on the node even if the Job Preparation task fails.

    -   If the Job Preparation task fails \(that is, exhausts its retry count before exiting with exit code 0\), Batch will not run tasks of this job on the compute node.  The node remains ineligible to run tasks of this job until it is reimaged.  The node remains active and can be used for other jobs.

-   The Job Preparation task can run multiple times on the same compute node. Therefore, you should write the Job Preparation task to handle re\-execution. Batch runs a Job Preparation task on a compute node in the following cases:

    -   The Job Preparation task is run before the first time Batch schedules any other task of the job to run on the compute node.

    -   If the compute node is rebooted, the Job Preparation task is run again on the node before scheduling any other task of the job, if rerunOnNodeRebootAfterSuccess is true or if the Job Preparation task did not previously complete.

    -   If the compute node is reimaged, the Job Preparation task is run again before scheduling any task of the job.

-   When a Job Preparation task starts, the Batch service downloads all the resource files of the Job Preparation task to the task’s working directory. The retention time for the Job Preparation task’s directory is measured from the end of the job. \(You can specify the retention time as part of the task constraints.\) After the retention time expires, the Batch service deletes this directory and all its contents.

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|id|No|String|A string that uniquely identifies the job preparation task within the job. The id can contain any combination of alphanumeric characters including hyphens and underscores and cannot contain more than 64 characters.<br /><br /> If you do not specify this property, the Batch service assigns a default value of "jobpreparation".<br /><br /> No other task in the job can have the same id as the Job Preparation task. If you try to submit a task with the same id, the Batch service rejects the request with HTTP status code 409 \(Conflict\) and error code TaskIdSameAsJobPreparationTask.|
|commandLine|Yes|String|The command line of the Job Preparation task.|
|[resourceFiles](../batchservice/add-a-job-to-an-account.md#resourceFiles)|No|Collection|A list of files that Batch will download to the compute node before running the command line.<br /><br /> If you are providing the executable for the task, at least one instance of this element is required to specify the source location and target location of the executable file.<br /><br /> If the task requires additional supporting files, add additional instances of this element to list these files.<br /><br /> Files that listed under this element are located in the task’s **wd** directory. For more information, see [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md).<br /><br /> If the command line is a default server program, and requires no additional supporting files, you do not need to include this element.|
|[environmentSettings](../batchservice/add-a-job-to-an-account.md#environmentSettings)|No|Collection|A list of environment variable settings for the Job Preparation task.|
|[constraints](../batchservice/add-a-job-to-an-account.md#constraints1)|No|Complex Type|Specifies constraints that apply to the Job Preparation task.|
|waitForSuccess|No|Boolean|Specifies whether the Batch Service should wait for the Job Preparation task to complete successfully \(that is, to exit with exit code 0\) before scheduling any other tasks of the job on the compute node.<br /><br /> The default is true.<br /><br /> If true and the Job Preparation task fails on a compute node, the Batch service retries the Job Preparation task up to its maximum retry count \(as specified in the constraints element\).  If the task has still not completed successfully after all retries, then the Batch service will not schedule tasks of the job to the compute node.  The compute node remains active and eligible to run tasks of other jobs.<br /><br /> If false, the Batch service will not wait for the Job Preparation task to complete. In this case, other tasks can start executing on the compute node while the Job Preparation task is still running; and even if the Job Preparation task fails, new tasks will continue to be scheduled on the node.|
|[userIdentity](#userIdentity)|No|Complex Type|The user identity under which the task runs. If omitted, the task runs as a non-administrative user unique to the task.|
|rerunOnNodeRebootAfterSuccess|No|Boolean|Specifies whether the Batch service should rerun the Job Preparation task after a compute node reboots. The default value is true.<br /><br /> The Job Preparation task is always rerun if a compute node is reimaged, or if the Job Preparation task did not complete \(e.g. because the reboot occurred while the task was running\). Therefore, you should always write a Job Preparation task to be idempotent and to behave correctly if run multiple times.|

###  <a name="jobReleaseTask"></a> jobReleaseTask
 A Job Release task is special in the following ways:

-   A Job Release task cannot be specified without also specifying a Job Preparation task for the job.

-   The Job Release task runs when the job ends, because of one of the following:

    -   The user calls the Terminate Job API, or the Delete Job API while the job is still active.

    -   The job's maximum wall clock time constraint is reached, and the job is still active.

    -   The job's Job Manager task completed, and the job is configured to terminate when the Job Manager completes.

-   The Job Release task runs on *each* compute node where tasks of the job have run.

    -   The Job Release task runs *only* on those nodes where the Job Preparation task ran and completed.

    -   If you reimage a compute node after it has run the Job Preparation task, and the job ends without any further tasks of the job running on that compute node \(and hence the Job Preparation task does not re\-run\), then the Job Release task does *not* run on that node.

-   If a compute node reboots while the Job Release task is still running, the Job Release task runs again when the compute node starts up.

-   The job is not marked as complete until all Job Release tasks have completed.

    -   If a Job Release task fails \(exits with a nonzero exit code\), this does not prevent the job from completing.

    -   Job Release tasks are not retried if they fail.

-   The Job Release task runs in the background.  It does not occupy a scheduling slot; that is, it does not count towards the maxTasksPerNode limit specified on the pool.

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|id|No|String|A string that uniquely identifies the Job Release task within the job. The id can contain any combination of alphanumeric characters including hyphens and underscores and cannot contain more than 64 characters.<br /><br /> If you do not specify this property, the Batch service assigns a default value of "jobrelease".<br /><br /> No other task in the job can have the same id as the Job Release task. If you try to submit a task with the same id, the Batch service rejects the request with HTTP status code 409 \(Conflict\) and error code TaskIdSameAsJobReleaseTask.|
|commandLine|Yes|String|The command line of the Job Release task.|
|[resourceFiles](../batchservice/add-a-job-to-an-account.md#resourceFiles)|No|Collection|A list of files that Batch will download to the compute node before running the command line.<br /><br /> If you are providing the executable for the task, at least one instance of this element is required to specify the source location and target location of the executable file.<br /><br /> If the task requires additional supporting files, add additional instances of this element to list these files.<br /><br /> Files that listed under this element are located in the task’s **wd** directory. For more information, see [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md).<br /><br /> If the command line is a default server program, and requires no additional supporting files, you do not need to include this element.|
|[environmentSettings](../batchservice/add-a-job-to-an-account.md#environmentSettings)|No|Collection|A list of environment variable settings for the Job Release task.|
|maxWallClockTime|No|TimeInterval|The maximum elapsed time that the Job Release task may run on a given compute node, measured from the time the task starts. If the task does not complete within the time limit, the Batch service terminates it.<br /><br /> The default value is 15 minutes.<br /><br /> You may not specify a timeout longer than 15 minutes. If you do, the Batch service rejects it with HTTP status code 400 \(Bad Request\).|
|retentionTime|No|TimeInterval|Specifies the minimum time to retain the working directory for the Job Release task on the compute node.  After this time, the Batch service may delete the working directory and all its contents.<br /><br /> The default is infinite, i.e. the working directory will be retained until the compute node is removed or reimaged.|
|[userIdentity](#userIdentity)|No|Complex Type|The user identity under which the task runs. If omitted, the task runs as a non-administrative user unique to the task.|

###  <a name="resourceFiles"></a> resourceFiles

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|blobSource|Yes|String|The URL of a blob in Azure storage. The Batch service downloads the blob to the specified file path.<br /><br /> The URL must be readable using anonymous access; that is, the Batch service does not present any credentials when downloading the blob.  There are two ways to get such a URL for a blob in Azure storage: use a Shared Access Signature \(SAS\) granting read permissions on the blob, or set the ACL for the blob’s container to allow public access.|
|filePath|Yes|String|The location on the compute node to which the file should be downloaded.|
|fileMode|No|String|The file permission mode attribute in octal format. This property is applicable only if the resourceFile is downloaded to a Linux node. This property will be ignored if it is specified for a resourceFile which is downloaded to a Windows node.<br /><br /> If this property is not specified for a Linux node, then a default value of 0770 is applied to the file.|

###  <a name="outputFile"></a> outputFile

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
|path|No|String|The destination blob or virtual directory within the Azure Storage container. If filePattern refers to a specific file (i.e. contains no wildcards), then path is the name of the blob to which to upload that file. If filePattern contains one or more wildcards (and therefore may match multiple files), then path is the name of the blob virtual directory (which is prepended to each blob name) to which to upload the file(s). If omitted, file(s) are uploaded to the root of the container with a blob name matching their file name.|
|containerUrl|Yes|String|The URL of the container within Azure Blob Storage to which to upload the file(s). The URL must include a Shared Access Signature (SAS) granting write permissions to the container.|

###  <a name="outputFileUploadOptions"></a> outputFileUploadOptions

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|uploadCondition|Yes|String|The conditions under which the task output file or set of files should be uploaded. Possible values include:<br /><br /> - **taskSuccess**: Upload the file(s) only after the task process exits with an exit code of 0.<br /><br /> - **taskFailure**: Upload the file(s) only after the task process exits with a nonzero exit code.<br /><br /> **taskCompletion**: Upload the file(s) after the task process exits, no matter what the exit code was.<br /><br /> 
The default is taskCompletion.|


### <a name="applicationPackageReferences"></a> applicationPackageReferences

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|applicationId|Required|String|The id of the application to install.|
|version|Optional|String|The version of the application to install.<br /><br />If omitted, the default version is installed. If no default version is specified for this application, the task on which the package is specified will fail when scheduled, with a scheduling error.|

###  <a name="environmentSettings"></a> environmentSettings

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|name|Yes|String|The name of the environment variable.|
|value|No|String|The value of the environment variable.|

###  <a name="constraints1"></a> constraints

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|maxWallClockTime|No|Time Interval|The maximum elapsed time that the task may run, measured from the time the task starts. If the task does not complete within the time limit, the Batch service terminates it.<br /><br /> If this is not specified, there is no time limit on how long the task may run.|
|maxTaskRetryCount|No|Int32|The maximum number of times the task may be retried. The Batch service retries a task if its exit code is nonzero.<br /><br /> Note that this value specifically controls the number of retries. The Batch service will try the task once, and may then retry up to this limit. For example, if the maximum retry count is 3, Batch tries the task up to 4 times \(one initial try and 3 retries\).<br /><br /> If the maximum retry count is 0, the Batch service does not retry the task.<br /><br /> If the maximum retry count is \-1, the Batch service retries the task without limit.|
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

###  <a name="poolInfo"></a> poolInfo

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|poolId|No|String|Specifies the id of an existing pool. All the tasks of the job will run on the specified pool. To find the ids of existing pools, see [List the pools in the account](../batchservice/list-the-pools-in-the-account.md).<br /><br /> You must specify *either* poolId or autoPoolSpecification, but not both.|
|[autoPoolSpecification](../batchservice/add-a-job-to-an-account.md#autoPoolSpecification)|No|Complex Type|Specifies characteristics for a temporary ‘auto pool.’ The Batch service will create this auto pool and run all the tasks of the job will run on it, and will delete the pool once the job has completed.<br /><br /> You must specify *either* poolId or autoPoolSpecification, but not both.|

###  <a name="autoPoolSpecification"></a> autoPoolSpecification

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|autoPoolIdPrefix|No|String|The Batch service assigns each auto pool a unique identifier on creation. To distinguish between pools created for different purposes, you can specify this element to add a prefix to the id that is assigned. The prefix can be up to 20 characters long.|
|poolLifetimeOption|Yes|String|Specifies the minimum lifetime of created auto pools, and how multiple jobs on a schedule are assigned to pools.  Possible values are:<br /><br /> **job**: the pool exists for the lifetime of the job to which it is dedicated.  The Batch service creates the pool when it creates the job. If applied to a job schedule, the Batch service creates a new auto pool for every job created on the schedule.<br /><br /> **jobschedule** – the pool exists for the lifetime of the job schedule. The Batch Service creates the pool when it creates the first job on the schedule.  You may apply this option only to job schedules, not to jobs.|
|keepAlive|No|Boolean|Specifies whether to keep an auto pool alive after its lifetime expires.<br /><br /> If false, the Batch service deletes the pool once its lifetime \(as determined by the poolLifetimeOption setting\) expires; that is, when the job or job schedule completes.<br /><br /> If true, the Batch service does not delete the pool automatically. It is up to the user to delete auto pools created with this option.|
|pool|Yes|Complex Type|Contains the pool specification for the auto pool.|

### pool

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|displayName|No|String|Display name for the auto pool. It need not be unique and can contain any Unicode characters up to a maximum length of 1024.|
|vmSize|Yes|String|The size of the virtual machines in the pool. All virtual machines in a pool are the same size. <br/><br/> For information about available sizes of virtual machines for Cloud Services pools (pools created with cloudServiceConfiguration), see [Sizes for Cloud Services](http://azure.microsoft.com/documentation/articles/cloud-services-sizes-specs/). Batch supports all Cloud Services VM sizes except `ExtraSmall`, `Standard_A1_v2`, and `Standard_A2_v2`.<br/><br/> For information about available VM sizes for pools using images from the Virtual Machines Marketplace (pools created with virtualMachineConfiguration) see [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-linux-sizes/) (Linux) or [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-windows-sizes/) (Windows). Batch supports all Azure VM sizes except `STANDARD_A0` and those with premium storage (`STANDARD_GS`, `STANDARD_DS`, and `STANDARD_DSV2` series).|
|[cloudServiceConfiguration](../batchservice/add-a-job-to-an-account.md#bk_csconf)|No|Complex Type|The cloud service configuration for the pool. This property must be specified if the pool needs to be created with Azure PaaS VMs.<br />Note that the cloudServiceConfiguration and virtualMachineConfiguration properties are mutually exclusive and only one of the properties can be specified. If neither is specified then the Batch service returns Bad Request \(400\).<br /><br />This property cannot be specified if the Batch account was created with its **poolAllocationMode** property set to 'UserSubscription'.|
|[virtualMachineConfiguration](../batchservice/add-a-job-to-an-account.md#bk_vmconf)|No|Complex Type|The virtual machine configuration for the pool. This property must be specified if the pool needs to be created with Azure IaaS VMs.<br />Note that the cloudServiceConfiguration and virtualMachineConfiguration properties are mutually exclusive and only one of the properties can be specified. If neither is specified then the Batch service returns Bad Request \(400\).|
|[networkConfiguration](../batchservice/add-a-job-to-an-account.md#bk_netconf)|Optional|Complex Type|The network configuration for the pool.|
|resizeTimeout|No|Time|Specifies the timeout for allocation of compute nodes to the pool.<br /><br /> This timeout applies only to manual scaling; it has no effect when enableAutoScale is set to true.<br /><br /> The default value is 15 minutes.<br /><br /> The minimum value is 5 minutes. If you specify a value less than 5 minutes, the Batch service returns a Bad Request \(400\).|
|targetDedicatedNodes|No|Int32|Specifies the desired number of dedicated compute nodes in the pool.<br /><br /> This property must not be specified if enableAutoScale is set to true.  If enableAutoScale is set to false, then you must set either targetDedicatedNodes, targetLowPriorityNodes, or both.|
|targetLowPriorityNodes|Optional|Int32|Specifies the desired number of low-priority compute nodes in the pool.<br /><br /> This property must not be specified if enableAutoScale is set to true.  If enableAutoScale is set to false, then you must set either targetDedicatedNodes, targetLowPriorityNodes, or both.||maxTasksPerNode|No|Int32|The maximum number of tasks that can run concurrently on a single compute node in the pool.<br /><br /> The default value is 1.<br /><br /> The maximum value of this setting depends on the size of the compute nodes in the pool \(the vmSize setting\).|
|taskSchedulingPolicy|No|Complex Type|Defines how the Batch service distributes tasks between compute nodes in the pool.|
|autoScaleFormula|No|String|Specifies a formula for the desired number of compute nodes in the pool.<br /><br /> This property must not be specified if enableAutoScale is set to false. It is required if enableAutoScale is set to true.<br /><br /> The formula is checked for validity before the pool is created. If the formula is not valid, the Batch service rejects the request with detailed error information.|
|autoScaleEvaluationInterval|No|Time|Specifies a time interval at which to automatically adjust the pool size according to the autoscale formula.<br />The default value is 15 minutes.<br /><br /> The minimum and maximum value are 5 minutes and 168 hours respectively. If you specify a value less than 5 minutes or greater than 168 hours, the Batch service returns a Bad Request \(400\).|
|enableAutoScale|No|Boolean|Specifies whether the pool size should automatically adjust over time.<br /><br /> If false, the targetDedicatedNodes element is required.<br /><br /> If true, the autoScaleFormula element is required. The pool automatically resizes according to the formula.<br /><br /> The default value is false.|
|enableInterNodeCommunication|No|Boolean|Specifies whether the pool permits direct communication between nodes.<br /><br /> The default value is false.|
|startTask|No|Complex Type|Specifies a task to run on each compute node as it joins the pool. The task runs when the node is added to the pool or when the node is restarted.|
|certificateReferences|No|Collection|A list of certificates to be installed on each compute node in the pool.<br /><br /> Each certificate in the list must have been previously added to the Batch account.|
|applicationPackageReferences|No|Collection|A list of application packages to be installed on each compute node in the pool.<br /><br /> This property is currently not supported on auto pools created with the virtualMachineConfiguration \(IaaS\) property.|
|[metadata](#bk_meta)|No|Collection|A list of name\-value pairs associated with the pool as metadata.<br /><br /> The Batch service does not assign any meaning to metadata; it is solely for the use of user code.|

###  <a name="bk_csconf"></a> cloudServiceConfiguration

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|osFamily|Yes|String|The Azure Guest OS family to be installed on the virtual machines in the pool.<br /><br /> Possible values are:<br /><br /> **2** – OS Family 2, equivalent to Windows Server 2008 R2 SP1.<br /><br /> **3** – OS Family 3, equivalent to Windows Server 2012.<br /><br /> **4** – OS Family 4, equivalent to Windows Server 2012 R2.<br /><br /> **5** – OS Family 5, equivalent to Windows Server 2016.<br /><br /> For more information, see [Azure Guest OS Releases](https://azure.microsoft.com/documentation/articles/cloud-services-guestos-update-matrix/#releases).|
|targetOSVersion|No|String|The Azure Guest OS version to be installed on the virtual machines in the pool.<br /><br /> The default value is * which specifies the latest operating system version for the specified family.<br /><br /> For other permitted values, see [Azure Guest OS Releases](https://azure.microsoft.com/documentation/articles/cloud-services-guestos-update-matrix/#releases).|

###  <a name="bk_vmconf"></a> virtualMachineConfiguration

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|[imageReference](../batchservice/add-a-job-to-an-account.md#bk_imgref)|Yes|Complex Type|Specifies information about the platform or Marketplace image to use.|
|nodeAgentSKUId|Yes|String|The SKU of the Batch node agent that needs to be provisioned on the compute node. An appropriate node agent SKU which matches the selected image reference must be provided.<br /><br /> To get the list of supported node agent SKUs along with their list of verified image references, see [List supported node agent SKUs](../batchservice/list-supported-node-agent-skus.md).|
|[windowsConfiguration](../batchservice/add-a-job-to-an-account.md#bk_winconf)|No|Complex Type|Specifies Windows operating system settings on the virtual machine. This property must not be specified if the imageReference is referencing a Linux OS image.|

###  <a name="bk_imgref"></a> imageReference

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|publisher|Required|String|The publisher of the image.<br /><br /> To get the list of all imageReferences verified by Azure Batch, see [List supported node agent SKUs](../batchservice/list-supported-node-agent-skus.md).|
|offer|Required|String|The offer of the image.|
|sku|Required|String|The SKU of the image.|
|version|Optional|String|The version of the image. A value of 'latest' can be specified to select the latest version of an image. The default value is 'latest'.|

###  <a name="bk_winconf"></a> windowsConfiguration

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|enableAutomaticUpdates|No|Boolean|Indicates whether the virtual machine is enabled for automatic updates. If this property is not specified, the default value is true.|

###  <a name="bk_netconf"></a> networkConfiguration

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|subnetId|Required|String|Specifies the resource identifier of the subnet in which the pool's compute nodes should be created. The following conditions must be met:<ul> <li>The specified [Virtual Network (VNet)](https://azure.microsoft.com/documentation/articles/virtual-networks-overview/) must be in the same Azure region as the Azure Batch account.</li> <li>The specified VNet must be in the same subscription as the Azure Batch account.</li> <li>The type of VNet supported depends on how pools are being allocated for the Batch account: <ul> <li>If the Batch account was created with its **poolAllocationMode** property set to 'BatchService', then the specified VNet must be a classic VNet.</li> <li>If the Batch account was created with its **poolAllocationMode** property set to 'UserSubscription', then the specified VNet may be a classic VNet or an Azure Resource Manager VNet. Pools must be created with a virtual machine configuration to use a VNet. Pools created with a cloud service configuration are not supported.</li> </ul> </li> <li>If the Batch account was created with its **poolAllocationMode** property set to 'BatchService', then you must provide permissions for the Batch service principal to access the VNet. The Batch service principal, named 'Microsoft Azure Batch' or 'MicrosoftAzureBatch', must have the [Classic Virtual Machine Contributor Role-Based Access Control (RBAC) role](https://azure.microsoft.com/documentation/articles/role-based-access-built-in-roles/#classic-virtual-machine-contributor) for the specified VNet. If the specified RBAC role is not provided, the Batch service returns 400 (Bad Request). </li> <li>The specified subnet should have enough free IP addresses to accommodate the total target number of nodes; that is, the sum of the values of the **targetDedicatedNodes** and **targetLowPriorityNodes** properties. If the subnet doesn't have enough free IP addresses, the pool will partially allocate compute nodes, and a resize error will occur.</li> <li>The specified subnet must allow communication from the Azure Batch service to be able to schedule tasks on the compute nodes. This can be verified by checking if the specified VNet has any associated Network Security Groups (NSG). If communication to the compute nodes in the specified subnet is denied by an NSG, then the Batch service will set the state of the compute nodes to **unusable**. </li> <li>If the specified VNet has any associated Network Security Groups (NSG), then a few reserved system ports must be enabled for inbound communication. For pools created with a virtual machine configuration, enable ports 29876 and 29877, as well as port 22 for Linux and port 3389 for Windows. For pools created with a cloud service configuration, enable ports 10100, 20100, and 30100. Also enable outbound connections to Azure Storage on port 443.</li></ul>|

###  <a name="bk_meta"></a> metadata

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|name|Yes|String|Name of the metadata setting.|
|value|Yes|String|Value of the metadata setting.|

## Example
 In the request body example above, you can see:

-   Constraints being set for the job, including a maximum duration of 1 hour

-   A job manager task, "myprogram.exe", that runs when the job is started

-   A temporary pool of 3 compute nodes being created to run the job, which will be deleted when the job ends

-   A start task, "myprogram2.exe", running on all of the compute nodes in the pool before they run job tasks

-   A metadata entry named "myproperty" being set on the pool

## Response
 Status code: 201. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md)

## Remarks
 You can specify that a job run on an existing pool, by setting the poolId element, or in an automatically created temporary pool, by setting the autoPoolSpecification element.

 If you specify poolId, it is up to you to ensure that the pool exists. If the pool does not exist at the time the Batch service tries to schedule a job, no tasks for the job will run until you create a pool with that id. Note that the Batch service will not reject the job request; it will simply not run tasks until the pool exists. For more information about creating pools, see [Add a pool to an account](../batchservice/add-a-pool-to-an-account.md).

 If you specify an autoPoolSpecification, the Batch service manages the lifetime \(both creation and, unless keepAlive is specified, deletion\) of the auto pool. Any user actions that affect the lifetime of the auto pool while the job is active will result in unexpected behavior.

 If auto pool creation fails, the Batch service moves the job to a Completed state, and the pool creation error is set in the job’s failureInfo property. For example, if any of the certificates specified in the certificateReferences for the auto pool does not exist, or is in the deleting or deletefailed state, the auto pool creation will fail, and the Batch service will terminate the job.

