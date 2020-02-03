---
title: "Update Index (Azure Cognitive Search REST API)"
description: "Update an existing index definition in a search service."
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
# Update Index (Azure Cognitive Search REST API)

Modifying an existing Azure Cognitive Search index typically requires an [index drop and rebuild](https://docs.microsoft.com/azure/search/search-howto-reindex), with the exception of the following schema changes:

+  Add new fields
+  [Add or change scoring profiles](https://docs.microsoft.com/azure/search/index-add-scoring-profiles) 
+  Change CORS options
+  Change existing fields with any of the following three modifications: 
  1. Show or hide fields (`retrievable`: true | false)
  2. Change the analyzer used at query time (`searchAnalyzer`)
  3. Add or edit the synonymMap used at query time (`synonymMaps`) 

To make any of these schema changes to an existing index, specify the name of the index on the request URI, and then include a fully-specified index definition with the new or changed elements.

```http  
PUT https://[search service name].search.windows.net/indexes/[index name]?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin key]  
```  

> [!Note]  
>  Field attributes that can be changed without the need to re-create the index include: `retrievable`, `searchAnalyzer`, `synonymMaps`.
>  

Although existing fields cannot be deleted and most attributes cannot be changed, new fields can be added to an existing index at any time. The same applies to a [`suggester`](https://docs.microsoft.com/azure/search/index-add-suggesters). New fields may be added to a `suggester` at the same time fields are added, but existing fields cannot be removed from nor added to `suggesters` without an index rebuild.

When a new field is added, all existing documents in the index automatically have a null value for that field. No additional storage space is consumed until one of two things occur: a value is provided for the new field ([using merge](addupdate-or-delete-documents.md)), or new documents are added.

Once an analyzer, a tokenizer, a token filter or a char filter is defined, it cannot be modified. New ones can be added to an existing index only if the `allowIndexDowntime` flag is set to true in the index update request:

`PUT https://[search service name].search.windows.net/indexes/[index name]?api-version=[api-version]&allowIndexDowntime=true`

This operation takes your index offline for at least a few seconds, causing your indexing and query requests to fail. Performance and write availability of the index can be impaired for several minutes after the index is updated, or longer for  indexes.

 ## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required. The request URI specifies the name of the index to update.   |
| api-version | Required. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|

## Request Header 
 The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Update requests must include an `api-key` header set to your admin key (as opposed to a query key).|  

You can get the `api-key` from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys).   

## Request Body

The request body syntax is the same as for [Create Index](create-index.md).  

When updating an existing index, the body must include the original schema definition, plus the new fields you are adding, as well as the modified scoring profiles and CORS options, if any. If you are not modifying the scoring profiles and CORS options, you must include the original values from when the index was created. In general, the best pattern to use for updates is to retrieve the index definition with a GET, modify it, and then update it with PUT.  

## Response  
 For a successful request, you should see "204 No Content".  

 By default the response body will be empty. However, if the `Prefer` request header is set to `return=representation`, the response body will contain the JSON for the index definition that was updated. In this case, the success status code will be "200 OK.  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Create Index &#40;Azure Cognitive Search REST API&#41;](create-index.md)   
 [Index operations &#40;Azure Cognitive Search REST API&#41;](index-operations.md)   
 [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions)  
 [Azure Cognitive Search .NET library](https://docs.microsoft.com/dotnet/api/overview/azure/search?view=azure-dotnet)   
 [Create an index in the portal](https://azure.microsoft.com/documentation/articles/search-create-index-portal/)  
