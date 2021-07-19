---
title: Reset Documents (2021-04-30-Preview)
description: Preview version of the Reset Document REST API for Azure Cognitive Search.
ms.date: 07/20/2021

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: shuyangmsft
ms.author: szhang
ms.manager: jennmar
---

# Reset Documents (Preview REST API)

**API Version: 2021-04-30-Preview**

> [!Important]
> This preview API adds the ability to flag specific documents for reprocessing by an indexer. Document keys passed in the request are processed in full on the next run. The entire API is a preview feature. This preview feature is also supported in 2020-06-30-Preview. For more information, see [Reset and run an indexer](https://docs.microsoft.com/azure/search/search-howto-run-reset-indexers). 

The Reset Documents API allows you to selectively reprocess documents from your data source. The API accepts document keys as input, and prioritizes the processing of those documents ahead of other documents from the same data source. This API works for all indexers (with or without a skillset). If the call succeeds, customers will always get a 204 NoContent response.

* For indexers with a skillset and incremental enrichment enabled, Reset Documents will clear the cache and re-run the full skillset.
* For indexers without a skillset, Reset Documents will simply read the source document from the data source and update/insert the contents into the index.

If your document key is referenced in an indexer field mapping, the indexer will use field mapping to locate the appropriate field in the underlying data source.

This API works for all indexers (with or without a skillset). If the call succeeds, customers will always get a 204 NoContent response. If the indexer doesn’t have a skillset, it will simply read the document from the data source and update/insert the document into the index.

You can reprocess documents for an existing indexer using an HTTP POST request. Specify the name of the indexer to update on the request URI: 

```http
POST https://[service name].search.windows.net/indexers/[indexer name]/resetdocs?api-version=[api-version]
    Content-Type: application/json
    api-key: [admin key]  
``` 

Reset Documents is an asynchronous API. Invoking the API adds the document keys to be reset to the indexer metadata. On the next scheduled or on demand run of the indexer, the indexer prioritizes processing the reset documents before indexing any new or updated documents in the data source.

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| indexer name  | Required. The request URI specifies the name of the indexer to update. |
| api-version | Required. The current version is `api-version=2021-04-30-Preview`. See [API versions](../search-service-api-versions.md) for more versions.|
| overwrite | Optional. This parameter determines whether consecutive Reset Document operations are combined or overwritten. Default is false. When false, the call’s payload of document keys will be added to the list of keys already queued up for reprocessing. If true, the call’s payload of document keys will overwrite the existing list, including clearing the list of reset documents if you set the keys to null.|

## Request Headers

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key).|  

You can get the `api-key` from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys).   

## Request Body

The body should contain a list of document keys that the indexer will look for in the data source. 

The following JSON is a high-level representation of the main parts of the definition. 

```json
{
    "documentKeys" : [
        "key1",
        "key2",
        "key3"
    ]
}
```
 Request contains the following properties:
 
|Property|Description|  
|--------------|-----------------|
|documentKeys|Required. This is the set of document keys the indexer will selectively reprocess from its data source. By default, calling this action multiple times will append document key sets together. This behavior can be changed to overwrite rather than append via the overwrite URI parameter (see above). If you want the indexer to stop trying to process reset documents, you can set "documentKeys" to an empty list "[]". This will result in the indexer resuming regular indexing based on the high water mark. Invalid document keys or document keys that don't exist will be ignored.|

## Response  
204 No Content for a successful request.

## See also

+ [Indexer overview](https://docs.microsoft.com/azure/search/search-indexer-overview)
+ [AI enrichment overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Quickstart: Try AI enrichment in the portal](https://docs.microsoft.com/azure/search/cognitive-search-quickstart-blob)
+ [How to map fields (AI enrichment)](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
