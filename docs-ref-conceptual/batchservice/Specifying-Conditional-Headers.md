---
title: "Specifying Conditional Headers | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b4eaa7c1-6397-4d45-81c4-ae8c27aa2071
caps.latest.revision: 18
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Specifying Conditional Headers
  The Batch service supports conditional headers on all the PUT, PATCH, DELETE, HEAD and GET operations on the following resources: pool, job schedule, job, task and files. A PUT/PATCH and possibly a POST call (the exact list of operations is listed below) on these resources can cause the ETag and Last-Modified-Time to change.  Both write operations (PUT/PATCH/POST) and read operations (GET/HEAD) will return the current ETag and a Last-Modified-Time for the resource.  These can be used in for subsequent conditional PUT, PATCH, POST, DELETE, HEAD or GET operations.  
  
 Pool, job schedule, job and task support both ETag and Last-Modified-Time. Files only support Last-Modified-Time because files are modified directly by tasks on the node using Windows File System APIs.  The Last-Modified-Time for files are based on the file system maintained file attributes. Nodes do not support any conditional operations.  
  
 The following table lists the APIs which support conditional operations and also the APIs which return the current ETag and Last-Modified time of the resource. All other APIs which are not listed in the below table do not support conditional headers and also do not return E-Tag/Last-Modified.  
  
|Operation|Supports Conditional Headers?|Returns E-Tag/Last-Modified Headers?|  
|---------------|-----------------------------------|---------------------------------------------|  
|[Get information about a pool](../batchservice/get-information-about-a-pool.md)|Yes|Yes|  
|[Add a pool to an account](../batchservice/add-a-pool-to-an-account.md)|No|Yes|  
|[Delete a pool from an account](../batchservice/delete-a-pool-from-an-account.md)|Yes|No|  
|[Upgrade the operating system of compute nodes in a pool](../batchservice/upgrade-the-operating-system-of-compute-nodes-in-a-pool.md)|Yes|Yes|  
|[Change the size of a pool](../batchservice/change-the-size-of-a-pool.md)|Yes|Yes|  
|[Remove compute nodes from a pool](../batchservice/remove-compute-nodes-from-a-pool.md)|Yes|Yes|  
|[Enable automatic scaling on a pool](../batchservice/enable-automatic-scaling-on-a-pool.md)|Yes|Yes|  
|[Disable automatic scaling on a pool](../batchservice/disable-automatic-scaling-on-a-pool.md)|Yes|Yes|  
|[Stop changing the size of a pool](../batchservice/stop-changing-the-size-of-a-pool.md)|Yes|Yes|  
|[Replace the properties of a pool](../batchservice/replace-the-properties-of-a-pool.md)|Yes|Yes|  
|[Update the properties of a pool](../batchservice/update-the-properties-of-a-pool.md)|Yes|Yes|  
|[Get data from a file on a compute node](../batchservice/get-data-from-a-file-on-a-compute-node.md)|Yes|Yes|  
|[Get data from a file on a compute node](../batchservice/get-data-from-a-file-on-a-compute-node.md)|Yes|Yes|  
|[Get information about a job schedule](../batchservice/get-information-about-a-job-schedule.md)|Yes|Yes|  
|[Add a job schedule to an account](../batchservice/add-a-job-schedule-to-an-account.md)|No|Yes|  
|[Delete a job schedule from an account](../batchservice/delete-a-job-schedule-from-an-account.md)|Yes|No|  
|[Update the properties of a job schedule](../batchservice/update-the-properties-of-a-job-schedule.md)|Yes|Yes|  
|[Enable a job schedule](../batchservice/enable-a-job-schedule.md)|Yes|Yes|  
|[Disable a job schedule](../batchservice/disable-a-job-schedule.md)|Yes|Yes|  
|[Terminate a job schedule](../batchservice/terminate-a-job-schedule.md)|Yes|Yes|  
|[Add a job to an account](../batchservice/add-a-job-to-an-account.md)|No|Yes|  
|[Get information about a job](../batchservice/get-information-about-a-job-in-batch.md)|Yes|Yes|  
|[Delete a job from an account](../batchservice/delete-a-job-from-an-account.md)|Yes|No|  
|[Update the properties of a job](../batchservice/update-the-properties-of-a-job.md)|Yes|Yes|  
|[Enable a job](../batchservice/enable-a-job.md)|Yes|Yes|  
|[Disable a job](../batchservice/disable-a-job.md)|Yes|Yes|  
|[Terminate a job](../batchservice/terminate-a-job.md)|Yes|Yes|  
|[Get information about a task](../batchservice/get-information-about-a-task.md)|Yes|Yes|  
|[Add a task to a job](../batchservice/add-a-task-to-a-job.md)|No|Yes|  
|[Delete a task from a job](../batchservice/delete-a-task-from-a-job.md)|Yes|No|  
|[Update the properties of a task](../batchservice/update-the-properties-of-a-task.md)|Yes|Yes|  
|[Terminate a task](../batchservice/terminate-a-task.md)|Yes|Yes|  
  
 You can specify conditional headers to carry out an operation only if a specified condition has been met.  
  
 The Batch service follows the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478) for conditional headers.  
  
## Supported Conditional Headers  
 The supported conditional headers are described in the following table.  Task Files only support if-modified-since and if-unmodified-since.  
  
|||  
|-|-|  
|Conditional header|Description|  
|If-Match|An ETag is specified.  Specify this header to perform the operation only if the resource’s ETag is an exact match as specified.|  
|If-None-Match|An ETag is specified.  Specify this header to perform the operation only if the resource’s ETag does not match the specified ETag.|  
|If-Modified-Since|A DateTime value. Specify this header to perform the operation only if the resource has been modified since the specified time.|  
|If-Unmodified-Since|A DateTime value. Specify this header to perform the operation only if the resource has not been modified since the specified date/time.|  
  
 The Batch service uses the below rules to process requests specifying conditional headers:  
  
-   If a request specifies both the *If-None-Match* and *If-Modified-Since* headers, the request is evaluated based on the criteria specified in *If-None-Match*.  
  
-   If a request specifies both the *If-Match* and *If-Unmodified-Since* headers, the request is evaluated based on the criteria specified in *If-Match*.  
  
-   With the exception of the two combinations of conditional headers listed above, a request may specify only a single conditional header. Specifying more than one conditional header results in status code 400 (Bad Request).  
  
## HTTP Response Codes for Operations Supporting Conditional Headers  
 Batch service returns an HTTP response code in accordance with the HTTP/1.1 protocol specification (RFC 2616).  
  
### Read Operations  
 The following table indicates the response codes returned for an unmet condition for each conditional header when the operation is a read operation. Read operations use the verbs GET or HEAD.  
  
|Conditional header|Response code if condition has not been met|  
|------------------------|-------------------------------------------------|  
|*If-Match*|Precondition Failed (412)|  
|*If-None-Match*|Not Modified (304)|  
|*If-Modified-Since*|Not Modified (304)|  
|*If-Unmodified-Since*|Precondition Failed (412)|  
  
### Write Operations  
 The following table indicates the response codes returned for an unmet condition for each conditional header when the operation is a write operation. Write operations use the verbs POST, PUT, PATCH or DELETE.  
  
|Conditional header|Response code if condition has not been met|  
|------------------------|-------------------------------------------------|  
|*If-Match*|Precondition Failed (412)|  
|*If-None-Match*|Precondition Failed (412)|  
|*If-Modified-Since*|Precondition Failed (412)|  
|*If-Unmodified-Since*|Precondition Failed (412)|  
  
  