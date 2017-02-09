---
title: "Get information about a U-SQL catalog item"
ms.custom: ""
ms.date: "02/09/2017"
ms.reviewer: ""
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: fca5e104-f5f0-4b88-9f7c-b88587f10b82
caps.latest.revision: 9
ms.author: "jgao"
manager: "jhubbard"
---
# Get information about a U-SQL catalog item
Get information about a U-SQL catalog item.
  
## Request  
 See [Common parameters and headers](../AzureDataLakeStoreREST/job-management-apis.md#bk_common_adla) for headers and parameters that are used by the REST call.  
  

|Method|Request URI|  
|-|-|  
|GET|https://{account-name}.azuredatalakeanalytics.net/catalog/usql/{catalog-path}?api-version={api-version}| 


{catalog-path} can be any of the following:

|Catalog item(s) requested|	{catalog-path}|
|-|-|
|Database|	databases/{database-name}|
|Assembly|	databases/{database-name}/assemblies/{assembly-name}|
|Credential|	databases/{database-name}/credentials/{credential-name}|
|External data source|	databases/{database-name}/externalDataSources/{external-data-source-name}|
|Schema|	databases/{database-name}/schemas/{schema-name}|
|Procedure|	databases/{database-name}/schemas/{schema-name}/procedures/{procedure-name}|
|Table-valued function|	databases/{database-name}/schemas/{schema-name}/tableValuedFunctions/{table-valued-function-name}|
|Type|	databases/{database-name}/schemas/{schema-name}/types/{type-name}|
|View|	databases/{database-name}/schemas/{schema-name}/views/{view-name}|
|Table|	databases/{database-name}/schemas/{schema-name}/tables/{table-name}|
|Table partition|	databases/{database-name}/schemas/{schema-name}/tables/{table-name}/partitions/{table-partition-name}|
|Table statistics	|databases/{database-name}/schemas/{schema-name}/tables/{table-name}/statistics/{table-statistics-name}|


  
## Response  
  
### Status code  
 

|Status code|Condition(s)|  
|-|-|  
|200 (OK)|The operation is successful.|  
|400 (BAD_REQUEST)|	The request was invalid.|
|401 (UNAUTHORIZED)|	The request was unauthorized.|
|404 (NOT_FOUND)|The item (or parent item) was not found.|  
  
### Response body  

The following example shows the response body for requesting information about a specific U-SQL database:

    {
      "computeAccountName": "myadla",
      "databaseName": "mydatabase",
      "version": "35315dd8-1673-4be8-bd24-3ae29d1c553c"
    }

|Element name	|Description|
|-|-|
|computeAccountName	|The name of the Data Lake Analytics account that contains the catalog.|
|databaseName|	The name of the database.|
|version|	The GUID representing the current version of the catalog item.|

