---
title: "Get Data Source (Azure Search Service REST API) | Microsoft Docs"
description: Return data source connection information used by an Azure Searching indexer when crawling an external data source.
ms.date: "04/20/2018"
ms.prod: "azure"
ms.service: "search"
ms.topic: "language-reference"
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: cgronlun
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
# Get Data Source (Azure Search Service REST API)
  The **Get Data Source** operation gets the data source definition from Azure Search.  

```  
GET https://[service name].search.windows.net/datasources/[datasource name]?api-version=[api-version]  
api-key: [admin key]  
```  

 The **api-version** is required. The current version is `2017-11-11`. See [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 Status Code: 200 OK is returned for a successful response.  

 The response is similar to examples in [Create Data Source &#40;Azure Search Service REST API&#41;](create-data-source.md).  

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
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
 [Support for OData &#40;Azure Search&#41;](support-for-odata.md)   
 [OData Expression Syntax for Azure Search](odata-expression-syntax-for-azure-search.md)  
