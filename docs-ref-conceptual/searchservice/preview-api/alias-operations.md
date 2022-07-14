---
title: Alias Operations (2021-04-30-Preview)
titleSuffix: Azure Cognitive Search
description: Index aliases define a secondary name that can be used to refer to an index for querying, indexing, and other operations.
ms.date: 03/01/2022

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: dereklegenzoff
ms.author: delegenz
ms.manager: nitinme
---
# Alias Operations (Preview REST API)

**API Version: 2021-04-30-Preview**

> [!Important]
> The entire API is a preview feature.

In Azure Cognitive Search, an index alias is a secondary name that can be used to refer to an index for querying, indexing, and other operations. You can create an alias that maps to a search index and substitute the alias name in places where you would otherwise reference an index name. This gives you added flexibility if you ever need to change which index your application is pointing to. Instead of updating the references to the index name in your application, you can just update the mapping for your alias.

You can create and manage aliases in Azure Cognitive Search service via simple HTTP requests (POST, GET, PUT, DELETE) against a given alias resource. Aliases are service level resources and maintained independently from search indexes. Once a search index is created, you can create an alias that maps to that search index.

> [!NOTE]
> You can only use an alias with [document operations](/rest/api/searchservice/document-operations). Aliases can't be used to get or update an index definition, can't be used with the Analyze Text API, and can't be used as the `targetIndexName` on an indexer.

## Example

The following example shows how to create an alias that maps to an existing search index.

```http 
POST /aliases?api-version=2021-04-30-preview
{   
  "name" : "my-alias",  
  "indexes" : ["my-index"]
}  
```

## Operations on Aliases  

An admin API key is required for all Alias operations.

+ [Create or Update Alias](create-or-update-alias.md)
+ [List Aliases](list-aliases.md)  
+ [Get Alias](get-alias.md)  
+ [Delete Alias](delete-alias.md)  

## See also  

+ [Create an index alias in Azure Cognitive Search](/azure/search/search-how-to-alias)   
