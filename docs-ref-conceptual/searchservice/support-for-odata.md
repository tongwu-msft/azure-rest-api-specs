---
title: Support for OData protocol - Azure Cognitive Search
description: OData protocol is used for filter expressions and orderby expressions in Azure Cognitive Search queries.
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
# Support for OData (Azure Cognitive Search)

Azure Cognitive Search service API uses Open Data Protocol (OData) for index queries. Azure Cognitive Search supports OData version 4.  

## OData syntax in HTTP request headers  
 OData defines a few HTTP request headers that you can optionally set. You can use OData-specific values for the Accept header like `application/json;odata.metadata=none` to control the amount of metadata included in the response. The default is `odata.metadata=minimal`. For brevity, all examples in this document assume `odata.metadata=none`.  

 Another header you can set is `OData-MaxVersion`. The Azure Cognitive Search Service API supports OData V4 so you should set `OData-MaxVersion` to "4.0". This tells the API to expect the OData V4 format in the request body, and to send responses in the OData V4 format. In the future as we add support for newer versions of the OData protocol, you may set this header to a different value. The Azure Cognitive Search service API does not support versions of OData older than V4.  

 See [OData Expression Syntax for Azure Cognitive Search](https://docs.microsoft.com/azure/search/query-odata-filter-orderby-syntax) for details about using OData in filters and sort expressions. See [Simple query syntax in Azure Cognitive Search](https://docs.microsoft.com/azure/search/query-simple-syntax) for alternative syntax.  

## Search service API with Alternate OData syntax  
 The Search service API supports OData syntax for entity lookup. This applies both to both documents in an index, as well as to indexes themselves (where the index name is the entity key). Here is a summary of all APIs that have alternate OData syntax:  

 **Updating an Index**  

```  
PUT /indexes('[index name]')?api-version=2015-02-28  
```  

 **Getting an Index**  

```  
GET /indexes('[index name]')?api-version=2015-02-28  
```  

 **Getting Index Statistics**  

```  
GET /indexes('[index name]')/stats?api-version=2015-02-28  
```  

 **Deleting an Index**  

```  
DELETE /indexes('[index name]')?api-version=2015-02-28  
```  

 **Adding and Deleting Data within an Index**  

```  
POST /indexes('[index name]')/docs/index?api-version=2015-02-28  
```  

 **Search**  

```  
GET /indexes('[index name]')/docs?[query parameters]  
```  

 **Lookup**  

```  
GET /indexes('[index name]')/docs('[key]')?[query parameters]  
```  

 **Count**  

```  
GET /indexes('[index name]')/docs/$count?api-version=2015-02-28  
```  

 **Suggestions**  

```  
GET /indexes('[index name]')/docs/suggest?[query parameters]  
```  

## See also  
 [OData Expression Syntax for Azure Cognitive Search](https://docs.microsoft.com/azure/search/query-odata-filter-orderby-syntax)   
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Create Index &#40;Azure Cognitive Search REST API&#41;](create-index.md)   
 [Add, Update or Delete Documents &#40;Azure Cognitive Search REST API&#41;](addupdate-or-delete-documents.md)  
