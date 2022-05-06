---
title: "Service Statistics in Azure Cognitive Search"
description: Get statistics about the usage of service-level resources in your Azure Cognitive Search service
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Service Statistics in Azure Cognitive Search
The **Service Statistics** operation returns the number and type of objects in your service, the maximum allowed for each object type given the service tier, actual and maximum storage, and other limits that vary by tier. This request pulls information from the service so that you don't have to look up or calculate [service limits](/azure/search/search-limits-quotas-capacity).

Statistics on document count and storage size are collected every few minutes, not in real time. Therefore, the statistics returned by this API may not reflect changes caused by recent indexing operations.

 ```http  
GET https://[service name].search.windows.net/servicestats?api-version=[api-version]
    Content-Type: application/json  
    api-key: [admin key]  
``` 

 ## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. The request URI specifies the name of the index for which statistics should be returned. |
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
        "maxFieldsPerIndex": number,
        "maxIndexerRunTime": string,
        "maxFileExtractionSize": number,
        "maxFileContentCharactersToExtract": number,
        "maxFieldNestingDepthPerIndex": number,
        "maxComplexCollectionFieldsPerIndex": number,
        "maxComplexObjectsInCollectionsPerDocument": number
    }
}
```  
## Examples

```json
{
    "@odata.context": "https://my-search-service.search.windows.net/$metadata#Microsoft.Azure.Search.V2019_05_06.ServiceStatistics",
    "counters": {
        "documentCount": {
            "usage": 5072,
            "quota": null
        },
        "indexesCount": {
            "usage": 10,
            "quota": 15
        },
        "indexersCount": {
            "usage": 8,
            "quota": 15
        },
        "dataSourcesCount": {
            "usage": 9,
            "quota": 15
        },
        "storageSize": {
            "usage": 22265221,
            "quota": 2147483648
        },
        "synonymMaps": {
            "usage": 0,
            "quota": 3
        }
    },
    "limits": {
        "maxFieldsPerIndex": 1000,
        "maxIndexerRunTime": "P1D",
        "maxFileExtractionSize": 16777216,
        "maxFileContentCharactersToExtract": 65536,
        "maxFieldNestingDepthPerIndex": 10,
        "maxComplexCollectionFieldsPerIndex": 40,
        "maxComplexObjectsInCollectionsPerDocument": 3000
    }
}
```

## See also  

+ [Azure Cognitive Search REST APIs](index.md)   
