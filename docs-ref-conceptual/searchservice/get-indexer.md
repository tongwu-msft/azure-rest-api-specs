---
title: "Get Indexer (Azure Cognitive Search REST API)"
description: Returns an indexer definition from an Azure Cognitive Search service.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: nitinme
---
# Get Indexer (Azure Cognitive Search REST API)

The **Get Indexer** operation gets the indexer definition from Azure Cognitive Search.  

```http  
GET https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]
```  

## URI Parameters

| Parameter  | Description  |
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| indexer name  | Required. The request URI specifies the name of the indexer to return. |
| api-version | Required. The current version is `api-version=2020-06-30`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|  

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

 Status Code: 200 OK is returned for a successful response. The response is similar to examples in [Create Indexer &#40;Azure Cognitive Search REST API&#41;](create-indexer.md):

```json
{  
    "name" : "myindexer",  
    "description" : "a cool indexer",  
    "dataSourceName" : "ordersds",  
    "targetIndexName" : "orders",  
    "schedule" : { "interval" : "PT1H", "startTime" : "2015-01-01T00:00:00Z" },  
    "parameters" : { "maxFailedItems" : 10, "maxFailedItemsPerBatch" : 5, "base64EncodeKeys": false },
    "encryptionKey": null
}  
```

> [!NOTE]
> If the indexer has an [encryption key](https://docs.microsoft.com/azure/search/search-security-manage-encryption-keys), the search service must have access to the encryption key to retrieve the indexer definition. Without access to the encryption key, a 400 Bad Request is returned. Restoring access to the key allows the search service to retrieve the indexer definition again.

## See also

* [Azure Cognitive Search REST APIs](index.md)
* [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)
* [Indexer operations &#40;Azure Cognitive Search REST API&#41;](indexer-operations.md)
* [Naming rules &#40;Azure Cognitive Search&#41;](naming-rules.md)
* [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions)  
