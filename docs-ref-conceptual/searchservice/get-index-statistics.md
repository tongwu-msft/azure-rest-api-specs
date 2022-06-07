---
title: "Get Index Statistics (Azure Cognitive Search REST API)"
description: Return documents counts, index counts, and resource usage metrics for an Azure Cognitive Search service.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Get Index Statistics (Azure Cognitive Search REST API)
The **Get Index Statistics** operation returns from Azure Cognitive Search a document count for the current index, plus storage usage. You can also get this information from the portal.  

 > [!NOTE] 
 > Statistics on document count and storage size are collected every few minutes, not in real time. Therefore, the statistics returned by this API may not reflect changes caused by recent indexing operations. 

```http  
GET https://[service name].search.windows.net/indexes/[index name]/stats?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]   
```  

 ## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required. The request URI specifies the name of the index for which statistics should be returned. |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|

## Request Headers 

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The api-key is used to authenticate the request to your Search service. It is a string value, unique to your service. Get requests for system information must include an api-key field set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

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

+ [Azure Cognitive Search REST APIs](index.md)
