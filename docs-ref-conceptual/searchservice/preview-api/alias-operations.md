---
title: Alias Operations (Azure Cognitive Search REST API)
description: Aliases define a secondary name that can be used to refer to an index for querying, indexing, and other operations.
ms.date: 03/01/2022

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: dereklegenzoff
ms.author: delegenz
ms.manager: nitinme
---
# Alias Operations (Azure Cognitive Search REST API)

**API Version: 2021-04-30-Preview**

> [!Important]
> The entire API is a preview feature.

In Azure Cognitive Search, an alias is a secondary name that can be used to refer to an index for querying, indexing, and other operations. You can create and manage aliases in Azure Cognitive Search service via simple HTTP requests (POST, GET, PUT, DELETE) against a given alias resource.

Aliases are service level resources and maintained independently from search indexes. Once a search index is created, you can create an alias that maps to that search index.


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
+ [Update Alias](update-alias.md)  
+ [List Aliases](list-aliases.md)  
+ [Get Alias](get-alias.md)  
+ [Delete Alias](delete-alias.md)  

## See also  

+ [Aliases]()