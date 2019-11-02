---
title: "List Data Sources (Azure Cognitive Search REST API)"
description: Return a list of data source connection objects used by an Azure Cognitive Search indexer.
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
# List Data Sources (Azure Cognitive Search REST API)
  The **List Data Sources** operation returns a list of the data sources in your Azure Cognitive Search service.  

```  
GET https://[service name].search.windows.net/datasources?api-version=[api-version]  
    api-key: [admin key]  
```  

 The `api-version` is required. The current version is `2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

 The `api-key` must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Cognitive Search REST APIs](index.md) to learn more about keys. [Create an Azure Cognitive Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

## Response  
 For a successful request: 200 OK. Here is an example response body:  

```  
    {  
      "value" : [  
        {  
          "name": "datasource1",  
          "type": "azuresql",  
          ... other data source properties  
        }]  
    }  
```  

 You can filter the response down to just the properties you're interested in. For example, if you want only a list of data source names, use the OData **select** query option:  

```  
GET /datasources?api-version=2019-05-06&$select=name  
```  

 In this case, the response from the above example would appear as follows:  

```  
    {  
      "value" : [ { "name": "datasource1" }, ... ]  
    }  
```  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)   
 [OData Expression Syntax for Azure Cognitive Search](https://docs.microsoft.com/azure/search/query-odata-filter-orderby-syntax)   
 [Support for OData &#40;Azure Cognitive Search&#41;](support-for-odata.md)  
