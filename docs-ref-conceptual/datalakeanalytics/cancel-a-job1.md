---
title: "Cancel a job1"
ms.custom: ""
ms.date: "2016-10-27"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "data-lake-analytics"
ms.suite: ""
ms.technology: 
  - "analysis-services"
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: d3252a12-c2aa-4061-90a1-4fca2062b29b
caps.latest.revision: 8
ms.author: "jgao"
manager: "jhubbard"
---
# Cancel a job
Cancel an Azure Data Lake Analytics job.  
  
## Request  
 See [Common parameters and headers](../AzureDataLakeStoreREST/job-management-apis.md#bk_common_adla) for headers and parameters that are used by the REST call.  
  
 
|Method|Request URI|  
|-|-| 
|POST|https://{account-name}.azuredatalakeanalytics.net/jobs/{job-id}/cancelJob?api-version={api-version}|  
  
## Response  
  
### Status code  
  

|Status code|Condition(s)|  
|-|-|  
|200 (OK)|The operation is successful.|