---
title: API versions of Search REST APIs 
titleSuffix: Azure Cognitive Search
description: Lists the generally available and preview versions of the Search REST APIs for Azure Cognitive Search.

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

ms.date: 07/20/2021
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# API versions of Search REST APIs

This article lists the current and past versions of the Search REST APIs for Azure Cognitive Search.

## Stable versions

| API version | Specification | API updates |
|-------------|---------------|-------------|
| [`2020-06-30`](/rest/api/searchservice/index)| [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/data-plane/Azure.Search/preview/2020-06-30) | [Release note](#2020-06-30) |
| `2019-05-06` |  [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/data-plane/Azure.Search/stable/2019-05-06) | Adds complex types. |
| `2017-11-11` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/data-plane/Microsoft.Azure.Search.Data/preview/2017-11-11) | Adds skillsets and AI enrichment. |
| `2016-09-01` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/data-plane/Microsoft.Azure.Search.Data/preview/2016-09-01) | Adds indexers. |
| `2015-02-28` | Unsupported after 10-10-2020   | First generally available release.  |

## Preview versions

Preview versions are released to test new functionality, gather feedback, and discover and fix issues. Preview APIs are available under [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/).

| API version | Specification | API updates |
|-------------|---------------|-------------|
| [`2021-04-30-Preview`](/rest/api/searchservice/index-preview) | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/data-plane/Azure.Search/preview/2021-04-30-Preview) | [Release note](#2021-04-30-Preview) |
| `2020-06-30-Preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/data-plane/Azure.Search/preview/2020-06-30-Preview) | [Release note](#2020-06-30-Preview)  |
| `2019-05-06-Preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/data-plane/Azure.Search/preview/2019-05-06-Preview)| [Release note](#2019-05-06-Preview) |
| `2017-11-11-Preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/data-plane/Microsoft.Azure.Search.Data/preview/2017-11-11-preview)| Preview version associated with stable version. |
| `2016-09-01-Preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/data-plane/Microsoft.Azure.Search.Data/preview/2016-09-01-preview) | Preview version associated with stable version.|
| `2015-02-28-Preview` | Unsupported after 10-10-2020  | Preview version associated with stable version. |
| `2014-10-20-Preview` | Unsupported after 10-10-2020 | Second public preview. |
| `2014-07-31-Preview` | Unsupported after 10-10-2020  | First public preview. |

## Release notes

<a name="2021-04-30-Preview"></a>

### 2021-04-30-Preview

This preview version includes all of the features introduced in 2020-06-30-Preview, plus the following additions:

+ Azure Active Directory (Azure AD) support. This preview API adds an authorization header so that applications can authenticate using Azure Active Directory. Azure AD support means that you can implement [role-based authorization](/search/search-security-rbac) to indexes, synonym maps, indexers, data sources, and skillsets. Using this feature requires that you first enable it on your search service using Azure portal or the [Management REST API](/rest/api/searchmanagement/) version 2021-04-01-Preview.

+ SearchIndexerDataIdentity property that specifies a system or user-managed identity. This property is added to encryption key for indexer data sources, and also as an indexer data source top-level property.

+ More languages for the Text Translation cognitive skill.

+ More queryLanguages for semantic search and speller.

<a name="2020-06-30"></a>

### 2020-06-30

This is the current stable release of the Search REST APIs. Generally available features in this release include:

+ Relevance scoring (BM25)
+ Knowledge stores
+ Indexer data source for Azure Data Lake Storage (ADLS) Gen2
+ Custom Entity Lookup skill
+ Indexers running under a system or user-managed identity via Azure Active Directory

<a name="2020-06-30-Preview"></a>

### 2020-06-30-Preview

This preview version includes all of the features introduced in 2019-05-06-Preview, plus the following additions:

+ Semantic search, a premium feature that runs on Standard tier services and that invokes semantic ranking.
+ Indexer data source for Power Query Connectors
+ Indexer data source for MySQL
+ Indexer data source for Cosmos DB Gremlin API
+ Indexer data source for SharePoint Online
+ Normalizer property for text normalization, for case-insensitive filtering, faceting and sorting
+ Reset Documents for indexer-based indexing to specifically refresh specific documents by ID
+ Entity Linking cognitive skill (v3)
+ Entity Recognition cognitive skill (v3)
+ Sentiment cognitive cognitive skill (v3)

<a name="2019-05-06-Preview"></a>

### 2019-05-06-Preview

+ Indexer data source support for Cosmos DB MongoDB API, Cassandra API
+ Indexer data source for native blob soft delete in Blob Storage
+ featuresMode parameter that returns detailed information about a relevance score
+ Azure Machine Learning (AML) cognitive skill
+ Personal identification detection cognitive skill
+ Cache enriched documents to preserve and reuse image processing (and other AI enrichments)

## See also

+ [Create a search service](/azure/search/search-create-service-portal)
+ [Quickstart: Create an Azure Cognitive Search index using REST APIs](/azure/search/search-get-started-rest)
+ [Get started with Azure Cognitive Search using Visual Studio Code](/azure/search/search-get-started-vs-code)
