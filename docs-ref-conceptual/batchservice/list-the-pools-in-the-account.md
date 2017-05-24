---
title: "List the pools in the account | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: f37e3f20-f5ac-49e1-a026-586086a566b4
caps.latest.revision: 26
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# List the pools in the account
  Lists all of the pools in the specified account.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to pools.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.{region-id}.batch.azure.com/pools?$skiptoken={skiptoken}&$filter={filter}&$select={select-list}&$expand=stats&maxresults={result-number}&api-version={api-version}`|

 The value for {filter} can be the following or any AND-ed or OR-ed combination of the following:

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|id|startswith, eq, ne, ge, gt, le, lt|String|
|state|eq|String|
|stateTransitionTime|eq, ne, ge, gt, le , lt|DateTime|
|allocationState|eq|String|
|allocationStateTransitionTime|eq, ne, ge, gt, le , lt|DateTime|
|creationTime|eq, ne, ge, gt, le , lt|DateTime|
|enableAutoScale|eq, ne|Boolean|
|lastModified|eq, ne, ge, gt, le , lt|DateTime|
|vmSize|eq, ne|String|
|enableInterNodeCommunication|eq, ne|Boolean|

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

 The following example shows information about a pool that has an autoscale formula that scales based on the CPU percentage of the compute nodes:

```
{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#pools",
  "value": [ {
    "id":"mypool1",
    "url":"https://myaccount.myregion.batch.core.windows.net/pools/mypool1",
    "eTag":"#################",
    "lastModified":"2014-09-02T19:32:32.6050009Z",
    "creationTime":"2014-09-02T19:32:32.6050009Z",
    "state":"active",
    "stateTransitionTime":"2014-09-02T19:32:32.6050009Z",
    "allocationState":"steady",
    "allocationStateTransitionTime":"2014-09-02T19:32:34.2211084Z",
    "vmSize":"small",
    "resizeTimeout":"P1D",
    "currentDedicated":0,
    "targetDedicatedNodes":0,
    "enableAutoScale":true,
    "autoScaleFormula":"totalNodes=($CPUPercent.GetSamplePercent(TimeInterval_Minute*0,TimeInterval_Minute*10)<0.7?5:(min($CPUPercent.GetSample(TimeInterval_Minute*0, TimeInterval_Minute*10))>0.8?($CurrentDedicated*1.1):$CurrentDedicated));$targetDedicatedNodes=min(100,totalNodes);",
"autoScaleEvaluationInterval": "PT10M",
    "autoScaleRun": {
      "timestamp":"2014-09-23T21:37:40.6519011Z",
      "results":"$targetDedicatedNodes=5;$NodeDeallocationOption=requeue;totalNodes=5"
     },
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
    } ],
    "maxTasksPerNode":3,
    "taskSchedulingPolicy": {
      "nodeFillType":"Spread"
    }
  } ]
}

```

|Element|Notes|
|-------------|-----------|
|state|The current state of the pool. Possible values are:<br /><br /> **active** – The pool is available to run tasks subject to the availability of compute nodes.<br /><br /> **deleting** – The user has requested that the pool be deleted, but the delete operation has not yet completed.<br /><br /> **upgrading** – The user has requested that the operating system of the pool’s nodes be upgraded, but the upgrade operation has not yet completed (that is, some nodes in the pool have not yet been upgraded). The pool may be able to run tasks (with reduced capacity) but this is not guaranteed.|
|allocationState|Indicates whether the pool is resizing. Possible values are:<br /><br /> **steady** – The pool is not resizing. There are no changes to the number of nodes in the pool in progress. A pool enters this state when it is created and when no operations are being performed on the pool to change the number of dedicated nodes.<br /><br /> **resizing** – The pool is resizing; that is, compute nodes are being added to or removed from the pool.<br /><br /> **stopping** – The pool was resizing, but the user has requested that the resize be stopped, but the stop request has not yet been completed.|
|vmSize|The size of the virtual machines in the pool. All virtual machines in a pool are the same size. <br/><br/> For information about available sizes of virtual machines for Cloud Services pools (pools created with cloudServiceConfiguration), see [Sizes for Cloud Services](http://azure.microsoft.com/documentation/articles/cloud-services-sizes-specs/). Batch supports all Cloud Services VM sizes except `ExtraSmall`, `Standard_A1_v2`, and `Standard_A2_v2`.<br/><br/> For information about available VM sizes for pools using images from the Virtual Machines Marketplace (pools created with virtualMachineConfiguration) see [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-linux-sizes/) (Linux) or [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-windows-sizes/) (Windows). Batch supports all Azure VM sizes except `STANDARD_A0` and those with premium storage (`STANDARD_GS`, `STANDARD_DS`, and `STANDARD_DSV2` series).|
|autoScaleFormula|The formula that governs automatic scaling for the pool, if any. For more information about autoscale formulas, see [Automatically scale compute nodes in an Azure Batch pool](https://azure.microsoft.com/documentation/articles/batch-automatic-scaling/).|
|autoScaleEvaluationInterval|The time interval at which to automatically adjust the pool size according to the autoscale formula.<br /><br /> This element is present only if the pool automatically scales, i.e. enableAutoScale is true.|

