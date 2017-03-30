---
title: "Get remote login settings for a node | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a10f9921-f8c0-4bc9-a6d9-a3f8d3b976a9
caps.latest.revision: 6
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Get remote login settings for a node
  Gets the remote login settings for the specified node.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to nodes.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/nodes/{node-id}/remoteloginsettings?api-version={api-version}`|

 Replace {pool\-id} with the id of the pool that contains the node. Replace {node\-id} with the id of the node from which you want to get the remote login settings.

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

 The following example shows remote login settings for a node:

```

{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#Microsoft.Azure.Batch.Protocol.Entities.RemoteLoginSettings",
  "remoteLoginIPAddress":"10.0.0.1",
  "remoteLoginPort":12345
}

```

|Element name|Type|Notes|
|------------------|----------|-----------|
|remoteLoginIPAddress|String|The IP address to use for remote login to the compute node.|
|remoteLoginPort|Int32|The port to use for remote login to the compute node.|

## Remarks
 Before you can remotely login to a node using the remote login settings, you must create a user account on the node. For more information, see [Add a user account to a node](../batchservice/add-a-user-account-to-a-node.md).

 This API can be invoked only on IaaS pools \(pools created with the ‘virtualMachineConfiguration’ property\). If this API is invoked on PaaS pools \(pools created with ‘cloudServiceConfiguration’\), then the Batch Service returns 409 \(Conflict\). To obtain a remote desktop protocol file for PaaS pools, see [Get a remote desktop protocol file from a node](../batchservice/get-a-remote-desktop-protocol-file-from-a-node.md).

