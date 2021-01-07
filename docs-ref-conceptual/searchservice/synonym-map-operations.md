---
title: Synonym Map Operations (Azure Cognitive Search REST API)
description: "Synonym maps contain custom rules to expand or rewrite a search query in Azure Cognitive Search."
ms.date: 12/18/2020

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Synonym Map Operations (Azure Cognitive Search REST API)

In Azure Cognitive Search, developers can define custom rules to expand or rewrite a search query with equivalent terms. For example, in your application, the words "whirlpool", "jacuzzi" and "hot tub" may be equivalent and you want to have a rule that automatically expands the search when only one is searched for. The resource that contains the rules is called a synonym map. Synonym maps are service level resources and maintained independently from search indexes. Once a synonym map is uploaded, you can point any searchable field to the synonym map (one per field).

## Workflow  

1. Add a synonym map using [Create Synonym Map](create-synonym-map.md).

1. Reference the synonym map on a searchable field of type Edm.String or Edm.Collection in the index definition. You can use [Update Index](update-index.md) to add this property to an existing field. A new field property **`synonymMaps`** specifies the map (one per field). You can update the **`synonymMaps`** properties of existing fields at any time.

1. Query as usual, using terms or phrases (enclosed in quotation marks). In Cognitive Search, two-part terms, such as "hot tub", must be expressed as a phrase, otherwise each term is evaluated independently. 

## Example

The index definition below configures the 'name' field to use the synonym map 'mysynonymmap'.

```http 
POST /indexes?api-version=2020-06-30
{
    "name":"myindex",
    "fields":[
    ...
        {
            "name":"name",
            "type":"Edm.String",
            "searchable":true,
            "analyzer":"en.lucene",
            "synonymMaps":[
            "mysynonymmap"
            ]
        }
}
```

## See also  

+ [Synonyms in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-synonyms)

+ [Synonyms C# example](https://docs.microsoft.com/azure/search/search-synonyms-tutorial-sdk)
