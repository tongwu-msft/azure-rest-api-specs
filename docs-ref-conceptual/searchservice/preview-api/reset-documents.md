---
title: Reset Documents (api-version=2019-05-06-Preview or 2020-06-30-Preview)
description: Re-ingest a subset of documents from a data source with customer-provided document keys.
ms.date: 11/10/2020

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: shuyangmsft
ms.author: szhang
ms.manager: jennmar
---
# Reset Documents (Preview REST API)

**API Version: 2019-05-06-Preview or 2020-06-30-Preview**

This preview API allows you to re-run an indexer (with or without a skillset) over a subset of documents when you provide the document keys in the request. Using the key as a reference, the indexer finds the equivalent source document and reruns all skills and projections in an enrichment pipeline.

You can reprocess documents for an existing indexer using an HTTP POST request. Specify the name of the indexer to update on the request URI: 

```http
POST https://[service name].search.windows.net/indexers/[indexer name]/resetdocs?api-version=[api-version]   
    api-key: [admin key]  
``` 

Calling this API for an indexer does not automatically run it. Instead, at the next scheduled run, the indexer will modify its order of operations to handle this request first, before progressing to routine processing. The indexer will re-enumerate the data source, using the keys you have provided to identify the relevant documents. If the matching documents are found, the indexer runs them through a skillet (if any) and then updates the index or knowledge store. Once the indexer has finished reprocessing the documents you have specified, it will continue with its normal indexing tasks. Normal indexing refers to synchronizing an index or knowledge store with unspecified changes to the underlying source data, using timestamps or other highwater mark fields that indicate a change in document status.

By default, resetting additional documents while the indexer is processing a previously specified keyset will cause the secondary enumeration to restart with a superset of both Reset Document request payloads. You can modify the default to specify overwrite rather than append. For more information, see the URI parameter section below.

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| indexer name  | Required. The request URI specifies the name of the indexer to update. |
| api-version | Required. The current preview version is `api-version=2019-05-06-Preview` or `api-version=2020-06-30-Preview` (case-sensitive). See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|
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
|documentKeys|Required. This is the set of document keys the indexer will selectively reprocess from its data source. By default, calling this action multiple times will append document keysets together. This behavior can be changed to overwrite rather than append via the overwrite URI parameter (see above). If you want the indexer to stop trying to process reset documents, you can set "documentKeys" to an empty list "[]". This will tell the indexer that no documents need to be reset on its next run.|

## Response  
204 No Content for a successful request.

## See also

+ [Indexer overview](https://docs.microsoft.com/azure/search/search-indexer-overview)
+ [AI enrichment overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Quickstart: Try AI enrichment in the portal](https://docs.microsoft.com/azure/search/cognitive-search-quickstart-blob)
+ [How to map fields (AI enrichment)](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
