---
title: "Enable a job schedule | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 5f01c12d-e15b-4c7e-ad6d-39b86ec5eae9
caps.latest.revision: 7
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Enable a job schedule
  Changes the status of a job schedule to enabled.  
  
## Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to job schedules.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/jobschedules/{jobschedule-id}/enable?api-version={api-version}`|  
  
 Replace {jobschedule-id} with the id of the job schedule that you want to enable.  
  
## Response  
 Status code: 204. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
  