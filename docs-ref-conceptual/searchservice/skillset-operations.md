---
title: Skillset operations using Azure Search Service REST APIs - Azure Search
description: Describes the REST APIs used to create and manage a collection of cognitive skills used in an Azure Search indexer pipeline.

ms.manager: cgronlun
author: luiscabrer
ms.author: luisca

services: search
ms.service: search
ms.devlang: rest-api
ms.workload: search
ms.topic: "language-reference"
ms.date: "05/02/2019"

---
# Skillset operations (Azure Search Service REST API - Preview)

**Applies to:** api-version-2017-11-11-Preview

A skillset is a collection of AI-powered algorithms, referred to as *cognitive skills*, used for natural language processing and other transformations on content that you are indexing in Azure Search. A skillset can include [built-in skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills), custom skills, or a combination of both. Examples of built-in skills include entity recognition, key phrase extraction, chunking text into logical pages, among others.

To use the skillset, reference it in an [indexer](create-indexer.md) and then run the indexer to import data, invoking transformations and enrichment on in-transit data, mapping the results to output fields to an index. A skillset is high-level standalone resource that exists on a level equivalent to indexes, indexers, and data sources, but it is operational only within indexer processing. As a high-level resource, you can design a skillset once, and then reference it in multiple indexers. 

## Operations on skillsets

+ [Create Skillset](create-skillset.md)
+ [Delete Skillset](delete-skillset.md)
+ [Get Skillset](get-skillset.md)
+ [List Skillset](list-skillset.md)
+ [Update Skillset](update-skillset.md)  

## See also  

+ [Azure Search Service REST](index.md)   
+ [Service limits in Azure Search](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/)   
+ [Azure Search .NET library](https://docs.microsoft.com/dotnet/api/overview/azure/search?view=azure-dotnet) 
+ [Cognitive search overview](https://docs.microsoft.com/azure/search/cognitive-search-concept-intro)
+ [Quickstart: Try cognitive search](https://docs.microsoft.com/azure/search/cognitive-search-quickstart-blob)
+ [Tutorial: Learn the cognitive search REST APIs](https://docs.microsoft.com/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](https://docs.microsoft.com/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](https://docs.microsoft.com/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](https://docs.microsoft.com/azure/search/cognitive-search-custom-skill-interface)
+ [Example: creating a custom skill](https://docs.microsoft.com/azure/search/cognitive-search-create-custom-skill-example)
+ [Predefined skills](https://docs.microsoft.com/azure/search/cognitive-search-predefined-skills)
