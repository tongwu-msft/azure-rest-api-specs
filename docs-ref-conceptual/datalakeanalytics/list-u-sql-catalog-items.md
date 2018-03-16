---
title: "List U-SQL catalog items"
ms.custom: ""
ms.date: "02/09/2017"
ms.reviewer: ""
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 573b667c-471a-4e80-8c6c-9f102d3e40ec
caps.latest.revision: 12
ms.author: "jgao"
manager: "jhubbard"
---
# List U-SQL catalog items
List U-SQL catalog items.  
  
## Request  
 See [Common parameters and headers](../AzureDataLakeStoreREST/job-management-apis.md#bk_common_adla) for headers and parameters that are used by the REST call.  
  
 
|Method|Request URI|  
|-|-| 
|GET|https://{account-name}.azuredatalakeanalytics.net/catalog/usql/{catalog-path}?api-version={api-version}|  
  

{catalog-path} can be any of the following:

|Catalog item(s) requested	|{catalog-path}|
|-|-|
|List of databases|	databases|
|List of assemblies	|databases/{database-name}/assemblies|
|List of credentials|	databases/{database-name}/credentials|
|List of external data sources|	databases/{database-name}/externalDataSources|
|List of schemas|	databases/{database-name}/schemas|
|List of procedures|	databases/{database-name}/schemas/{schema-name}/procedures|
|List of table-valued functions	|databases/{database-name}/schemas/{schema-name}/tableValuedFunctions|
|List of types|	databases/{database-name}/schemas/{schema-name}/types|
|List of views|	databases/{database-name}/schemas/{schema-name}/views|
|List of tables|	databases/{database-name}/schemas/{schema-name}/tables|
|List of table partitions	|databases/{database-name}/schemas/{schema-name}/tables/{table-name}/partitions|
|List of table statistics|	databases/{database-name}/schemas/{schema-name}/tables/{table-name}/statistics|






## Response  
  
### Status code  
  
|Status code|Condition(s)|  
|-|-|  
|200 (OK)|The operation is successful.|  
|404 (NOT_FOUND)|	The item (or parent item) was not found.|
|400 (BAD_REQUEST)|	The request was invalid.|
|401 (UNAUTHORIZED)	|The request was unauthorized.|
 
### Response body  

The following example shows the response body for requesting a list of U-SQL databases:

    {
      "value": [
        {
          "computeAccountName": "myadla",
          "databaseName": "mydatabase",
          "version": "35315dd8-1673-4be8-bd24-3ae29d1c553c"
        }
      ]
    }

|Element name|	Description|
|-|-|
|value|	The list of credentials.|
|computeAccountName	|The name of the Data Lake Analytics account that contains the catalog.|
|databaseName	|The name of the database.|
|version|	The GUID representing the current version of the catalog item.|

  