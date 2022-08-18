---
title: Document operations using Azure Cognitive Search REST APIs
description: Learn which REST API calls are used to populate and query an Azure Cognitive Search index.
ms.date: 01/18/2021

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Document operations (Azure Cognitive Search REST API)

In Azure Cognitive Search, an index is stored in the cloud and populated using JSON documents that you upload to the service. The fields collection of an index defines the structure of the search document. Fields have a name, data types, and attributes that determine how it is used. For example, *searchable* fields are used in full text search, and thus tokenized during indexing.

Queries target the documents collection of an index. In a service URL, the `/docs` parameter represents the collection. All operations performed on the collection such as uploading, merging, deleting, or querying documents take place in the context of a single index, so the URL format document operations will always include `/indexes/[index name]/docs` for a given index name.  

To create search documents, application code must either generate JSON documents to upload to Azure Cognitive Search or you can use an indexer to serialize incoming documents into JSON.   

Before you can upload documents, you must have already created the index on the service. See [Create Index (REST API)](create-index.md) or [Create an index in the portal](https://azure.microsoft.com/documentation/articles/search-create-index-portal/) for instructions.  

## Operations on search documents  

An admin API key is required for object management, but you can use a query API key for read-only access to the documents collection of an index. All query forms can accept a query API key.

+ [Add, Update or Delete Documents](addupdate-or-delete-documents.md)  
+ [Search Documents](search-documents.md)  
+ [Autocomplete](suggestions.md) 
+ [Suggestions](suggestions.md)  
+ [Count Documents](count-documents.md)  
+ [Lookup Document](lookup-document.md)  

## See also  

+ [Get started with Azure Cognitive Search REST APIs](/azure/search/search-get-started-rest)   
+ [Query types and composition](/azure/search/search-query-overview)   
+ [Create a basic query](/azure/search/search-query-create)   
+ [Create and manage API keys](/azure/search/search-security-api-keys)  
