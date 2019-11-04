---
title: "Get Data Source (Azure Cognitive Search REST API)"
description: Return data source connection information used by an Azure Cognitive Searching indexer when crawling an external data source.
ms.date: "05/02/2019"
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
# Get Data Source (Azure Cognitive Search REST API)
The **Get Data Source** operation gets the data source definition from Azure Cognitive Search.  

## Request  
HTTPS is required for all services requests. The **Get Data Source** request can be constructed using the GET method. 

```  
GET https://[service name].search.windows.net/datasources/[datasource name]?api-version=[api-version]  
api-key: [admin key]  
```  

The `[datasource name]` in the request URI specifies which data source definition to return from the datasources collection.  

The `[api-version]` is required. The current version is `2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details. 

### Request Headers  
The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`.|  
|*api-key:*|Required. The api-key is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Get Data Source** request must include an api-key set to an admin key (as opposed to a query key).|  

 You will also need the service name to construct the request URL. You can get the service name and api-key from your service overview page in the Azure portal. See [Create an Azure Cognitive Search service](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for details.   

### Request Body  
 None.  

## Response  
 Status Code: 200 OK is returned for a successful response.  

 The response is similar to examples in [Create Data Source &#40;Azure Cognitive Search REST API&#41;](create-data-source.md).  

> [!NOTE]  
>  The connection string is not returned in the response for security purposes. 

```  
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
        "softDeleteMarkerValue" : "true" }  
}  

```  

> [!NOTE]  
>  Do not set the `Accept` request header to `application/json;odata.metadata=none` when calling this API as doing so will cause `@odata.type` attribute to be omitted from the response and you won't be able to differentiate between data change and data deletion detection policies of different types.  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)   
 [Support for OData &#40;Azure Cognitive Search&#41;](support-for-odata.md)   
 [OData Expression Syntax for Azure Cognitive Search](https://docs.microsoft.com/azure/search/query-odata-filter-orderby-syntax)  
