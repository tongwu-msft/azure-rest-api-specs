---
title: Preview REST API (Search Service)
titleSuffix: Azure Cognitive Search
description: Preview version of the search service REST API using for creating and consuming objects.
ms.date: 06/30/2020

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

This preview version of the search service REST API includes functionality for scoring and AI enrichment.

+ [Create Indexer](preview-api/create-indexer.md) adds **caching** used for storing enriched content at each stage of enrichment for potential reuse if you change parts of a skillset. [Update Indexer](preview-api/update-indexer.md) updates an indexer that has the **caching** property.
+ [Reset Skills](preview-api/reset-skills.md) is used to rebuild all or part of the cache by specifying which skills are changed.
+ [Search Document](preview-api/search-documents.md) includes a **featureModes** query parameter that returns additional information about a search score.

The preview features documented in this section are available on all tiers, in all regions.
