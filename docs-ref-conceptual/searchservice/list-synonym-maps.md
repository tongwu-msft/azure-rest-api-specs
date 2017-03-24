---
title: "List Synonym Maps (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2017-03-13"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: 3f3a33a1-7179-42a0-b4a7-4a5f6e24fd31
caps.latest.revision: 10
author: "mhko"
ms.author: "nateko"
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
# List Synonym Maps (Azure Search Service REST API)
> [!NOTE]  
> Synonyms is a preview feature and is not intended to be used in production code. Preview features are subject to change and are exempt from the service level agreement (SLA).

## Request
  The **List Synonym Maps** operation returns a list of the synonym maps in your Azure Search service.  

```  
GET https://[service name].search.windows.net/synonymmaps?api-version=[api-version]  
api-key: [admin key]  
```  

 The `api-version` is required. The current preview version is `2016-09-01-Preview`. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details.  

### Request Headers
   The following list describes the required and optional request headers.  

  |Request Header|Description|  
  |--------------------|-----------------|  
  |*Content-Type:*|Required. Set this to `application/json`|  
  |*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **List Synonym Maps** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

   You will also need the service name to construct the request URL. You can get both the service name and `api-key` from your service dashboard in the [Azure portal](https://portal.azure.com). See [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

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

## See Also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Synonym map operations &#40;Azure Search Service REST API&#41;](synonym-map-operations.md)   
 [Naming rules &#40;Azure Search&#41;](naming-rules.md)   
 [OData Expression Syntax for Azure Search](odata-expression-syntax-for-azure-search.md)   
 [Support for OData &#40;Azure Search&#41;](support-for-odata.md)  
