---
title: "Create Data Source (Azure Cognitive Search REST API)"
description: Data source connection information used by an Azure Cognitive Search indexer when crawling external data sources.
ms.date: 01/30/2020
ms.service: cognitive-search
ms.topic: "language-reference"
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: nitinme
translation.priority.mt:
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Create Data Source (Azure Cognitive Search REST API)
In Azure Cognitive Search, a data source is used with [indexers](create-indexer.md), providing the connection information for ad hoc or scheduled data refresh of a target index, pulling data from [supported Azure data sources](https://docs.microsoft.com/azure/search/search-indexer-overview#supported-data-sources). 

You can use either POST or PUT on the request. For either one, the JSON document in the request body provides the object definition.

```http  
POST https://[service name].search.windows.net/datasources?api-version=[api-version]  
Content-Type: application/json  
api-key: [admin key]  
```  

 Alternatively, you can use PUT and specify the name on the URI. 

```http  
PUT https://[service name].search.windows.net/datasources/[data source name]?api-version=[api-version]  
```  
 HTTPS is required for all service requests. If the object doesn't exist, it is created. If it already exists, it is updated to the new definition  

> [!NOTE]  
>  The maximum number of indexes that you can create varies by pricing tier. For more information, see [Service limits for Azure Cognitive Search](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/).   

 ## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| data source name  | Required on the URI if using PUT. The name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive.  |
| api-version | Required. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|

## Request Header 
 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key).|  

You can get the `api-key` from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys).  

## Request Body
 The body of the request contains a data source definition, which includes type of the data source, credentials to read the data, as well as an optional data change detection and data deletion detection policies that are used to efficiently identify changed or deleted data in the data source when used with a periodically scheduled indexer  

The following JSON is a high-level representation of the main parts of the definition.

```json
{   
    "name" : (optional on PUT; required on POST) "Name of the data source",  
    "description" : (optional) "Anything you want, or nothing at all",  
    "type" : (required) "Must be a supported data source",
    "credentials" : (required) { "connectionString" : "Connection string for your data source" },  
    "container" : (required) { "name" : "Name of the table, collection, or blob container you wish to index" },  
    "dataChangeDetectionPolicy" : (optional) {See below for details },   
    "dataDeletionDetectionPolicy" : (optional) {See below for details }  
}  
```  

 Request contains the following properties:  

|Property|Description|  
|--------------|-----------------|  
|name|Required. The name of the data source. A data source name must only contain lowercase letters, digits or dashes, cannot start or end with dashes and is limited to 128 characters.|  
|description|An optional description.|  
|type|Required. Must be one of the supported data source types:<br /><br /> 1. `azuresql` for Azure SQL Database<br />2. `cosmosdb` for the Azure Cosmos DB SQL API<br />3. `azureblob` - Azure Blob Storage <br />4. `azuretable` - Azure Table Storage|
|credentials|The required **connectionString** property specifies the connection string for the data source. The format of the connection string depends on the data source type:<br /><br /> -   For Azure SQL Database, this is the usual SQL Server connection string. If you're using Azure portal to retrieve the connection string, use the `ADO.NET connection string` option.<br />-   For Azure Cosmos DB, the connection string must be in the following format: `"AccountEndpoint=https://[your account name].documents.azure.com;AccountKey=[your account key];Database=[your database id]"`. All of the values are required. You can find them in the [Azure portal](https://portal.azure.com).|  
|container|Required. Specifies the data to index using the `name` and `query` properties: <br /><br />`name`, required:<br />- Azure SQL: specifies the table or view. You can use schema-qualified names, such as `[dbo].[mytable]`.<br />- Azure Cosmos DB: specifies the SQL API collection. <br />- Azure Blob Storage: specifies the storage container.<br />- Azure Table Storage: specifies the name of the table. <br /><br />`query`, optional:<br />- Azure Cosmos DB: allows you to specify a query that flattens an arbitrary JSON document layout into a flat schema that Azure Cognitive Search can index.<br />- Azure Blob Storage: allows you to specify a virtual folder within the blob container. For example, for blob path `mycontainer/documents/blob.pdf`, `documents` can be used as the virtual folder.<br />- Azure Table Storage: allows you to specify a query that filters the set of rows to be imported.<br />- Azure SQL: query is not supported. Use views instead. |  

 The optional **dataChangeDetectionPolicy** and **dataDeletionDetectionPolicy** are described below.  

### Data Change Detection Policies  
 The purpose of a data change detection policy is to efficiently identify changed data items. Supported policies vary based on the data source type. Sections below describe each policy  

> [!NOTE]  
>  You can switch data detection policies after the indexer is already created, using [Reset Indexer &#40;Azure Cognitive Search REST API&#41;](reset-indexer.md).  

 **High Watermark Change Detection Policy**  

 Use this policy when your data source contains a column or property that meets the following criteria:  

-   All inserts specify a value for the column.  

-   All updates to an item also change the value of the column.  

-   The value of this column increases with each change.  

-   Queries that use a filter clause similar to the following `WHERE [High Water Mark Column] > [Current High Water Mark Value]` can be executed efficiently.  

 For example, when using Azure SQL data sources, an indexed `rowversion` column is the ideal candidate for use with the high water mark policy.  

 This policy can be specified as follows:  

```  
{   
    "@odata.type" : "#Microsoft.Azure.Search.HighWaterMarkChangeDetectionPolicy",  
    "highWaterMarkColumnName" : "[a row version or last_updated column name]"   
}  

```  
When using Azure Cosmos DB data sources, you must use the `_ts` property provided by Azure Cosmos DB.

When using Azure Blob data sources, Azure Cognitive Search automatically uses a high watermark change detection policy based on a blob's last-modified timestamp; you don't need to specify such a policy yourself.   

 **SQL Integrated Change Detection Policy**  

 If your SQL Server relational database supports [change tracking](https://docs.microsoft.com/sql/relational-databases/track-changes/about-change-tracking-sql-server), we recommend using SQL Integrated Change Tracking Policy. This policy enables the most efficient change tracking, and allows Azure Cognitive Search to identify deleted rows without you having to have an explicit "soft delete" column in your schema.  

 Integrated change tracking is supported starting with the following SQL Server database versions:  

-   SQL Server 2008 R2, if you're using SQL Server on Azure VMs.  

-   Azure SQL Database V12, if you're using Azure SQL Database.  

 When using SQL Integrated Change Tracking policy, do not specify a separate data deletion detection policy - this policy has built-in support for identifying deleted rows.  

 This policy can only be used with tables; it cannot be used with views. You need to enable change tracking for the table you're using before you can use this policy. See [Enable and disable change tracking](https://docs.microsoft.com/sql/relational-databases/track-changes/enable-and-disable-change-tracking-sql-server) for instructions.  

 When structuring the **Create Data Source** request, SQL integrated change tracking policy can be specified as follows:  

```  
{   
    "@odata.type" : "#Microsoft.Azure.Search.SqlIntegratedChangeTrackingPolicy"   
}  
```  

> [!NOTE]  
> When using [TRUNCATE TABLE](https://docs.microsoft.com/sql/t-sql/statements/truncate-table-transact-sql) to remove a large number of rows from a SQL table, the change tracking state needs to be reset via an [indexer reset](reset-indexer.md) to pick up row deletions.

### Data Deletion Detection Policies  
 The purpose of a data deletion detection policy is to efficiently identify deleted data items. Currently, the only supported policy is the **Soft Delete** policy, which allows identifying deleted items based on the value of a 'soft delete' column or property in the data source. This policy can be specified as follows:  

```  
{   
    "@odata.type" : "#Microsoft.Azure.Search.SoftDeleteColumnDeletionDetectionPolicy",  
    "softDeleteColumnName" : "the column that specifies whether a row was deleted",   
    "softDeleteMarkerValue" : "the value that identifies a row as deleted"   
}  

```  

> [!NOTE]  
>  Only columns with string, integer, or boolean values are supported. The value used as **softDeleteMarkerValue** must be a string, even if the corresponding column holds integers or booleans. For example, if the value that appears in your data source is 1, use **"1"** as the **softDeleteMarkerValue**.  

## Response  
 For a successful request: 201 Created.  

## Examples  
 If you intend to use the data source with an indexer that runs on a schedule, this example shows how to specify change and deletion detection policies:  

```  
{   
    "name" : "asqldatasource",  
    "description" : "a description",  
    "type" : "azuresql",  
    "credentials" : { "connectionString" : "Server=tcp:....database.windows.net,1433;Database=...;User ID=...;Password=...;Trusted_Connection=False;Encrypt=True;Connection Timeout=30;" },  
    "container" : { "name" : "sometable" },  
    "dataChangeDetectionPolicy" : { "@odata.type" : "#Microsoft.Azure.Search.HighWaterMarkChangeDetectionPolicy", "highWaterMarkColumnName" : "RowVersion" },   
    "dataDeletionDetectionPolicy" : { "@odata.type" : "#Microsoft.Azure.Search.SoftDeleteColumnDeletionDetectionPolicy", "softDeleteColumnName" : "IsDeleted", "softDeleteMarkerValue" : "true" }  
}  

```  

 If you only intend to use the data source for one-time copy of the data, the policies can be omitted:  

```  
{   
    "name" : "asqldatasource",  
    "description" : "anything you want, or nothing at all",  
    "type" : "azuresql",  
    "credentials" : { "connectionString" : "Server=tcp:....database.windows.net,1433;Database=...;User ID=...;Password=...;Trusted_Connection=False;Encrypt=True;Connection Timeout=30;" },  
    "container" : { "name" : "sometable" }  
}   
```  

## See also  

 + [Azure Cognitive Search REST APIs](index.md)   
 + [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 + [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md)   
 + [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)   
 + [Data type map for indexers in Azure Cognitive Search](data-type-map-for-indexers-in-azure-search.md)  