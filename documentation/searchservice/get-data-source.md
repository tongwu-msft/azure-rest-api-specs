---
title: "Get Data Source (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2016-08-10"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to: 
  - "Azure"
ms.assetid: abdb08c7-19fd-4b84-bf4b-1e4819136dc7
caps.latest.revision: 10
author: "Brjohnstmsft"
ms.author: "brjohnst"
manager: "jhubbard"
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
  
 The **api-version** is required. The current version is `2015-02-28`. [Azure Search Service Versioning](../Topic/Azure%20Search%20Service%20Versioning.md) has details, including more information about alternative versions.  
  
 The **api-key** must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](service-rest.md) to learn more about keys. [Create an Azure Search service in the portal](http://azure.microsoft.com/en-us/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  
  
## Response  
 Status Code: 200 OK is returned for a successful response.  
  
 The response is similar to examples in [Create Data Source &#40;Azure Search Service REST API&#41;](create-data-source.md).  
  
```  
{   
    "name" : "asqldatasource",  
    "description" : "a description",  
    "type" : "azuresql",  
    "credentials" : { "connectionString" : "Server=tcp:....database.windows.net,1433;Database=...;User ID=...;Password=...;Trusted_Connection=False;Encrypt=True;Connection Timeout=30;" },  
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
  
## See Also  
 [Azure Search Service REST](service-rest.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
 [Support for OData &#40;Azure Search&#41;](support-for-odata.md)   
 [OData Expression Syntax for Azure Search](odata-expression-syntax-for-azure-search.md)  
  
  