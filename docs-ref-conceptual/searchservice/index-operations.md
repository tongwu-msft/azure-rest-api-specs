---
title: Index operations using Azure Search Service REST APIs - Azure Search
description: Learn which REST APIs are used to create, delete, and update Azure Search index definitions.
ms.date: 02/14/2019
services: search
ms.service: search
ms.topic: "language-reference"
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: cgronlun
translation.priority.mt:
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Index operations (Azure Search Service REST API)

You can create and manage indexes in Azure Search service via simple HTTP requests (POST, GET, PUT, DELETE) against a given index resource. To create an index, you first POST a JSON document that describes the index schema. The schema defines the fields of the index, their data types, and how they can be used (for example, in full-text searches, filters, sorting, or faceting). It also defines scoring profiles, suggesters, analyzers, and other attributes to configure the behavior of the index.

The following example illustrates an index schema that includes fields, a suggester, a custom analyzer, and a language analyzer. Fields, suggesters, custom analyzers, and scoring profiles (not shown) are sections in the index. A language analyzer is predefined and simply referenced on the field definition.

Within the field definition, attributes control how the field is used. For example, `"key": true` marks the field that is used to uniquely identify a document (`hotelId` in the example below). Other attributes like `searchable`, `filterable`, `sortable`, and `facetable` can be specified to change default behaviors. For example, they are used on the `description` field to turn off filtering, sorting and faceting. These features aren't needed for verbose text like a description, and turning them off saves space in the index.

Language-specific fields are also illustrated in this index. Description fields exist for English (default) and for French translations, with the French translation using the `fr.lucene` analyzer for lexical analysis.


```  
{
 "name": "hotels",  
 "fields": [
  {"name": "hotelId", "type": "Edm.String", "key": true, "searchable": false},
  {"name": "baseRate", "type": "Edm.Double"},
  {"name": "description", "type": "Edm.String", "filterable": false, "sortable": false, "facetable": false},
  {"name": "description_fr", "type": "Edm.String", "filterable": false, "sortable": false, "facetable": false, "analyzer": "fr.lucene"},
  {"name": "hotelName", "type": "Edm.String"},
  {"name": "category", "type": "Edm.String"},
  {"name": "tags", "type": "Collection(Edm.String)", "analyzer": "tagsAnalyzer"},
  {"name": "parkingIncluded", "type": "Edm.Boolean"},
  {"name": "smokingAllowed", "type": "Edm.Boolean"},
  {"name": "lastRenovationDate", "type": "Edm.DateTimeOffset"},
  {"name": "rating", "type": "Edm.Int32"},
  {"name": "location", "type": "Edm.GeographyPoint"}
 ],
 "suggesters": [
  {
   "name": "sg",
   "searchMode": "analyzingInfixMatching",
   "sourceFields": ["hotelName"]
  }
 ],
 "analyzers": [
  {
   "name": "tagsAnalyzer",
   "type": "#Microsoft.Azure.Search.CustomAnalyzer",
   "charFilters": [ "html_strip" ],
   "tokenizer": "standard"
  }
 ]
}
```  

 After the index is created, you'll upload documents that populate the index. See [Add, Update or Delete Documents &#40;Azure Search Service REST API&#41;](addupdate-or-delete-documents.md) for this next step.  

 For a code sample that shows how to create and build an index using the REST API, see [Get Started with Azure Search using REST](https://github.com/Azure-Samples/search-rest-api-getting-started).  

 For a video introduction to indexing, see the [Channel 9 Cloud Cover episode 152 on Azure Search](https://channel9.msdn.com/Shows/Cloud+Cover/Cloud-Cover-152-Azure-Search-with-Liam-Cavanagh).  

## Operations on indexes  

-   [Create Index &#40;Azure Search Service REST API&#41;](create-index.md)  

-   [Update Index &#40;Azure Search Service REST API&#41;](update-index.md)  

-   [Get Index &#40;Azure Search Service REST API&#41;](get-index.md)  

-   [List Indexes &#40;Azure Search Service REST API&#41;](list-indexes.md)  

-   [Delete Index &#40;Azure Search Service REST API&#41;](delete-index.md)  

-   [Get Index Statistics &#40;Azure Search Service REST API&#41;](get-index-statistics.md)  

## See also  
 [Azure Search Service REST](index.md)   
 [Service limits in Azure Search](https://azure.microsoft.com/documentation/articles/search-limits-quotas-capacity/)   
 [Azure Search .NET library](https://docs.microsoft.com/dotnet/api/overview/azure/search?view=azure-dotnet)  
