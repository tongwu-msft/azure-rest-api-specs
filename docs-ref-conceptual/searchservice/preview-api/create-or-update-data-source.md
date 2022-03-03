---
title: Create or Update Data Source (2021-04-30-Preview)
titleSuffix: Azure Cognitive Search
description: Preview version of the Create or Update Data Source REST API for Azure Cognitive Search.
ms.date: 07/20/2021

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---

# Create or Update Data Source (Preview REST API)

**API Version: 2021-04-30-Preview**

> [!Important]
> This preview API adds managed identity support for indexer connections to other Azure resources:
> + **"credentials"** accepts an Azure resource ID as a value, provided that the search service runs under a managed identity and Azure role assignments grant read access to data.
> + **"identity"** accepts a user-assigned managed identity. This property is first-level for data connections. It's also under **"encryptionKey"** for retrieving a customer-managed key in Azure Key Vault.

<!-- support for indexer connections using a managed identity and Azure role assignments. The **Credentials** property now accepts a resource ID as a value, provided that the search service runs under a managed identity and Azure role assignments grant read access to data. The **Identity** property accepts the resource ID of services that have user-managed identities assigned to them. Additionally, if you are using [customer-managed encryption](/azure/search/search-security-manage-encryption-keys), this preview adds an **identity** property and managed identity support to key vault connections. -->

In Azure Cognitive Search, a data source is used with [indexers](../create-indexer.md), providing the connection information for on demand or scheduled data refresh of a target index, pulling data from [supported data sources](/azure/search/search-indexer-overview#supported-data-sources). 

You can use either POST or PUT on a create request. For either one, the request body provides the object definition.

```http  
POST https://[service name].search.windows.net/datasources?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

For update requests, use PUT and specify the indexer name on the URI. 

```http  
PUT https://[service name].search.windows.net/datasources/[data source name]?api-version=[api-version]
    Content-Type: application/json  
    api-key: [admin key]    
```

 HTTPS is required for all service requests. If the object doesn't exist, it is created. If it already exists, it is overwritten using the new definition.

> [!NOTE]  
> Once a data source exists, you cannot change the type property on an update request. Instead, you should create a new data source using the type you want.

## URI Parameters

| Parameter  | Description  |
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| data source name  | Required on the URI if using PUT. The name must be lower case, start with a letter or number, have no slashes or dots, and be fewer than 128 characters. After starting the name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive.  |
| api-version | Required. The current version is `api-version=2021-04-30-Preview`. See [API versions](../search-service-api-versions.md) for more versions.|

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
    "container" : (required) { "name" : "Name of the table, collection, or blob container you wish to index" },  
    "dataChangeDetectionPolicy" : (optional) {See below for details },
    "dataDeletionDetectionPolicy" : (optional) {See below for details },
    "identity": (optional) {Sets the Resource ID of a managed identity. See below for details },
    "encryptionKey":(optional) { 
      "keyVaultKeyName": "Name of the Azure Key Vault key used for encryption",
      "keyVaultKeyVersion": "Version of the Azure Key Vault key",
      "keyVaultUri": "URI of Azure Key Vault, also referred to as DNS name, that provides the key.",
      "identity": "(Resource ID of a user-assigned managed identity, used for connecting to key vault)",
      "accessCredentials": (Credentials for connecting to key vault. Omit if using a managed identity) {
        "applicationId": "Azure AD Application ID that has access permissions to the key vault",
        "applicationSecret": "Authentication key of the specified Azure AD application)"}
      }
} 
```  

 Request contains the following properties:  

|Property|Description|  
|--------------|-----------------|  
|name|Required. The name of the data source. A data source name must only contain lowercase letters, digits or dashes, cannot start or end with dashes and is limited to 128 characters.|  
|description|An optional description.|  
|type|Required. Must be one of the supported data source types: </br></br>`azuresql` for [Azure SQL Database](/azure/search/search-howto-connecting-azure-sql-database-to-azure-search-using-indexers) </br>`cosmosdb` for the [Azure Cosmos DB SQL API](/azure/search/search-howto-index-cosmosdb) </br>`azureblob` for [Azure Blob Storage](/azure/search/search-howto-indexing-azure-blob-storage) </br>`adlsgen2` for [Azure Data Lake Storage Gen2](/azure/search/search-howto-index-azure-data-lake-storage) </br>`azuretable` for [Azure Table Storage](/azure/search/search-howto-indexing-azure-tables)|
|credentials|Required. It contains a `connectionString` property that specifies how to connect. If you are using a [managed identity to authenticate](/azure/search/search-howto-managed-identities-data-sources), you can omit credentials on the connection. </br></br>For connections that are authenticated using a managed identity, the connection string includes the resource ID (see these links for connection string format: [Azure Storage](/azure/search/search-howto-managed-identities-storage), [Cosmos DB](/azure/search/search-howto-managed-identities-cosmos-db),[SQL Database](/azure/search/search-howto-managed-identities-sql)). Role assignments scoped to the external data source determine whether the indexer can connect, and the search service must be configured to run as a trusted service in Azure Active Directory. If the `identity` property is also specified, the connection is made using the user-assigned managed identity provided by the `identity` property. Otherwise, if `identity` is unspecified or null, the connection is through the system-managed identity. </br></br>For connections that are authenticated using keys or login credentials, those values are visible in the connection string. The format of the connection string depends on the data source type: </br></br>For Azure SQL Database, this is the usual SQL Server connection string. If you're using Azure portal to retrieve the connection string, choose the `ADO.NET connection string` option. </br></br>For Azure Cosmos DB, the connection string must be in the following format: `"AccountEndpoint=https://[your account name].documents.azure.com;AccountKey=[your account key];Database=[your database id]"`. All of the values are required. You can find them in the [Azure portal](https://portal.azure.com). </br></br>For Azure Blob Storage, the connection string formats are defined in the Credentials section of [How to configure blob indexing in Cognitive Search](/azure/search/search-howto-indexing-azure-blob-storage#credentials). </br></br>Azure Storage, Azure SQL Database, and Azure Cosmos DB also support a managed identity connection string that does not include an account key in the connection string. To use the managed identity connection string format, follow the instructions for [Setting up an indexer connection to a data source using a managed identity](/azure/search/search-howto-managed-identities-data-sources). </br></br>If you are updating the data source definition, the connection string is not required. The values `<unchanged>` or `<redacted>` can be used in place of the actual connection string.|  
|container|Required. Specifies the data to index using the `name` (required) and `query` (optional) properties: </br></br>`name`: </br>For Azure SQL, specifies the table or view. You can use schema-qualified names, such as `[dbo].[mytable]`. </br>For Azure Cosmos DB, specifies the SQL API collection. </br>For Azure Blob Storage, specifies the storage container. </br>For Azure Table Storage, specifies the name of the table. </br></br>`query`: </br>For Azure Cosmos DB, allows you to specify a query that flattens an arbitrary JSON document layout into a flat schema that Azure Cognitive Search can index. </br>For Azure Blob Storage, allows you to specify a virtual folder within the blob container. For example, for blob path `mycontainer/documents/blob.pdf`, `documents` can be used as the virtual folder. </br>For Azure Table Storage, allows you to specify a query that filters the set of rows to be imported. </br>For Azure SQL, query is not supported. Use views instead. |
|dataChangeDetectionPolicy | Optional. Used to identify changed data items. Supported policies vary based on the data source type. Valid policies are High Watermark Change Detection Policy and SQL Integrated Change Detection Policy. </br></br>High Watermark Change Detection Policy depends on an existing column or property that is updated in tandem with other updates (all inserts result in an update to the watermark column), and the change in value is higher. For Cosmos DB data sources, you must use the `_ts` property. For Azure SQL, an indexed `rowversion` column is the ideal candidate for use with the high water mark policy. For Azure Storage, change detection is built-in using lastModified values, eliminating any need to set the dataChangeDetectionPolicy for blob or table storage. </br></br>SQL Integrated Change Detection Policy is used to reference the native change detection features in SQL Server.  This policy can only be used with tables; it cannot be used with views. You need to enable change tracking for the table you're using before you can use this policy. See [Enable and disable change tracking](/sql/relational-databases/track-changes/enable-and-disable-change-tracking-sql-server) for instructions. For more information about change detection support in the indexer, see [Connect to and index Azure SQL content](/azure/search/search-howto-connecting-azure-sql-database-to-azure-search-using-indexers).|
|dataDeletionDetectionPolicy | Optional. Used to identify deleted data items. Currently, the only supported policy is the Soft Delete Policy, which identifies deleted items based on the value of a 'soft delete' column or property in the data source. </br></br> Only columns with string, integer, or boolean values are supported. The value used as `softDeleteMarkerValue` must be a string, even if the corresponding column holds integers or booleans. For example, if the value that appears in your data source is 1, use "1" as the `softDeleteMarkerValue`.    |
|encryptionKey| Optional. Used for additional encryption of the data source, through [customer-managed encryption keys (CMK)](/azure/search/search-security-manage-encryption-keys) in Azure Key Vault. Available for billable search services created on or after 2019-01-01. </br></br> An `encryptionKey` section contains a user-defined `keyVaultKeyName` (required), a system-generated `keyVaultKeyVersion` (required), and a `keyVaultUri` providing the key (required, also referred to as DNS name). An example URI might be "https://my-keyvault-name.vault.azure.net". </br></br>A connection to the key vault must be authenticated. You can use either `accessCredentials` or a managed identity for this purpose. </br></br>Properties of `accessCredentials` include `applicationId` (Azure Active Directory Application ID that was granted access permissions to your specified Azure Key Vault), and `applicationSecret` (authentication key of the specified Azure AD application). An example in the next section illustrates the syntax.  </br></br>Managed identities can be system or user-assigned. If the search service has both a system-assigned managed identity and a role assignment that grants read access to the key vault, you can omit both `identity` and `accessCredentials`, and the request will authenticate using the managed identity. If the search service has user-assigned identity and role assignment, set the `identity` property to the resource ID of that identity.|
|disabled| Optional. Boolean value indicating whether the indexer is disabled. False by default. |
|identity| Optional. It contains a `userAssignedIdentity` of type `#Microsoft.Azure.Search.DataUserAssignedIdentity` and specifies the [user-assigned managed identity](/azure/active-directory/managed-identities-azure-resources/how-to-manage-ua-identity-portal) of the external resource. This property depends on `credentials` having the connection string in the right format for managed identity connections for each data source type. </br></br>If the `identity` property is null, the connection to a resource ID is made using the system-managed property. </br></br>If this property is assigned to the type `#Microsoft.Azure.Search.DataNoneIdentity`, any explicit identity that was previously specified is cleared. |

## Response

For a successful request: 201 Created if a new data source was created, and 204 No Content if an existing data source was updated. 

## Examples

**Example: Connect using Azure role-based access and a user-assigned managed identity (preview)**

```json
{
    "name": "ablobcontainer",
    "description": "a description of the blob data",
    "type": "azureblob",
    "subtype": null,
    "credentials": {
      "connectionString": "ResourceId=/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/contoso-rg/providers/Microsoft.Storage/storageAccounts/contosostorageaccount"
    },
    "container": {
      "name": "jfkfiles"
    },
    "dataChangeDetectionPolicy": null,
    "dataDeletionDetectionPolicy": null,
    "identity": {
      "@odata.type": "#Microsoft.Azure.Search.DataUserAssignedIdentity",
      "userAssignedIdentity": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/contoso-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/contoso-datasource-identity"
    }
  }
```

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

**Example: Using the unchanged or redacted credential option**

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
    "container" : { "name": "sometable" },
    "encryptionKey": (optional) { 
      "keyVaultKeyName": "Name of the Azure Key Vault key used for encryption",
      "keyVaultKeyVersion": "Version of the Azure Key Vault key",
      "keyVaultUri": "URI of Azure Key Vault, also referred to as DNS name, that provides the key. An example URI might be https://my-keyvault-name.vault.azure.net",
      "accessCredentials": (optional, only if not using managed identity) {
        "applicationId": "Azure Active Directory Application ID that was granted access permissions to your specified Azure Key Vault",
        "applicationSecret": "Authentication key of the specified Azure AD application)"}
      }
}
```

**Example: Encryption key vault connections by search services having a user-assigned managed identity**

This example omits accessCredentials. For a resource that has a [user-assigned managed identity](/azure/active-directory/managed-identities-azure-resources/how-to-manage-ua-identity-portal) assigned to it, you can specify the identity in encryptionKey and retrieve the key using that identity and Azure role assignments.

```json
{
    "name" : "adatasource",
    "description": "a description",
    "type": "azuresql",
    "credentials": { "connectionString": "<unchanged>" },
    "container" : { "name": "sometable" },
    "encryptionKey": (optional) { 
      "keyVaultKeyName": "Name of the Azure Key Vault key used for encryption",
      "keyVaultKeyVersion": "Version of the Azure Key Vault key",
      "keyVaultUri": "URI of Azure Key Vault, also referred to as DNS name, that provides the key. An example URI might be https://my-keyvault-name.vault.azure.net",
      "identity": {
        "@odata.type": "#Microsoft.Azure.Search.DataUserAssignedIdentity",
        "userAssignedIdentity": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/contoso-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/contoso-identity"
        }
    }
}
```

## See also  

+ [Indexers overview](/azure/search/search-indexer-overview)
+ [Creating indexers](/azure/search/search-howto-create-indexers)
+ [Customer-managed encryption](/azure/search/search-security-manage-encryption-keys)
