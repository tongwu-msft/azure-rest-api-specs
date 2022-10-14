---
title: "Create Data Source (Azure Cognitive Search REST API)"
description: Data source connection information used by an Azure Cognitive Search indexer when crawling external data sources.
ms.date: 10/13/2022

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: gmndrg
ms.author: gimondra

---
# Create Data Source (Azure Cognitive Search REST API)

In Azure Cognitive Search, a data source is used with [indexers](create-indexer.md), providing the connection information for ad hoc or scheduled data refresh of a target index, pulling data from [supported Azure data sources](/azure/search/search-indexer-overview#supported-data-sources). 

You can use either POST or PUT on the request. For either one, the JSON document in the request body provides the object definition.

```http  
POST https://[service name].search.windows.net/datasources?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

 Alternatively, you can use PUT and specify the name on the URI. 

```http  
PUT https://[service name].search.windows.net/datasources/[data source name]?api-version=[api-version]
    Content-Type: application/json  
    api-key: [admin key]    
```

 HTTPS is required for all service requests. If the object doesn't exist, it is created. If it already exists, it is updated to the new definition  

> [!NOTE]  
> The maximum number of indexes that you can create varies by pricing tier. For more information, see [Service limits](/azure/search/search-limits-quotas-capacity).   

## URI Parameters

| Parameter  | Description  |
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| data source name  | Required on the URI if using PUT. The name must be lower case, start with a letter or number, have no slashes or dots, and be fewer than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive.  |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|

## Request Headers

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|   

## Request Body

The body of the request contains a data source definition, which includes type of the data source, credentials to read the data, as well as an optional data change detection and data deletion detection policies that are used to efficiently identify changed or deleted data in the data source when used with a periodically scheduled indexer  

The following JSON is a high-level representation of the main parts of the definition.

```json
{   
    "name" : (optional on PUT; required on POST) "Name of the data source",  
    "description" : (optional) "Anything you want, or nothing at all",  
    "type" : (required) "Must be a supported data source",
    "credentials" : (required) { "connectionString" : "Connection string for your data source" },
    "container": {
        "name": "Name of the table, view, collection, or blob container you wish to index",
        "query": (optional) 
    },
    "dataChangeDetectionPolicy" : (optional) {See below for details },
    "dataDeletionDetectionPolicy" : (optional) {See below for details },
    "encryptionKey":(optional) { }
}  
```  

 Request contains the following properties:  

|Property|Description|  
|--------------|-----------------|  
|name|Required. The name of the data source. A data source name must only contain lowercase letters, digits or dashes, cannot start or end with dashes and is limited to 128 characters.|  
|description|An optional description.|  
|type|Required. Must be one of the supported data source types: </br></br>`azuresql` for [Azure SQL Database](/azure/search/search-howto-connecting-azure-sql-database-to-azure-search-using-indexers) or [SQL Server instance running on Azure VM](/azure/search/search-howto-connecting-azure-sql-iaas-to-azure-search-using-indexers) </br>`cosmosdb` for the [Azure Cosmos DB SQL API](/azure/search/search-howto-index-cosmosdb) </br>`azureblob` for [Azure Blob Storage](/azure/search/search-howto-indexing-azure-blob-storage) </br>`adlsgen2` for [Azure Data Lake Storage Gen2](/azure/search/search-howto-index-azure-data-lake-storage) </br>`azuretable` for [Azure Table Storage](/azure/search/search-howto-indexing-azure-tables)|
|credentials|Required. It contains a `connectionString` property that specifies the connection string for the data source. The format of the connection string depends on the data source type: </br></br>For Azure SQL Database, this is the usual SQL Server connection string. If you're using Azure portal to retrieve the connection string, choose the `ADO.NET connection string` option. </br></br>For Azure Cosmos DB, the connection string must be in the following format: `"AccountEndpoint=https://[your account name].documents.azure.com;AccountKey=[your account key];Database=[your database id]"`. All of the values are required. You can find them in the [Azure portal](https://portal.azure.com). </br></br>For Azure Blob Storage, the connection string formats are defined in the Credentials section of [How to configure blob indexing in Cognitive Search](/azure/search/search-howto-indexing-azure-blob-storage#credentials).</br></br>Azure Storage, Azure SQL Database, and Azure Cosmos DB also support a managed identity connection string that does not include an account key in the connection string. To use the managed identity connection string format, follow the instructions for [Setting up an indexer connection to a data source using a managed identity](/azure/search/search-howto-managed-identities-data-sources). </br></br>If you are updating the data source, the connection string is not required. The values `<unchanged>` or `<redacted>` can be used in place of the actual connection string.|  
|container|Required. Specifies the data to index using the `name` (required) and `query` (optional) properties: </br></br>`name`: </br>For Azure SQL, specifies the table or view. You can use schema-qualified names, such as `[dbo].[mytable]`. </br>For Azure Cosmos DB, specifies the SQL API collection. </br>For Azure Blob Storage, specifies the storage container. </br>For Azure Table Storage, specifies the name of the table. </br></br>`query`: </br>For Azure Cosmos DB, allows you to specify a query that flattens an arbitrary JSON document layout into a flat schema that Azure Cognitive Search can index. </br>For Azure Blob Storage, allows you to specify a virtual folder within the blob container. For example, for blob path `mycontainer/documents/blob.pdf`, `documents` can be used as the virtual folder. </br>For Azure Table Storage, allows you to specify a query that filters the set of rows to be imported. </br>For Azure SQL, query is not supported. Use views instead. |
|dataChangeDetectionPolicy | Optional. Used to identify changed data items. Supported policies vary based on the data source type. Valid policies are High Watermark Change Detection Policy and SQL Integrated Change Detection Policy. </br></br>High Watermark Change Detection Policy depends on an existing column or property that is updated in tandem with other updates (all inserts result in an update to the watermark column), and the change in value is higher. For Cosmos DB data sources, you must use the `_ts` property. For Azure SQL, an indexed `rowversion` column is the ideal candidate for use with the high water mark policy. For Azure Storage, change detection is built-in using lastModified values, eliminating any need to set the dataChangeDetectionPolicy for blob or table storage. </br></br>SQL Integrated Change Detection Policy is used to reference the native change detection features in SQL Server.  This policy can only be used with tables; it cannot be used with views. You need to enable change tracking for the table you're using before you can use this policy. See [Enable and disable change tracking](/sql/relational-databases/track-changes/enable-and-disable-change-tracking-sql-server) for instructions. For more information about change detection support in the indexer, see [Connect to and index Azure SQL content](/azure/search/search-howto-connecting-azure-sql-database-to-azure-search-using-indexers).|
|dataDeletionDetectionPolicy | Optional. Used to identify deleted data items. Currently, the only supported policy is the Soft Delete Policy, which identifies deleted items based on the value of a 'soft delete' column or property in the data source. </br></br> Only columns with string, integer, or boolean values are supported. The value used as `softDeleteMarkerValue` must be a string, even if the corresponding column holds integers or booleans. For example, if the value that appears in your data source is 1, use "1" as the `softDeleteMarkerValue`.    |
|encryptionKey| Optional. Used to encrypt the data source at rest with your own keys, managed in your Azure Key Vault. Available for billable search services created on or after 2019-01-01. </br></br> An `encryptionKey` section contains a user-defined `keyVaultKeyName` (required), a system-generated `keyVaultKeyVersion` (required), and a `keyVaultUri` providing the key (required, also referred to as DNS name). An example URI might be "https://my-keyvault-name.vault.azure.net". </br></br>Optionally, you can specify `accessCredentials` if you are not using a managed system identity. Properties of `accessCredentials` include `applicationId` (Azure Active Directory Application ID that was granted access permissions to your specified Azure Key Vault), and `applicationSecret` (authentication key of the specified Azure AD application). An example in the next section illustrates the syntax. |

## Response

 For a successful request: 201 Created.  

## Examples

**Example: Azure SQL with change detection (High Watermark Change Detection Policy)**

```json
{   
    "name" : "asqldatasource",  
    "description" : "a description",  
    "type" : "azuresql",  
    "credentials" : { "connectionString" : "Server=tcp:....database.windows.net,1433;Database=...;User ID=...;Password=...;Trusted_Connection=False;Encrypt=True;Connection Timeout=30;" },  
    "container" : { "name" : "sometable" },  
    "dataChangeDetectionPolicy" : { "@odata.type" : "#Microsoft.Azure.Search.HighWaterMarkChangeDetectionPolicy", "highWaterMarkColumnName" : "RowVersion" }
}  
```

**Example: Azure SQL with change detection (SQL Integrated Change Tracking Policy)**

```json
{   
    "name" : "asqldatasource",  
    "description" : "a description",  
    "type" : "azuresql",  
    "credentials" : { "connectionString" : "Server=tcp:....database.windows.net,1433;Database=...;User ID=...;Password=...;Trusted_Connection=False;Encrypt=True;Connection Timeout=30;" },  
    "container" : { "name" : "sometable" },  
    "dataChangeDetectionPolicy" : { "@odata.type" : "#Microsoft.Azure.Search.SqlIntegratedChangeTrackingPolicy" }
}  
```

**Example: Azure SQL with change detection with deletion detection**

Recall that the properties for deletion detection are `softDeleteColumnName` and `softDeleteMarkerValue`.

```json
{   
    "name" : "asqldatasource",  
    "description" : "a description",  
    "type" : "azuresql",  
    "credentials" : { "connectionString" : "Server=tcp:....database.windows.net,1433;Database=...;User ID=...;Password=...;Trusted_Connection=False;Encrypt=True;Connection Timeout=30;" },  
    "container" : { "name" : "sometable" },   
    "dataDeletionDetectionPolicy" : { "@odata.type" : "#Microsoft.Azure.Search.SoftDeleteColumnDeletionDetectionPolicy", "softDeleteColumnName" : "IsDeleted", "softDeleteMarkerValue" : "true" }  
}  

```

**Example: Data source with required properties only**

Optional properties related to change and deletion detection can be omitted if you only intend to use the data source for one-time copy of the data:  

```json
{   
    "name" : "asqldatasource",  
    "description" : "anything you want, or nothing at all",  
    "type" : "azuresql",  
    "credentials" : { "connectionString" : "Server=tcp:....database.windows.net,1433;Database=...;User ID=...;Password=...;Trusted_Connection=False;Encrypt=True;Connection Timeout=30;" },  
    "container" : { "name" : "sometable" }  
}   
```  

**Example: Omitting credentials**

If you intend to update the data source, the credentials are not required. The values `<unchanged>` or `<redacted>` can be used in place of the connection string.

```json
{
    "name" : "adatasource",
    "description": "a description",
    "type": "azuresql",
    "credentials": { "connectionString": "<unchanged>" },
    "container" : { "name": "sometable" }
}
```

**Example: Encryption keys**

Encryption keys are customer-managed keys used for additional encryption. For more information, see [Encryption using customer-managed keys in Azure Key Vault](/azure/search/search-security-manage-encryption-keys).

```json
{
    "name" : "adatasource",
    "description": "a description",
    "type": "azuresql",
    "credentials": { "connectionString": "<unchanged>" },
    "container" : { "name": "sometable" }
    "encryptionKey": (optional) { 
      "keyVaultKeyName": "Name of the Azure Key Vault key used for encryption",
      "keyVaultKeyVersion": "Version of the Azure Key Vault key",
      "keyVaultUri": "URI of Azure Key Vault, also referred to as DNS name, that provides the key. An example URI might be https://my-keyvault-name.vault.azure.net",
      "accessCredentials": (optional, only if not using managed system identity) {
        "applicationId": "Azure Active Directory Application ID that was granted access permissions to your specified Azure Key Vault",
        "applicationSecret": "Authentication key of the specified Azure AD application)"}
      }
}
```

## See also  

+ [Indexers overview](/azure/search/search-indexer-overview)
+ [Creating indexers](/azure/search/search-howto-create-indexers)
+ [Azure Cognitive Search REST APIs](index.md)
+ [Indexer operations](indexer-operations.md)
+ [Naming rules](naming-rules.md)
