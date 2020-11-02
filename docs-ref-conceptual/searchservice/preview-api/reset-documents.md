---
title: Reset Documents (api-version=2019-05-06-Preview or 2020-06-30-Preview)
description: Re-ingest a subset of documents from datasource with provided document keys.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: shuyangmsft
ms.author: szhang
ms.manager: jennmar
---
# Reset Documents (Preview REST API)

**API Version: 2019-05-06-Preview or 2020-06-30-Preview**

This preview allows customers to selectively reprocess specific documents from their datasources. They would supply the document keys of the documents they wish to reset, 
and we would use those keys to find the documents from the datasource and rerun all skills/projections in their pipeline against the fresh data.

You can reset documents for an existing indexer using an HTTP POST request. Specify the name of the indexer to update on the request URI: 

```http
POST https://[service name].search.windows.net/indexers/[indexer name]/resetdocs?api-version=[api-version]   
    api-key: [admin key]  
``` 

Calling this API for an indexer does not automatically run it. Instead, at the next scheduled time, the indexer will stop indexing new documents but resetting documents 
with provided document keys.

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| indexer name  | Required. The request URI specifies the name of the indexer to update. |
| api-version | Required. The current preview version is `api-version=2019-05-06-Preview` or `api-version=2020-06-30-Preview` (case-sensitive). See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|
| overwrite | Optional. Defaults to false. When false, the call’s payload of document keys will be appended to any existing document keys queued up to be reset. When true, the call’s payload of document keys will overwrite any existing document keys queued up to be reset. This can be used to clear the list of reset documents.|

## Request Headers

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. Create requests must include an `api-key` header set to your admin key (as opposed to a query key).|  

You can get the `api-key` from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys).   

## Request Body

The body should contain a list of document keys that the indexer will look for in the datasource. 

The following JSON is a high-level representation of the main parts of the definition. 

```json
{
    "documentKeys" : [
        "bW9yZXN0dWZmbG9uZ2Vya2V5bG9uZ25hbWU=",
        "b25jZXVwb25hdGltZWluYWZhcmF3YXlsYW5kaWZvdW5kdGhpc3N0dWZm",
        "c21hbGxuYW1l"
    ]
}
```
 Request contains the following properties:
 
|Property|Description|  
|--------------|-----------------|
|documentKeys|Required. This is the set of document keys the indexer will selectively reprocess from its datasource. By default, calling this action multiple times will append document key sets together. This behavior can be changed to overwrite rather than append via the overwrite url parameter (see above).|

## Response  
204 No Content for a successful request.

## See also

+ [Indexer overview](https://docs.microsoft.com/azure/search/search-indexer-overview)
+ [AI enrichment overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Quickstart: Try AI enrichment in the portal](https://docs.microsoft.com/azure/search/cognitive-search-quickstart-blob)
+ [How to map fields (AI enrichment)](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
