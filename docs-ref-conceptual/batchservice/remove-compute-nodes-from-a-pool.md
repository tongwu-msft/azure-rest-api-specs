---
title: "Remove compute nodes from a pool | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: eb33e899-ba5b-409d-a565-7a924572ffa7
caps.latest.revision: 15
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Remove compute nodes from a pool
  Removes compute nodes from the specified pool.

##  <a name="bk_lifetime"></a> Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to pools.

|Method|Request URI|
|------------|-----------------|
|POST|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/removenodes?api-version={api-version}`|

 Replace {pool-id} with the id of the pool from which you want to remove a node.

```

{
  "resizeTimeout":"PT5M",
  "nodeDeallocationOption":"terminate",
  "nodeList":["tvm-1-20110510T063000Z"]
}

```

|Element name|Required|Type|Notes|
|------------------|--------------|----------|-----------|
|resizeTimeout|No|Time|Specifies the timeout for allocation of compute nodes to the pool. This timeout is only used when EnableAutoScale is false.<br /><br /> If this is not specified, the default value is 15 minutes.<br /><br /> The minimum value allowed is 5 minutes. If a value less than 5 minute is provided, the Batch service returns a Bad Request (400).|
|nodeDeallocationOption|No|String|Specifies when nodes may be removed from the pool. Possible values are:<br /><br /> **requeue** – Terminate tasks immediately and put them back on the job queue so that they are rescheduled<br /><br /> **terminate** – Terminate running tasks. The tasks will not run again. Remove nodes as soon as tasks have been terminated.<br /><br /> **taskcompletion** – Allow currently running tasks to complete. Schedule no new tasks while waiting. Remove nodes when all tasks have completed.<br /><br /> **retaineddata** - Allow currently running tasks to complete, then wait for all task data retention periods to expire. Schedule no new tasks while waiting. Remove nodes when all task retention periods have expired.<br /><br /> The default value is requeue.|
|nodeList|Yes|Collection|A list containing the ids of the compute nodes to be removed from the specified pool. The nodeList collection is limited to 100 ids.|

## Response
 Status code: 202. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

## Remarks
 This operation can only run when the allocationState of the pool is **steady**. When this operation runs, the allocationState changes from **steady** to **resizing**.

