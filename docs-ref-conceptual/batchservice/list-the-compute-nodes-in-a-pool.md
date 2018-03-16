---
title: "List the compute nodes in a pool | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 876efb80-c367-4763-bf45-b0db6583f7c0
caps.latest.revision: 19
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# List the compute nodes in a pool
  List the compute nodes that are associated with the specified pool.  
  
## Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to pools.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/nodes?$skiptoken={skiptoken}&$filter={filter}&$select={select-list}&maxresults={result-number}&api-version={api-version}|  
  
 Replace {pool-id} with the id of the pool from which you want to list nodes.  
  
 The value for {filter} can be the following or any AND-ed or OR-ed combination of the following:  
  
|Property|Operations allowed|Type|  
|--------------|------------------------|----------|  
|state|eq|String|  
|stateTransitionTime|eq, ne, ge, gt, le , lt|DateTime|  
|lastBootTime|eq, ne, ge, gt, le , lt|DateTime|  
|allocationTime|eq, ne, ge, gt, le , lt|DateTime|  
|startTaskInfo/state|eq|String|  
|startTaskInfo/exitCode|eq, ne, ge, gt, le , lt|Int|  
|startTaskInfo/startTime|eq, ne, ge, gt, le , lt|DateTime|  
|startTaskInfo/endTime|eq, ne, ge, gt, le , lt|DateTime|  
  
## Response  
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
 The following example shows information about a compute node that has a start task and a certificate assigned to it.  
  
```  
{  
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#nodes",  
  "value": [ {  
    "id":"tvm-2167304207_1-20140905t174658z",  
    "url":"https://myaccount.myregion.batch.azure.com/pools/mypool1/nodes/tvm-2167304207_1-20140905t174658z",  
"state":"idle",  
"schedulingState":"enabled",  
    "stateTransitionTime":"2014-09-05T17:46:58.9909975Z",  
    "lastBootTime":"2014-09-05T17:46:58.7917915Z",  
    "allocationTime":"2014-09-05T17:46:58.7846116Z",  
    "ipAddress":"10.115.50.134",  
    "affinityId":"TVM:tvm-2167304207_1-20140905t174658z",  
    "vmSize":"small",  
    "totalTasksRun":1,  
    "totalTasksSucceeded":1,  
    "runningTasksCount":0,   
    "recentTasks": [ {  
      "taskUrl":"https://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks/mytask1",  
      "jobId":"job-0000000001",  
      "taskId":"mytask1",  
      "taskState":"completed",  
      "executionInfo":{  
        "startTime":"2014-09-05T18:05:36.037666Z",  
        "endTime":"2014-09-05T18:05:36.2612845Z",  
        "exitCode":0,  
        "retryCount":0,  
        "requeueCount":0  
      }  
    } ],  
    "startTask": {  
      "commandLine":"myprogram.exe",  
      "resourceFiles": [ {  
        "blobSource":"http://mystorage.blob.core.windows.net/scripts/myprogram.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",  
        "filePath":"myprogram.exe"  
      },  
      {  
        "blobSource":"http://mystorage.blob.core.windows.net/scripts/test.txt?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",  
        "filePath":"test.txt"  
      } ],  
      "environmentSettings": [ {  
        "name":"myvariable","value":"myvalue"  
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
      "startTime":"2014-09-05T17:47:00.0866305Z",  
      "endTime":"2014-09-05T17:47:00.845371Z",  
      "exitCode":0,  
      "retryCount":0  
    },  
    "certificateReferences": [ {  
      "thumbprint":"#############################################",  
      "thumbprintAlgorithm":"sha1",  
      "storeLocation":"LocalMachine",  
      "storeName":"Root",  
      "visibility":["task"]  
    } ]  
  } ]  
}  
  
```  
  
|Element|Notes|  
|-------------|-----------|  
|state|The current state of the node. Possible values are:<br /><br />**Creating** – The Batch service has obtained the underlying virtual machine from Azure Compute, but it has not yet started to join a pool.<br />**Starting** – The Batch service is starting on the underlying virtual machine.<br />**Waitingforstarttask** – The start task has started running on the compute node, but waitForSuccess is set and the start task has not yet completed.<br />**Starttaskfailed** – The start task has failed on the compute node (and exhausted all retries), and waitForSuccess is set. The node is not usable for running tasks.<br />**Idle** – The node is not currently running a task.<br />**offline** – The node is not currently running a task, and scheduling of new tasks to the node is disabled<br />**Rebooting** – The node is rebooting.<br />**Reimaging** – The node is being reimaged.<br />**Running** – The node is running one or more tasks (other than the start task).<br />**Leavingpool** – The node is leaving the pool, either because the user explicitly removed it or because the pool is resizing or autoscaling down.<br />**Unknown** – The Batch service has lost contact with the node, and does not know its true state.<br />**Unusable** – The node cannot be used for task execution due to errors.<br />-   **preempted** The low-priority node has been preempted. Running tasks will be rescheduled when another node becomes available. |  
|schedulingState|Specifies whether the node is available for task scheduling. Possible values are:<br /><br />**enabled** – Tasks can be scheduled on the node.<br />**disabled** – No new tasks will be scheduled on the node. Tasks already running on the node may still run to completion.<br /><br /> All nodes start with scheduling enabled.|  
|ipAddress|The IP address that other nodes can use to communicate with this node.This element is present only if enableInterNodeCommunication is set to true on the containing pool. For more information, see<br />          [Add a pool to an account](../batchservice/add-a-pool-to-an-account.md).|  
|affinityId|An identifier which can be passed in the Add Task API to request that the task be scheduled close to this compute node. For more information, see<br />          [Add a task to a job](../batchservice/add-a-task-to-a-job.md).|  
|vmSize|The size of the virtual machines in the pool. All virtual machines in a pool are the same size. <br/><br/> For information about available sizes of virtual machines for Cloud Services pools (pools created with cloudServiceConfiguration), see [Sizes for Cloud Services](http://azure.microsoft.com/documentation/articles/cloud-services-sizes-specs/). Batch supports all Cloud Services VM sizes except `ExtraSmall`, `Standard_A1_v2`, and `Standard_A2_v2`.<br/><br/> For information about available VM sizes for pools using images from the Virtual Machines Marketplace (pools created with virtualMachineConfiguration) see [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-linux-sizes/) (Linux) or [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-windows-sizes/) (Windows). Batch supports all Azure VM sizes except `STANDARD_A0` and those with premium storage (`STANDARD_GS`, `STANDARD_DS`, and `STANDARD_DSV2` series).|  
|totalTasksRun|The total number of job tasks completed on the compute node. This includes Job Preparation, Job Release and Job Manager tasks, but not the pool start task.|  
|totalTasksSucceeded|The total number of job tasks completed successfully (with exitCode 0) on the compute node. This includes Job Preparation, Job Release, and Job Manager tasks, but not the pool start task.|  
|runningTasksCount|The total number of job tasks currently running on the compute node. This includes Job Preparation, Job Release, and Job Manager tasks, but not the pool start task.|  
|isDedicated|Boolean|Indicates whether this compute node is a dedicated node. If false, the node is a low-priority node.|


## See Also  
 [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md)   
 [Batch Service Error Codes](../batchservice/batch-status-and-error-codes.md#bk_batchsererrcode)  
  
  