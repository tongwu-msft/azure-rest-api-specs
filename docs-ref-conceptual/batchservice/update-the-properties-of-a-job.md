---
title: "Update the properties of a job | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 9ebf976c-222b-4950-9a9a-ecf8c32b4931
caps.latest.revision: 22
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Update the properties of a job
  Update the properties of a job.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to jobs.

|Method|Request URI|
|------------|-----------------|
|PUT or PATCH|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}?api-version={api-version}`|

```

{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#jobs/@Element",
  "priority":100,
  "constraints": {
    "maxWallClockTime":"PT1H",
    "maxTaskRetryCount":-1
  },
  "poolInfo": {
    "poolId":"mypool1"
  }
}

```

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|priority|No|Int32|The priority of the job. Priority values can range from \-1000 to 1000, with \-1000 being the lowest priority and 1000 being the highest priority.<br /><br /> If you do not specify priority in a PUT request, it takes the default value 0.|
|[constraints](../batchservice/update-the-properties-of-a-job.md#constraints)|No|Complex Type|Specifies the execution constraints for the job.<br /><br /> If you specify this element in a PUT or PATCH request, it overwrites all existing execution constraints for the job, even if you do not include all constraint attributes.  For example, if you include a constraints element which specifies only maxWallClockTime, then maxTaskRetryCount is reset to its default of 0.<br /><br /> If you do not specify this element in a PUT request, it is equivalent to passing the default constraints.<br /><br /> If you change the maxTaskRetryCount, the new value applies only to new tasks of the job. It does not apply to existing tasks.<br /><br /> The default maxTaskRetryCount is 0.  The default maxWallClockTime is infinite.|
|[poolInfo](../batchservice/update-the-properties-of-a-job.md#poolInfo)|Yes for PUT<br /><br /> No for PATCH|Complex Type|Specifies the pool on which the Batch service runs the job’s tasks.<br /><br /> You may change the pool for a job only when the job is disabled. The Update Job call will fail if you include the poolInfo element and the job is not disabled.<br /><br /> If you specify an autoPoolSpecification specification in the poolInfo, only the keepAlive property can be updated, and then only if the auto pool has a *poolLifetimeOption* of **job**. Otherwise, the Update Job call fails with HTTP status 409 \(Conflict\).|
|onAllTasksComplete|No|String|Specifies an action the Batch service should take when all tasks in the job are in the completed state.<br /><br /> Note that if a job contains no tasks, then all tasks are considered complete. This option is therefore most commonly used with a job manager task; if you want to use automatic job termination without a job manager, you should initially set onAllTasksComplete to **noaction** and update the job properties to set onAllTasksComplete to **terminatejob** once you have finished adding tasks.<br /><br /> Permitted values are:<br /><br /> **noaction** – do nothing. The job remains active unless terminated or disabled by some other means.<br /><br /> **terminatejob** – terminate the job. The job’s terminateReason is set to "AllTasksComplete".<br /><br /> You may not change the value from **terminatejob** to **noaction** – that is, once you have engaged automatic job termination, you cannot turn it off again. If you try to do this, the request fails and Batch returns status code 400 (Bad Request) and an 'invalid property value' error response.<br /><br /> If you do not specify this element in a PUT request, it is equivalent to passing **noaction**. This is an error if the current value is **terminatejob**.|
|metadata|No|Collection|A list of name\-value pairs associated with the job as metadata.<br /><br /> If you specify this element in a PUT or PATCH request, the new list entirely replaces any existing metadata.<br /><br /> If you do not specify this element in a PUT request, it takes the default value of an empty list; in effect, any existing metadata is deleted.|

###  <a name="constraints"></a> constraints

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|maxWallClockTime|No|Time Interval|The maximum elapsed time that the task may run, measured from the time the task starts. If the task does not complete within the time limit, the Batch service terminates it.<br /><br /> If this is not specified, there is no time limit on how long the task may run.|
|maxTaskRetryCount|No|Int32|The maximum number of times the task may be retried. The Batch service retries a task if its exit code is nonzero.<br /><br /> Note that this value specifically controls the number of retries. The Batch service will try the task once, and may then retry up to this limit. For example, if the maximum retry count is 3, Batch tries the task up to 4 times \(one initial try and 3 retries\).<br /><br /> If the maximum retry count is 0, the Batch service does not retry the task.If the maximum retry count is \-1, the Batch service retries the task without limit.|

###  <a name="poolInfo"></a> poolInfo

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|poolId|No|String|Specifies the id of an existing pool. All the tasks of the job will run on the specified pool. To find the ids of existing pools, see [List the pools in the account](../batchservice/list-the-pools-in-the-account.md).<br /><br /> You must specify either poolId or autoPoolSpecification, but not both.|
|[autoPoolSpecification](../batchservice/update-the-properties-of-a-job.md#autoPoolSpecification)|No|Complex Type|Specifies characteristics for a temporary ‘auto pool.’ The Batch service will create this auto pool and run all the tasks of the job will run on it, and will delete the pool once the job has completed.<br /><br /> You must specify either poolId or autoPoolSpecification, but not both.|

###  <a name="autoPoolSpecification"></a> autoPoolSpecification

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|autoPoolIdPrefix|No|String|The Batch service assigns each auto pool a unique identifier on creation. To distinguish between pools created for different purposes, you can specify this element to add a prefix to the id that is assigned. The prefix can be up to 20 characters long.|
|poolLifetimeOption|Yes|String|Specifies the minimum lifetime of created auto pools, and how multiple jobs on a schedule are assigned to pools.  Possible values are:<br /><br /> **job**: the pool exists for the lifetime of the job to which it is dedicated.  The Batch service creates the pool when it creates the job. If applied to a job schedule, the Batch service creates a new auto pool for every job created on the schedule.<br /><br /> **jobschedule** – the pool exists for the lifetime of the job schedule. The Batch Service creates the pool when it creates the first job on the schedule.  You may apply this option only to job schedules, not to jobs.|
|keepAlive|No|Boolean|Specifies whether to keep an auto pool alive after its lifetime expires.<br /><br /> If **false**, the Batch service deletes the pool once its lifetime \(as determined by the poolLifetimeOption setting\) expires; that is, when the job or job schedule completes.<br /><br /> If **true**, the Batch service does not delete the pool automatically. It is up to the user to delete auto pools created with this option.<br /><br /> The default value is **false**.|
|pool|Yes|Complex Type|Contains the pool specification for the auto pool.|

### pool

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|displayName|No|String|Display name for the auto pool. It need not be unique and can contain any Unicode characters up to a maximum length of 1024.|
|vmSize|Yes|String|The size of the virtual machines in the pool. All virtual machines in a pool are the same size. <br/><br/> For information about available sizes of virtual machines for Cloud Services pools (pools created with cloudServiceConfiguration), see [Sizes for Cloud Services](http://azure.microsoft.com/documentation/articles/cloud-services-sizes-specs/). Batch supports all Cloud Services VM sizes except `ExtraSmall`, `Standard_A1_v2`, and `Standard_A2_v2`.<br/><br/> For information about available VM sizes for pools using images from the Virtual Machines Marketplace (pools created with virtualMachineConfiguration) see [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-linux-sizes/) (Linux) or [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-windows-sizes/) (Windows). Batch supports all Azure VM sizes except `STANDARD_A0` and those with premium storage (`STANDARD_GS`, `STANDARD_DS`, and `STANDARD_DSV2` series).|
|[cloudServiceConfiguration](../batchservice/update-the-properties-of-a-job.md#bk_csconf)|Optional|Complex Type|The cloud service configuration for the pool. This property must be specified if the pool needs to be created with Azure PaaS VMs.<br />Note that the cloudServiceConfiguration and virtualMachineConfiguration properties are mutually exclusive and only one of the properties can be specified. If neither is specified then the Batch service returns Bad Request \(400\).|
|[virtualMachineConfiguration](../batchservice/update-the-properties-of-a-job.md#bk_vmconf)|Optional|Complex Type|The virtual machine configuration for the pool. This property must be specified if the pool needs to be created with Azure IaaS VMs.<br />Note that the cloudServiceConfiguration and virtualMachineConfiguration properties are mutually exclusive and only one of the properties can be specified. If neither is specified then the Batch service returns Bad Request \(400\).|
|[networkConfiguration](../batchservice/update-the-properties-of-a-job.md#bk_netconf)|Optional|Complex Type|The network configuration for the pool.|
|resizeTimeout|No|Time|Specifies the timeout for allocation of compute nodes to the pool.<br /><br /> This timeout applies only to manual scaling; it has no effect when enableAutoScale is set to true.<br /><br /> The default value is 15 minutes.<br /><br /> The minimum value is 5 minutes. If you specify a value less than 5 minutes, the Batch service returns a Bad Request \(400\).|
|targetDedicated|No|Int32|Specifies the desired number of compute nodes in the pool.<br /><br /> This property must not be specified if enableAutoScale is set to **true**.  It is required if enableAutoScale is set to **false**.|
|maxTasksPerNode|No|Int32|The maximum number of tasks that can run concurrently on a single compute node in the pool.<br /><br /> The default value is 1.<br /><br /> The maximum value of this setting depends on the size of the compute nodes in the pool \(the vmSize setting\).|
|taskSchedulingPolicy|No|Complex Type|Defines how the Batch service distributes tasks between compute nodes in the pool.|
|autoScaleFormula|No|String|Specifies a formula for the desired number of compute nodes in the pool.<br /><br /> This property must not be specified if enableAutoScale is set to false. It is required if enableAutoScale is set to true.<br /><br /> The formula is checked for validity before the pool is created. If the formula is not valid, the Batch service rejects the request with detailed error information.|
|autoScaleEvaluationInterval|No|Time|Specifies a time interval at which to automatically adjust the pool size according to the AutoScale formula.<br />The default value is 15 minutes.<br /><br /> The minimum and maximum value are 5 minutes and 168 hours respectively. If you specify a value less than 5 minutes or greater than 168 hours, the Batch service returns a Bad Request \(400\).|
|enableAutoScale|No|Boolean|Specifies whether the pool size should automatically adjust over time.<br /><br /> If **false**, the targetDedicated element is required.<br /><br /> If **true**, the autoScaleFormula element is required. The pool automatically resizes according to the formula.<br /><br /> The default value is **false**.|
|enableInterNodeCommunication|No|Boolean|Specifies whether the pool permits direct communication between nodes.<br /><br /> The default value is false.|
|startTask|No|Complex Type|Specifies a task to run on each compute node as it joins the pool. The task runs when the node is added to the pool or when the node is restarted.|
|certificateReferences|No|Collection|A list of certificates to be installed on each compute node in the pool.<br /><br /> Each certificate in the list must have been previously added to the Batch account.|
|metadata|No|Collection|A list of name\-value pairs associated with the pool as metadata.<br /><br /> The Batch service does not assign any meaning to metadata; it is solely for the use of user code.|

###  <a name="bk_csconf"></a> cloudServiceConfiguration

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|osFamily|Required|String|The Azure Guest OS family to be installed on the virtual machines in the pool.<br /><br /> Possible values are:<br /><br /> **2** – OS Family 2, equivalent to Windows Server 2008 R2 SP1.<br /><br /> **3** – OS Family 3, equivalent to Windows Server 2012.<br /><br /> **4** – OS Family 4, equivalent to Windows Server 2012 R2.<br /><br /> **5** – OS Family 5, equivalent to Windows Server 2016.<br /><br /> For more information, see [Azure Guest OS Releases](https://azure.microsoft.com/documentation/articles/cloud-services-guestos-update-matrix/#releases).|
|targetOSVersion|Optional|String|The Azure Guest OS version to be installed on the virtual machines in the pool.<br /><br /> The default value is * which specifies the latest operating system version for the specified family.<br /><br /> For other permitted values, see [Azure Guest OS Releases](https://azure.microsoft.com/documentation/articles/cloud-services-guestos-update-matrix/#releases).|

###  <a name="bk_vmconf"></a> virtualMachineConfiguration

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|[imageReference](../batchservice/update-the-properties-of-a-job.md#bk_imgref)|Required|Complex Type|Specifies information about the platform or Marketplace image to use.|
|nodeAgentSKUId|Required|String|The SKU of the Batch node agent that needs to be provisioned on the compute node. An appropriate node agent SKU which matches the selected image reference must be provided.<br /><br /> To get the list of supported node agent SKUs along with their list of verified image references, see [List supported node agent SKUs](../batchservice/list-supported-node-agent-skus.md).|
|[windowsConfiguration](../batchservice/update-the-properties-of-a-job.md#bk_winconf)|Optional|Complex Type|Specifies Windows operating system settings on the virtual machine. This property must not be specified if the imageReference is referencing a Linux OS image.|

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
|enableAutomaticUpdates|Optional|Boolean|Indicates whether the virtual machine is enabled for automatic updates. If this property is not specified, the default value is true.|

###  <a name="bk_netconf"></a> networkConfiguration

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|subnetId|Required|String|Specifies the resource identifier of the subnet in which the pool's compute nodes should be created. The following conditions must be met:<ul><li>The specified [Virtual Network (VNet)](https://azure.microsoft.com/documentation/articles/virtual-networks-overview/)  must be in the same Azure region as the Azure Batch account.</li><li>The specified VNet must be in the same subscription as the Azure Batch account.</li><li>The specified VNet must be a Classic VNet. VNets created via Azure Resource Manager are not supported.</li><li>The specified subnet should have enough free IP addresses to accommodate the "targetDedicated" property. If the subnet doesn't have enough free IP addresses, the pool will partially allocate compute nodes, and a resize error will occur.</li><li>The "MicrosoftAzureBatch" service principal must have the ["Classic Virtual Machine Contributor" Role-Based Access Control (RBAC) role](https://azure.microsoft.com/en-us/documentation/articles/role-based-access-built-in-roles/#classic-virtual-machine-contributor) for the specified VNet. If the specified RBAC role is not given, the Batch service returns 400 (Bad Request). </li><li>The specified subnet must allow communication from the Azure Batch service to be able to schedule tasks on the compute nodes. This can be verified by checking if the specified VNet has any associated  Network Security Groups (NSG). If communication to the compute nodes in the specified subnet is denied by an NSG, then the Batch service will set the state of the compute nodes to unusable. </li><li>This property can be specified only for pools created with [cloudServiceConfiguration](#bk_csconf). If this is specified on pools created with the [virtualMachineConfiguration](#bk_vmconf) property, the Batch service returns 400 (Bad Request).</li></ul>|

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

## Remarks
 The PUT request performs a full replace of all updatable properties of the job. For example, if the *constraints* element is not specified, then the Batch service removes the job's existing *constraints* and replaces them with the default constraints. The PATCH request replaces only the properties specified in the request.

