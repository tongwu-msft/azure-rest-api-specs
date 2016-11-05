---
title: "Document operations (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2016-08-10"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
ms.assetid: 86722ded-daf6-4776-b984-b0dfd48218c0
caps.latest.revision: 14
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
# Document operations (Azure Search Service REST API)
  In Azure Search, an index is stored in the cloud and populated using JSON documents that you upload to the service. All the documents that you upload comprise the corpus of your search data. Documents contain fields, some of which are tokenized into search terms as they are uploaded. The `/docs` URL segment in the Azure Search API represents the collection of documents in an index. All operations performed on the collection such as uploading, merging, deleting, or querying documents take place in the context of a single index, so the URLs for these operations will always start with `/indexes/[index name]/docs` for a given index name.  
  
 Your application code must either generate JSON documents to upload to Azure Search or you can use an indexer to load documents if the data source is either Azure SQL Database or DocumentDB. Typically, indexes are populated from a single dataset that you provide.  
  
 Before you can upload documents, you must have already created the index on the service. See [Create Index &#40;Azure Search Service REST API&#41;](../SearchServiceREST/create-index.md) or [Create an Azure Search index in the portal](https://azure.microsoft.com/documentation/articles/search-create-index-portal/) for instructions.  
  
> [!NOTE]  
>  For a code sample, see [Get Started with Azure Search using REST](https://github.com/Azure-Samples/search-rest-api-getting-started).  If you want to practice on an existing index and data (for example, if the code you want to write is on document operations rather than indexing), you can step through a portal-based walkthrough that gets you both data and an index quickly: [Get started with Azure Search in the Portal](https://azure.microsoft.com/en-us/documentation/articles/search-get-started-portal/).  
  
 **Document storage**  
  
 In the majority of application development scenarios, search data is separate and external to your application data layer. If your application uses an on-premises database for tracking inventory status, the documents persisted in Azure Search will contain similar or identical data values in terms of product name, price, and availability, but they will be stored in the cloud, in an Azure Search index optimized for search operations.  
  
 You should plan on having one document for each item that you want to search. A movie rental application might have one document per movie, a storefront application might have one document per SKU, an online courseware application might have one document per course, a research firm might have one document for each academic paper in their repository, and so on.  
  
 **Document definition in the schema**  
  
 Documents consist of one or more fields. Fields can contain text that is tokenized into search terms, as well as non-tokenized or non-text values that can be used in filters or scoring profiles. The names, data types, and search features supported for each field are determined by the [index schema](../SearchServiceREST/create-index.md). One of the fields in each index schema must be designated as an ID, and each document must have a value for the ID field that uniquely identifies that document in the index. All other document fields are optional and will default to a null value if left unspecified. Note that null values do not take up space in the inverted index.  
  
## Operations on Documents  
 Allowable operations on Azure Search documents include the following:  
  
-   [Add, Update or Delete Documents &#40;Azure Search Service REST API&#41;](../SearchServiceREST/addupdate-or-delete-documents.md)  
  
     Once you have created an index, you can start adding, updating or removing documents that match the configured schema into the index. This step populates the index that you previously defined on the service.  
  
-   [Search Documents &#40;Azure Search Service REST API&#41;](../SearchServiceREST/search-documents.md)  
  
     You can use either Lucene query syntax or a simple syntax to formulate full-text search queries in your application code. You can also use an OData syntax in a **$filter** to get scoped search.  
  
-   [Suggestions &#40;Azure Search Service REST API&#41;](../SearchServiceREST/suggestions.md)  
  
     Suggestions are type-ahead, auto-complete queries that are displayed as the user enters a search term. For example, while typing "mountain bikes", a list of potential queries that include "mountain bikes" drop down below the search box. Suggestions are a document operation because potential queries are built from the fields in your documents.  
  
-   [Count Documents &#40;Azure Search Service REST API&#41;](../SearchServiceREST/count-documents.md)  
  
-   [Lookup Document &#40;Azure Search Service REST API&#41;](../SearchServiceREST/lookup-document.md)  
  
     You can retrieve a document by its ID, which can be useful when you know exactly which document should be returned in the search results list.  
  
## See Also  
 [Azure Search Service REST](../SearchServiceREST/service-rest.md)   
 [Index operations &#40;Azure Search Service REST API&#41;](../SearchServiceREST/index-operations.md)   
 [HTTP status codes &#40;Azure Search&#41;](../SearchServiceREST/http-status-codes.md)   
 [Service limits in Azure Search](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/)   
 [Azure Search .NET SDK](https://msdn.microsoft.com/library/azure/dn951165.aspx)  
  
  