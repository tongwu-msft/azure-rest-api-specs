---
title: Update Index (Azure Cognitive Search REST API)
description: "Update an existing index definition in a search service."
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Update Index (Azure Cognitive Search REST API)

Modifying an existing index typically requires an [index drop and rebuild](/azure/search/search-howto-reindex), except for the following schema changes:

+ Add new fields to a fields collection

+ Add newly created fields to a [suggester](/azure/search/index-add-suggesters)

+ Add or change [scoring profiles](/azure/search/index-add-scoring-profiles)

+ Add or change [encryption keys](/azure/search/search-security-manage-encryption-keys)

+ Add new [custom analyzers](/azure/search/index-add-custom-analyzers)

+ Change CORS options

+ Change existing fields with any of these three modifications:

  + Change `retrievable` (values are true or false)
  + Change `searchAnalyzer` (used at query time)
  + Add or change `synonymMaps` (used at query time)

To add these updates, put the index name on the request URI. In the request body, include a fully-specified index definition with your modifications.

```http  
PUT https://[search service name].search.windows.net/indexes/[index name]?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]  
```

Existing fields and most field attributes can't be deleted or changed, nor can fields be added to suggesters. Only newly created fields can be added to a `suggester`.

When a new field is added, all existing documents automatically get a null value for that field. No other storage space is consumed until one of two things occur: a value is provided for the new field ([using merge](addupdate-or-delete-documents.md)), or new documents are added.

Existing analyzers, tokenizers, token filters, and char filters can't be modified. New ones can be added to an existing index only if the `allowIndexDowntime` flag is set to true in the index update request:

`PUT https://[search service name].search.windows.net/indexes/[index name]?api-version=[api-version]&allowIndexDowntime=true`

This operation takes your index offline for a few seconds. Indexing and query requests will fail while the index is offline. Performance and write operations can be temporarily impaired for several minutes after the index is back online.

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required. The request URI specifies the name of the index to update.   |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions. |
| allowIndexDowntime | Optional. False by default. Set to true for certain updates, such as adding or modifying an analyzer, tokenizer, token filter, char filter, or similarity property. The index is taken offline for the duration of the update, usually no more than several seconds. |

## Request Headers

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Update requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.|  

## Request Body

The request body syntax is the same as for [Create Index](create-index.md).  

When updating an existing index, the body must include the full schema definition, including any original definitions that you want to preserve. In general, the best pattern for updates is to retrieve the index definition with a GET, modify it, and then update it with PUT.  

## Response
  
For a successful request, you should see "204 No Content".  

By default the response body will be empty. However, if the `Prefer` request header is set to `return=representation`, the response body contains the JSON of updated index. In this case, the success status code will be "200 OK.  

## See also

+ [Azure Cognitive Search REST APIs](index.md)
+ [HTTP status codes](http-status-codes.md)
+ [Create Index (REST)](create-index.md)
+ [Index operations (REST)](index-operations.md)
+ [Create an index in the portal](/azure/search/search-create-index-portal/)