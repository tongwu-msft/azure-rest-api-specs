---
title: "Get Index Statistics (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2016-11-09"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: f664dab2-6568-4e64-aab1-47138d8e5dbb
caps.latest.revision: 27
author: "Brjohnstmsft"
ms.author: "brjohnst"
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
# Get Index Statistics (Azure Search Service REST API)
  The **Get Index Statistics** operation returns from Azure Search a document count for the current index, plus storage usage. You can also get this information from the portal.  

```  
GET https://[service name].search.windows.net/indexes/[index name]/stats?api-version=[api-version]  
api-key: [admin key]  

```  
 > [AZURE.NOTE] Statistics on document count and storage size are collected every few minutes, not in real time. Therefore, the statistics returned by this API may not reflect changes caused by recent indexing operations.


## Request  
 HTTPS is required for all services requests. The **Get Index Statistics** request can be constructed using the GET method.  

 The `[index name]` in the request URI tells the service to return index statistics for the specified index.  

 The `api-version` parameter is required. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for a list of available versions.  

### Request Headers  
 The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*api-key:*|The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Get Index Statistics** request must include an `api-key` set to an admin key (as opposed to a query key).|  

 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure Preview Portal. See [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body  
 None.  

## Response  
 Status Code: "200 OK" is returned for a successful response.The response body is in the following format:  

```  
{  
  "documentCount": number,  
  "storageSize": number (size of the index in bytes)  
}  
```  

## See Also  
 [Azure Search Service REST](index.md)   
 [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796)
