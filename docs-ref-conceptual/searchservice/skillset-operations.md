---
title: Skillset operations using Azure Cognitive Search REST APIs
description: Describes the REST APIs used to create and manage a collection of cognitive skills used in an Azure Cognitive Search indexer pipeline.
ms.date: 01/18/2021

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Skillset operations (Azure Cognitive Search REST API)

A skillset adds external processing steps to indexer execution, and is usually used to add AI or deep learning models to analyze or transform content to make it searchable in an index. The contents of a skillset are one or more *skills*, which can be [built-in skills](/azure/search/cognitive-search-predefined-skills) created by Microsoft, custom skills, or a combination of both.  Built-in skills exist for image analysis, including OCR, and natural language processing. Other examples of built-in skills include entity recognition, key phrase extraction, chunking text into logical pages, among others.

To use the skillset, reference it in an [indexer](create-indexer.md) and then run the indexer to import data, invoking transformations and enrichment on in-transit data, mapping the results to output fields to an index. A skillset is high-level standalone resource that exists on a level equivalent to indexes, indexers, and data sources, but it is operational only within indexer processing. As a high-level resource, you can design a skillset once, and then reference it in multiple indexers. 

## Operations on skillsets

An admin API key is required for all skillset operations.

+ [Create Skillset](create-skillset.md)
+ [Delete Skillset](delete-skillset.md)
+ [Get Skillset](get-skillset.md)
+ [List Skillset](list-skillset.md)
+ [Update Skillset](update-skillset.md) 

## See also  

+ [Get started with Azure Cognitive Search REST APIs](/azure/search/search-get-started-rest)   
+ [Service limits](/azure/search/search-limits-quotas-capacity/)   
+ [AI enrichment overview](/azure/search/cognitive-search-concept-intro)
+ [Quickstart: Create a skillset in the portal](/azure/search/cognitive-search-quickstart-blob)
+ [Tutorial: Enriched indexing with AI](/azure/search/cognitive-search-tutorial-blob)
+ [How to define a skillset](/azure/search/cognitive-search-defining-skillset)
+ [How to map fields](/azure/search/cognitive-search-output-field-mapping)
+ [How to define a custom interface](/azure/search/cognitive-search-custom-skill-interface)
+ [Built-in skills](/azure/search/cognitive-search-predefined-skills)
