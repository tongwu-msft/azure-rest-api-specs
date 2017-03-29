---
title: "Replace the properties of a pool | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: fc04b4f5-54a6-4c8e-a3d4-8305ce025b91
caps.latest.revision: 23
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Replace the properties of a pool
  Fully replace all the updateable properties of the pool. For example, if the pool has a start task associated with it and if start task is not specified with this request, then the Batch service will remove the existing start task.

##  <a name="bk_lifetime"></a> Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to pools.

|Method|Request URI|
|------------|-----------------|
|POST|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/updateproperties?api-version={api-version}`|
|||

 Replace {pool\-id} with the id of the pool that you want to update.

 The following example shows a start task being added to the pool:

```

{
  "startTask": {
    "commandLine":"myprogram.exe",
    "resourceFiles": [ {
      "blobSource":"http://mystorage.blob.core.windows.net/scripts/myprogram.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
      "filePath":"myprogram.exe"
    }],
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
  "certificateReferences": [ ],
  "metadata": [ ]
}

```

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|[startTask](../batchservice/replace-the-properties-of-a-pool.md#startTask)|Optional|Complex Type|Specifies a task to run on each compute node as it joins the pool. The task runs when the node is added to the pool or when the node is restarted.If this element is present, it overwrites any existing start task.If this element is not present, any existing start task is removed from the pool.|
|[certificateReferences](../batchservice/replace-the-properties-of-a-pool.md#certificateReferences)|Required|Collection|A list of certificates to be installed on each compute node in the pool.This list replaces any existing certificate references configured on the pool.  If you specify an empty collection, any existing certificate references are removed from the pool.Each certificate in the list must have been previously added to the Batch account.<br /><br /> For more information about adding a certificate, see [Add a certificate to an account](../batchservice/add-a-certificate-to-an-account.md).|
|[applicationPackageReferences](../batchservice/replace-the-properties-of-a-pool.md#applicationPackageReferences)|Required|Collection|A list of application packages to be installed on each compute node in the pool.  The list replaces any existing application package references.  If you specify an empty collection, then all application package references are removed from the pool.<br /><br /> Changes to application package references affect all new compute nodes joining the pool, but do not affect compute nodes that are already in the pool until they are rebooted or reimaged.|
|[metadata](../batchservice/replace-the-properties-of-a-pool.md#metadata)|Required|Collection|A list of name\-value pairs associated with the pool as metadata.<br /><br /> This list replaces any existing metadata configured on the pool. If you specify an empty collection, any metadata is removed from the pool.|

###  <a name="startTask"></a> startTask

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|commandLine|Yes|String|Specifies the command line of the start task.|
|[resourceFiles](../batchservice/replace-the-properties-of-a-pool.md#resourceFiles)|No|Collection|A list of files that Batch will download to the compute node before running the command line.<br /><br /> If you are providing the executable for the task, at least one instance of this element is required to specify the source location and target location of the executable file. If the task requires additional supporting files, add additional instances of this element to list these files.<br /><br /> Files listed under this element are located in the task’s **wd** directory. For more information, see [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md). If the command line is a default server program, and requires no additional supporting files, you do not need to include this element.|
|[environmentSettings](../batchservice/replace-the-properties-of-a-pool.md#environmentSettings)|No|Collection|A list of environment variable settings for the start task.|
|[userIdentity](#userIdentity)|No|Complex Type|The user identity under which the task runs. If omitted, the task runs as a non-administrative user unique to the task.|
|maxTaskRetryCount|No|Int32|The maximum number of times the task may be retried. The Batch service retries a task if its exit code is nonzero. Note that this value specifically controls the number of retries. The Batch service will try the task once, and may then retry up to this limit. For example, if the maximum retry count is 3, Batch tries the task up to 4 times \(one initial try and 3 retries\). If the maximum retry count is 0, the Batch service does not retry the task. If the maximum retry count is \-1, the Batch service retries the task without limit.|
|waitForSuccess|No|Boolean|Specifies whether the Batch Service should wait for the start task to complete successfully \(that is, to exit with exit code 0\) before scheduling any tasks on the compute node. If true and the start task fails on a compute node, the Batch service retries the start task up to its maximum retry count \(maxTaskRetryCount\).  If the task has still not completed successfully after all retries, then the Batch service marks the compute node unusable, and will not schedule tasks to it.  This condition can be detected via the node state and scheduling error detail. If false, the Batch service will not wait for the start task to complete. In this case, other tasks can start executing on the compute node while the start task is still running; and even if the start task fails, new tasks will continue to be scheduled on the node. The default is true.|

###  <a name="resourceFiles"></a> resourceFiles

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|blobSource|Yes|String|The URL of a blob in Azure storage. The Batch service downloads the blob to the specified file path. The URL must be readable using anonymous access; that is, the Batch service does not present any credentials when downloading the blob.  There are two ways to get such a URL for a blob in Azure storage: use a Shared Access Signature \(SAS\) granting read permissions on the blob, or set the ACL for the blob’s container to allow public access.|
|filePath|Yes|String|The location on the compute node to which the file should be downloaded.|
|fileMode|No|String|The file permission mode attribute in octal format. This property is applicable only if the resourceFile is downloaded to a Linux node. This property will be ignored if it is specified for a resourceFile which is downloaded to a Windows node.<br /><br /> If this property is not specified for a Linux node, then a default value of 0770 is applied to the file.|

###  <a name="environmentSettings"></a> environmentSettings

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
|thumbprintAlgorithm|Yes|String|The algorithm with which the thumbprint is associated.  This must be **sha1**.|
|storeLocation|No|String|The location of the certificate store on the compute node into which to install the certificate. Possible values are:<br /><br /> **CurrentUser**<br /><br /> **LocalMachine**<br /><br /> The default value is **CurrentUser**.<br /><br /> This property is applicable only for pools created with cloudServiceConfiguration \(PaaS\) or virtualMachineConfiguration \(IaaS\) Windows nodes.<br /><br /> For Linux compute nodes, the certificates are stored in a directory inside the task working directory and an environment variable AZ\_BATCH\_CERTIFICATES\_DIR is supplied to the task to query for this location. For certificates with visibility of remoteuser, a certs directory is created in the user's home directory \(e.g., /home/\<user-name\>/certs\) where certificates are placed.|
|storeName|No|String|The name of the certificate store on the compute node into which to install the certificate. Possible values are:<br /><br /> **My**<br /><br /> **Root**<br /><br /> **CA**<br /><br /> **Trust**<br /><br /> **Disallowed**<br /><br /> **TrustedPeople**<br /><br /> **TrustedPublisher**<br /><br /> **AuthRoot**<br /><br /> **AddressBook**<br /><br /> Any custom store name<br /><br /> The default value is **My**.<br /><br /> This property is applicable only for pools created with cloudServiceConfiguration \(PaaS\) or virtualMachineConfiguration \(IaaS\) Windows nodes.|
|visibility|No|Collection|Specifies which user accounts on the compute node should have access to the private data of the certificate.<br /><br /> This property is a collection of strings. Possible values for each visibility option are:<br /><br /> **starttask** – The user account under which the start task is run.<br /><br /> **task** \- The accounts under which job tasks are run.<br /><br /> **remoteuser** \- The accounts under which users remotely access the node.<br /><br /> You can specify more than one visibility value in this collection.  For example, \["starttask","task"\] grants access to both the start task and job tasks, but not for remote login users.<br /><br /> The default is that the certificate is visible to all the user accounts listed above, i.e., a value of \["starttask","task", "remoteuser"\].|

###  <a name="applicationPackageReferences"></a> applicationPackageReferences

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|applicationId|Required|String|The id of the application to install.|
|version|Optional|String|The version of the application to install.<br /><br /> If omitted, the default version is installed.  If no default version is specified for this application, the request fails with HTTP status code 403 and error code InvalidApplicationPackageReferences.|

###  <a name="metadata"></a> metadata

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|name|Yes|String|The name of the metadata setting.|
|value|Yes|String|The value of the metadata setting.|

 The following example shows a start task, certificate, and a metadata property being added to the pool.

```
{
  "startTask": {
    "commandLine":"myprogram.exe",
    "resourceFiles": [ {
      "blobSource":"http://mystorage.blob.core.windows.net/scripts/myprogram.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
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
 Status code: 204. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md)

## Remarks
 To update only selected properties of a pool, use [Update the properties of a pool](../batchservice/update-the-properties-of-a-pool.md).

