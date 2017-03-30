---
title: "List the files on a node | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 6d47922e-235e-4751-8185-b98994e5ff43
caps.latest.revision: 12
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# List the files on a node
  Lists all of the files in task directories on the specified node.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to nodes.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/nodes/{node-id}/files?$skiptoken={skiptoken}&$filter={filter}&maxresults={result-number}&api-version={api-version}&recursive=true`|

 Replace {pool\-id} with the id of the pool that contains the node. Replace {node\-id} with the id of the node.

 The optional recursive parameter can be used to list all of the contents of the working directory. This parameter can be used in combination with the filter parameter to list specific type of files.

 The value for {filter} can be the following:

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|name|startswith|String|

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

 The following example shows some files that were automatically added to the node, and others that were added and used by a running task.

```
{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#files",
  "value": [ {
    "name":"shared",
    "url":"https://myaccount.myregion.batch.azure.com/pools/mypool_A0DBA2F6-DB8E-49CC-A6FD-8E8845AE4E52/nodes/tvm-2167304207_2-20140919t215614z/files/shared",
    "isDirectory":true
  },
  {
    "name":"startup\\ProcessEnv.cmd",
    "url":"https://myaccount.myregion.batch.azure.com/pools/mypool_A0DBA2F6-DB8E-49CC-A6FD-8E8845AE4E52/nodes/tvm-2167304207_2-20140919t215614z/files/startup\\ProcessEnv.cmd",
    "isDirectory":false,
    "properties": {
      "creationTime":"2014-09-19T21:56:17.679195Z",
      "lastModified":"2014-09-19T21:56:17.679195Z",
      "contentLength":"1813",
      "contentType":"application/octet-stream"
    }
  },
  {
    "name":"startup\\stderr.txt",
    "url":"https://myaccount.myregion.batch.azure.com/pools/mypool_A0DBA2F6-DB8E-49CC-A6FD-8E8845AE4E52/nodes/tvm-2167304207_2-20140919t215614z/files/startup\\stderr.txt",
    "isDirectory":false,
    "properties": {
      "creationTime":"2014-09-19T21:56:17.5590855Z",
      "lastModified":"2014-09-19T21:56:17.5590855Z",
      "contentLength":"0",
      "contentType":"application/octet-stream"
    }
  }
]
}

```

## Remarks
 The fileMode property is returned by the Batch service only for Linux compute nodes. Also, the creationTime property is not returned for Linux compute nodes.

