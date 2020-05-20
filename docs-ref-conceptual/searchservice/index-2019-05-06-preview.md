---
title: Preview REST API (Search Service)
titleSuffix: Azure Cognitive Search
description: Preview version of the search service REST API using for creating and consuming objects.
ms.prod: azure
ms.service: cognitive-search
ms.topic: "language-reference"

ms.date: 05/20/2020
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# 2019-05-06-Preview Search Service REST APIs

> [!Important]
> Only those operations that differ from the generally available version are documented. Preview APIs are provided without a service level agreement, and are not recommended for production workloads. For more information, see [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/). 

This preview version of the search service REST API includes functionality for search rank and AI enrichment.

+ [Search Document](2019-05-06-preview/search-documents.md) includes a featureMode query parameters not available in the stable version. These parameters affect search rank and results composition.
+ [Create Skillset](2019-05-06-preview/create-skillset.md) includes knowledge store and projection definitions.
+ [Create Indexer](2019-05-06-preview/create-indexer.md) adds caching used during incremental enrichment.

For more information about these preview functions, see [Knowledge stores](https://docs.microsoft.com/azure/search/knowledge-store-concept-intro) and [Incremental enrichment](https://docs.microsoft.com/azure/search/cognitive-search-incremental-indexing-conceptual).

The preview features documented in this section are available on all tiers, in all regions.
