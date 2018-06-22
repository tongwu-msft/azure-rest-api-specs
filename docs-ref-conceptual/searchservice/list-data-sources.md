---
title: "List Data Sources (Azure Search Service REST API) | Microsoft Docs"
description: Return a list of data source connection objects used by an Azure Search indexer.
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
# List Data Sources (Azure Search Service REST API)
  The **List Data Sources** operation returns a list of the data sources in your Azure Search service.  

```  
GET https://[service name].search.windows.net/datasources?api-version=[api-version]  
    api-key: [admin key]  
```  

 The `api-version` is required. The current version is `2017-11-11`. See [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

 The `api-key` must be an admin key (as opposed to a query key). Refer to the authentication section in [Azure Search Service REST](index.md) to learn more about keys. [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) explains how to get the service URL and key properties used in the request.  

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

 Note that you can filter the response down to just the properties you're interested in. For example, if you want only a list of data source names, use the OData **select** query option:  

```  
GET /datasources?api-version=2017-11-11&$select=name  
```  

 In this case, the response from the above example would appear as follows:  

```  
    {  
      "value" : [ { "name": "datasource1" }, ... ]  
    }  
```  

## See also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Search Service REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
 [OData Expression Syntax for Azure Search](odata-expression-syntax-for-azure-search.md)   
 [Support for OData &#40;Azure Search&#41;](support-for-odata.md)  
