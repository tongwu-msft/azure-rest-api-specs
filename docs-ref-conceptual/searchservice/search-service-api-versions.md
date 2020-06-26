---
title: API versions (Azure Cognitive Search REST API)
description: Generally available and preview versions of the search REST APIs used to create and use objects on Azure Cognitive Search.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# REST API versions - Azure Cognitive Search

## Stable versions

Stable versions operate under an [Azure service level agreement (SLA)](https://azure.microsoft.com/support/legal/sla/search/v1_0/).

**2020-06-30** is the most current generally available release of the Search Service REST API. This release adds the generally available version of knowledge store (in the Skillset APIs), relevance scoring improvements, and customer-managed encryption keys. For more information, see [What's New in Azure Cognitive Search](https://docs.microsoft.com/azure/search/whats-new).

**2019-05-06** is the previous stable version. For more information about upgrading from this version, see [Upgrade to the latest REST API](https://docs.microsoft.com/azure/search/search-api-migration).

## Preview versions

Preview functionality is provided without a service level agreement, and is not recommended for production workloads. For more information, see [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/).

**2020-06-30-Preview** is the most current preview version. A core feature still in preview is incremental enrichment (caching of enriched documents created by an indexer-driven AI enrichment pipeline).

**2019-05-06-Preview** is the previous preview version.

The full list of preview features can be found in [Preview APIs](https://docs.microsoft.com/azure/search/search-api-preview) and in [What's New in Azure Cognitive Search](https://docs.microsoft.com/azure/search/whats-new).

## See also

+ [Create a search service](https://docs.microsoft.com/azure/search/search-create-service-portal)
+ [Service administration using the portal](https://docs.microsoft.com/azure/search/search-manage)