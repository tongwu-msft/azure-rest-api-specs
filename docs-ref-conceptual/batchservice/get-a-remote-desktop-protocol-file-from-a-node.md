---
title: "Get a remote desktop protocol file from a node | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 3074cd2c-6cc8-4e6b-96f9-a3fc3762548e
caps.latest.revision: 10
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Get a remote desktop protocol file from a node
  Gets the Remote Desktop Protocol file for the specified node.  
  
## Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to nodes.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/nodes/{node-id}/rdp?api-version={api-version}`|  
  
 Replace {pool-id} with the id of the pool that contains the node. Replace {node-id} with the id of the node from which you want to get the Remote Desktop Protocol file.  
  
## Response  
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
 The response contains the contents of the RDP file.  
  
## Remarks  
 Before you can access a node by using the RDP file, you must create a user account on the node. For more information, see [Add a user account to a node](../batchservice/add-a-user-account-to-a-node.md).  
  
 This API can be invoked only on PaaS pools (pools created with the ‘cloudServiceConfiguration’ property). If this API is invoked on IaaS pools (pools created with ‘virtualMachineConfiguration’), then the Batch service returns 409 (Conflict). To obtain a remote desktop protocol file for PaaS pools, see [Get remote login settings for a node](../batchservice/get-remote-login-settings-for-a-node.md).  
  
  