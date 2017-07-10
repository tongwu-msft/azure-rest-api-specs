---
title: "Get data from a file on a compute node | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 68081338-3102-45af-9e9f-8a9974cc88c9
caps.latest.revision: 13
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Get data from a file on a compute node
  Gets the content of the specified task file.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to task files.

|Method|Request URI|
|------------|-----------------|
|GET or HEAD|`https://{account-name}.{region-id}.batch.azure.com/jobs/{job-id}/tasks/{task-id}/files/{file-path}?api-version={api-version}`<br /><br /> `https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/nodes/{node-id}/files/{file-path}?api-version={api-version}`|

 Replace {job\-id} with the id of the job and {task\-id} with the id of the task. Replace {file\-path} with the path to the task file that you want to get the contents of.

 Replace {pool\-id} with the id of the pool that contains the node and {node\-id} with the id of the node. Replace {file\-path} with the path to the task file that you want to get the contents of.

 This operation supports an optional ocp\-range header. If present, this specifies a range of bytes to return from the file. The format of the header is `bytes=startRange-endRange`.

> [!NOTE]
>  You can use the HEAD method to obtain the properties of the task file without getting the contents of the file. The file properties are returned as HTTP response headers.
>
>  -   The file creation time is returned in the ‘ocp\-creation\-time’ response header. This property is not returned for files on Linux compute nodes,
> -   The last modified time of the file is returned in the ‘Last\-Modified’ response header.
> -   The file size is returned in ‘Content\-Length’ response header.
> -   For Linux compute nodes, an additional header 'ocp\-batch\-file\-mode' is returned which indicates the file permission mode attribute in octal format.

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

 The response consists of the contents of the specified file.

