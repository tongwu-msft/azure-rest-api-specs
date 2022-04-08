---
title: Synonym Map Operations (Azure Cognitive Search REST API)
description: "Synonym maps contain custom rules to expand or rewrite a search query in Azure Cognitive Search."
ms.date: 01/18/2021

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Synonym Map Operations (Azure Cognitive Search REST API)

A synonym map is a resource that associates terms, expanding queries to include mapped terms. For example, in your application, the words "whirlpool", "jacuzzi" and "hot tub" may be equivalent and you want to have a rule that automatically expands the search when only one is searched for. The resource that contains the rules is called a synonym map. 

Synonym maps are service level resources and maintained independently from search indexes. Once a synonym map is uploaded, you can point any searchable field to the synonym map (one per field).

## Workflow  

1. Add a synonym map using [Create Synonym Map](create-synonym-map.md).

1. Reference the synonym map on a *searchable* field of type Edm.String or Edm.Collection in the index definition. You can use [Update Index](update-index.md) to add this property to an existing field. A field property `synonymMaps` specifies the map (one per field). You can update the `synonymMaps` properties of existing fields at any time.

1. Query as usual, using terms or phrases (enclosed in quotation marks). In Cognitive Search, two-part terms, such as "hot tub", must be expressed as a phrase, otherwise each term is evaluated independently. If you query for "hot tub", the search engine will scan for that phrase as well as any synonyms you have defined, such as jacuzzi.

## Example

After you create a synonym map, you can assign it to specific fields in an index. The index definition below configures the 'name' field to use the synonym map 'mysynonymmap'.

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
            "synonymMaps": [
                "mysynonymmap"
            ]
        }
    ...
}
```

## Operations on synonym maps  

An admin API key is required for all synonym map operations.

+ [Create Synonym Map](create-synonym-map.md)  
+ [Update Synonym Map](update-synonym-map.md)  
+ [List Synonym Maps](list-synonym-maps.md)  
+ [Get Synonym Map](get-synonym-map.md)  
+ [Delete Synonym Map](delete-synonym-map.md)  

## See also

+ [Get started with Azure Cognitive Search REST APIs](/azure/search/search-get-started-rest)
+ [Synonyms in Azure Cognitive Search](/azure/search/search-synonyms)
+ [Synonyms C# example](/azure/search/search-synonyms-tutorial-sdk)
+ [Create and manage API keys](/azure/search/search-security-api-keys)