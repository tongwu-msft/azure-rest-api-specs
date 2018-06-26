---
title: "Service Statistics in Azure Search"
description: Get statistics about the usage of service-level resources in your Azure Search service
ms.date: "04/20/2018"
ms.prod: "azure"
ms.service: "search"
ms.topic: conceptual
author: "ashmaka"
ms.author: "ashmaka"
ms.manager: eladz
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
# Service Statistics in Azure Search
The Service Statistics operation returns from Azure Search the current usage and limits of the following properties:
* Documents
* Indexes
* Indexers
* Data Sources
* Storage Size
* Synonym Maps

The Service Statistics API also shows the per-service limits of these properties:
* Maximum fields per index

```  
GET https://[service name].search.windows.net/servicestats?api-version=[api-version]
Content-Type: application/json  
api-key: [admin key]  
```  

> [!NOTE]  
>  Statistics on document count and storage size are collected every few minutes, not in real time. Therefore, the statistics returned by this API may not reflect changes caused by recent indexing operations.

## Request  
 HTTPS is required for all service requests. The **Service Statistics** request is constructed using HTTP GET.

 The `api-version` parameter is required. The current version is `api-version=2017-11-11`. See [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

### Request Headers  
 The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Service Statistics** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure portal.

### Request Body  
 None.  

## Response  
 Status Code: "200 OK" is returned for a successful response. The response body is in the following format:  

```  
{
    "counters": {
        "documentCount": {
            "usage": number,
            "quota": number | null (if the service has unlimitied document counts, the quota will be null)
        },
        "indexesCount": {
            "usage": number,
            "quota": number
        },
        "indexersCount": {
            "usage": number,
            "quota": number
        },
        "dataSourcesCount": {
            "usage": number,
            "quota": number
        },
        "storageSize": {
            "usage": number (bytes),
            "quota": number (bytes) 
        },
        "synonymMaps": {
            "usage": number,
            "quota": number
        }
    },
    "limits": {
        "maxFieldsPerIndex": number
    }
}
```  

## See also  
 [Azure Search Service REST](index.md)   
 [API versions in Azure Search](https://docs.microsoft.com/azure/search/search-api-versions)