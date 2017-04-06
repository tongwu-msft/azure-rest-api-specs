---
title: "List the tasks associated with a job | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: d67f9ca1-fa4a-4e43-92eb-92d5b7e79a29
caps.latest.revision: 13
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# List the tasks associated with a job
  List all of the tasks that are associated with the specified job.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to jobs.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/tasks?$skiptoken={skiptoken}&$filter={filter}&$select={select-list}&$expand=stats&maxresults={result-number}&api-version={api-version}`|

 Replace {job\-id} with the id of the job whose tasks you want to retrieve.

 The value for {filter} can be the following or any AND-ed or OR-ed combination of the following:

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|id|startswith, eq, ge, gt, le, lt, ne|String|
|state|eq|String|
|stateTransitionTime|eq, ne, ge, gt, le , lt|DateTime|
|creationTime|eq, ne, ge, gt, le , lt|DateTime|
|lastModifiedTime|eq, ne, ge, gt, le , lt|DateTime|
|executionInfo/startTime|eq, ne, ge, gt, le , lt|DateTime|
|executionInfo/endTime|eq, ne, ge, gt, le , lt|DateTime|
|executionInfo/exitCode|eq, ne, ge, gt, le , lt|Int|

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

 The following example shows information about a task that is waiting to run:

```
{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#tasks",
  "value": [ {
    "id":"mytask1",
    "url":"https://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks/mytask1",
    "eTag":"#################",
    "creationTime":"2014-09-17T17:41:17.0639929Z",
    "lastModified":"2014-09-17T17:41:17.0639929Z",
    "state":"active",
    "stateTransitionTime":"2014-09-17T18:10:34.7362713Z",
    "previousState":"active",
    "previousStateTransitionTime":"2014-09-17T18:10:34.1126725Z",
    "commandLine":"myprogram.exe",
    "resourceFiles": [ {
      "blobSource":"http://mystorage1.blob.core.windows.net/scripts/myprogram.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
      "filePath":"myprogram.exe"
    } ],
    "authenticationTokenSettings" : [ {
      "access":"job"
    } ]    
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
    "constraints": {
      "maxWallClockTime":"P10675199DT2H48M5.4775807S",
      "retentionTime":"P10675199DT2H48M5.4775807S",
      "maxTaskRetryCount":-1
    },
    "executionInfo": {
      "retryCount":3383,
      "lastRetryTime":"2014-09-17T18:10:35.2391688Z",
      "requeueCount":0
    }
  } ]
}

```

 The following example shows information about a running task, which includes information about the compute node on which the task is running, and the pool that contains the compute node:

```
{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#tasks",
  "value": [ {
    "id":"mytask1",
    "url":"https://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks/mytask1",
    "eTag":"#################",
    "creationTime":"2014-09-17T17:41:17.0639929Z",
    "lastModified":"2014-09-17T17:41:17.0639929Z",
    "state":"running",
    "stateTransitionTime":"2014-09-17T17:41:26.028162Z",
    "previousState":"active",
    "previousStateTransitionTime":"2014-09-17T17:41:17.0639929Z",
    "commandLine":"myprogram.exe",
    "resourceFiles": [ {
      "blobSource":"http://mystorage1.blob.core.windows.net/scripts/myprogram.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
      "filePath":"myprogram.exe"
    } ],
    "authenticationTokenSettings" : [ {
      "access":"job"
    } ]    
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
    "constraints": {
      "maxWallClockTime":"P10675199DT2H48M5.4775807S",
      "retentionTime":"P10675199DT2H48M5.4775807S",
      "maxTaskRetryCount":-1
    },
    "executionInfo": {
      "startTime":"2014-09-17T17:41:26.028162Z",
      "retryCount":1,
      "lastRetryTime":"2014-09-17T17:41:26.5564485Z",
      "requeueCount":0
    },
    "nodeInfo": {
      "affinityId":"TVM:tvm-2167304207_2-20140917t171233z",
      "nodeUrl":"https://myaccount.myregion.batch.azure.com/pools/mypool_766989E2-D66E-4FFB-94DC-7EA99C48E79D/nodes/tvm-2167304207_2-20140917t171233z",
      "poolId":"mypool_766989E2-D66E-4FFB-94DC-7EA99C48E79D",
      "nodeId":"tvm-2167304207_2-20140917t171233z",
      "taskRootDirectory":" tasks/myjob/job-1/mytask1/wd",
      "taskRootDirectoryUrl":"https://myaccount.myregion.batch.azure.com/pools/mypool_766989E2-D66E-4FFB-94DC-7EA99C48E79D/nodes/tvm-2167304207_2-20140917t171233z/files/tasks/myjob/job-1/mytask1/wd"
    }
  } ]
}

```

 The following example shows information about a multi\-instance task that is waiting to run.  Because the task is multi\-instance, information such as the node id, affinity info and root directories reflects the primary \(which is assumed to be where outputs will be gathered\):

```
{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#tasks",
  "value": [ {
    "id":"mytask1",
    "url":"https://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks/mytask1",
    "eTag":"#################",
    "creationTime":"2014-09-17T17:41:17.0639929Z",
    "lastModified":"2014-09-17T17:41:17.0639929Z",
    "state":"active",
    "stateTransitionTime":"2014-09-17T18:10:34.7362713Z",
    "previousState":"active",
    "previousStateTransitionTime":"2014-09-17T18:10:34.1126725Z",
    "commandLine":"myprogram.exe",
    "resourceFiles": [ {
      "blobSource":"http://mystorage1.blob.core.windows.net/scripts/myprogram.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
      "filePath":"myprogram.exe"
    } ],
    "authenticationTokenSettings" : [ {
      "access":"job"
    } ]    
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
    "constraints": {
      "maxWallClockTime":"P10675199DT2H48M5.4775807S",
      "retentionTime":"P10675199DT2H48M5.4775807S",
      "maxTaskRetryCount":-1
    },
    "executionInfo": {
      "retryCount":3383,
      "lastRetryTime":"2014-09-17T18:10:35.2391688Z",
      "requeueCount":0
    }
  } ],
  "multiInstanceSettings" : {
    "numberOfInstances": 3,
    "coordinationCommandLine": "cmd /c start cmd /c \"%MSMPI_BIN%\\smpd.exe\" -d",
   "commonResourceFiles": [ {
     "blobSource":"http://mystorage1.blob.core.windows.net/scripts/multiprogram.exe?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
     "filePath":"multiprogram.exe"
   },
   {
     "blobSource":"http://mystorage1.blob.core.windows.net/scripts/multitest.txt?st=2013-08-09T08%3a49%3a37.0000000Z&se=2013-08-10T08%3a49%3a37.0000000Z&sr=c&sp=d&si=YWJjZGTVMZw%3d%3d&sig= %2bSzBm0wi8xECuGkKw97wnkSZ%2f62sxU%2b6Hq6a7qojIVE%3d",
     "filePath":"multitest.txt"
   } ]
  }
}

```

|Element|Notes|
|-------------|-----------|
|state|Possible values are:<br /><br /> **active** – The task is queued and able to run, but is not currently assigned to a compute node. A task enters this state when it is created, when it is enabled after being disabled, or when it is waiting to retry after a failed run.<br /><br /> **preparing** – The task has been assigned to a compute node, but is waiting for a required Job Preparation task to complete on the node. If the Job Preparation task succeeds, the task will move to **running**. If the Job Preparation task fails, the task will return to **active** and will be eligible to be assigned to a different node.<br /><br /> **running** – The task is running on a compute node.  This includes task-level preparation such as downloading resource files or deploying application packages specified on the task – it does not necessarily mean that the task command line has started executing.<br /><br /> **completed** – The task is no longer eligible to run, usually because the task has finished successfully, or the task has finished unsuccessfully and has exhausted its retry limit.  A task is also marked as completed if an error occurred launching the task, or when the task has been terminated.|

