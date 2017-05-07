---
title: "Get information about a node | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 97654063-414e-4d75-ae4d-e3a9f426f36d
caps.latest.revision: 22
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Get information about a node
  Gets information about the specified node.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to nodes.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/nodes/{node-id}?$select={select-list}&api-version={api-version}`|

 Replace {pool\-id} with the id of the pool that contains the node. Replace {node\-id} with the id of the node that you want to get information about.

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

```

{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#nodes/@Element",
  "id":"tvm-2167304207_2-20140919t215614z",
  "url":"https://myaccount.myregion.batch.azure.com/pools/mypool_A0DBA2F6-DB8E-49CC-A6FD-8E8845AE4E52/nodes/tvm-2167304207_2-20140919t215614z",
  "state":"idle",
  "schedulingState":"enabled",
  "stateTransitionTime":"2014-09-19T21:56:15.1080705Z",
  "lastBootTime":"2014-09-19T21:56:14.929371Z",
  "allocationTime":"2014-09-19T21:56:14.3013703Z",
  "ipAddress":"10.115.42.108",
  "affinityId":"TVM:tvm-2167304207_2-20140919t215614z",
  "vmSize":"small",
  "totalTasksRun":1,
  "totalTasksSucceeded":1,
  "runningTasksCount":0,
  "recentTasks": [ {
    "taskUrl":"https://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks/mytask1",
    "jobId":"job-0000000001",
    "taskId":"mytask1",
    "taskState":"completed",
    "executionInfo": {
      "startTime":"2014-09-19T22:01:21.046497Z",
      "endTime":"2014-09-19T22:06:21.328059Z",
      "exitCode":0,
      "retryCount":0,
      "requeueCount":0
    }
  } ],
  "startTask":{
    "commandLine":"myprogram2.exe",
    "resourceFiles": [ {
      "blobSource":"http://mystorage1.blob.core.windows.net/scripts/myprogram2.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
      "filePath":"myprogram2.exe"
    },
    {
      "blobSource":"http://mystorage1.blob.core.windows.net/scripts/test.txt?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
      "filePath":"test.txt"
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
  "startTaskInfo": {
    "state":"completed",
    "startTime":"2014-09-19T21:56:16.1724555Z",
    "endTime":"2014-09-19T22:01:17.783034Z",
    "exitCode":0,
    "retryCount":0
  }
}

```

|Element|Type|Notes|
|-------------|----------|-----------|
|id|String|The id of the node.|
|url|String|The URL of the node.|
|state|String|The current state of the node. Possible values are:<br /><br /> -   **creating** – The Batch service has obtained the node, but it has not yet started to join a pool.<br />-   **starting** – The Batch service is starting on the node.<br />-   **waitingforstarttask** – The start task has started running on the node, but waitForSuccess is set and the start task has not yet completed.<br />-   **starttaskfailed** – The start task has failed on the node \(and exhausted all retries\), and waitForSuccess is set.  The node is not usable for running tasks.<br />-   **idle** – The node is not currently running a task.<br />-   **offline** – The node is not currently running a task, and scheduling of new tasks to the node is disabled.<br />-   **rebooting** – The node is rebooting.<br />-   **reimaging** – The node is being reimaged.<br />-   **running** –The node is running one or more tasks \(other than the start task\).<br />-   **leavingpool** – The node is leaving the pool, either because the user explicitly removed it or because the pool is resizing or autoscaling down.<br />-   **unknown** – The Batch service has lost contact with the node, and does not know its true state.<br />-   **unusable** – The node cannot be used for task execution due to errors.|
|schedulingState|String|Specifies whether the node is available for task scheduling. Possible values are:<br /><br /> -   **enabled** – Tasks can be scheduled on the node.<br />-   **disabled** – No new tasks will be scheduled on the node. Tasks already running on the node may still run to completion.<br /><br /> All nodes start with scheduling enabled.|
|stateTransitionTime|DateTime|The time at which the node entered its current state.|
|lastBootTime|DateTime|The time at which the node was started. This property may not be present if the node state is **unusable.**|
|allocationTime|DateTime|The time at which this node was allocated to the pool.|
|ipAddress|String|The IP address that other nodes can use to communicate with this node. This element is present only if enableInterNodeCommunication is set to **true** on the containing pool.|
|affinityId|String|An identifier which can be passed in the Add Task API to request that the task be scheduled close to this compute node.|
|vmSize|String|The size of the virtual machines in the pool. All virtual machines in a pool are the same size. <br/><br/> For information about available sizes of virtual machines for Cloud Services pools (pools created with cloudServiceConfiguration), see [Sizes for Cloud Services](http://azure.microsoft.com/documentation/articles/cloud-services-sizes-specs/). Batch supports all Cloud Services VM sizes except `ExtraSmall`, `Standard_A1_v2`, and `Standard_A2_v2`.<br/><br/> For information about available VM sizes for pools using images from the Virtual Machines Marketplace (pools created with virtualMachineConfiguration) see [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-linux-sizes/) (Linux) or [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-windows-sizes/) (Windows). Batch supports all Azure VM sizes except `STANDARD_A0` and those with premium storage (`STANDARD_GS`, `STANDARD_DS`, and `STANDARD_DSV2` series).|
|totalTasksRun|Int32|The total number of job tasks completed on the compute node. This includes Job Preparation, Job Release and Job Manager tasks, but not the pool start task.|
|totalTasksSucceeded|Int32|The total number of job tasks completed successfully \(with exitCode 0\) on the compute node. This includes Job Preparation, Job Release, and Job Manager tasks, but not the pool start task.|
|runningTasksCount|Int32|The total number of currently running job tasks on the compute node. This includes Job Preparation, Job Release, and Job Manager tasks, but not the pool start task.|
|[recentTasks](../batchservice/get-information-about-a-node.md#recentTasks)|Collection|A list of tasks whose state has recently changed. This property is present only if at least one task has run on this node since it was assigned to the pool.|
|[startTask](../batchservice/get-information-about-a-node.md#startTask)|Complex Type|A task specified to run on the node as it joins the pool.<br /><br /> This element is present only if a start task is configured on the pool that contains the node.|
|[startTaskInfo](../batchservice/get-information-about-a-node.md#startTaskInfo)|Complex|Runtime information about the execution of the start task on this node, including current state, error details, exit code, start time, end time, etc.<br /><br /> This element is present only if a start task is configured on the pool that contains the node.|
|[certificateReferences](../batchservice/get-information-about-a-node.md#certificateReferences)|Collection|A list of certificates installed on the node.<br /><br /> This element is present only if at least one certificate is configured to be installed on the pool that contains the node.|
|errors|Complex Type|A list of errors that are currently being encountered by the node.<br /><br /> This element is present only if the node has any errors.|

###  <a name="recentTasks"></a> recentTasks

|Element name|Type|Notes|
|------------------|----------|-----------|
|taskUrl|String|The URL of the task.|
|jobId|String|The id of the job to which the task belongs.|
|taskId|String|The id of the task within the job.|
|subtaskId|Int32|If the task is a multi\-instance task, the id of the subtask within the task. This property is present only if the task is multi\-instance.|
|taskState|String|The current state of the task.|
|[executionInfo](../batchservice/get-information-about-a-node.md#executionInfo)|Complex Type|Information about the execution of the task.|

###  <a name="startTask"></a> startTask

|Element name|Type|Notes|
|------------------|--------------|----------|
|commandLine|String|Specifies the command line of the start task.|
|[resourceFiles](../batchservice/get-information-about-a-node.md#resourceFiles)|Collection|A list of files that Batch will download to the compute node before running the command line. If you are providing the executable for the task, at least one instance of this element is required to specify the source location and target location of the executable file. If the task requires additional supporting files, add additional instances of this element to list these files.<br /><br /> Files that listed under this element are located in the task’s wd directory. For more information, see [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md). If the command line is a default server program, and requires no additional supporting files, you do not need to include this element.|
|[environmentSettings](../batchservice/get-information-about-a-node.md#environmentSettings)|Collection|A list of environment variable settings for the start task.|
|[userIdentity](#userIdentity)|Complex Type|The user identity under which the task runs. If absent, the task runs as a non-administrative user unique to the task.|
|maxTaskRetryCount|Int32|The maximum number of times the task may be retried. The Batch service retries a task if its exit code is nonzero.<br /><br /> Note that this value specifically controls the number of retries. The Batch service will try the task once, and may then retry up to this limit. For example, if the maximum retry count is 3, Batch tries the task up to 4 times \(one initial try and 3 retries\).<br /><br /> If the maximum retry count is 0, the Batch service does not retry the task. If the maximum retry count is \-1, the Batch service retries the task without limit.|
|waitForSuccess|Boolean|Specifies whether the Batch Service should wait for the start task to complete successfully \(that is, to exit with exit code 0\) before scheduling any tasks on the compute node.<br /><br /> If **true** and the start task fails on a compute node, the Batch service retries the start task up to its maximum retry count \(maxTaskRetryCount\). If the task has still not completed successfully after all retries, then the Batch service marks the compute node unusable, and will not schedule tasks to it.  This condition can be detected via the node state and scheduling error detail.<br /><br /> If **false**, the Batch service will not wait for the start task to complete. In this case, other tasks can start executing on the compute node while the start task is still running; and even if the start task fails, new tasks will continue to be scheduled on the node.<br /><br /> The default is **true**.|

###  <a name="resourceFiles"></a> resourceFiles

|Element name|Type|Notes|
|------------------|--------------|----------|
|blobSource|String|The URL of a blob in Azure storage. The Batch service downloads the blob to the specified file path.<br /><br /> The URL must be readable using anonymous access; that is, the Batch service does not present any credentials when downloading the blob.  There are two ways to get such a URL for a blob in Azure storage:<br /><br /> 1.  Use a Shared Access Signature \(SAS\) granting read permissions on the blob.<br />2.  Set the ACL for the blob’s container to allow public access.|
|filePath|String|The location on the compute node to which the file should be downloaded.|
|fileMode|String|The file permission mode attribute in octal format. This property is applicable only if the resourceFile is downloaded to a Linux node. This property will be ignored if it is specified for a resourceFile which is downloaded to a Windows node.<br /><br /> If this property is not specified for a Linux node, then a default value of 0770 is applied to the file.|

###  <a name="environmentSettings"></a> environmentSettings

|Element name|Type|Notes|
|------------------|--------------|----------|
|name|String|The name of the environment variable.|
|value|String|The value of the environment variable.|

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


###  <a name="startTaskInfo"></a> startTaskInfo

|Element name|Type|Notes|
|------------------|----------|-----------|
|state|String|The state of the start task on the node. Possible values are:<br /><br /> -   **running** – The start task is currently running.<br />-   **completed** – The start task has exited with exit code 0, or the start task has failed and the retry limit has reached, or the start task process did not run due to scheduling errors.|
|startTime|DateTime|The time at which the start task started running. This value is reset every time the task is restarted or retried \(that is, this is the most recent time at which the start task started running\).|
|endTime|DateTime|The time at which the start task stopped running. This is the end time of the most recent run of the start task, if that run has completed \(even if that run failed and a retry is pending\). This element is not present if the start task is currently running.|
|exitCode|Int32|The exit code of the start task. If the start task has run more than once this is the exit code of the most recent run to have completed. This element is not present if the start task has never run to completion.|
|[preProcessingError](../batchservice/get-information-about-a-node.md#preProcessingError)|ComplexType|If there was an error scheduling the start task, this element contains the error details.|
|retryCount|Int32|The number of times the task has been retried by the Batch service. The task is retried if it exits with a nonzero exit code, up to the specified MaxTaskRetryCount.|
|lastRetryTime|DateTime|The most recent time at which a retry of the task started running. This element is present only if the task was retried \(i.e. retryCount is nonzero\). If present, this is typically the same as startTime, but may be different if the task has been restarted for reasons other than retry; for example, if the compute node was rebooted during a retry, then the startTime is updated but the lastRetryTime is not.|

###  <a name="certificateReferences"></a> certificateReferences

|Element name|Type|Notes|
|------------------|--------------|----------|
|thumbprint|String|The thumbprint of the certificate.|
|thumbprintAlgorithm|String|The algorithm with which the thumbprint is associated. This must be **sha1**.|
|storeLocation|String|The location of the certificate store on the compute node into which to install the certificate. Possible values are:<br /><br /> -   **CurrentUser**<br />-   **LocalMachine**<br /><br /> The default value is **CurrentUser**.<br /><br /> This property is applicable only for pools created with cloudServiceConfiguration \(PaaS\) or virtualMachineConfiguration \(IaaS\) Windows nodes.<br /><br /> For Linux compute nodes, the certificates are stored in a directory inside the task working directory and an environment variable AZ\_BATCH\_CERTIFICATES\_DIR is supplied to the task to query for this location. For certificates with visibility of remoteuser, a certs directory is created in the user's home directory \(e.g., /home/\<user-name\>/certs\) where certificates are placed.|
|storeName|String|The name of the certificate store on the compute node into which to install the certificate. Possible values are:<br /><br /> -   **My**<br />-   **Root**<br />-   **CA**<br />-   **Trust**<br />-   **Disallowed**<br />-   **TrustedPeople**<br />-   **TrustedPublisher**<br />-   **AuthRoot**<br />-   **AddressBook**<br />-   Any custom store name. The default value is **My**.<br /><br /> This property is applicable only for pools created with cloudServiceConfiguration \(PaaS\) or virtualMachineConfiguration \(IaaS\) Windows nodes.|
|visibility|Collection|Specifies which user accounts on the compute node should have access to the private data of the certificate.<br /><br /> This property is a collection of strings. Possible values are:<br /><br /> -   **starttask** – The user account under which the start task is run.<br />-   **task** – The accounts under which job tasks are run.<br />-   **remoteuser** – The accounts under which users remotely access the node.|

###  <a name="executionInfo"></a> executionInfo

|Element name|Type|Notes|
|------------------|----------|-----------|
|startTime|DateTime|The time at which the task started running. If the task has been restarted or retried, this is the most recent time at which the task started running.<br /><br /> This property is present only for tasks that are in the **running** or **completed** state.|
|endTime|DateTime|The time at which the task completed.<br /><br /> This property is present only if the task is in the **completed** state.|
|exitCode|Int32|The exit code of the task.<br /><br /> This property is present only if the task is in **completed** state.|
|[preProcessingError](../batchservice/get-information-about-a-node.md#preProcessingError)|Complex Type|If there was an error scheduling the task, and the task is now in a **completed** state, this element contains the error details.|
|retryCount|Int32|The number of times the task has been retried by the Batch service. The task is retried if it exits with a nonzero exit code, up to the specified MaxTaskRetryCount.|
|lastRetryTime|DateTime|The most recent time at which a retry of the task started running.<br /><br /> This element is present only if the task was retried \(i.e. retryCount is nonzero\). If present, this is typically the same as startTime, but may be different if the task has been restarted for reasons other than retry; for example, if the compute node was rebooted during a retry, then the startTime is updated but the lastRetryTime is not.|
|requeueCount|Int32|The number of times the task has been requeued by the Batch service as the result of a user request.<br /><br /> When the user removes nodes from a pool \(by resizing or shrinking the pool\) or when the job is being disabled, the user can specify that running tasks on the nodes be requeued for execution. This count tracks how many times the task has been requeued for these reasons.|
|lastRequeueTime|DateTime|The most recent time at which the task has been requeued by the Batch service as the result of a user request.<br /><br /> This property is present only if the requeueCount is nonzero.|

###  <a name="preProcessingError"></a> preProcessingError

|Element name|Type|Notes|
|------------------|----------|-----------|
|category|String|The category of the task scheduling error.|
|code|String|An identifier for the task scheduling error. Codes are invariant and are intended to be consumed programmatically.|
|message|String|A message describing the task scheduling error, intended to be suitable for display in a user interface.|
|values|Collection|A list of additional error details related to the scheduling error.|

## Remarks
 Every node that is added to a pool is assigned a unique id and IP address. Whenever a node is removed from a pool, all of its local files are deleted, and the id and IP address are reclaimed and could be reused for new nodes.
