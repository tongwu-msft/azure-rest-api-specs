---
title: "List Synonym Maps (Azure Cognitive Search REST API)"
description: "A list of synonym maps can be retrieved using REST API in Azure Cognitive Search."
ms.date: "05/02/2019"

ms.service: search
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
# List Synonym Maps (Azure Cognitive Search REST API)

## Request
  The **List Synonym Maps** operation returns a list of the synonym maps in your Azure Cognitive Search service.  

```  
GET https://[service name].search.windows.net/synonymmaps?api-version=[api-version]  
api-key: [admin key]  
```  

 The `api-version` is required. The current version is `2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

### Request Headers
   The following list describes the required and optional request headers.  

  |Request Header|Description|  
  |--------------------|-----------------|  
  |*Content-Type:*|Required. Set this to `application/json`|  
  |*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **List Synonym Maps** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

   You will also need the service name to construct the request URL. You can get both the service name and `api-key` from your service dashboard in the [Azure portal](https://portal.azure.com). See [Create an Azure Cognitive Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

## Response  
 For a successful request: 200 OK. Here is an example response body:  

```  
    {  
      "value" : [  
        {  
          "name": "synonymmap1",  
          "format": "solr",  
          ... other synonym map properties  
        }]  
    }  
```  

 You can filter the response down to just the properties you're interested in. For example, if you want only a list of synonym map names, use the OData **select** query option:  

```  
GET https://[service name].search.windows.net/synonymmaps?api-version=[api-version]&$select=name
api-key: [admin key]  
```  

 In this case, the response from the above example would appear as follows:  

```  
    {  
      "value" : [ { "name": "synonymmap1" }, ... ]  
    }  
```  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Synonym map operations &#40;Azure Cognitive Search REST API&#41;](synonym-map-operations.md)   
 [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)   
 [OData Expression Syntax for Azure Cognitive Search](https://docs.microsoft.com/azure/search/query-odata-filter-orderby-syntax)   
 [Support for OData &#40;Azure Cognitive Search&#41;](support-for-odata.md)  
