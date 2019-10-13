---
title: Skillset operations using Azure Cognitive Search REST APIs
description: Describes the REST APIs used to create and manage a collection of cognitive skills used in an Azure Cognitive Search indexer pipeline.

ms.manager: nitinme
author: luiscabrer
ms.author: luisca

ms.service: cognitive-search
ms.devlang: rest-api
ms.workload: search
ms.topic: "language-reference"
ms.date: "05/02/2019"

---
# Skillset operations (Azure Cognitive Search REST API)

A skillset is a collection of AI-powered algorithms, referred to as *cognitive skills*, used for natural language processing and other transformations on content that you are indexing in Azure Cognitive Search. A skillset can include [built-in skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills), custom skills, or a combination of both. Examples of built-in skills include entity recognition, key phrase extraction, chunking text into logical pages, among others.

To use the skillset, reference it in an [indexer](create-indexer.md) and then run the indexer to import data, invoking transformations and enrichment on in-transit data, mapping the results to output fields to an index. A skillset is high-level standalone resource that exists on a level equivalent to indexes, indexers, and data sources, but it is operational only within indexer processing. As a high-level resource, you can design a skillset once, and then reference it in multiple indexers. 

## Operations on skillsets

+ [Create Skillset](create-skillset.md)
+ [Delete Skillset](delete-skillset.md)
+ [Get Skillset](get-skillset.md)
+ [List Skillset](list-skillset.md)
+ [Update Skillset](update-skillset.md)  

## See also  

+ [Azure Cognitive Search REST APIs](index.md)   
+ [Service limits in Azure Cognitive Search](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/)   
+ [Azure Cognitive Search .NET library](https://docs.microsoft.com/dotnet/api/overview/azure/search?view=azure-dotnet) 
+ [AI enrichment overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Quickstart: Try AI enrichment](https://docs.microsoft.com/azure/search/cognitive-search-quickstart-blob)
+ [Tutorial: Enriched indexing with AI](https://docs.microsoft.com/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](https://docs.microsoft.com/azure/search/cognitive-search-custom-skill-interface)
+ [Example: creating a custom skill](https://docs.microsoft.com/azure/search/cognitive-search-create-custom-skill-example)
+ [Built-in skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills)
