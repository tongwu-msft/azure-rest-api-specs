---
title: "Get Index Statistics (Azure Cognitive Search REST API)"
description: Return documents counts, index counts, and resource usage metrics for an Azure Cognitive Search service.
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
# Get Index Statistics (Azure Cognitive Search REST API)
The **Get Index Statistics** operation returns from Azure Cognitive Search a document count for the current index, plus storage usage. You can also get this information from the portal.  

 > [!NOTE] 
 > Statistics on document count and storage size are collected every few minutes, not in real time. Therefore, the statistics returned by this API may not reflect changes caused by recent indexing operations. 

```http  
GET https://[service name].search.windows.net/indexes/[index name]/stats?api-version=[api-version]  
api-key: [admin key]  
```  

 ## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required. The request URI specifies the name of the index for which statistics should be returned. |
| api-version | Required. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|

## Request Header 

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The api-key is used to authenticate the request to your Search service. It is a string value, unique to your service. Get requests for system information must include an api-key field set to your admin key (as opposed to a query key).|  

You can get the api-key value from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys). 

## Request Body  
 None.  

## Response  
 Status Code: "200 OK" is returned for a successful response. The response body is in the following format:  

```json
{  
  "documentCount": number,  
  "storageSize": number (size of the index in bytes)  
}  
```  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions)
