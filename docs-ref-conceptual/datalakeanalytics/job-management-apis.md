---
title: "Job management APIs"
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
ms.assetid: b6742c84-798d-41e5-888d-26f05778bdb0
caps.latest.revision: 9
ms.author: "jgao"
manager: "jhubbard"
---
# Job management APIs
Use the following REST APIs to manage Azure Data Lake Analytics jobs.  
  
-   [Submit a job](../AzureDataLakeStoreREST/submit-a-job.md)    
-   [Get information about a job](../AzureDataLakeStoreREST/get-information-about-a-job.md)    
-   [List jobs](../AzureDataLakeStoreREST/list-jobs.md)    
-   [Cancel a job](../Topic/Cancel%20a%20job.md)  
  
  
##  <a name="bk_common_adla"></a> Common parameters and headers  
 The following information is common to all tasks that you might do related to Data Lake Store:  
  
-   Replace {api-version} with 2016-11-01.    
-   Replace {account-name} with your Data Lake Analytics account name in the URI.    
-   Set the Content-Type header to **application/json**.    
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For job operations, be sure to obtain a token for the resource URI / audience claim “https://datalake.azure.net/”, NOT “https://management.core.windows.net/” nor “https://management.azure.com/”. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).