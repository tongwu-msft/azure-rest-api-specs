---
title: Preview REST API (Search Service)
titleSuffix: Azure Cognitive Search
description: Preview version of the search service REST API using for creating and consuming objects.
ms.date: 03/02/2021

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# 2020-06-30-Preview Search Service REST APIs

> [!Important]
> Only those operations that differ from the generally available version are documented. Preview APIs are provided without a service level agreement, and are not recommended for production workloads. For more information, see [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/). 

This preview version of the search service REST API includes functionality for semantic search, relevance scoring, and cached AI enrichments.

| API | Preview feature in this API |
|-----|-------------------------|
| [Create Indexer](preview-api/create-indexer.md) | Configure caching of enriched content at each stage for potential reuse if you change parts of a skillset.  |
| [Reset Documents](preview-api/reset-documents.md) | Rebuild specific documents by overwriting its content. If the document contains enriched content, the skillset is invoked for that document. If enrichment caching is enabled, the cached content for that document is also refreshed. |
| [Reset Skills](preview-api/reset-skills.md) | Rebuild all or part of the cache by specifying which skills are changed. |
| [Search Document](preview-api/search-documents.md) | Includes preview query parameters that impact query term inputs and search rank: </br></br>**featureModes** returns additional information about a search score that can be consumed in custom ranking models. </br></br>**speller** adds spelling correction to simple, full, and semantic queries. </br></br>**queryType=semantic** brings deep learning to search results evaluation, promoting semantically relevant results to the top. This query type also adds **captions** and **answers** to the response. |
| [Update Indexer](preview-api/update-indexer.md) | Updates an existing indexer to use cached enrichments. |

Preview feature availability can vary by tier and region. For more information, see the [Preview features list](https://docs.microsoft.com/azure/search/search-api-preview).
