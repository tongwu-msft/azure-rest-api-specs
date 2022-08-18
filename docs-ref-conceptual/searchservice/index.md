---
title: "Azure Cognitive Search Service REST"
description: REST API reference for Azure Cognitive Search, used for non-managed code such as Java, JavaScript, node.js, Python, and any programming language compatible with REST.
ms.date: 07/20/2021

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Azure Cognitive Search Service REST

Azure Cognitive Search is a fully managed cloud search service that provides a rich search experience over user-owned content. One way to add search capability is through the Search REST APIs, with operations that create and manage indexes, load data, implement search features, execute queries, and handle results.

A separate [Management REST API](/rest/api/searchmanagement) can be used to create or modify the service itself. Alternatively, you can use the portal for many service and content management tasks. To get started, see [Create a search service in Azure portal](/azure/search/search-create-service-portal).

## Key concepts

Cognitive Search has the concepts of *search services* and *indexes* and *documents*:

- A search service contains one or more indexes.
- An index provides persistent storage of search documents.
- Search documents are loaded from external sources in the form of JSON documents and pushed to an index to make it searchable.

You can also create an *indexer* to automate indexing. An indexer has a *data source* and points to an index. Optionally, it might also have a *skillset* that adds AI to the indexer pipeline.

[AI enrichment](/azure/search/cognitive-search-concept-intro) is an extension of indexers that adds machine learning transformations that extract or generate text, or add structure to content so that it can be indexed by a search service. The construct that drives AI enrichment is called a *skillset*. During data ingestion, it defines a sequence of steps that detect, structure, or transform content that is otherwise unsearchable (for example, image content).

All together, there are five types of operations that can be executed against the service:  

| Operation | Description |
|-----------|-------------|
| [Index](index-operations.md) | Create, delete, update, or configure a search index. |
| [Document](document-operations.md) | Add, update, or delete documents in the index, query the index, or look up specific documents by ID. |
| [Indexer](indexer-operations.md) | Automate aspects of an indexing operation by configuring a **data source** and an **indexer** that you can schedule or run on demand. This feature is supported for a limited number of data source types on Azure. |
| [Skillset](skillset-operations.md) | Part of an [AI enrichment](/azure/search/cognitive-search-concept-intro) workload, a skillset defines a series of enrichment processing that extracts or creates searchable text from unstructured text, application files, or image files. A skillset is invoked by an indexer. |
| [Synonym map](synonym-map-operations.md) | A synonym map is service-level resource that contains user-defined synonyms. This resource is maintained independently from search indexes. Once uploaded, you can point any searchable field to the synonym map (one per field). |

## Calling the APIs

 The APIs documented in this section provide access to operations on search data, such as index creation and population, document upload, and queries. When calling APIs, keep the following points in mind:  

- Requests must be issued over HTTPS (on the default port 443).  

- Requests must include the **api-version** in the URI. The value must be set to a supported version, formatted as shown in this example: `GET https://[search service name].search.windows.net/indexes?api-version=2020-06-30`  

- [Request headers](common-http-request-and-response-headers-used-in-azure-search.md) must include an **api-key** that was generated for the search service you provisioned. Having a valid key establishes trust, on a per request basis, between the application sending the request and the service that handles it. Optionally, you can set the Accept HTTP header. If the header is not set, the default is assumed to be `application/json`.

## Key authentication

Every HTTP request to your search service is authenticated based on two pieces of information: a search service URL and an **api-key** that provides proof the request is from a trusted entity. There are  two types of **api-keys** for different levels of operation.  

|Key|Description|Limits|  
|---------|-----------------|------------|  
|Admin|Admin keys grant full rights to all operations, including the ability to manage the service, get status and object definitions, and create and delete **indexes**, **indexers**, and **data sources**. </br></br>Two admin **api-keys**, referred to as *primary* and *secondary* keys in the portal, are automatically generated when the service is created and can be individually regenerated on demand. Having two keys allows you to roll over one key while using the second key for continued access to the service. </br></br>Admin keys are only specified in HTTP request headers. You cannot place an admin **api-key** in a URL.|Maximum of 2 per service|  
|Query|Query keys grant read-only access to content within an index (documents), and are typically distributed to client applications that issue search requests. </br></br>Query keys are created on demand. You can create them manually in the portal or programmatically via the [Management REST API](/rest/api/searchmanagement). </br></br>Query keys can be specified  in an HTTP request header for search, suggestion, or lookup operation. Alternatively, you can pass a query key  as a parameter on a URL. Depending on how your client application formulates the request, it might be easier to pass the key as a query parameter: </br></br>`GET /indexes/hotels/docs?search=*&$orderby=lastRenovationDate desc&api-version=2020-06-30&api-key=[query key]`|50 per service|  

 Visually, there is no distinction between an admin key or query key. Both keys are strings composed of 32 randomly generated alpha-numeric characters. If you lose track of what type of key is specified in your application, you can [check the key values in the portal](https://portal.azure.com) or use the [Management REST API](/rest/api/searchmanagement) to return the value and key type.  

> [!NOTE]  
> It's considered a poor security practice to pass sensitive data such as an `api-key` in the request URI. For this reason, Azure Cognitive Search will only accept a query key as an `api-key` in the query string, and you should avoid doing so unless the contents of your index should be publicly available. As a general rule, we recommend passing your `api-key` as a request header.  

## Authorization

Cognitive Search supports [Azure role-based access control (Azure RBAC)](/azure/role-based-access-control/overview) for search service administration, through Owner, Contributor, and Reader roles.

Optionally, for search solutions that can use preview features, you can use Azure RBAC to control access to indexes and other objects on a search service. This approach requires a [search service configured for Azure RBAC on the data plane](/azure/search/search-security-rbac) and an [authorization header](common-http-request-and-response-headers-used-in-azure-search.md) on REST API calls that are authenticated using Azure Active Directory.

## See also

- [Create a search service in Azure portal](/azure/search/search-create-service-portal)
- [Pricing Details](https://azure.microsoft.com/pricing/details/search/)
- [Common HTTP request and response headers](common-http-request-and-response-headers-used-in-azure-search.md)
