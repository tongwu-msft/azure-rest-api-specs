---
title: Indexer operations using Azure Cognitive Search REST APIs
description: Learn REST API calls used to create, delete, or update an Azure Cognitive Search indexer used for crawling external data sources for searchable content.
ms.date: 01/18/2021

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Indexer operations (Azure Cognitive Search REST API)

 An **indexer** is a resource that crawls an Azure data source and loads search documents into a target search index. Indexers read from an external source using connection information you provide in a **data source**, and serialize the incoming data into JSON search documents. In addition to a **data source**, an indexer also requires an index. The index specifies the fields and attributes of the search documents.

Indexers can run on demand or on a schedule, and depending on the data source, can honor the native change detection functionality of the underlying data source so that data refresh picks up just the changed data. 

Depending on the service tier, a search service has a maximum limit on the number of indexers and data sources that you can create. For more information, see [Service Limits](/azure/search/search-limits-quotas-capacity/).  

## Typical workflow  

Using an indexer is efficient, [removing the need to write code to index your data](https://azure.microsoft.com/blog/load-data-into-azure-search-with-zero-code-required/). You can create and manage indexers and data sources via simple HTTP requests (POST, GET, PUT, DELETE) against a given data source or indexer resource.  

 Setting up automatic indexing is typically a four step process:  

1. Identify the data source that contains the data that needs to be indexed. Indexers only work with certain Azure data platforms. For more information, see [Supported data source](/azure/search/search-indexer-overview#supported-data-sources).  

1. Create search index whose schema is compatible with your data source.  

1. Create a data source to provide connection information.  

1. Create an indexer to specify the data source, index, and other properties and parameters used during indexing.  

 You should plan on creating one indexer for every target index and data source combination. You can have multiple indexers writing into the same index, and you can reuse the same data source for multiple indexers. However, an indexer can only consume one data source at a time, and can only write to a single index. As the following graphic illustrates, one data source provides input to one indexer, which then populates a single index:  

 ![Data Source, Indexer, Index chain in Azure Cognitive Search](media/azsrch-ds-indxr-index.png "Azsrch-ds-indxr-index")  

 Although you can only use one indexer at a time, resources can be used in different combinations. The main takeaway of the next illustration is to notice is that a data source can be paired with more than one indexer, and multiple indexers can write to same index.  

 ![Resource combinations used in indexers](media/azsrch-ds2-indexer3-index2.png "AzSrch-DS2-Indexer3-Index2")  

 After creating an indexer, you can retrieve its execution status using the [Get Indexer Status](get-indexer-status.md) operation.  

## Operations on indexers  

An admin API key is required for viewing system information. Indexers require an index and a data source. Because data sources are used solely by indexers, data source and indexer operations are listed together.

+ [Create Data Source](create-data-source.md)  
+ [Update Data Source](update-data-source.md)  
+ [List Data Sources](list-data-sources.md)  
+ [Get Data Source](get-data-source.md)  
+ [Delete Data Source](delete-data-source.md)  
+ [Create Indexer](create-indexer.md)  
+ [Update Indexer](update-indexer.md)  
+ [List Indexers](list-indexers.md)  
+ [Get Indexer](get-indexer.md)  
+ [Delete Indexer](delete-indexer.md)  
+ [Run Indexer](run-indexer.md)  
+ [Get Indexer Status](get-indexer-status.md)  
+ [Reset Indexer](reset-indexer.md)  

## See also
 
+ [Get started with Azure Cognitive Search REST APIs](/azure/search/search-get-started-rest)
+ [Create and manage API keys](/azure/search/search-security-api-keys)
+ [Service Limits](/azure/search/search-limits-quotas-capacity)  
+ [Indexers in Azure Cognitive Search](/azure/search/search-indexer-overview)
+ [Tutorial: Index Azure JSON blobs](/azure/search/search-semi-structured-data)
