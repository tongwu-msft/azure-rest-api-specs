---
title: "Reimage a node | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 9001268a-2043-4130-bbbd-8fc534e6810b
caps.latest.revision: 13
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Reimage a node
  Reinstalls the operating system on the specified node.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to nodes.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/nodes/{node-id}/reimage?api-version={api-version}`|  
  
 Replace {pool-id} with the id of the pool that contains the node. Replace {node-id} with the id of the node on which you want to reinstall the operating system.  
  
 The following example shows a request to reinstall the operating system on the node and reschedule tasks that are assigned to it.  
  
```  
{  
  "nodeReimageOption":"requeue"  
}  
```  
  
|Element name|Required|Type|Notes|  
|------------------|--------------|----------|-----------|  
|nodeReimageOption|No|String|Specifies when to reimage the node and what to do with currently running tasks.<br /><br /> Possible values are:<br /><br /> -   **requeue** – Terminate running tasks and requeue them. The tasks will run again when the job is enabled. Reimage the node as soon as tasks have been terminated.<br />-   **terminate** – Terminate running tasks. The tasks will not run again. Reimage the node as soon as tasks have been terminated.<br />-   **taskcompletion** – Allow currently running tasks to complete. Schedule no new tasks while waiting. Reimage the node when all tasks have completed.<br />-   **retaineddata** – Allow currently running tasks to complete, then wait for all task data retention periods to expire. Schedule no new tasks while waiting. Reimage the node when all task retention periods have expired.<br /><br /> The default value is **requeue**.|  
  
## Response  
 Status code: 202. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
## Remarks  
 You can reinstall the operating system on a node only if it is in an idle or running state.  
  
 This API can be invoked only on PaaS pools (pools created with the ‘cloudServiceConfiguration’ property). If this API is invoked on IaaS pools (pools created with ‘virtualMachineConfiguration’), then the Batch service returns 409 (Conflict).  
  
  