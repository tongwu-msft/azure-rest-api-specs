---
title: "Terminate a job schedule | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: eed8f8e9-0def-4e06-9f8b-421ba42baa2b
caps.latest.revision: 7
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Terminate a job schedule
  Changes the status of a job schedule to terminated.  
  
## Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to job schedules.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/jobschedules/{jobschedule-id}/terminate?api-version={api-version}`|  
  
 Replace {jobschedule-id} with the id of the job schedule that you want to terminate.  
  
## Response  
 Status code: 202. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
  