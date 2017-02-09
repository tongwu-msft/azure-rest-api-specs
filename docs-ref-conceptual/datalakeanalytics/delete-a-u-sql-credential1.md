---
title: "Delete a U-SQL credential1"
ms.custom: ""
ms.date: "02/09/2017"
ms.reviewer: ""
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: bdc0bb05-ea93-4f08-ad78-128030e67fe0
caps.latest.revision: 8
ms.author: "jgao"
manager: "jhubbard"
---
# Delete a U-SQL credential
Delete a U-SQL credential.
  
## Request  
 See [Common parameters and headers](../AzureDataLakeStoreREST/job-management-apis.md#bk_common_adla) for headers and parameters that are used by the REST call.  
  

 
|Method|Request URI|  
|-|-| 
|DELETE|https://{account-name}.azuredatalakeanalytics.net/catalog/usql/databases/{database-name}/credentials/{credential-name}?api-version={api-version}|  
  
## Response  
  
### Status code  
  

|Status code|Condition(s)|  
|-|-|  
|200 (OK)|The operation is successful.|  
|400 (BAD_REQUEST)	|The request was invalid.|
|401 (UNAUTHORIZED)|	The request was unauthorized.|
|404 (NOT_FOUND)|The item (or parent item) was not found.|