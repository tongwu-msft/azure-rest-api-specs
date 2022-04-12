---
title: "Get Data Source (Azure Cognitive Search REST API)"
description: Return data source connection information used by an Azure Cognitive Searching indexer when crawling an external data source.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: gmndrg
ms.author: gimondra
---
# Get Data Source (Azure Cognitive Search REST API)

The **Get Data Source** operation gets the data source definition from Azure Cognitive Search.  

```http
GET https://[service name].search.windows.net/datasources/[data source name]?api-version=[api-version]&includeConnectionString=[includeConnectionString]
  Content-Type: application/json  
  api-key: [admin key]  
```  

## URI Parameters

| Parameter  | Description  |
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| data source name  | Required. The request URI specifies the name of the data source to return.   |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|
| includeConnectionString | Optional. The default is `false` (connection string is omitted from the response). When set to `true`, the response includes the connection string, minus the user name and password, if they exist.

## Request Headers

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The api-key is used to authenticate the request to your Search service. It is a string value, unique to your service. Get requests for an object definition must include an api-key field set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body

None.  

## Response

Status Code: 200 OK is returned for a successful response.  

The response body is similar to examples in [Create Data Source &#40;Azure Cognitive Search REST API&#41;](create-data-source.md).  

> [!NOTE]  
> By default, the connection string is not returned in the response. If the URI parameter `includeConnectionString` is set to `true`, a connection string trimmed of the user name and password is returned in the response.

```json
{
    "name" : "asqldatasource",  
    "description" : "a description",  
    "type" : "azuresql",  
    "credentials" : { "connectionString" : null },  
    "container" : { "name" : "sometable" },  
    "dataChangeDetectionPolicy" : {
        "@odata.type" : "#Microsoft.Azure.Search.HighWaterMarkChangeDetectionPolicy",  
        "highWaterMarkColumnName" : "RowVersion" },
    "dataDeletionDetectionPolicy" : {
        "@odata.type" : "#Microsoft.Azure.Search.SoftDeleteColumnDeletionDetectionPolicy",  
        "softDeleteColumnName" : "IsDeleted",
        "softDeleteMarkerValue" : "true" },
    "encryptionKey": null
}  

```  

> [!NOTE]  
> Do not set the `Accept` request header to `application/json;odata.metadata=none` when calling this API as doing so will cause `@odata.type` attribute to be omitted from the response and you won't be able to differentiate between data change and data deletion detection policies of different types.

> [!NOTE]
> If the data source has an [encryption key](/azure/search/search-security-manage-encryption-keys), the search service must have access to the encryption key to retrieve the data source definition. Without access to the encryption key, a 400 Bad Request is returned. Restoring access to the key allows the search service to retrieve the data source definition again.

## See also

* [Azure Cognitive Search REST APIs](index.md)
* [HTTP status codes](http-status-codes.md)
* [Indexer operations](indexer-operations.md)
* [Naming rule](naming-rules.md)
* [Support for OData](support-for-odata.md)
* [OData Expression Syntax for Azure Cognitive Search](/azure/search/query-odata-filter-orderby-syntax)  
