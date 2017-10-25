---
title: "Batch Service REST API Versioning | Microsoft Docs"
ms.custom: ""
ms.date: "2017-05-05"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b4b1f270-69e7-4d7d-af45-416efbd7d1cf
caps.latest.revision: 24
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Batch Service REST API Versioning
  Operations provided by the Batch service REST API may have multiple versions for backwards compatibility as the API evolves over time. You must specify which version of an operation you wish to use when it is called by providing the version with your REST call. If your application calls an older version of an operation, you can choose to continue calling the older version, or modify your code to call a newer version. If the version is not specified or an incorrect version is specified, then an error will be returned.

 To specify which version of an operation to use, specify the *api-version* query parameter. The version is of the format Group.Major.Minor where Group is in the format ‘YYYY-MM-DD’ and Major is an integer and Minor is an integer.

## Latest version: 2017-06-01.5.1

The version of the Batch API described here is **2017-06-01.5.1**. Using the latest version is recommended when possible.

New features in version 2017-06-01.5.1 include:

- Support for efficient task counts via the new [Get Task Counts](../batchservice/get-the-task-counts-for-a-job.md) operation. By calling the Get Task Counts operation, you can get a count of active, running, and completed tasks, and of tasks that have succeeded or failed. For more information, see [Count tasks for a job by state (Preview)](https://docs.microsoft.com/azure/batch/batch-get-task-counts).
- Support for specifying inbound endpoints on pool compute nodes, via the new **poolEndpointConfiguration** property. By setting this property, you can address specific ports on the node externally.

## Previous Versions
 
 Previous versions include:

- [2017-05-01.5.0](#version-2017050150)
- [2017-01-01.4.0](#version-2017010140)
- [2016-07-01.3.1](#version-2016070131)
- [2016-02-01.3.0](#version-2016020130)
- [2015-12-01.2.1](#version-2015120122)
- [2015-11-01.2.1](#version-2015110121)
- 2015-06-01.2.0
- 2015-03-01.1.1
- 2014-10-01.1.0



### Version 2017-05-01.5.0

The following sections outline new and changed features in version 2017-05-01.5.0.

> [!IMPORTANT]
> Version 2017-05-01.5.0 includes several breaking changes. Please review the breaking changes noted below and update your code in order to call version 2017-05-01.5.0. 
>
>

#### Low-priority compute nodes

Azure Batch now offers low-priorty compute nodes to reduce the cost of Batch workloads. Low-priority VMs make new types of Batch workloads possible by providing a large amount of compute power that is also economical.

There are several changes to the REST API for low-priority nodes:  

- (**Breaking change**) The **targetDedicated** and **currentDedicated** properties of a pool or pool specification have been renamed to **targetDedicatedNodes** and **currentComputeNodes**.
- (**Breaking change**) The **resizeError** property of a pool is now a collection called **resizeErrors**. 
- Compute nodes have a new **isDedicated** property. This property is **true** for dedicated nodes, and **false** for low-priority nodes.
- A Job Manager task has a new **allowLowPriorityNode** property. If this property is **true**, the Job Manager task may run on a low-priority node. If it is **false**, then the Job Manager task will run on a dedicated compute node.

#### Named users on Linux

Azure Batch now offers additional support for creating named users on Linux nodes. 

- The new **linuxUserConfiguration** property supports specifying a **uid** (user ID) and **gid** (group ID) when creating a Linux user.
- (**Breaking change**) The **sshPrivateKey** property has been moved from the **userAccount** property to the new **linuxUserConfiguration** property. The **linuxUserConfiguration** property is itself a property of the **userAccount** property.

See [Run tasks under user accounts in Batch](https://docs.microsoft.com/azure/batch/batch-user-accounts) for more information about named user accounts.

#### Output files for task data

You can now specify output files to upload task data after a task has completed.

- The new **outputFiles** property supports specifying task files to upload to Azure Storage.
- The new **fileUploadError** property of the **exitConditions** property supports specifying actions to take based on the upload status of an output file.

#### Task error reporting

Several changes have been made to improve reporting for task errors.

- The new **result** property of the **executionInfo** property indicates whether a task succeeded or failed.
- (**Breaking change**) The **schedulingError** property of the **executionInfo** property has been renamed **failureInfo**. The **failureInfo** property is returned any time there is a task failure. This includes all previous scheduling error cases, all cases where a nonzero task exit codes is returned, and any file upload failures.
- (**Breaking change**) The **schedulingError** property of the **exitConditions** property has been renamed to **preProcessingError** to clarify when the error took place in the task life-cycle.
- (**Breaking change**) The **schedulingErrorCateogry** property has been renamed to **errorCategory**.

#### Application licenses

You can now request that application licenses be provisioned to your pool, via the new **applicationLicenses** property on a pool or pool specification.


### Version 2017-01-01.4.0

 This version release extends all support from the previous version, 2016-07-01.3.1. Additionally, it supports the following capabilities:

- **Run a task under a specified user identity.** 

    You can now run a task or task collection under one of the following user identities, specified via the new **userIdentity** property on the task resource:

    - A user account with a name that you define.
    - A user account that is created automatically (an auto-user). An auto-user can run as an administrative user or as a non-administrative user. By default, an auto-user runs as a non-administrative user.
    
    > [!IMPORTANT]
    > The **userIdentity** property, with its **elevationLevel** property, replaces the **runElevated** property in requests that add a task or a task collection, and in responses that get information about a task or that list tasks.
    >
    If you make a request that includes the **runElevated** property to version 2017-01-01.4.0 of the Batch service, the request will fail. 
    >
    To run as an administrative user, update your application to use the **userIdentity** property, setting the **elevationLevel** property to *admin*.
    > 
    To run as a non-administrative user, update your application to use the **userIdentity** property, setting the **elevationLevel** property to *nonAdmin*. Since this is the default, you can also omit the setting.  
    >
    >

- **Define user accounts across all nodes in a pool.** 

    You can now run a task or task collection under a user account that you define on the pool resource. Define a user account via the new **userAccounts** property in requests to [Add Pool](../batchservice/add-a-pool-to-an-account.md). When you define the account, you can specify the account name, password, elevation level (admin or non-admin), and SSH private key (for Linux pools).
    
    Once you define the user account, you can specify that user account for the **userIdentity** property in requests that add a task or a task collection.

- **Provide a task with a token to authenticate to the Batch service when the task runs.** 

    The Batch service can now provide an authentication token to a task when it runs. The authentication token enables a task to issue requests related to the job to the Batch service, without the Batch account keys. The token is provided via the AZ_BATCH_AUTHENTICATION_TOKEN environment variable.
    
    Currently authentication tokens are supported for calling operations on the job resource only. The authentication token grants access to all operations on the job that contains the task. 

    To have the Batch service provide the authentication token, specify the new **authenticationTokenSettings** property, together with its **access** property, in requests to [Add Task](../batchservice/add-a-task-to-a-job.md) or [Add Task Collection](../batchservice/add-a-collection-of-tasks-to-a-job.md).

- **Specify an action to take on a task's dependencies if the task fails.** 
    
    You can now specify that dependent tasks proceed even if the task that they depend on fails. Set the new **dependencyAction** property of a task resource to *satisfy* to run dependent tasks even if the parent task fails. Alternately, set **dependencyAction** to *block* to block running of dependent tasks if the parent task fails.  

    Specify the **dependencyAction** property in requests to [Add Task](../batchservice/add-a-task-to-a-job.md) or [Add Task Collection](../batchservice/add-a-collection-of-tasks-to-a-job.md).

    For more information about using dependency actions, see [Dependency actions](https://docs.microsoft.com/azure/batch/batch-task-dependencies#dependency-actions).

- **Use custom OS disk images when creating a pool.** 

    You can now use custom OS disk images to create a pool.  
    
    To do so, you must specify when you create your Batch account that pools are to be provisioned in the user subscription, rather than in a subscription managed by the Batch service. In a call to [Create Account](~/docs-ref-autogen/batchmanagement/batchaccount.json#BatchAccount_Create), set the **poolAllocationMode** property to _UserSubscription_. Then   use the **osDisk** property to specify a reference to a disk image in a request to [Add Pool](../batchservice/add-a-pool-to-an-account.md).

    > [!IMPORTANT] 
    > When you create your Batch account, if you specify that pools are to be provisioned in the user subscription, then you must use Azure Active Directory-based authentication for all requests made through that account.
    >
    >


- **Use Azure Active Directory-based authentication for requests to the Batch service.** 

    Azure Active Directory (AAD) is now supported for authenticating calls to the Batch service.

    If your Batch account is set up to provision pools in the user subscription, then using AAD authentication is required.  

### Version 2016-07-01.3.1
 This version release extends all support from previous version, 2016-02-01.3.0. Additionally, it supports the following capabilities:

-   Capability to create a pool and an auto-pool with Network configuration

    -   A new property [networkConfiguration](../batchservice/add-a-pool-to-an-account.md#bk_netconf), has been added to both the pool and auto-pool resources. This property can be used to specify the pool's network configuration, such as the subnet in which the pool's compute nodes will be created.

- Automatically terminate a job when all tasks are complete.
    - A new property [onAllTasksComplete](../batchservice/add-a-job-to-an-account.md) has been added to the job resource. You can specify this when you create or update a job.

- Automatically terminate or disable a job when a task fails.

    - A new property [onTaskFailure](../batchservice/add-a-job-to-an-account.md) has been added to the job resource, and a new property [exitConditions](../batchservice/add-a-task-to-a-job.md) has been added to the task resource. The job onTaskFailure setting indicates whether task failure may have a job-level impact, and the task exitConditions property allows tasks to tailor the job-level impact to the nature of the failure.

- Associate application packages with tasks as well as pools.

    - A new property [applicationPackageReferences](../batchservice/add-a-job-to-an-account.md) has been added to the task resource and to the job jobManagerTask settings. This allows application packages to be deployed on demand as tasks require them rather than requiring them to be specified at pool creation time. This is particularly valuable for long-lived pools that may be called on to run different kinds of jobs or different application versions over their lifetime, or if you have a large application package that is not required by all tasks.

- Capability to reactivate a failed task.

    - A new operation [Reactivate a task](../batchservice/reactivate-a-task.md) has been added to reset a failed task's state to active. This allows failures to be retried, for example if the failure was transient or if you have been able to fix the cause of the failure, without recreating the task.  

### Version 2016-02-01.3.0
 This version release extends all support from previous version, 2015-12-01.2.2. Additionally, it supports the following capabilities:

-   Capability to create a pool and an auto-pool with IaaS VM configuration

    -   Existing properties 'osFamily', 'targetOSVersion' and 'currentOSVersion' are moved from top-level properties of Pool and AutoPool resources and are moved inside a new property called 'cloudServiceConfiguration'.

    -   A new property 'virtualMachineConfiguration' is added to both the Pool and AutoPool resources. This property can be specified to configure a pool/auto pool with IaaS VMs.

    -   A new API is added to obtain information about all the node agent SKUs supported by the Batch service. See [List supported node agent SKUs](../batchservice/list-supported-node-agent-skus.md).

    -   A new API is added to obtain remote login settings which can be used to remotely login to a compute node created with IaaS VM configuration. See [Get remote login settings for a node](../batchservice/get-remote-login-settings-for-a-node.md).

    -   A new API is added to add a collection of tasks to a job. See [Add a collection of tasks to a job](../batchservice/add-a-collection-of-tasks-to-a-job.md).

    -   A new optional property 'sshPublicKey' is added to the User resource which can be used for adding/updating users on a Linux compute node.

    -   Two new properties 'totalTasksSucceeded' and 'runningTasksCount' are added to the Node resource. These properties can be obtained via [Get information about a node](../batchservice/get-information-about-a-node.md) or [List the compute nodes in a pool](../batchservice/list-the-compute-nodes-in-a-pool.md).

    -   A new property 'fileMode' is added to the 'ResourceFile' complex type. This property is applied only on Linux compute nodes and ignored for Windows compute nodes.

    -   A new property 'fileMode' is added to the 'FileProperties' complex type. This property will be returned by the Batch service for Linux compute nodes as part of GetFileProperties or ListFileProperties APIs. Also, the existing property 'creationTime' under the 'FileProperties' complex type is changed to an optional property because this property will not be returned for Linux compute nodes.

    -   The data type of the existing property 'visibility' inside the 'CertificateReference' complex type is modified from a string with comma-separated values to a collection of strings. Also one of the existing values for visibility is renamed from "rdp" to "remoteuser".

-   The URLs of the following APIs are changed to replace "?" for the action name to "/":

    -   [Replace the properties of a pool](../batchservice/replace-the-properties-of-a-pool.md)

    -   [Disable automatic scaling on a pool](../batchservice/disable-automatic-scaling-on-a-pool.md)

    -   [Enable automatic scaling on a pool](../batchservice/enable-automatic-scaling-on-a-pool.md)

    -   [Evaluate an automatic scaling formula](../batchservice/evaluate-an-automatic-scaling-formula.md)

    -   [Change the size of a pool](../batchservice/change-the-size-of-a-pool.md)

    -   [Stop changing the size of a pool](../batchservice/stop-changing-the-size-of-a-pool.md)

    -   [Upgrade the operating system of compute nodes in a pool](../batchservice/upgrade-the-operating-system-of-compute-nodes-in-a-pool.md)

    -   [Remove compute nodes from a pool](../batchservice/remove-compute-nodes-from-a-pool.md)

    -   [Reboot a node](../batchservice/reboot-a-node.md)

    -   [Reimage a node](../batchservice/reimage-a-node.md)

    -   [Disable task scheduling on a node](../batchservice/disable-task-scheduling-on-a-node.md)

    -   [Enable task scheduling on a node](../batchservice/enable-task-scheduling-on-a-node.md)

    -   [Disable a job schedule](../batchservice/disable-a-job-schedule.md)

    -   [Enable a job schedule](../batchservice/enable-a-job-schedule.md)

    -   [Terminate a job schedule](../batchservice/terminate-a-job-schedule.md)

    -   [Disable a job](../batchservice/disable-a-job.md)

    -   [Enable a job](../batchservice/enable-a-job.md)

    -   [Terminate a job](../batchservice/terminate-a-job.md)

    -   [Terminate a task](../batchservice/terminate-a-task.md)

    -   [Cancel the deletion of a certificate](../batchservice/cancel-the-deletion-of-a-certificate.md)

### Version 2015-12-01.2.2
 This version release extends all support from previous version, 2015-11-01.2.1. Additionally, it supports the following capabilities:

-   Applications can now be deployed to compute nodes using application packages instead of as resource files.

    -   New APIs are provided for clients to browse the list of available applications and versions, for example to display a selector in a user interface.

    -   Pool-related APIs are changed to allow a pool to specify application packages to be downloaded to all nodes in that pool.

-   Tasks can now be made dependent on other tasks.  A dependent task will not start until all the tasks it depends on have completed successfully.

 This version release includes the following other changes:

-   The default pool resize timeout has changed to 15 minutes.

### Version 2015-11-01.2.1
 This version release extends all support from previous version 2015-06-01.2.0. Additionally, it supports the following capabilities:

-   Capability to add and run multiinstance task \(eg MPI\)

    -   A new optional property ‘multiInstanceSettings’ is added to the Task resource which can be optionally included in Add Task, Get Task, List Tasks APIs.

    -   A new API List the subtasks of a task is added to obtain information about subtasks.

    -   A new optional property ‘subtaskId’ is added to ‘recentTasks’ for a Compute Node. This property is returned as part of Get Compute Node and List Compute Nodes

-   Capability to disable or enable task scheduling on a compute node

    -   Two new APIs Disable task scheduling on a node and Enable task scheduling on a node are added on compute node resource.

    -   A new compute node state ‘offline’ is added. For older API versions, this state is mapped to ‘unusable’.

    -   A new property ‘schedulingState’ is added to the compute node resource. Possible values for ‘enabled’ and ‘disabled’.

-   Capability to specify autoscale evaluation interval on a pool/autopool

    -   A new property ‘autoScaleEvaluationInterval’ is added to pool resource. This property can be included in Add Pool, Get Pool, Enable AutoScale, and List Pools APIs.

    -   Similarly, for auto pools, a new property ‘autoScaleEvaluationInterval’ is added to ‘autoPoolSpecification’ property. This property can be included in Add Job, Get Job, List Jobs, Add Job Schedule, Get Job Schedule, Update Job Schedule, List Job Schedules,
                        and List Jobs in Job Schedule APIs.

-   Enhancement to Task APIs to return the root directory of the task on the compute node.

    -   Two new properties ‘taskRootDirectory’ and ‘taskRootDirectoryUrl’ are added to Task resource which can be obtained as part of Get information about a task, List Tasks APIs

    -   A new property ‘taskRootDirectory’ is added to ‘jobPreparationTaskExecutionInfo’ and ‘jobReleaseTaskExecutionInfo’ which can be obtained via List the status of the job preparation and job release tasks for a job API.

