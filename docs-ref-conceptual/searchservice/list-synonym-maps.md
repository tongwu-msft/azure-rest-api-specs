---
title: "List Synonym Maps (Azure Search Service REST API) | Microsoft Docs"
description: "A list of synonym maps can be retrieved using REST API in Azure Search."
ms.date: "04/20/2018"
ms.prod: "azure"
ms.service: "search"
ms.topic: "language-reference"
author: "mhko"
ms.author: "nateko"
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
# List Synonym Maps (Azure Search Service REST API)

## Request
  The **List Synonym Maps** operation returns a list of the synonym maps in your Azure Search service.  

```  
GET https://[service name].search.windows.net/synonymmaps?api-version=[api-version]  
api-key: [admin key]  
```  

 The `api-version` is required. The current version is `2017-11-11`. See [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

### Request Headers
   The following list describes the required and optional request headers.  

  |Request Header|Description|  
  |--------------------|-----------------|  
  |*Content-Type:*|Required. Set this to `application/json`|  
  |*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **List Synonym Maps** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

   You will also need the service name to construct the request URL. You can get both the service name and `api-key` from your service dashboard in the [Azure portal](https://portal.azure.com). See [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

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

 Note that you can filter the response down to just the properties you're interested in. For example, if you want only a list of synonym map names, use the OData **select** query option:  

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
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Synonym map operations &#40;Azure Search Service REST API&#41;](synonym-map-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
 [OData Expression Syntax for Azure Search](odata-expression-syntax-for-azure-search.md)   
 [Support for OData &#40;Azure Search&#41;](support-for-odata.md)  
