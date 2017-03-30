---
title: "Delete a file from a compute node | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 3df3c8f0-baa0-4a48-8fe5-3e8bf9cb0a72
caps.latest.revision: 11
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Delete a file from a compute node
  Deletes the specified task file from the compute node.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to task files.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/tasks/{task-id}/files/{file-path}?api-version={api-version}&recursive=true`<br /><br /> `https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/nodes/{node-id}/files/{file-path}?api-version={api-version}&recursive=true`|  
  
 Replace {job-id} with the id of the job and {task-id} with the id of the task. Replace {file-path} with the path to the task file that you want to delete.  
  
 Replace {pool-id} with the id of the pool that contains the node and {} with the id of the node from which you want to delete the file.  Replace {file-path} with the path to the file that you want to delete.  
  
 If the file-path parameter represents a directory instead of a file, you can set the optional recursive parameter to true to delete the directory and all of the files and subdirectories in it. If recursive is false then the directory must be empty or deletion will fail.  
  
## Response  
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
  