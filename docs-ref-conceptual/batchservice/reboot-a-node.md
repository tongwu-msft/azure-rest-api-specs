---
title: "Reboot a node | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 9e7e8c34-7bc5-4acc-a537-8d1f5023c572
caps.latest.revision: 12
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Reboot a node
  Restarts the specified node.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to nodes.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/nodes/{node-id}/reboot?api-version={api-version}`|  
  
 Replace {pool-id} with the id of the pool that contains the node. Replace {node-id} with the id of the node that you want to restart.  
  
 The following example shows a request to restart the node and requeue all the tasks currently running on it so that they can be re-run.  
  
```  
{  
  "nodeRebootOption":"requeue"  
}  
```  
  
|Element name|Required|Type|Notes|  
|------------------|--------------|----------|-----------|  
|nodeRebootOption|No|String|Specifies when to reboot the node and what to do with currently running tasks.<br /><br /> Possible values are:<br /><br /> -   **requeue** – Terminate running tasks and requeue them. The tasks will run again when the job is enabled. Restart the node as soon as tasks have been terminated.<br />-   **terminate** – Terminate running tasks. The tasks will not run again. Restart the node as soon as tasks have been terminated.<br />-   **taskcompletion** – Allow currently running tasks to complete. Schedule no new tasks while waiting. Restart the node when all tasks have completed.<br />-   **retaineddata** – Allow currently running tasks to complete, then wait for all task data retention periods to expire. Schedule no new tasks while waiting. Restart the node when all task retention periods have expired.<br /><br /> The default value is **requeue**.|  
  
## Response  
 Status code: 202. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
## Remarks  
 You can restart a node only if it is in an idle or running state.  
  
  