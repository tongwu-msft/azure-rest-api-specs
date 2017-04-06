---
title: "Disable a job schedule | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 9f1b2259-5d3f-4cbf-abaf-f9bc1b086002
caps.latest.revision: 7
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Disable a job schedule
  Changes the status of a job schedule to disabled.  
  
## Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to job schedules.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/jobschedules/{jobschedule-id}/disable?api-version={api-version}`|  
  
 Replace {jobschedule-id} with the id of the job schedule that you want to disable.  
  
## Response  
 Status code: 204. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
  