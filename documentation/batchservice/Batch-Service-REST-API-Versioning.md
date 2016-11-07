# Batch REST API versioning

Operations provided by the Batch service REST API may have multiple versions for backwards compatibility as the API evolves over time. You must specify which version of an operation you wish to use when it is called by providing the version with your REST call. If your application calls an older version of an operation, you can choose to continue calling the older version, or modify your code to call a newer version. If the version is not specified or an incorrect version is specified, then an error will be returned.

To specify which version of an operation to use, specify the *api-version* query parameter. The version is of the format Group.Major.Minor where Group is in the format 'YYYY-MM-DD' and Major is an integer and Minor is an integer.

## Supported Versions
 The version of the Batch API described here is '2016-07-01.3.1', and using that version is recommended where possible.

 Earlier versions include '2016-02-01.3.0', '2015-12-01.2.1', '2015-11-01.2.1', '2015-06-01.2.0', '2015-03-01.1.1', and '2014-10-01.1.0'.

### Version 2016-07-01.3.1
 This version release extends all support from previous version, 2016-02-01.3.0. Additionally, it supports the following capabilities:

-   Capability to create a pool and an auto-pool with Network configuration

    -   A new property [networkConfiguration](../Topic/Add%20a%20pool%20to%20an%20account.md#bk_netconf), has been added to both the pool and auto-pool resources. This property can be used to specify the pool's network configuration, such as the subnet in which the pool's compute nodes will be created.

- Automatically terminate a job when all tasks are complete.
    - A new property [onAllTasksComplete](../Topic/Add%20a%20job%20to%20an%20account.md) has been added to the job resource. You can specify this when you create or update a job.

- Automatically terminate or disable a job when a task fails.

    - A new property [onTaskFailure](../Topic/Add%20a%20job%20to%20an%20account.md) has been added to the job resource, and a new property [exitConditions](../Topic/Add%20a%20task%20to%20a%20job.md) has been added to the task resource. The job onTaskFailure setting indicates whether task failure may have a job-level impact, and the task exitConditions property allows tasks to tailor the job-level impact to the nature of the failure.

- Associate application packages with tasks as well as pools.

    - A new property [applicationPackageReferences](../Topic/Add%20a%20job%20to%20an%20account.md) has been added to the task resource and to the job jobManagerTask settings. This allows application packages to be deployed on demand as tasks require them rather than requiring them to be specified at pool creation time. This is particularly valuable for long-lived pools that may be called on to run different kinds of jobs or different application versions over their lifetime, or if you have a large application package that is not required by all tasks.

- Capability to reactivate a failed task.

    - A new operation [Reactivate a task](../Topic/Reactivate%20a%20task.md) has been added to reset a failed task's state to active. This allows failures to be retried, for example if the failure was transient or if you have been able to fix the cause of the failure, without recreating the task.

### Version 2016-02-01.3.0
 This version release extends all support from previous version, 2015-12-01.2.2. Additionally, it supports the following capabilities:

-   Capability to create a pool and an auto-pool with IaaS VM configuration

    -   Existing properties 'osFamily', 'targetOSVersion' and 'currentOSVersion' are moved from top-level properties of Pool and AutoPool resources and are moved inside a new property called 'cloudServiceConfiguration'.

    -   A new property 'virtualMachineConfiguration' is added to both the Pool and AutoPool resources. This property can be specified to configure a pool/auto pool with IaaS VMs.

    -   A new API is added to obtain information about all the node agent SKUs supported by the Batch service. See [List supported node agent SKUs](../Topic/List%20supported%20node%20agent%20SKUs.md).

    -   A new API is added to obtain remote login settings which can be used to remotely login to a compute node created with IaaS VM configuration. See [Get remote login settings for a node](../Topic/Get%20remote%20login%20settings%20for%20a%20node.md).

    -   A new API is added to add a collection of tasks to a job. See [Add a collection of tasks to a job](../Topic/Add%20a%20collection%20of%20tasks%20to%20a%20job.md).

    -   A new optional property 'sshPublicKey' is added to the User resource which can be used for adding/updating users on a Linux compute node.

    -   Two new properties 'totalTasksSucceeded' and 'runningTasksCount' are added to the Node resource. These properties can be obtained via [Get information about a node](../Topic/Get%20information%20about%20a%20node.md) or [List the compute nodes in a pool](../Topic/List%20the%20compute%20nodes%20in%20a%20pool.md).

    -   A new property 'fileMode' is added to the 'ResourceFile' complex type. This property is applied only on Linux compute nodes and ignored for Windows compute nodes.

    -   A new property 'fileMode' is added to the 'FileProperties' complex type. This property will be returned by the Batch service for Linux compute nodes as part of GetFileProperties or ListFileProperties APIs. Also, the existing property 'creationTime' under the 'FileProperties' complex type is changed to an optional property because this property will not be returned for Linux compute nodes.

    -   The data type of the existing property 'visibility' inside the 'CertificateReference' complex type is modified from a string with comma-separated values to a collection of strings. Also one of the existing values for visibility is renamed from "rdp" to "remoteuser".

-   The URLs of the following APIs are changed to replace "?" for the action name to "/":

    -   [Replace the properties of a pool](../Topic/Replace%20the%20properties%20of%20a%20pool.md)

    -   [Disable automatic scaling on a pool](../Topic/Disable%20automatic%20scaling%20on%20a%20pool.md)

    -   [Enable automatic scaling on a pool](../Topic/Enable%20automatic%20scaling%20on%20a%20pool.md)

    -   [Evaluate an automatic scaling formula](../Topic/Evaluate%20an%20automatic%20scaling%20formula.md)

    -   [Change the size of a pool](../Topic/Change%20the%20size%20of%20a%20pool.md)

    -   [Stop changing the size of a pool](../Topic/Stop%20changing%20the%20size%20of%20a%20pool.md)

    -   [Upgrade the operating system of compute nodes in a pool](../Topic/Upgrade%20the%20operating%20system%20of%20compute%20nodes%20in%20a%20pool.md)

    -   [Remove compute nodes from a pool](../Topic/Remove%20compute%20nodes%20from%20a%20pool.md)

    -   [Reboot a node](../Topic/Reboot%20a%20node.md)

    -   [Reimage a node](../Topic/Reimage%20a%20node.md)

    -   [Disable task scheduling on a node](../Topic/Disable%20task%20scheduling%20on%20a%20node.md)

    -   [Enable task scheduling on a node](../Topic/Enable%20task%20scheduling%20on%20a%20node.md)

    -   [Disable a job schedule](../Topic/Disable%20a%20job%20schedule.md)

    -   [Enable a job schedule](../Topic/Enable%20a%20job%20schedule.md)

    -   [Terminate a job schedule](../Topic/Terminate%20a%20job%20schedule.md)

    -   [Disable a job](../Topic/Disable%20a%20job.md)

    -   [Enable a job](../Topic/Enable%20a%20job.md)

    -   [Terminate a job](../Topic/Terminate%20a%20job.md)

    -   [Terminate a task](../Topic/Terminate%20a%20task.md)

    -   [Cancel the deletion of a certificate](../Topic/Cancel%20the%20deletion%20of%20a%20certificate.md)

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

