---
title: "List the files associated with a task | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 6e4a5e67-dc09-4de2-8ae9-88a30987fcfb
caps.latest.revision: 12
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# List the files associated with a task
  Lists the files in the task’s directory on its compute node.  
  
## Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to tasks.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/tasks/{task-id}/files?$skiptoken={skiptoken}&$filter={filter}&maxresults={result-number}&api-version={api-version}&recursive=true`|  
  
 Replace {job-id} with the id of the job that contains the task. Replace {task-id} with the id of the task from which you want to list associated files.  
  
 The optional recursive parameter can be used to list all of the contents of the working directory. This parameter can be used in combination with the filter parameter to list specific type of files.  
  
 The value for {filter} can be the following:  
  
|Property|Operations allowed|Type|  
|--------------|------------------------|----------|  
|name|startswith|String|  
  
## Response  
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
 The following example shows a recursive list of files for a task:  
  
```  
  
{  
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#files",  
  "value": [ {  
    "name":"ProcessEnv.cmd",  
    "url":"https://myaccount.myregion.batch.azure.com/jobs/job-0000000001/tasks/mytask1/files/ProcessEnv.cmd",  
    "isDirectory":false,  
    "properties": {  
      "creationTime":"2014-09-19T15:18:01.4964853Z",  
      "lastModified":"2014-09-19T15:18:01.4964853Z",  
      "contentLength":"1978",  
      "contentType":"application/octet-stream"  
    }  
  },  
  {  
    "name":"stderr.txt",  
    "url":"https://myaccount.myregion.batch.azure.com/jobs/job-1/tasks/mytask1/files/stderr.txt",  
    "isDirectory":false,  
    "properties": {  
      "creationTime":"2014-09-19T15:18:01.4437543Z",  
      "lastModified":"2014-09-19T15:18:01.4437543Z",  
      "contentLength":"0",  
      "contentType":"application/octet-stream"  
    }  
  }]  
}  
  
```  
  
## Remarks  
 The fileMode property is returned by the  Batch service only for Linux compute nodes. Also, the creationTime property is not returned for Linux compute nodes.  
  
  