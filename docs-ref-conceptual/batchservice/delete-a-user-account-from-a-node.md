---
title: "Delete a user account from a node | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b1485764-6119-40a7-aa6e-d1871db3c125
caps.latest.revision: 9
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Delete a user account from a node
  Deletes a user account from the specified node.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to user accounts on nodes.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/nodes/{node-id}/users/{user-account-name}?api-version={api-version}`|  
  
 Replace {pool-id} with the id of the pool that contains the node. Replace {node-id} with the name of the node from which you want to delete a user account. Replace {user-account-name} with the name of the user account to delete.  
  
## Response  
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
## Remarks  
 You can delete a user account from a node only when it is in the **idle** or **running** state.  
  
  