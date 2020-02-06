---
title: "Reset Indexer (Azure Cognitive Search REST API)"
description: Rebuild an index created by an Azure Cognitive Search indexer.
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
# Reset Indexer (Azure Cognitive Search REST API)

The **Reset Indexer** operation resets the change tracking state of indexed documents so that you can rebuild the index from scratch on the next run. A reset might be required if the data source schema has changed, or if you are modifying the change detection policy. For information about change tracking state, see [Create Data Source](create-data-source.md).  

```http
POST https://[service name].search.windows.net/indexers/[indexer name]/reset?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]  
```  

 ## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| indexer name  | Required. The request URI specifies the name of the indexer to reset. |
| api-version | Required. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|  

## Request Headers 

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The api-key is used to authenticate the request to your Search service. It is a string value, unique to your service. Get requests about objects in your service must include an api-key field set to your admin key (as opposed to a query key).|  

You can get the api-key value from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys). 

## Request Body  
 None. 


## Response  
 Status Code: 204 No Content for a successful response.  

## See also  

+ [Azure Cognitive Search REST APIs](index.md)   
+ [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
+ [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md)   
+ [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)   
