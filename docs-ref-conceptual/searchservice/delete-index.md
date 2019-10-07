---
title: "Delete Index (Azure Cognitive Search REST API)"
description: Permanently delete an index definition and all content from an Azure Cognitive Search service.
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
# Delete Index (Azure Cognitive Search REST API)
  The **Delete Index** operation permanently removes an index and its contents from your Azure Cognitive Search service. This operation is final, with no recovery option. Make sure you have a master copy of your index definition code, data ingestion code, and a backup of the external data source in case a rebuild is required.
  
  To delete an index, provide the command along with the index name. You can get the index name from the service dashboard in the Azure portal, or from the API. See [List Indexes &#40;Azure Cognitive Search REST API&#41;](list-indexes.md) for details.  

```  
DELETE https://[service name].search.windows.net/indexes/[index name]?api-version=[api-version]  
api-key: [admin key]  

```  

## Request  
 HTTPS is required for service requests. The **Delete Index** request can be constructed using the DELETE method.  

 The [index name] in the request URI specifies which index to delete from the indexes collection.  

 The `api-version` parameter is required. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.  

### Request Headers  
 The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service URL. The **Delete Index** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure portal. See [Create an Azure Cognitive Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body  
 None.  

## Response  
 Status Code: 204 No Content  is returned for a successful response.  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Create Index &#40;Azure Cognitive Search REST API&#41;](create-index.md)   
 [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions)
