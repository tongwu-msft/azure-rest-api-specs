---
ms.assetid: c85ea5cf-e1cb-4c95-8c47-581baf599c64
ms.title: Batch REST API versioning | Microsoft Docs
ms.service: batch
author: mmacy
ms.author: marsma
ms.manager: timlt
---

# Batch REST API versioning

Operations provided by the Batch service REST API may have multiple versions for backwards compatibility as the API evolves over time. You must specify which version of an operation you wish to use when it is called by providing the version with your REST call. If your application calls an older version of an operation, you can choose to continue calling the older version, or modify your code to call a newer version. If the version is not specified or an incorrect version is specified, then an error will be returned.

To specify which version of an operation to use, specify the *api-version* query parameter. The version is of the format Group.Major.Minor where Group is in the format 'YYYY-MM-DD' and Major is an integer and Minor is an integer.

## Supported Versions
 The version of the Batch API described here is 2017-01-01.4.0. Using the latest version is recommended where possible.

 Earlier versions include '2016-07-01.3.1', '2016-02-01.3.0', '2015-12-01.2.1', '2015-11-01.2.1', '2015-06-01.2.0', '2015-03-01.1.1', and '2014-10-01.1.0'.

### Version 2017-01-01.4.0

 This version release extends all support from the previous version, 2016-07-01.3.1. Additionally, it supports the following capabilities:

- Support for running a task under a specified user identity.  

    You can specify that a task be run under one of the following user identities:

    - A user account with a name that you define.
    - A user account that is created automatically (auto-user). The auto-user can run as an administrative user or as a non-administrative user, depending on how you specify the elevationLevel property.

    The userIdentity property replaces the runElevated property in requests that add a task or a task collection, and in responses that get information about a task or that list tasks.

- Support for defining user accounts across all nodes in a pool. You can run a task under a user account that you define by specifying that user account for the userIdentity property.

    You can specify a user account via the userAccounts property in requests to Add Pool. The userAccounts property is returned in responses from Get Pool and List Pool.
    
- Support for requesting an authentication token from the Batch service to provide to a task when it runs. The authentication token enables a task to issue requests related to the job to the Batch service, without the Batch account keys. Currently the authentication token supports operations on the job only. 

    You can specify the authenticationTokenSettings property in requests that add a task or a collection of tasks. The authenticationTokenSettings property is returned in responses that get information about a task or that list tasks.

- Support for specifying an action to take on a task's dependencies if the task fails. You can specify the dependencyAction property on requests that add a task or a task collection. The dependencyAction property is returned in responses that get information about a task or that list tasks.

- Support for deploying nodes in the user's subscription using custom VHDs. To deploy nodes in the user's subscription, you must specify when you create your Batch account that pools are to be provisioned in the user subscription, rather than in a subscription managed by the Batch service. Then when you add a pool to your Batch account, you can use the osDisk property to specify a reference to a disk image.

    > [!IMPORTANT] 
    > When you create your Batch account, if you specify that pools are to be provisioned in the user subscription, then you must use Azure Active Directory-based authentication for all requests made through that account.
    >
    >

- Support for Azure Active Directory-based authentication for requests to the Batch service. 

### Version 2016-07-01.3.1
 This version release extends all support from the previous version, 2016-02-01.3.0. Additionally, it supports the following capabilities:

-   Capability to create a pool and an auto-pool with Network configuration

    -   A new property [networkConfiguration](~/docs-ref-autogen/batchservice/pool.json#Pool_Add), has been added to both the pool and auto-pool resources. This property can be used to specify the pool's network configuration, such as the subnet in which the pool's compute nodes will be created.

- Automatically terminate a job when all tasks are complete.
    - A new property [onAllTasksComplete](~/docs-ref-autogen/batchservice/job.json#Job_Add) has been added to the job resource. You can specify this when you create or update a job.

- Automatically terminate or disable a job when a task fails.

    - A new property [onTaskFailure](~/docs-ref-autogen/batchservice/job.json#Job_Add) has been added to the job resource, and a new property [exitConditions](~/docs-ref-autogen/batchservice/task.json#Task_Add) has been added to the task resource. The job onTaskFailure setting indicates whether task failure may have a job-level impact, and the task exitConditions property allows tasks to tailor the job-level impact to the nature of the failure.

- Associate application packages with tasks as well as pools.

    - A new property [applicationPackageReferences](~/docs-ref-autogen/batchservice/job.json#Job_Add) has been added to the task resource and to the job jobManagerTask settings. This allows application packages to be deployed on demand as tasks require them rather than requiring them to be specified at pool creation time. This is particularly valuable for long-lived pools that may be called on to run different kinds of jobs or different application versions over their lifetime, or if you have a large application package that is not required by all tasks.

- Capability to reactivate a failed task.

    - A new operation [Reactivate a task](~/docs-ref-autogen/batchservice/task.json#Task_Reactivate) has been added to reset a failed task's state to active. This allows failures to be retried, for example if the failure was transient or if you have been able to fix the cause of the failure, without recreating the task.

### Version 2016-02-01.3.0
 This version release extends all support from the previous version, 2015-12-01.2.2. Additionally, it supports the following capabilities:

-   Capability to create a pool and an auto-pool with IaaS VM configuration

    -   Existing properties 'osFamily', 'targetOSVersion' and 'currentOSVersion' are moved from top-level properties of Pool and AutoPool resources and are moved inside a new property called 'cloudServiceConfiguration'.

    -   A new property 'virtualMachineConfiguration' is added to both the Pool and AutoPool resources. This property can be specified to configure a pool/auto pool with IaaS VMs.

    -   A new API is added to obtain information about all the node agent SKUs supported by the Batch service. See [List supported node agent SKUs](~/docs-ref-autogen/batchservice/account.json#Account_ListNodeAgentSkus).

    -   A new API is added to obtain remote login settings which can be used to remotely login to a compute node created with IaaS VM configuration. See [Get remote login settings for a node](~/docs-ref-autogen/batchservice/computenode.json#ComputeNode_GetRemoteLoginSettings).

    -   A new API is added to add a collection of tasks to a job. See [Add a collection of tasks to a job](~/docs-ref-autogen/batchservice/task.json#Task_AddCollection).

    -   A new optional property 'sshPublicKey' is added to the User resource which can be used for adding/updating users on a Linux compute node.

    -   Two new properties 'totalTasksSucceeded' and 'runningTasksCount' are added to the Node resource. These properties can be obtained via [Get information about a node](~/docs-ref-autogen/batchservice/computenode.json#ComputeNode_Get) or [List the compute nodes in a pool](~/docs-ref-autogen/batchservice/computenode.json#ComputeNode_List).

    -   A new property 'fileMode' is added to the 'ResourceFile' complex type. This property is applied only on Linux compute nodes and ignored for Windows compute nodes.

    -   A new property 'fileMode' is added to the 'FileProperties' complex type. This property will be returned by the Batch service for Linux compute nodes as part of GetFileProperties or ListFileProperties APIs. Also, the existing property 'creationTime' under the 'FileProperties' complex type is changed to an optional property because this property will not be returned for Linux compute nodes.

    -   The data type of the existing property 'visibility' inside the 'CertificateReference' complex type is modified from a string with comma-separated values to a collection of strings. Also one of the existing values for visibility is renamed from "rdp" to "remoteuser".

-   The URLs of the following APIs are changed to replace "?" for the action name to "/":

    -   [Replace the properties of a pool](~/docs-ref-autogen/batchservice/pool.json#Pool_UpdateProperties)

    -   [Disable automatic scaling on a pool](~/docs-ref-autogen/batchservice/pool.json#Pool_DisableAutoScale)

    -   [Enable automatic scaling on a pool](~/docs-ref-autogen/batchservice/pool.json#Pool_EnableAutoScale)

    -   [Evaluate an automatic scaling formula](~/docs-ref-autogen/batchservice/pool.json#Pool_EvaluateAutoScale)

    -   [Change the size of a pool](~/docs-ref-autogen/batchservice/pool.json#Pool_Resize)

    -   [Stop changing the size of a pool](~/docs-ref-autogen/batchservice/pool.json#Pool_StopResize)

    -   [Upgrade the operating system of compute nodes in a pool](~/docs-ref-autogen/batchservice/pool.json#Pool_UpgradeOS)

    -   [Remove compute nodes from a pool](~/docs-ref-autogen/batchservice/pool.json#Pool_RemoveNodes)

    -   [Reboot a node](~/docs-ref-autogen/batchservice/computenode.json#ComputeNode_Reboot)

    -   [Reimage a node](~/docs-ref-autogen/batchservice/computenode.json#ComputeNode_Reimage)

    -   [Disable task scheduling on a node](~/docs-ref-autogen/batchservice/computenode.json#ComputeNode_DisableScheduling)

    -   [Enable task scheduling on a node](~/docs-ref-autogen/batchservice/computenode.json#ComputeNode_EnableScheduling)

    -   [Disable a job schedule](~/docs-ref-autogen/batchservice/jobschedule.json#JobSchedule_Disable)

    -   [Enable a job schedule](~/docs-ref-autogen/batchservice/jobschedule.json#JobSchedule_Enable)

    -   [Terminate a job schedule](~/docs-ref-autogen/batchservice/jobschedule.json#JobSchedule_Terminate)

    -   [Disable a job](~/docs-ref-autogen/batchservice/job.json#Job_Disable)

    -   [Enable a job](~/docs-ref-autogen/batchservice/job.json#Job_Enable)

    -   [Terminate a job](~/docs-ref-autogen/batchservice/job.json#Job_Terminate)

    -   [Terminate a task](~/docs-ref-autogen/batchservice/task.json#Task_Terminate)

    -   [Cancel the deletion of a certificate](~/docs-ref-autogen/batchservice/certificate.json#Certificate_CancelDeletion)

### Version 2015-12-01.2.2
 This version release extends all support from the previous version, 2015-11-01.2.1. Additionally, it supports the following capabilities:

-   Applications can now be deployed to compute nodes using application packages instead of as resource files.

    -   New APIs are provided for clients to browse the list of available applications and versions, for example to display a selector in a user interface.

    -   Pool-related APIs are changed to allow a pool to specify application packages to be downloaded to all nodes in that pool.

-   Tasks can now be made dependent on other tasks.  A dependent task will not start until all the tasks it depends on have completed successfully.

 This version release includes the following other changes:

-   The default pool resize timeout has changed to 15 minutes.

### Version 2015-11-01.2.1
 This version release extends all support from the previous version 2015-06-01.2.0. Additionally, it supports the following capabilities:

-   Capability to add and run multiinstance task (eg MPI)

    -   A new optional property 'multiInstanceSettings' is added to the Task resource which can be optionally included in Add Task, Get Task, List Tasks APIs.

    -   A new API List the subtasks of a task is added to obtain information about subtasks.

    -   A new optional property 'subtaskId' is added to 'recentTasks' for a Compute Node. This property is returned as part of Get Compute Node and List Compute Nodes

-   Capability to disable or enable task scheduling on a compute node

    -   Two new APIs Disable task scheduling on a node and Enable task scheduling on a node are added on compute node resource.

    -   A new compute node state 'offline' is added. For older API versions, this state is mapped to 'unusable'.

    -   A new property 'schedulingState' is added to the compute node resource. Possible values for 'enabled' and 'disabled'.

-   Capability to specify autoscale evaluation interval on a pool/autopool

    -   A new property 'autoScaleEvaluationInterval' is added to pool resource. This property can be included in Add Pool, Get Pool, Enable AutoScale, and List Pools APIs.

    -   Similarly, for auto pools, a new property 'autoScaleEvaluationInterval' is added to 'autoPoolSpecification' property. This property can be included in Add Job, Get Job, List Jobs, Add Job Schedule, Get Job Schedule, Update Job Schedule, List Job Schedules,
                        and List Jobs in Job Schedule APIs.

-   Enhancement to Task APIs to return the root directory of the task on the compute node.

    -   Two new properties 'taskRootDirectory' and 'taskRootDirectoryUrl' are added to Task resource which can be obtained as part of Get information about a task, List Tasks APIs

    -   A new property 'taskRootDirectory' is added to 'jobPreparationTaskExecutionInfo' and 'jobReleaseTaskExecutionInfo' which can be obtained via List the status of the job preparation and job release tasks for a job API.

