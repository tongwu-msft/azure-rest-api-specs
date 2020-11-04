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

This new preview API allows you to selectively reprocess documents from your data source. The API accepts the index document keys as input and prioritizes the processing of those documents from the data source. If you have a indexer cache configured, reset documents are not read from the cache and all skills configured will be re-run. Note that the index document key may be different from your data source document identifier.

You can reprocess documents for an existing indexer using an HTTP POST request. Specify the name of the indexer to update on the request URI: 

```http
POST https://[service name].search.windows.net/indexers/[indexer name]/resetdocs?api-version=[api-version]   
    api-key: [admin key]  
``` 

Reset documents is an asynchronous API. Invoking the API adds the document keys to be reset to the indexer metadata. On the next scheduled or on demand run of the indexer, the indexer prioritizes processing the reset documents before indexing any new or updated documents in the data source.

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
|documentKeys|Required. This is the set of document keys the indexer will selectively reprocess from its data source. By default, calling this action multiple times will append document keysets together. This behavior can be changed to overwrite rather than append via the overwrite URI parameter (see above). If you want the indexer to stop trying to process reset documents, you can set "documentKeys" to an empty list "[]". This will result in the indexer resuming regular indexing based on the high water mark.|

## Response  
204 No Content for a successful request.

## See also

+ [Indexer overview](https://docs.microsoft.com/azure/search/search-indexer-overview)
+ [AI enrichment overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Quickstart: Try AI enrichment in the portal](https://docs.microsoft.com/azure/search/cognitive-search-quickstart-blob)
+ [How to map fields (AI enrichment)](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
