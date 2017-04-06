---
title: "Get information about a pool | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 8e5cb917-2230-4d0a-951d-9f21f70cee4f
caps.latest.revision: 35
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Get information about a pool
  Gets information about the specified pool.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to pools.

|Method|Request URI|
|------------|-----------------|
|GET or HEAD|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}?$select={select-list}&expand=stats&api-version={api-version}`|

 Replace {pool\-id} with the id of the pool that you want to get information about.

 You can use the HEAD method to obtain just the HTTP status code and headers, excluding the pool details response body: this is useful for determining whether the pool exists or whether it has changed since you last obtained its details.

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md)

 The following example shows information about a pool that does not include autoscaling, a start task, or certificates. See the examples later in this page of a pool with these optional elements.

```

{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#pools/@Element",
  "id":"mypool1",
  "url":"https://myaccount.myregion.batch.azure.com/pools/mypool1",
  "eTag":"#################",
  "lastModified":"2014-09-05T21:23:11.6762384Z",
  "creationTime":"2014-09-05T21:23:11.6762384Z",
  "state":"active",
  "stateTransitionTime":"2014-09-05T21:23:11.6762384Z",
  "allocationState":"steady",
  "allocationStateTransitionTime":"2014-09-05T21:23:15.0051269Z",
  "vmSize":"small",
  "cloudServiceConfiguration": {
    "osFamily":"4",
    "targetOSVersion":"WA-GUEST-OS-2.28_201409-01",
    "currentOSVersion":"WA-GUEST-OS-2.28_201409-01"
  }
  "resizeTimeout":"PT15M",
  "currentDedicated":5,
  "targetDedicated":5,
  "enableAutoScale":false,
  "enableInterNodeCommunication":false,
  "maxTasksPerNode":3,
  "taskSchedulingPolicy": {
    "nodeFillType":"Spread"
  }
}

```

|Element|Type|Notes|
|-------------|----------|-----------|
|id|String|The id of the pool.|
|displayName|String|The display name of the pool|
|url|String|The url of the pool.|
|eTag|String|The ETag of the pool. This is an opaque string. You can use it to detect whether the pool has changed between requests.  In particular, you can be pass the ETag with an Update Job request to specify that your changes should take effect only if nobody else has modified the job in the meantime.|
|lastModifed|DateTime|The last modified time of the pool. This is the last time at which the pool level data, such as the targetDedicated or enableAutoscale, changed.  It does not factor in node\-level changes such as a compute node changing state.|
|creationTime|DateTime|The creation time of the pool.|
|state|String|The current state of the pool. Possible values are:<br /><br /> **active** – The pool is available to run tasks subject to the availability of compute nodes.<br /><br /> **deleting** – The user has requested that the pool be deleted, but the delete operation has not yet completed.<br /><br /> **upgrading** – The user has requested that the operating system of the pool’s nodes be upgraded, but the upgrade operation has not yet completed \(that is, some nodes in the pool have not yet been upgraded\). The pool may be able to run tasks \(with reduced capacity\) but this is not guaranteed.|
|stateTransitionTime|DateTime|The time at which the pool entered its current state.|
|allocationState|String|Indicates whether the pool is resizing. Possible values are:<br /><br /> **steady** – The pool is not resizing. There are no changes to the number of nodes in the pool in progress. A pool enters this state when it is created and when no operations are being performed on the pool to change the number of dedicated nodes.<br /><br /> **resizing** \- The pool is resizing; that is, compute nodes are being added to or removed from the pool.<br /><br /> **stopping** \- The pool was resizing, but the user has requested that the resize be stopped, but the stop request has not yet been completed.|
|allocationStateTransitionTime|DateTime|The time at which the pool entered its current allocation state.|
|vmSize|String|The size of the virtual machines in the pool. All virtual machines in a pool are the same size. <br/><br/> For information about available sizes of virtual machines for Cloud Services pools (pools created with cloudServiceConfiguration), see [Sizes for Cloud Services](http://azure.microsoft.com/documentation/articles/cloud-services-sizes-specs/). Batch supports all Cloud Services VM sizes except `ExtraSmall`, `Standard_A1_v2`, and `Standard_A2_v2`.<br/><br/> For information about available VM sizes for pools using images from the Virtual Machines Marketplace (pools created with virtualMachineConfiguration) see [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-linux-sizes/) (Linux) or [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-windows-sizes/) (Windows). Batch supports all Azure VM sizes except `STANDARD_A0` and those with premium storage (`STANDARD_GS`, `STANDARD_DS`, and `STANDARD_DSV2` series).|
|[cloudServiceConfiguration](../batchservice/get-information-about-a-pool.md#bk_csconf)|Complex Type|The cloud service configuration for the pool.|
|[virtualMachineConfiguration](../batchservice/get-information-about-a-pool.md#bk_vmconf)|Complex Type|The virtual machine configuration for the pool.|
|[networkConfiguration](../batchservice/get-information-about-a-pool.md#bk_netconf)|Complex Type|The network configuration for the pool.|
|resizeTimeout|Time|The timeout for allocation of compute nodes to the pool specified for the last resize operation on the pool.  \(The initial sizing when the pool is created counts as a resize.\)|
|[resizeError](../batchservice/get-information-about-a-pool.md#bk_reserr)|Complex Type|Contains details of any error encountered while performing the last resize on the pool.<br /><br /> This element is present only if an error occurred during the last pool resize, and only when the pool allocationState is steady.|
|currentDedicated|Int32|The number of compute nodes currently assigned to the pool.|
|targetDedicated|Int32|The number of compute nodes that are requested for the pool.|
|enableAutoScale|Bool|Specifies whether the pool size automatically adjusts over time.|
|autoScaleFormula|String|The formula for the desired number of compute nodes in the pool.<br /><br /> This element is present only if the pool automatically scales, i.e. enableAutoScale is true.|
|autoScaleEvaluationInterval|Time|The time interval at which to automatically adjust the pool size according to the autoscale formula.<br /><br /> This element is present only if the pool automatically scales, i.e. enableAutoScale is true.|
|[autoScaleRun](../batchservice/get-information-about-a-pool.md#bk_autrun)|Complex Type|Contains the results and errors from the last execution of the autoscale formula.<br /><br /> This element is present only if the pool automatically scales, i.e. enableAutoScale is true.|
|enableInterNodeCommunication|Bool|Specifies whether the pool is set up for direct communication between nodes.|
|[startTask](../batchservice/get-information-about-a-pool.md#bk_statask)|Complex Type|A task specified to run on each compute node as it joins the pool.<br /><br /> This element is present only if a start task is configured on the pool.|
|[certificateReferences](../batchservice/get-information-about-a-pool.md#bk_certref)|Collection|A list of certificates to be installed on each compute node in the pool.<br /><br /> This element is present only if at least one certificate is configured to be installed on the pool.|
|maxTasksPerNode|Int32|The maximum number of tasks that can run concurrently on a single compute node in the pool.|
|[taskSchedulingPolicy](../batchservice/get-information-about-a-pool.md#bk_tassched)|Complex Type|Defines how the Batch service distributes tasks between compute nodes in the pool.|
|[applicationPackageReferences](../batchservice/get-information-about-a-pool.md#applicationPackageReferences)|Collection|A list of application packages to be installed on each compute node in the pool.|
|[metadata](../batchservice/get-information-about-a-pool.md#bk_metadat)|Collection|Name value pairs associated with the pool as metadata.|
|[stats](../batchservice/get-information-about-a-pool.md#bk_postat)|Complex Type|The lifetime resource usage statistics for the pool.|

###  <a name="bk_csconf"></a> cloudServiceConfiguration

|Element name|Type|Notes|
|------------------|----------|-----------|
|osFamily|String|The Azure Guest OS family to be installed on the virtual machines in the pool.<br /><br /> Possible values are:<br /><br /> **2** – OS Family 2, equivalent to Windows Server 2008 R2 SP1.<br /><br /> **3** – OS Family 3, equivalent to Windows Server 2012.<br /><br /> **4** – OS Family 4, equivalent to Windows Server 2012 R2.<br /><br /> **5** – OS Family 5, equivalent to Windows Server 2016.<br /><br /> For more information, see [Azure Guest OS Releases](https://azure.microsoft.com/documentation/articles/cloud-services-guestos-update-matrix/#releases).|
|targetOSVersion|String|The Azure Guest OS version to be installed on the virtual machines in the pool.<br /><br /> The default value is * which specifies the latest operating system version for the specified family.<br /><br /> For other permitted values, see [Azure Guest OS Releases](https://azure.microsoft.com/documentation/articles/cloud-services-guestos-update-matrix/#releases).|
|currentOSVersion|String|The Azure Guest OS Version currently installed on the virtual machines in the pool.  This may differ from targetOSVersion if the pool state is upgrading.  In this case some virtual machines may be on the targetOSVersion and some may be on the currentOSVersion during the upgrade process.  Once all virtual machines have upgraded, currentOSVersion is updated to be the same as targetOSVersion.|

###  <a name="bk_vmconf"></a> virtualMachineConfiguration

|Element name|Type|Notes|
|------------------|----------|-----------|
|[imageReference](../batchservice/add-a-pool-to-an-account.md#bk_imgref)|Complex Type|Specifies information about the platform or Marketplace image to use.|
|nodeAgentSKUId|String|The SKU of the Batch node agent that needs to be provisioned on the compute node. An appropriate node agent SKU which matches the selected image reference must be provided.<br /><br /> To get the list of supported node agent SKUs along with their list of verified image references, see [List supported node agent SKUs](../batchservice/list-supported-node-agent-skus.md).|
|[windowsConfiguration](../batchservice/add-a-pool-to-an-account.md#bk_winconf)|Complex Type|Specifies Windows operating system settings on the virtual machine. This property must not be specified if the imageReference is referencing a Linux OS image.|

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

###  <a name="bk_reserr"></a> resizeError

|Element name|Type|Notes|
|------------------|----------|-----------|
|code|String|An identifier for the pool resize error.  Codes are invariant and are intended to be consumed programmatically.|
|message|String|A message describing the pool resize error, intended to be suitable for display in a user interface.|
|values|String|A list of additional error details related to the pool resize error.|

###  <a name="bk_autrun"></a> autoScaleRun

|Element name|Type|Notes|
|------------------|----------|-----------|
|timestamp|DateTime|Time of the last autoscale execution.|
|results|String|The final values of all variables used in the last evaluation of the autoscale formula.  Each variable value is returned in the form $variable\=value, and variables are separated by semicolons.|
|error|Complex Type|Contains details of the error encountered evaluating the autoscale formula on the pool, if the last evaluation was unsuccessful.|

###  <a name="bk_statask"></a> startTask

|Element name|Type|Notes|
|------------------|----------|-----------|
|commandLine|String|Specifies the command line of the start task|
|[resourceFiles](../batchservice/get-information-about-a-pool.md#bk_resfile)|Collection|Specifies a list of files that Batch will download to the compute node before running the command line.|
|[environmentSettings](../batchservice/get-information-about-a-pool.md#bk_enviset)|Collection|Specifies a list of environment variable settings for the start task.|
|[userIdentity](#userIdentity)|Complex Type|The user identity under which the task runs. If absent, the task runs as a non-administrative user unique to the task.|
|maxTaskRetryCount|Int32|Specifies the maximum number of times the task may be retried.|
|waitForSuccess|Bool|Specifies whether the Batch Service should wait for the start task to complete successfully \(that is, to exit with exit code 0\) before scheduling any tasks on the compute node.|

###  <a name="bk_resfile"></a> resourceFiles

|Element name|Type|Notes|
|------------------|----------|-----------|
|blobSource|String|Specifies the URL of a blob in Azure storage. The Batch service downloads the blob to the specified file path.|
|filePath|String|Specifies the location on the compute node to which the file should be downloaded.|
|fileMode|String|The file permission mode attribute in octal format. This property is applicable only if the resourceFile is downloaded to a Linux node. This property will be ignored if it is specified for a resourceFile which is downloaded to a Windows node.<br /><br /> If this property is not specified for a Linux node, then a default value of 0770 is applied to the file.|

###  <a name="bk_enviset"></a> environmentSettings

|Element name|Type|Notes|
|------------------|----------|-----------|
|name|String|Specifies the name of the environment variable|
|value|String|Specifies the value of the environment variable.|

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

###  <a name="bk_certref"></a> certificateReferences

|Element name|Type|Notes|
|------------------|----------|-----------|
|thumbprint|String|The thumbprint of the certificate.|
|thumbprintAlgorithm|String|The algorithm with which the thumbprint is associated.  This must be **sha1**.|
|storeLocation|String|The location of the certificate store on the compute node into which to install the certificate.<br /><br /> Possible values are:<br /><br /> **CurrentUser**<br /><br /> **LocalMachine**<br /><br /> The default value is **CurrentUser**.<br /><br /> This property is applicable only for pools created with cloudServiceConfiguration \(PaaS\) or virtualMachineConfiguration \(IaaS\) Windows nodes.<br /><br /> For Linux compute nodes, the certificates are stored in a directory inside the task working directory and an environment variable AZ\_BATCH\_CERTIFICATES\_DIR is supplied to the task to query for this location. For certificates with visibility of remoteuser, a certs directory is created in the user's home directory \(e.g., /home/\<user-name\>/certs\) where certificates are placed.|
|storeName|String|The name of the certificate store on the compute node into which to install the certificate.<br /><br /> Possible values are:<br /><br /> **My**<br /><br /> **Root**<br /><br /> **CA**<br /><br /> **Trust**<br /><br /> **Disallowed**<br /><br /> **TrustedPeople**<br /><br /> **TrustedPublisher**<br /><br /> **AuthRoot**<br /><br /> **AddressBook**<br /><br /> Any custom store name<br /><br /> The default value is **My**.<br /><br /> This property is applicable only for pools created with cloudServiceConfiguration \(PaaS\) or virtualMachineConfiguration \(IaaS\) Windows nodes.|
|visibility|Collection|Specifies which user accounts on the compute node should have access to the private data of the certificate.<br /><br /> This property is a collection of strings. Possible values for each visibility option are:<br /><br /> **starttask** – The user account under which the start task is run.<br /><br /> **task** – The accounts under which job tasks are run.<br /><br /> **remoteuser** – The accounts under which users remotely access the node.|

###  <a name="bk_tassched"></a> taskSchedulingPolicy

|Element name|Type|Notes|
|------------------|----------|-----------|
|nodeFillType|String|Specifies how tasks should be distributed across compute nodes.<br /><br /> Possible values are:<br /><br /> **pack** – As many tasks as possible \(maxTasksPerNode\) should be assigned to each node in the pool before any tasks are assigned to the next node in the pool.<br /><br /> **spread** – Tasks should be assigned evenly across all  nodes in the pool.|

###  <a name="applicationPackageReferences"></a> applicationPackageReferences

|Element name|Type|Notes|
|------------------|----------|-----------|
|applicationId|String|The id of the application to install.|
|version|String|The version of the application to install. If omitted, the default version is installed.|

###  <a name="bk_metadat"></a> metadata

|Element name|Type|Notes|
|------------------|----------|-----------|
|name|String|The name of the metadata setting.|
|value|String|The value of the metadata setting.|

###  <a name="bk_postat"></a> stats

|Element name|Type|Notes|
|------------------|----------|-----------|
|[usageStats](../batchservice/get-information-about-a-pool.md#bk_usasta)|Complex Type|Statistics related to pool usage information such as aggregated wall\-clock time of dedicated nodes in the pool.|
|[resourceStats](../batchservice/get-information-about-a-pool.md#bk_ressta)|Complex Type|Statistics related to resources consumed by nodes of the pool such as *AvgCPU*, *AvgMemory*.|

###  <a name="bk_usasta"></a> usageStats

|Element name|Type|Notes|
|------------------|----------|-----------|
|startTime|DateTime|Start time of the time range for the statistics.|
|endTime|DateTime|End time of the time range for the statistics.|
|dedicatedNodeTime|Time|Aggregated wall\-clock time of the dedicated nodes being part of the pool.|

###  <a name="bk_ressta"></a> resourceStats

|Element name|Type|Notes|
|------------------|----------|-----------|
|startTime|DateTime|Start time of the time range for the statistics.|
|endTime|DateTime|End time of the time range for the statistics.|
|avgCPUPercentage|Double|Average CPU usage across all nodes in the pool \(percentage per VM\).|
|avgMemoryGiB|Double|Average Memory usage (in GiB) across all nodes in the pool.|
|peakMemoryGiB|Double|Peak memory usage (in GiB) across all nodes in the pool.|
|avgDiskGiB|Int64|Average disk capacity (in GiB) used across all nodes in the pool.|
|peakDiskGiB|Int64|Peak disk capacity (in GiB) used across all nodes in the pool.|
|diskReadIOps|Int64|Total number of disk read operations across all nodes in the pool.|
|diskWriteIOps|Int64|Total number of disk write operations across all nodes in the pool.|
|diskReadGiB|Int64|Total amount of disk reads (in GiB) across all nodes in the pool.|
|diskWriteGiB|Int64|Total amount of disk writes (in GiB) across all nodes in the pool.|
|networkReadGiB|Int64|Total amount of network reads (in GiB) across all nodes in the pool.|
|networkWriteGiB|Int64|Total amount of network writes (in GiB) across all nodes in the pool.|

