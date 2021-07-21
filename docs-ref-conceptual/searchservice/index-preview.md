---
title: Preview REST API (Search Service)
titleSuffix: Azure Cognitive Search
description: Preview version of the search service REST API using for creating and consuming objects.
ms.date: 07/20/2021

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# 2021-04-30-Preview Search Service REST APIs

This section of the REST API reference describes the new or changed APIs that are currently in preview. Only those API that differ from the generally available version are documented in this section. If an API is missing from this section, it's because there is no preview feature associated with that API.

> [!NOTE]
> Preview APIs are available under [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) and are not recommended for production workloads.

| API | Preview feature description|
|-----|-----------------------------|
| [Create or Update Index](preview-api/create-or-update-index.md) | Add a normalizer attribute to handle case discrepancies in filter and sort operations.  |
| [Create or Update Indexer](preview-api/create-or-update-indexer.md) | Configure caching of enriched content at each stage for potential reuse if you change parts of a skillset.  |
| [Create or Update Data Source](preview-api/create-or-update-data-source.md) | Connect to  indexer data sources using Azure AD authentication, using a system or user-assigned managed identity, with role assignments on the external data source. Managed identities are also supported when obtaining a key used on user-encrypted content. |
| [Reset Documents](preview-api/reset-documents.md) | Rebuild specific documents by overwriting its content. If the document contains enriched content, the skillset is invoked for that document. If enrichment caching is enabled, the cached content for that document is also refreshed. |
| [Reset Skills](preview-api/reset-skills.md) | Rebuild all or part of the cache by specifying which skills are changed. |
| [Search Document](preview-api/search-documents.md) | Includes preview query parameters that impact query term inputs and search rank: </br></br>**featureModes** returns additional information about a search score that can be consumed in custom ranking models. </br></br>**speller** adds spelling correction to simple, full, and semantic queries. </br></br>**queryType=semantic** brings deep learning to search results evaluation, promoting semantically relevant results to the top. This query type also adds **captions** and **answers** to the response. |
