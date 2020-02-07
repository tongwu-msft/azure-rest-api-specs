---
title: "Update Indexer (Azure Cognitive Search REST API)"
description: Modify an Azure Cognitive Search indexer used for crawling external data sources for searchable content.
ms.date: 01/30/2020

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
# Update Indexer (Azure Cognitive Search REST API)

You can update an existing indexer definition using an HTTP PUT request. Specify the name of the indexer to update on the request URI:  

```http
PUT https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

Updating an indexer definition does not automatically run it, but depending on your modifications and the associated a data source, a reset and rerun might be required.

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| indexer name  | Required. The request URI specifies the name of the indexer to update. |
| api-version | Required. The current preview version is `api-version=2019-05-06-Preview` (case-sensitive). See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|  

 ## Request Headers 
 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Update requests must include an `api-key` header set to your admin key (as opposed to a query key).|  

You can get the `api-key` from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys).    

## Request Body
 The request body syntax is the same as for [Create Indexer](create-indexer.md).

 When updating an existing indexer, the entire definition is replaced with the contents of the request body. In general, the best pattern to use for updates is to retrieve the indexer definition with a GET, modify it, and then update it with PUT.  

## Response  
 For a successful request: 201 Created if a new indexer was created, and 204 No Content if an existing indexer was updated.  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md)   
 [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)  
