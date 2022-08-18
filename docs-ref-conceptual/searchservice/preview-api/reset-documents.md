---
title: Reset Documents (2021-04-30-Preview)
titleSuffix: Azure Cognitive Search
description: Preview version of the Reset Document REST API for Azure Cognitive Search.
ms.date: 01/10/2022

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: gmndrg
ms.author: gimondra
---

# Reset Documents (Preview REST API)

**API Version: 2021-04-30-Preview, 2020-06-30-Preview, 2019-05-06-Preview**

> [!Important]
> This entire API is a preview feature that was introduced in 2019-05-06-Preview. It supports [reset scenarios](/azure/search/search-howto-run-reset-indexers).

Reset Documents is an asynchronous API. It allows you to selectively reprocess documents from your data source. 

The API accepts two types of document identifiers as input. They are document keys (keys that uniquely identify documents in a search index) and datasource document identifiers (keys that uniquely identify documents in a data source). Invoking the API adds the document keys or data source document identifiers to be reset to the indexer metadata. On the next scheduled or on-demand run of the indexer, the indexer processes only the reset documents. 

* For indexers with a skillset and incremental enrichment enabled, the API will clear the cache and re-run the full skillset for just the specified documents.
* For indexers without a skillset, the API will simply read the source document from the data source and update/insert the contents into the index.

If you use document keys to reset documents and your document keys are referenced in an indexer field mapping, the indexer will use field mapping to locate the appropriate field in the underlying data source.

The API works for all indexers (with or without a skillset). You can invoke it using an HTTP POST request. If the call succeeds, you will always get a 204 NoContent response. Specify the name of the indexer to update on the request URI: 

```http
POST https://[service name].search.windows.net/indexers/[indexer name]/resetdocs?api-version=[api-version]
    Content-Type: application/json
    api-key: [admin key]  
``` 

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| indexer name  | Required. The request URI specifies the name of the indexer to update. |
| api-version | Required. The current version is `api-version=2021-04-30-Preview`. See [API versions](../search-service-api-versions.md) for more versions.|
| overwrite | Optional. This parameter determines whether consecutive Reset Document operations are combined or overwritten. Default is false. When false, the call’s payload of document keys or data source document identifiers will be added to the list of keys already queued up for reprocessing. If true, the call’s payload of document keys or data source document identifiers will overwrite the existing list, including clearing the list of reset documents if you set the keys to null.|

## Request Headers

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Reset requests must include an `api-key` header set to your admin key (as opposed to a query key). You can [find the API key](/azure/search/search-security-api-keys#find-existing-keys) in your search service dashboard in the Azure portal.| 

## Request Body

The body should contain either a list of document keys or a list of data source document identifiers that the indexer will look for in the data source. 

The following JSON is a high-level representation of the main parts of the definition. 

```json
{
    "documentKeys" : [
        "key1",
        "key2",
        "key3"
    ],
    "datasourceDocumentIds" : [
        "key1",
        "key2",
        "key3"
    ],
}
```
 Request contains the following properties and note that one and only one of "documentKeys" and "datasourceDocumentIds" should be provided:
 
|Property|Description|  
|--------------|-----------------|
|documentKeys|This is the set of document keys the indexer will selectively reprocess from its data source. By default, calling this action multiple times will append document key sets together. This behavior can be changed to overwrite rather than append via the overwrite URI parameter (see above). If you want the indexer to stop trying to process reset documents, you can set "documentKeys" to an empty list "[]". This will result in the indexer resuming regular indexing based on the high water mark. Invalid document keys or document keys that don't exist will be ignored.|
|datasourceDocumentIds|This is the set of data source document identifiers the indexer will selectively reprocess from its data source. By default, calling this action multiple times will append data source document identifiers sets together. This behavior can be changed to overwrite rather than append via the overwrite URI parameter (see above). If you want the indexer to stop trying to process reset documents, you can set "datasourceDocumentIds" to an empty list "[]". This will result in the indexer resuming regular indexing based on the high water mark. Invalid data source document identifiers or data source document identifiers that don't exist will be ignored.|

## Response  
204 No Content for a successful request.

## See also

+ [Indexer overview](/azure/search/search-indexer-overview)
+ [AI enrichment overview](/azure/search/cognitive-search-concept-intro)
+ [Quickstart: Try AI enrichment in the portal](/azure/search/cognitive-search-quickstart-blob)
+ [How to map fields (AI enrichment)](/azure/search/cognitive-search-output-field-mapping)
