---
title: "Indexer operations (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2016-08-10"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: 99bd2afa-3413-424c-a54a-58c8bb12bdbe
caps.latest.revision: 12
author: "Brjohnstmsft"
ms.author: "brjohnst"
manager: "jhubbard"
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
# Indexer operations (Azure Search Service REST API)
  Azure Search can integrate directly with some common data sources, [removing the need to write code to index your data](https://azure.microsoft.com/en-in/blog/load-data-into-azure-search-with-zero-code-required/). To set up this up, you can call the Azure Search API to create and manage **indexers** and **data sources**.  

 An **indexer** is a resource that connects data sources with target search indexes. An indexer is used in the following ways:  

-   Perform a one-time copy of the data to populate an index.  

-   Sync an index with changes from the data source on a schedule. The schedule is part of the indexer definition.  

-   Invoke on-demand to update an index as needed.  

 All of the above scenarios are achieved through the [Run Indexer &#40;Azure Search Service REST API&#41;](run-indexer.md), which you can run as a standalone operation or scheduled using the built-in scheduler.  

 A **data source** specifies what data needs to be indexed, credentials to access the data, and policies to enable Azure Search to efficiently identify changes in the data (such as modified or deleted rows in a database table). It's defined as an independent resource so that it can be used by multiple indexers.  

 The following data sources are currently supported:  

-   [Azure SQL Database](https://azure.microsoft.com/documentation/articles/search-howto-connecting-azure-sql-database-to-azure-search-using-indexers-2015-02-28/)  

-   [DocumentDB](https://azure.microsoft.com/documentation/articles/documentdb-search-indexer/)  

-   [Azure Blob Storage (in preview)](https://azure.microsoft.com/documentation/articles/search-howto-indexing-azure-blob-storage/)  

 We're considering adding support for additional data sources in the future. To help us prioritize these decisions, please provide your feedback on the [Azure Search feedback forum](http://feedback.azure.com/forums/263029-azure-search).  

 See [Service Limits](https://azure.microsoft.com/en-us/documentation/articles/search-limits-quotas-capacity/) for maximum limits related to **indexer** and **data source** resources.  

## Typical workflow  
 You can create and manage **indexers** and **data sources** via simple HTTP requests (POST, GET, PUT, DELETE) against a given data source or indexer resource.  

 Setting up automatic indexing is typically a four step process:  

1.  Identify the data source that contains the data that needs to be indexed. Keep in mind that Azure Search may not support all of the data types present in your data source. See [Supported data types &#40;Azure Search&#41;](supported-data-types.md) for the list.  

2.  Create an Azure Search index whose schema is compatible with your data source.  

3.  Create an Azure Search **data source** as described in [Create Data Source &#40;Azure Search Service REST API&#41;](create-data-source.md).  

4.  Create an Azure Search **indexer** as described in [Create Indexer &#40;Azure Search Service REST API&#41;](create-indexer.md).  

 You should plan on creating one indexer for every target index and data source combination. You can have multiple indexers writing into the same index, and you can reuse the same data source for multiple indexers. However, an indexer can only consume one data source at a time, and can only write to a single index. As the following graphic illustrates, one data source provides input to one indexer, which then populates a single index:  

 ![Data Source, Indexer, Index chain in Azure Search](/media/azsrch-ds-indxr-index.png "Azsrch-ds-indxr-index")  

 Although you can only use one at a time, resources can be used in different combinations. The main takeaway of the next illustration is to notice is that a data source can be paired with more than one indexer, and multiple indexers can write to same index.  

 ![Resource combinations used in indexers](/media/azsrch-ds2-indexer3-index2.png "AzSrch-DS2-Indexer3-Index2")  

 After creating an indexer, you can retrieve its execution status using the [Get Indexer Status &#40;Azure Search Service REST API&#41;](get-indexer-status.md) operation. You can also run an indexer at any time (instead of or in addition to running it periodically on a schedule) using the [Run Indexer &#40;Azure Search Service REST API&#41;](run-indexer.md) operation.  

## Operations on indexers  
 The REST API for **indexers** and **data sources** includes the operations shown in the following table.  

 [Create Data Source](create-data-source.md)  

```  
POST https://[service name].search.windows.net/datasources?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

```  
PUT https://[service name].search.windows.net/datasources/[datasource name]?api-version=[api-version]  
```  

 [Update Data Source](update-data-source.md)  

```  
PUT https://[service name].search.windows.net/datasources/[datasource name]?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

 [List Data Sources](list-data-sources.md)  

```  
GET https://[service name].search.windows.net/datasources?api-version=[api-version]  
    api-key: [admin key]  
```  

 [Get Data Source](get-data-source.md)  

```  
GET https://[service name].search.windows.net/datasources/[datasource name]?api-version=[api-version]  
    api-key: [admin key]  
```  

 [Delete Data Source](delete-data-source.md)  

```  
DELETE https://[service name].search.windows.net/datasources/[datasource name]?api-version=[api-version]  
    api-key: [admin key]  
```  

 [Create Indexer](create-indexer.md)  

```  
POST https://[service name].search.windows.net/indexers?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

```  
PUT https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
```  

 [Update Indexer](update-indexer.md)  

```  
PUT https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
    Content-Type: application/json  
    api-key: [admin key]  
```  

 [List Indexers](list-indexers.md)  

```  
GET https://[service name].search.windows.net/indexers?api-version=[api-version]  
    api-key: [admin key  
```  

 [Get Indexer](get-indexer.md)  

```  
GET https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
    api-key: [admin key]  
```  

 [Delete Indexer](delete-indexer.md)  

```  
DELETE https://[service name].search.windows.net/indexers/[indexer name]?api-version=[api-version]  
    api-key: [admin key]  
```  

 [Run Indexer](run-indexer.md)  

```  
POST https://[service name].search.windows.net/indexers/[indexer name]/run?api-version=[api-version]  
    api-key: [admin key]  
```  

 [Get Indexer Status](get-indexer-status.md)  

```  
GET https://[service name].search.windows.net/indexers/[indexer name]/status?api-version=[api-version]  
    api-key: [admin key]  
```  

 [Reset Indexer](reset-indexer.md)  

```  
POST https://[service name].search.windows.net/indexers/[indexer name]/reset?api-version=[api-version]  
    api-key: [admin key]  
```  

## See Also  
 [Azure Search Service REST](index.md)   
 [Service Limits](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/)  
