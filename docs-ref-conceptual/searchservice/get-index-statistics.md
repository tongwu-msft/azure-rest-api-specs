---
title: "Get Index Statistics (Azure Cognitive Search REST API)"
description: Return documents counts, index counts, and resource usage metrics for an Azure Cognitive Search service.
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
# Get Index Statistics (Azure Cognitive Search REST API)
  The **Get Index Statistics** operation returns from Azure Cognitive Search a document count for the current index, plus storage usage. You can also get this information from the portal.  

 > [!NOTE] 
 > Statistics on document count and storage size are collected every few minutes, not in real time. Therefore, the statistics returned by this API may not reflect changes caused by recent indexing operations.

## Request  
HTTPS is required for all services requests. The **Get Index Statistics** request can be constructed using the GET method.  

```  
GET https://[service name].search.windows.net/indexes/[index name]/stats?api-version=[api-version]  
api-key: [admin key]  
```  

The `[index name]` in the request URI tells the service to return index statistics for the specified index.  

The `[api-version]` is required. The current version is `2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details. 

### Request Headers
The following list describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`.|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Get Index Statistics** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

You will also need the service name to construct the request URL. You can get both the service name and `api-key` from your service dashboard in the [Azure portal](https://portal.azure.com). See [Create an Azure Cognitive Search service](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for details.  

### Request Body  
 None.  

## Response  
 Status Code: "200 OK" is returned for a successful response. The response body is in the following format:  

```  
{  
  "documentCount": number,  
  "storageSize": number (size of the index in bytes)  
}  
```  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions)
