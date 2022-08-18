---
title: Index operations using Azure Cognitive Search REST APIs
description: Learn which REST APIs are used to create, delete, and update Azure Cognitive Search index definitions.
ms.date: 06/30/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---
# Index operations (Azure Cognitive Search REST API)

You can create and manage indexes in Azure Cognitive Search service via simple HTTP requests (POST, GET, PUT, DELETE) against a given index resource. An index specifies the structure of a search document via the fields collection of the index. Field names, data types, and attributes determine how individual fields are configured, analyzed, and used at query time. For example, attributes on the field determine whether a field is searchable, filterable, sortable, and so forth. 

An index also defines other constructs, such as scoring profiles for relevance tuning, suggesters, and custom analyzers.

## Example

The following example illustrates an index schema that includes fields, a suggester, a custom analyzer, and a language analyzer. Fields, suggesters, custom analyzers, and scoring profiles (not shown) are sections in the index. A language analyzer is predefined and referenced on the field definition.

Within the fields collection, one field must service as the search document identifier. This field is attributed with `"key": true` (see the `HotelId` in the example below).


```json  
{
  "name": "hotels",  
  "fields": [
    { "name": "HotelId", "type": "Edm.String", "key": true, "filterable": true },
    { "name": "HotelName", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": true, "facetable": false },
    { "name": "Description", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "en.microsoft" },
    { "name": "Description_fr", "type": "Edm.String", "searchable": true, "filterable": false, "sortable": false, "facetable": false, "analyzer": "fr.microsoft" },
    { "name": "Category", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
    { "name": "Tags", "type": "Collection(Edm.String)", "searchable": true, "filterable": true, "sortable": false, "facetable": true, "analyzer": "tagsAnalyzer" },
    { "name": "ParkingIncluded", "type": "Edm.Boolean", "filterable": true, "sortable": true, "facetable": true },
    { "name": "LastRenovationDate", "type": "Edm.DateTimeOffset", "filterable": true, "sortable": true, "facetable": true },
    { "name": "Rating", "type": "Edm.Double", "filterable": true, "sortable": true, "facetable": true },
    { "name": "Address", "type": "Edm.ComplexType", 
      "fields": [
          { "name": "StreetAddress", "type": "Edm.String", "filterable": false, "sortable": false, "facetable": false, "searchable": true },
          { "name": "City", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
          { "name": "StateProvince", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
          { "name": "PostalCode", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true },
          { "name": "Country", "type": "Edm.String", "searchable": true, "filterable": true, "sortable": true, "facetable": true }
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
          { "name": "Tags", "type": "Collection(Edm.String)", "searchable": true, "filterable": true, "facetable": true, "analyzer": "tagsAnalyzer" }
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
  ]
}  
```  

 After the index is created, you'll upload documents that populate the index. See [Add, Update, or Delete Documents](addupdate-or-delete-documents.md) for this next step.  

## Operations on indexes

An admin API key is required for all search index operations, including GET.

+ [Create Index](create-index.md)
+ [Update Index](update-index.md)
+ [List Indexes](list-indexes.md)
+ [Delete Index](delete-index.md)
+ [Get Index](get-index.md)
+ [Get Index Statistics](get-index-statistics.md)
+ [Analyze Text](test-analyzer.md)

## See also  

+ [Get started with Azure Cognitive Search REST APIs](/azure/search/search-get-started-rest)
+ [Create and manage API keys](/azure/search/search-security-api-keys)
+ [Service Limits](/azure/search/search-limits-quotas-capacity/) 
+ [How to create a basic search index](/azure/search/search-what-is-an-index)