---
title: "Delete Synonym Map (Azure Cognitive Search REST API)"
description: "A synonym map can be deleted using REST API in Azure Cognitive Search."
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
# Delete Synonym Map (Azure Cognitive Search REST API)

The **Delete Synonym Map** operation removes a synonym map from your Azure Cognitive Search service.  

```http 
DELETE https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
api-key: [admin key]  
```  

> [!NOTE]  
>  If you delete a synonym map that is referenced on a field in an index, the delete operation will proceed but searches against the fields will fail with 400 (Bad Request) and an error message stating that the synonym map has been deleted.

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| servicename | Required. Set this to the unique, user-defined name of your search service. |
| synonymmap name  | Required. The request URI specifies the name of the synonym map to delete.   |
| api-version | Required. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|

## Request Header 

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The api-key is used to authenticate the request to your Search service. It is a string value, unique to your service. Delete requests must include an api-key field set to your admin key (as opposed to a query key).|  

You can get the api-key value from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys). 

## Request Body  
 None.  

## Response  
 Status Code: 204 No Content is returned for a successful response.  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Synonym map operations &#40;Azure Cognitive Search REST API&#41;](synonym-map-operations.md)   
 [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)  
