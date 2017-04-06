---
title: "Disable task scheduling on a node | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 9de1aabf-e6d3-4363-b92d-a12e1dc530fb
caps.latest.revision: 7
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Disable task scheduling on a node
  Disables task scheduling on the specified node.  
  
## Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to nodes.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/nodes/{node-id}/disablescheduling?api-version={api-version}`|  
  
 Replace {pool-id} with the id of the pool that contains the node. Replace {node-id} with the id of the node on which you want to disable scheduling.  
  
 The following example shows a request to disable task scheduling of the node and requeue all the tasks currently running on it so that they can be re-run.  
  
```  
{  
  "nodeDisableSchedulingOption":"requeue"  
}  
  
```  
  
|Element name|Required|Type|Notes|  
|------------------|--------------|----------|-----------|  
|nodeDisableSchedulingOption|No|String|Specifies when to mark the node offline and what to do with currently running tasks.<br /><br /> Possible values are:<br /><br /> -   **requeue** – Terminate running tasks and requeue them. The tasks may run again on other compute nodes, or when task scheduling is re-enabled on this node. Enter offline state as soon as tasks have been terminated.<br />-   **terminate** – Terminate running tasks. The tasks will not run again. Enter offline state as soon as tasks have been terminated.<br />-   **taskcompletion** – Allow currently running tasks to complete. Schedule no new tasks while waiting. Enter offline state when all tasks have completed.<br /><br /> The default value is **requeue**.|  
  
## Response  
 Status code: 200. For more information, see Status and Error Codes.  
  
## Remarks  
 You can disable task scheduling on a node only if its current schedulingState is enabled. Otherwise, the request fails with status code 409 (Conflict).  
  
  