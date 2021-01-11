---
title: Index operations using Azure Cognitive Search REST APIs (api-version=2020-06-30-Preview)
description: Learn which REST APIs are used to create, delete, and update Azure Cognitive Search index definitions (api-version=2020-06-30-Preview).
ms.date: 01/06/2020

ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Index operations (Preview REST API)

**API Version: 2020-06-30-Preview**

> [!Important]
> This preview adds support for the [normalizers](https://docs.microsoft.com/azure/search/add-normalizers-to-search-index) that can be used to produce case-insensitive sorting and filtering output.

You can create and manage indexes in Azure Cognitive Search service via simple HTTP requests (POST, GET, PUT, DELETE) against a given index resource. To create an index, you first POST a JSON document that describes the index schema. The schema defines the fields of the index, their data types, and how they can be used (for example, in full-text searches, filters, sorting, or faceting). It also defines scoring profiles, suggesters, analyzers, normalizers, and other attributes to configure the behavior of the index.

The following example illustrates an index schema that includes fields, a suggester, a custom analyzer, a language analyzer, a pre-defined normalizer, and a custom normalizer. Fields, suggesters, custom analyzers, custom normalizers, and scoring profiles (not shown) are sections in the index. Language analyzers and pre-defined normalizers are defined natively and can be referenced on the field definition directly.

Within the field definition, attributes control how the field is used. For example, `"key": true` marks the field that is used to uniquely identify a document (`HotelId` in the example below). Other attributes like `searchable`, `filterable`, `sortable`, and `facetable` can be specified to change default behaviors. For example, they are used on the `description` field to turn off filtering, sorting and faceting. These features aren't needed for verbose text like a description, and turning them off saves space in the index.

Language-specific fields are also illustrated in this index. Description fields exist for English and for French translations, with the French translation using the `fr.microsoft` analyzer for lexical analysis.


```json  
{
  "name": "hotels",  
  "fields": [
    { "name": "HotelId", "type": "Edm.String", "key": true, "filterable": true, "normalizer": "standard" },
    { "name": "HotelName", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": true, "facetable": false },
    { "name": "Description", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "en.microsoft" },
    { "name": "Description_fr", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "fr.microsoft" },
    { "name": "Category", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
    { "name": "Tags", "type": "Collection(Edm.String)", "searchable": true, "filterable": true, "sortable": false, "facetable": true, "analyzer": "tagsAnalyzer", "normalizer": "tagsNormalizer" },
    { "name": "ParkingIncluded", "type": "Edm.Boolean", "filterable": true, "sortable": true, "facetable": true },
    { "name": "LastRenovationDate", "type": "Edm.DateTimeOffset", "filterable": true, "sortable": true, "facetable": true },
    { "name": "Rating", "type": "Edm.Double", "filterable": true, "sortable": true, "facetable": true },
    { "name": "Address", "type": "Edm.ComplexType", 
      "fields": [
          { "name": "StreetAddress", "type": "Edm.String", "filterable": false, "sortable": false, "facetable": false, "searchable": true },
          { "name": "City", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
          { "name": "StateProvince", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
          { "name": "PostalCode", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
          { "name": "Country", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true, "normalizer": "uppercase" }
        ]
    },
    { "name": "Location", "type": "Edm.GeographyPoint", "filterable": true, "sortable": true },
    { "name": "Rooms", "type": "Collection(Edm.ComplexType)", 
      "fields": [
          { "name": "Description", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "en.lucene" },
          { "name": "Description_fr", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "fr.lucene" },
          { "name": "Type", "type": "Edm.String", "searchable": true },
          { "name": "BaseRate", "type": "Edm.Double", "filterable": true, "facetable": true },
          { "name": "BedOptions", "type": "Edm.String", "searchable": true },
          { "name": "SleepsCount", "type": "Edm.Int32", "filterable": true, "facetable": true },
          { "name": "SmokingAllowed", "type": "Edm.Boolean", "filterable": true, "facetable": true },
          { "name": "Tags", "type": "Collection(Edm.String)", "searchable": true, "filterable": true, "facetable": true, "analyzer": "tagsAnalyzer", "normalizer": "tagsNormalizer" }
        ]
    }
  ],
  "suggesters": [
      { "name": "sg", "searchMode": "analyzingInfixMatching", "sourceFields": ["HotelName"] }
  ],
  "analyzers": [
    {
      "@odata.type": "#Microsoft.Azure.Search.CustomAnalyzer",    
      "name": "tagsAnalyzer",
      "charFilters": [ "html_strip" ],    
      "tokenizer": "standard_v2"    
    }
  ],
  "normalizers": [
    {
      "@odata.type": "#Microsoft.Azure.Search.CustomNormalizer",
      "name": "tagsNormalizer",
      "tokenFilters": [ "asciifolding", "lowercase" ]
    }
  ]
}  
```  

 After the index is created, you'll upload documents that populate the index. See [Add, Update or Delete Documents &#40;Azure Cognitive Search REST API&#41;](../addupdate-or-delete-documents.md) for this next step.

 For a code sample that shows how to create and build an index using the REST API, see [Get Started with Azure Cognitive Search using REST](https://github.com/Azure-Samples/search-rest-api-getting-started).  

## See also  

+ [Azure Cognitive Search REST APIs](../index.md)
+ [Azure Cognitive Search .NET library](https://docs.microsoft.com/dotnet/api/overview/azure/search?view=azure-dotnet&preserve-view=true)