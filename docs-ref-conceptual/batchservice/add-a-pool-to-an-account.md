---
title: "Add a pool to an account | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c5ad7f42-518c-4075-a4b7-8bd6e359f9af
caps.latest.revision: 49
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Add a pool to an account
  Adds a pool to the specified account.

> [!IMPORTANT]
>  When naming pools, avoid including sensitive information such as user names or secret project names. This information may appear in telemetry logs accessible to Microsoft Support engineers.

##  <a name="bk_lifetime"></a> Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to pools.

|Method|Request URI|
|------------|-----------------|
|POST|`https://{account-name}.{region-id}.batch.azure.com/pools?api-version={api-version}`|

 The following example shows a request to add a pool with cloud service configuration \(PaaS\) and without autoscaling enabled, without installing a start task and without installing certificates. See the examples later in this page for adding these optional elements.

```

{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#pools/@Element",
  "id":"mypool1",
  "displayName":"My Pool 1",
  "vmSize":"small",
  "cloudServiceConfiguration": {
    "osFamily":"5",
    "targetOSVersion":"*"
  },
  "resizeTimeout":"PT15M",
  "targetDedicatedNodes":5,
  "maxTasksPerNode":3,
  "taskSchedulingPolicy": {
    "nodeFillType":"Spread"
  },
  "enableAutoScale":false,
  "enableInterNodeCommunication":true,
  "metadata": [ {
    "name":"myproperty",
    "value":"myvalue"
  } ]
}

```

 The following example shows a request to add a pool with virtual machine configuration \(IaaS\) and without autoscaling enabled, without installing a start task and without installing certificates. See the examples later in this page for adding these optional elements.

```
{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#pools/@Element",
  "id":"mypool1",
  "displayName":"My Pool 1",
  "vmSize":"STANDARD_A1",
  "virtualMachineConfiguration": {
      "imageReference": {
        "publisher":"Canonical",
        "offer":"UbuntuServer",
        "sku":"14.04.4-LTS",
        "version":"latest"
      },
      "nodeAgentSKUId":"batch.node.ubuntu 14.04"
  },
  "resizeTimeout":"PT15M",
  "targetDedicatedNodes":5,
  "maxTasksPerNode":3,
  "taskSchedulingPolicy": {
    "nodeFillType":"Spread"
  },
  "enableAutoScale":false,
  "enableInterNodeCommunication":true,
  "userAccounts": [ {
    "name":"myaccount",
    "password":"mypassword",
    "elevationLevel":"nonAdmin"
  } ]  
  "metadata": [ {
    "name":"myproperty",
    "value":"myvalue"
  } ]
}

```

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|Id|Required|String|A string that uniquely identifies the pool within the account. The id can contain any combination of alphanumeric characters including hyphens and underscores, and cannot contain more than 64 characters.  The id is case\-preserving and case\-insensitive \(that is, you may not have two ids within an account that differ only by case\).|
|displayName|Optional|String|A display name for the pool. It need not be unique and can contain any Unicode characters up to a maximum length of 1024.|
|vmSize|Required|String|The size of the virtual machines in the pool. All virtual machines in a pool are the same size. <br/><br/> For information about available sizes of virtual machines for Cloud Services pools (pools created with cloudServiceConfiguration), see [Sizes for Cloud Services](http://azure.microsoft.com/documentation/articles/cloud-services-sizes-specs/). Batch supports all Cloud Services VM sizes except `ExtraSmall`, `Standard_A1_v2`, and `Standard_A2_v2`.<br/><br/> For information about available VM sizes for pools using images from the Virtual Machines Marketplace (pools created with virtualMachineConfiguration) see [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-linux-sizes/) (Linux) or [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-windows-sizes/) (Windows). Batch supports all Azure VM sizes except `STANDARD_A0` and those with premium storage (`STANDARD_GS`, `STANDARD_DS`, and `STANDARD_DSV2` series).|
|[cloudServiceConfiguration](../batchservice/add-a-pool-to-an-account.md#bk_csconf)|Optional|Complex Type|The cloud service configuration for the pool. This property must be specified if the pool needs to be created with Azure PaaS VMs.<br />Note that the cloudServiceConfiguration and virtualMachineConfiguration properties are mutually exclusive and only one of the properties can be specified. If neither is specified then the Batch service returns Bad Request \(400\).<br /><br />This property cannot be specified if the Batch account was created with its poolAllocationMode property set to 'UserSubscription'.|
|[virtualMachineConfiguration](../batchservice/add-a-pool-to-an-account.md#bk_vmconf)|Optional|Complex Type|The virtual machine configuration for the pool. This property must be specified if the pool needs to be created with Azure IaaS VMs.<br />Note that the cloudServiceConfiguration and virtualMachineConfiguration properties are mutually exclusive and only one of the properties can be specified. If neither is specified then the Batch service returns Bad Request \(400\).|
|[networkConfiguration](../batchservice/add-a-pool-to-an-account.md#bk_netconf)|Optional|Complex Type|The network configuration for the pool.|
|resizeTimeout|Optional|Time|Specifies the timeout for allocation of compute nodes to the pool.<br /><br /> This timeout applies only to manual scaling; it has no effect when enableAutoScale is set to true.<br /><br /> The default value is 15 minutes.<br /><br /> The minimum value is 5 minutes. If you specify a value less than 5 minutes, the Batch service returns a Bad Request \(400\).|
|targetDedicatedNodes|Optional|Int32|Specifies the desired number of dedicated compute nodes in the pool.<br /><br /> This property must not be specified if enableAutoScale is set to true.  If enableAutoScale is set to false, then you must set either targetDedicatedNodes, targetLowPriorityNodes, or both.|
|targetLowPriorityNodes|Optional|Int32|Specifies the desired number of low-priority compute nodes in the pool.<br /><br /> This property must not be specified if enableAutoScale is set to true.  If enableAutoScale is set to false, then you must set either targetDedicatedNodes, targetLowPriorityNodes, or both.|
|maxTasksPerNode|Optional|Int32|The maximum number of tasks that can run concurrently on a single compute node in the pool.<br /><br /> The default value is 1.<br /><br /> The maximum value of this setting depends on the size of the compute nodes in the pool \(the vmSize setting\).|
|[taskSchedulingPolicy](../batchservice/add-a-pool-to-an-account.md#bk_schedpol)|Optional|Complex Type|Defines how the Batch service distributes tasks between compute nodes in the pool.|
|autoScaleFormula|Optional|String|Specifies a formula for the desired number of compute nodes in the pool.<br /><br /> This property must not be specified if enableAutoScale is set to false. It is required if enableAutoScale is set to true.<br /><br /> The formula is checked for validity before the pool is created. If the formula is not valid, the Batch service rejects the request with detailed error information. For more information about specifying this formula, see [Automatically scale compute nodes in an Azure Batch pool](https://azure.microsoft.com/documentation/articles/batch-automatic-scaling/).|
|autoScaleEvaluationInterval|Optional|Time|Specifies a time interval at which to automatically adjust the pool size according to the AutoScale formula.<br />The default value is 15 minutes.<br /><br /> The minimum and maximum value are 5 minutes and 168 hours respectively. If you specify a value less than 5 minutes or greater than 168 hours, the Batch service returns a Bad Request \(400\).|
|enableAutoScale|Optional|Boolean|Specifies whether the pool size should automatically adjust over time.<br /><br />If false, the targetDedicatedNodes element is required. If true, the autoScaleFormula element is required. The pool automatically resizes according to the formula. The default value is false.|
|enableInterNodeCommunication|Optional|Boolean|Specifies whether the pool permits direct communication between nodes.<br /><br /> Enabling inter\-node communication limits the maximum size of the pool due to deployment restrictions on the nodes of the pool. This may result in the pool not reaching its desired size.<br /><br /> The default value is false.|
|[startTask](../batchservice/add-a-pool-to-an-account.md#bk_starttask)|Optional|Complex Type|Specifies a task to run on each compute node as it joins the pool. The task runs when the node is added to the pool or when the node is restarted.|
|[certificateReferences](../batchservice/add-a-pool-to-an-account.md#certificateReferences)|Optional|Collection|A list of certificates to be installed on each compute node in the pool.<br /><br /> Each certificate in the list must have been previously added to the Batch account. For more information about adding certificates, see [Add a certificate to an account](../batchservice/add-a-certificate-to-an-account.md).|
|applicationPackageReferences|Optional|Collection|A list of application packages to be installed on each compute node in the pool.<br /><br /> This property is currently not supported on auto pools created with the virtualMachineConfiguration \(IaaS\) property.|
|[userAccounts](#userAccount)|Optional|Collection|The list of user accounts to be created on each node in the pool.|
|applicationLicenses|Optional|Collection|The list of application licenses the Batch service will make available on each compute node in the pool.<br /><br /> The list of application licenses must be a subset of available Batch service application licenses. If a license is requested which is not supported, pool creation will fail.|
|[metadata](../batchservice/add-a-pool-to-an-account.md#bk_meta)|Optional|Collection|A list of name\-value pairs associated with the pool as metadata.<br /><br /> The Batch service does not assign any meaning to metadata; it is solely for the use of user code.|

###  <a name="bk_csconf"></a> cloudServiceConfiguration

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|osFamily|Required|String|The Azure Guest OS family to be installed on the virtual machines in the pool.<br /><br /> Possible values are:<br /><br /> **2** – OS Family 2, equivalent to Windows Server 2008 R2 SP1.<br /><br /> **3** – OS Family 3, equivalent to Windows Server 2012.<br /><br /> **4** – OS Family 4, equivalent to Windows Server 2012 R2.<br /><br /> **5** – OS Family 5, equivalent to Windows Server 2016.<br /><br /> For more information, see [Azure Guest OS Releases](https://azure.microsoft.com/documentation/articles/cloud-services-guestos-update-matrix/#releases).|
|targetOSVersion|Optional|String|The Azure Guest OS version to be installed on the virtual machines in the pool.<br /><br /> The default value is * which specifies the latest operating system version for the specified family.<br /><br /> For other permitted values, see [Azure Guest OS Releases](https://azure.microsoft.com/documentation/articles/cloud-services-guestos-update-matrix/#releases).|

### <a name="bk_vmconf"></a> virtualMachineConfiguration

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|[imageReference](../batchservice/add-a-pool-to-an-account.md#bk_imgref)|Optional|Complex Type|Specifies information about the platform or Marketplace image to use.|
|nodeAgentSKUId|Required|String|The SKU of the Batch node agent that needs to be provisioned on the compute node. An appropriate node agent SKU which matches the selected image reference must be provided.<br /><br /> To get the list of supported node agent SKUs along with their list of verified image references, see [List supported node agent SKUs](../batchservice/list-supported-node-agent-skus.md).<br /><br /> This property and the osDisk property are mutually exclusive; you must specify one or the other.|
|[osDisk](#bk_osdisk)|Optional|Complex Type|A reference to an OS disk image.<br /><br /> This property and the imageReference property are mutually exclusive; you must specify one or the other.|
|[windowsConfiguration](../batchservice/add-a-pool-to-an-account.md#bk_winconf)|Optional|Complex Type|Specifies Windows operating system settings on the virtual machine. This property must not be specified if the imageReference or osDisk property references a Linux OS image.|

###  <a name="bk_imgref"></a> imageReference

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|publisher|Required|String|The publisher of the image.<br /><br /> To get the list of all imageReferences verified by Azure Batch, see [List supported node agent SKUs](../batchservice/list-supported-node-agent-skus.md).|
|offer|Required|String|The offer of the image.|
|sku|Required|String|The SKU of the image.|
|version|Optional|String|The version of the image. A value of 'latest' can be specified to select the latest version of an image. The default value is 'latest'.|

###  <a name="bk_osdisk"></a> osDisk

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|imageUris|Required|Collection|The collection of Virtual Hard Disk (VHD) URIs.<br /><br /> All the VHDs must be identical and must reside in an Azure Storage account within the same subscription and same region as the Batch account. For best performance, it is recommended that each VHD resides in a separate Azure Storage account. Each VHD can serve up to 20 Windows compute nodes or 40 Linux compute nodes. You must supply enough VHD URIs to satisfy the 'targetDedicatedNodes' property of the pool. If you do not supply enough VHD URIs, the pool will partially allocate compute nodes, and a resize error will occur.|
|caching|Optional|String|The type of caching to enable for the OS disk.|

###  <a name="bk_winconf"></a> windowsConfiguration

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|enableAutomaticUpdates|Optional|Boolean|Indicates whether the virtual machine is enabled for automatic updates. If this property is not specified, the default value is true.|

###  <a name="bk_netconf"></a> networkConfiguration

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|subnetId|Required|String|Specifies the resource identifier of the subnet in which the pool's compute nodes should be created. The following conditions must be met:<ul> <li>The specified [Virtual Network (VNet)](https://azure.microsoft.com/documentation/articles/virtual-networks-overview/) must be in the same Azure region as the Azure Batch account.</li> <li>The specified VNet must be in the same subscription as the Azure Batch account.</li> <li>The type of VNet supported depends on how pools are being allocated for the Batch account: <ul> <li>If the Batch account was created with its poolAllocationMode property set to 'BatchService', then the specified VNet must be a classic VNet.</li> <li>If the Batch account was created with its poolAllocationMode property set to 'UserSubscription', then the specified VNet may be a classic VNet or an Azure Resource Manager VNet. Pools must be created with a virtual machine configuration to use a VNet. Pools created with a cloud service configuration are not supported.</li> </ul> </li> <li>If the Batch account was created with its poolAllocationMode property set to 'BatchService', then you must provide permissions for the Batch service principal to access the VNet. The Batch service principal, named 'Microsoft Azure Batch' or 'MicrosoftAzureBatch', must have the [Classic Virtual Machine Contributor Role-Based Access Control (RBAC) role](https://azure.microsoft.com/en-us/documentation/articles/role-based-access-built-in-roles/#classic-virtual-machine-contributor) for the specified VNet. If the specified RBAC role is not provided, the Batch service returns 400 (Bad Request). </li> <li>The specified subnet should have enough free IP addresses to accommodate the targetDedicatedNodes property. If the subnet doesn't have enough free IP addresses, the pool will partially allocate compute nodes, and a resize error will occur.</li> <li>The specified subnet must allow communication from the Azure Batch service to be able to schedule tasks on the compute nodes. This can be verified by checking if the specified VNet has any associated Network Security Groups (NSG). If communication to the compute nodes in the specified subnet is denied by an NSG, then the Batch service will set the state of the compute nodes to unusable. </li> <li>If the specified VNET has any associated Network Security Groups (NSG), then a few reserved system ports must be enabled for inbound communication. For pools created with a virtual machine configuration, enable ports 29876 and 29877, as well as port 22 for Linux and port 3389 for Windows. For pools created with a cloud service configuration, enable ports 10100, 20100, and 30100. Also enable outbound connections to Azure Storage on port 443.</li></ul>|

###  <a name="bk_schedpol"></a> taskSchedulingPolicy

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|nodeFillType|No|String|Specifies how tasks should be distributed across compute nodes<br /><br /> Possible values are:<br /><br /> **pack** – As many tasks as possible \(maxTasksPerNode\) should be assigned to each node in the pool before any tasks are assigned to the next node in the pool.<br /><br /> **spread** – Tasks should be assigned evenly across all  nodes in the pool.|

###  <a name="bk_starttask"></a> startTask

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|commandLine|Yes|String|Specifies the command line of the start task.|
|[resourceFiles](../batchservice/add-a-pool-to-an-account.md#bk_resfile)|No|Collection|A list of files that Batch will download to the compute node before running the command line.<br /><br /> If you are providing the executable for the startup task, at least one instance of this element is required to specify the source location and target location of the executable file.<br /><br /> If the task requires additional supporting files, add additional instances of this element to list these files.<br /><br /> Files that listed under this element are located in the task’s wd directory. For more information, see [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md).<br /><br /> If the command line is a default server program, and requires no additional supporting files, you do not need to include this element.|
|[environmentSettings](../batchservice/add-a-pool-to-an-account.md#bk_envset)|No|Collection|A list of environment variable settings for the start task.|
|[userIdentity](#userIdentity)|No|Complex Type|The user identity under which the task runs. If omitted, the task runs as a non-administrative user unique to the task.|
|maxTaskRetryCount|No|Int32|The maximum number of times the task may be retried. The Batch service retries a task if its exit code is nonzero.<br /><br /> Note that this value specifically controls the number of retries. The Batch service will try the task once, and may then retry up to this limit. For example, if the maximum retry count is 3, Batch tries the task up to 4 times \(one initial try and 3 retries\).<br /><br /> If the maximum retry count is 0, the Batch service does not retry the task.<br /><br /> If the maximum retry count is \-1, the Batch service retries the task without limit.|
|waitForSuccess|No|Boolean|Specifies whether the Batch Service should wait for the start task to complete successfully \(that is, to exit with exit code 0\) before scheduling any tasks on the compute node.<br /><br /> If true and the start task fails on a compute node, the Batch service retries the start task up to its maximum retry count \(maxTaskRetryCount\).  If the task has still not completed successfully after all retries, then the Batch service marks the compute node unusable, and will not schedule tasks to it.  This condition can be detected via the node state and scheduling error detail.<br /><br /> If false, the Batch service will not wait for the start task to complete. In this case, other tasks can start executing on the compute node while the start task is still running; and even if the start task fails, new tasks will continue to be scheduled on the node.<br /><br /> The default is false.|

###  <a name="bk_resfile"></a> resourceFiles

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|blobSource|Yes|String|The URL of a blob in Azure storage. The Batch service downloads the blob to the specified file path.<br /><br /> The URL must be readable using anonymous access; that is, the Batch service does not present any credentials when downloading the blob.  There are two ways to get such a URL for a blob in Azure storage: use a Shared Access Signature \(SAS\) granting read permissions on the blob, or Set the ACL for the blob’s container to allow public access.|
|filePath|Yes|String|The location on the compute node to which the file should be downloaded.|
|fileMode|No|String|The file permission mode attribute in octal format. This property is applicable only if the resourceFile is downloaded to a Linux node. This property will be ignored if it is specified for a resourceFile which is downloaded to a Windows node.<br /><br /> If this property is not specified for a Linux node, then a default value of 0770 is applied to the file.|

###  <a name="bk_envset"></a> environmentSettings

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|name|Yes|String|The name of the environment variable.|
|value|No|String|The value of the environment variable.|

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

###  <a name="certificateReferences"></a> certificateReferences

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|thumbprint|Yes|String|The thumbprint of the certificate.|
|thumbprintAlgorithm|Yes|String|The algorithm with which the thumbprint is associated. This must be **sha1**.|
|storeLocation|No|String|The location of the certificate store on the compute node into which to install the certificate.<br /><br /> Possible values are:<br /><br /> **CurrentUser**<br /><br /> **LocalMachine**<br /><br /> The default value is **CurrentUser**.<br /><br /> This property is applicable only for pools created with cloudServiceConfiguration \(PaaS\) or virtualMachineConfiguration \(IaaS\) Windows nodes.<br /><br /> For Linux compute nodes, the certificates are stored in a directory inside the task working directory and an environment variable AZ\_BATCH\_CERTIFICATES\_DIR is supplied to the task to query for this location. For certificates with visibility of remoteuser, a certs directory is created in the user's home directory \(e.g., /home/\<user-name\>/certs\) where certificates are placed.|
|storeName|No|String|The name of the certificate store on the compute node into which to install the certificate.<br /><br /> Possible values are:<br /><br /> **My**<br /><br /> **Root**<br /><br /> **CA**<br /><br /> **Trust**<br /><br /> **Disallowed**<br /><br /> **TrustedPeople**<br /><br /> **TrustedPublisher**<br /><br /> **AuthRoot**<br /><br /> **AddressBook**<br /><br /> Any custom store name<br /><br /> The default value is **My**.<br /><br /> This property is applicable only for pools created with cloudServiceConfiguration \(PaaS\) or virtualMachineConfiguration \(IaaS\) Windows nodes.|
|visibility|No|Collection|Specifies which user accounts on the compute node should have access to the private data of the certificate.<br /><br /> This property is a collection of strings. Possible values for each visibility option are:<br /><br /> **starttask** – The user account under which the start task is run.<br /><br /> **task** \- The accounts under which job tasks are run.<br /><br /> **remoteuser** \- The accounts under which users remotely access the node.<br /><br /> You can specify more than one visibility value in this collection.  For example, \["starttask","task"\] grants access to both the start task and job tasks, but not for remote login users.<br /><br /> The default is that the certificate is visible to all the user accounts listed above, i.e., a value of \["starttask","task", "remoteuser"\].|

###  <a name="bk_apkgreference"></a> applicationPackageReferences

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|applicationId|Required|String|The id of the application to install.|
|version|Optional|String|The version of the application to install.<br />If omitted, the default version is installed. If no default version is specified for this application, the request fails with HTTP status code 403 and error code InvalidApplicationPackageReferences.|

### <a name="userAccount"></a> userAccount
|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|name|Required|String|The name of the user account.|
|password|Required|String|The password for the user account.|
|elevationLevel|Optional|String|The elevation level of the user account.<br /><br />**nonAdmin** - The auto user is a standard user without elevated access.<br /><br />**admin** - The auto user is a user with elevated access and operates with full Administrator permissions.<br /><br />The default value is **nonAdmin**.|
|linuxUserConfiguration|Optional|String|The Linux-specific user configuration for the user account. This property is ignored if specified on a Windows pool. If not specified, the user is created with the default options.|

### <a name="linuxUserConfiguration"></a> linuxUserConfiguration
|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|uid|Optional|Integer|The user ID of the user account.<br /><br />The uid and gid properties must be specified together or not at all. If these properties are not specified, the underlying operating system picks the uid.|
|gidname|Optional|Integer|The group ID for the user account.<br /><br />"The uid and gid properties must be specified together or not at all. If these properties are not specified the underlying operating system picks the gid.|
|sshPrivateKey|Optional|String|The SSH private key for the user account.<br /><br />The SSH private key is used to automatically configure password-less SSH between nodes in a Linux pool when the pool's enableInterNodeCommunication property is true. If not specified, password-less SSH is not configured between nodes.|

###  <a name="bk_meta"></a> metadata

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|name|Yes|String|Name of the metadata setting.|
|value|Yes|String|Value of the metadata setting.|

 The following example shows an autoscale formula that increases the number of compute nodes that are used by 10% when the CPU usage in the pool for past 10 minutes stays over 70%. The formula is evaluated every 10 minutes.

```

{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#pools/@Element",
  "id":"mypool1",
  "vmSize":"STANDARD_A1",
  "virtualMachineConfiguration": {
      "imageReference": {
        "publisher":"Canonical",
        "offer":"UbuntuServer",
        "sku":"14.04.4-LTS",
        "version":"latest"
      },
      "nodeAgentSKUId":"batch.node.ubuntu 14.04"
  },
  "resizeTimeout":"PT15M",
  "targetDedicatedNodes":5,
  "maxTasksPerNode":3,
  "taskSchedulingPolicy": {
    "nodeFillType":"Spread"
  },
  "enableAutoScale":false,
  "enableInterNodeCommunication":true,
  "startTask": {
    "commandLine":"myprogram.exe",
    "resourceFiles": [ {
      "blobSource":"http://mystorage1.blob.core.windows.net/scripts/myprogram.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
      "filePath":"myprogram.exe"
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
    "thumbprint":"########################################",
    "thumbprintAlgorithm":"sha1",
    "visibility":["task"]
  } ],
  "metadata": [ {
    "name":"myproperty",
    "value":"myvalue"
  } ]
}

```

 The following example specifies that myprogram.exe should run as a start task on each compute node, with elevated permissions and a custom environment variable.

```

{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#pools/@Element",
  "id":"mypool1",
  "vmSize":"small",
  "cloudServiceConfiguration": {
    "osFamily":"5",
    "targetOSVersion":"*"
  },
  "resizeTimeout":"PT15M",
  "targetDedicatedNodes":5,
  "maxTasksPerNode":3,
  "taskSchedulingPolicy": {
    "nodeFillType":"Spread"
  },
  "enableAutoScale":false,
  "enableInterNodeCommunication":true,
  "startTask": {
    "commandLine":"myprogram.exe",
    "resourceFiles": [ {
      "blobSource":"http://mystorage1.blob.core.windows.net/scripts/myprogram.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
      "filePath":"myprogram.exe"
    }],
    "environmentSettings":[{
      "name":"myvariable",
      "value":"myvalue"
    }],
    "userIdentity": {
      "autoUser": {
        "scope":"task",
        "elevationLevel":"admin"
      }
    },
    "maxTaskRetryCount":2,
    "waitForSuccess":true
  },
  "metadata": [ {
    "name":"myproperty",
    "value":"myvalue"
  } ]
}

```

 The following example installs a certificate into the machine root certificate store of all compute nodes, and makes it available to job tasks but not the start task or Remote Desktop users.

```

{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#pools/@Element",
  "id":"mypool1",
  "vmSize":"small",
  "cloudServiceConfiguration": {
    "osFamily":"5",
    "targetOSVersion":"*"
  },
  "resizeTimeout":"PT15M",
  "targetDedicatedNodes":5,
  "maxTasksPerNode":3,
  "taskSchedulingPolicy": {
    "nodeFillType":"Spread"
  },
  "enableAutoScale":false,
  "enableInterNodeCommunication":true,
  "startTask": {
    "commandLine":"myprogram.exe",
    "resourceFiles": [ {
      "blobSource":"http://mystorage1.blob.core.windows.net/scripts/myprogram.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
      "filePath":"myprogram.exe"
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
    "thumbprint":"########################################",
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

```

## Response
 Status code: 201. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

## Remarks
 The enableInterNodeCommunication element imposes restrictions on which nodes can be assigned to the pool.  Specifying this value can reduce the chance of the requested number of nodes to be allocated in the pool.

 If certificate references are specified on a pool with cloudServiceConfiguration \(PaaS\) or virtualMachineConfiguration \(IaaS\) Windows nodes, then the Batch service installs the certificates to the specified certificate store and location. For Linux compute nodes, the certificates are stored in a directory inside the task working directory and an environment variable AZ\_BATCH\_CERTIFICATES\_DIR is supplied to the task to query for this location. For certificates with visibility of remoteuser, a certs directory is created in the user's home directory \(e.g., /home/\<user-name\>/certs\) where certificates are placed.

