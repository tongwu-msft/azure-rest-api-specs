---
title: "Disable automatic scaling on a pool | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: aad42e28-2ee6-4704-bac2-54291bb682a1
caps.latest.revision: 6
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Disable automatic scaling on a pool
  Disables automatic scaling for a pool.  
  
## Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to pools.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/disableautoscale?api-version={api-version}`|  
  
 Replace {pool-id} with the id of the pool that you want to update.  
  
 The request body is empty.  
  
## Response  
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md)  
  
  