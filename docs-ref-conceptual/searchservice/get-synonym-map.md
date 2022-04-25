---
title: "Get Synonym Map (Azure Cognitive Search REST API)"
description: "A content of a synonym map can be retrieved using REST API in Azure Cognitive Search."
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Get Synonym Map (Azure Cognitive Search REST API)

The **Get Synonym Map** operation gets the synonym map definition from Azure Cognitive Search.  

```http  
GET https://[service name].search.windows.net/synonymmaps/[synonymmap name]?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]  
```  

## URI Parameters

| Parameter  | Description  |
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| synonym map name  | Required. The request URI specifies the name of the synonym map to return. |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions.|

## Request Headers

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The api-key is used to authenticate the request to your Search service. It is a string value, unique to your service. Get requests for an object definition in your service must include an api-key field set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body

None.  

## Response

Status Code: 200 OK is returned for a successful response.  

The response is similar to examples in [Create Synonym Map &#40;Azure Cognitive Search REST API&#41;](create-synonym-map.md).  

```json
{
    "name" : "synonymmap1",  
    "format" : "solr",  
    "synonyms" : "United States, United States of America, USA\n
    Washington, Wash. => WA",
    "encryptionKey": null
}

```

> [!NOTE]
> If the synonym map has an [encryption key](/azure/search/search-security-manage-encryption-keys), the search service must have access to the encryption key to retrieve the synonym map definition. Without access to the encryption key, a 400 Bad Request is returned. Restoring access to the key allows the search service to retrieve the synonym map definition again.

## See also

* [Azure Cognitive Search REST APIs](index.md)
* [HTTP status codes](http-status-codes.md)
* [Synonym map operations](synonym-map-operations.md)
* [Naming rules](naming-rules.md)
