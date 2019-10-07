---
title: "Update Index (Azure Cognitive Search REST API)"
ms.custom: ""
ms.date: "05/02/2019"

ms.service: search
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: f26a6d3c-823c-401e-a27e-0699aad8fd8c
caps.latest.revision: 29
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: nitinme
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
# Update Index (Azure Cognitive Search REST API)

Modifying an existing Azure Cognitive Search index typically requires an [index drop and rebuild](https://docs.microsoft.com/azure/search/search-howto-reindex), with the exception of the following schema changes:

+  Add new fields
+  [Add or change scoring profiles](https://docs.microsoft.com/azure/search/index-add-scoring-profiles) 
+  Change CORS options
+  Change existing fields with any of the following three modifications: 
  1. Show or hide fields (`retrievable`: true | false)
  2. Change the analyzer used at query time (`searchAnalyzer`)
  3. Add or edit the synonymMap used at query time (`synonymMaps`) 

To make any of these schema changes to an existing index, specify the name of the index on the request URI, and then include a fully-specified index definition with the new or changed elements.

```  
PUT https://[search service name].search.windows.net/indexes/[index name]?api-version=[api-version]  
Content-Type: application/json  
api-key: [admin key]  

```  

> [!Note]  
>  Field attributes that can be changed without the need to re-create the index include: `retrievable`, `searchAnalyzer`, `synonymMaps`.
>  

Although existing fields cannot be deleted and most attributes cannot be changed, new fields can be added to an existing index at any time. The same applies to a [`suggester`](https://docs.microsoft.com/azure/search/index-add-suggesters). New fields may be added to a `suggester` at the same time fields are added, but existing fields cannot be removed from nor added to `suggesters` without an index rebuild.

When a new field is added, all existing documents in the index automatically have a null value for that field. No additional storage space is consumed until one of two things occur: a value is provided for the new field ([using merge](addupdate-or-delete-documents.md)), or new documents are added.

Once an analyzer, a tokenizer, a token filter or a char filter is defined, it cannot be modified. New ones can be added to an existing index only if the `allowIndexDowntime` flag is set to true in the index update request:

`PUT https://[search service name].search.windows.net/indexes/[index name]?api-version=[api-version]&allowIndexDowntime=true`

This operation takes your index offline for at least a few seconds, causing your indexing and query requests to fail. Performance and write availability of the index can be impaired for several minutes after the index is updated, or longer for  indexes.

## Request  
 HTTPS is required for all service requests. The **Update Index** request is constructed using HTTP PUT. With PUT, the index name is part of the URL. If the index doesn't exist, it is created. If it already exists, it is updated to the new definition.  

 The index name must be lower case, start with a letter or number, have no slashes or dots, and be fewer than 128 characters. After starting the index name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive.  

 The `api-version` parameter is required. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details.  

### Request Headers  
 The following table describes the required and optional request headers.  

|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Update Index** request must include an `api-key` header set to your admin key (as opposed to a query key).|  

 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure portal. See [Create an Azure Cognitive Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body Syntax  
 When updating an existing index, the body must include the original schema definition, plus the new fields you are adding, as well as the modified scoring profiles and CORS options, if any. If you are not modifying the scoring profiles and CORS options, you must include the original values from when the index was created. In general, the best pattern to use for updates is to retrieve the index definition with a GET, modify it, and then update it with PUT.  

 The schema syntax used to create an index is reproduced here for convenience. See [Create Index &#40;Azure Cognitive Search REST API&#41;](create-index.md) for descriptions of the index attributes, suggesters, scoring profiles, and corsOptions.  

```  
{  
  "name": (optional on PUT; required on POST) "name_of_index",  
  "fields": [  
    {  
      "name": "name_of_field",  
      "type": "Edm.String | Edm.Int32 | Edm.Int64 | Edm.Double | Edm.Boolean | Edm.DateTimeOffset | Edm.GeographyPoint | Edm.ComplexType | Collection(Edm.String) | Collection(Edm.Int32) | Collection(Edm.Int64) | Collection(Edm.Double) | Collection(Edm.Boolean) | Collection(Edm.DateTimeOffset) | Collection(Edm.GeographyPoint) | Collection(Edm.ComplexType)",  
      "searchable": true (default where applicable) | false (only Edm.String and Collection(Edm.String) fields can be searchable),  
      "filterable": true (default) | false,  
      "sortable": true (default where applicable) | false (Collection(Edm.String) fields cannot be sortable),  
      "facetable": true (default where applicable) | false (Edm.GeographyPoint fields cannot be facetable),  
      "key": true | false (default, only Edm.String fields can be keys),  
      "retrievable": true (default) | false,  
      "analyzer": "name_of_analyzer_for_search_and_indexing", (only if 'searchAnalyzer' and 'indexAnalyzer' are not set)
      "searchAnalyzer": "name_of_search_analyzer", (only if 'indexAnalyzer' is set and 'analyzer' is not set)
      "indexAnalyzer": "name_of_indexing_analyzer", (only if 'searchAnalyzer' is set and 'analyzer' is not set)
      "synonymMaps": [ "name_of_synonym_map" ] (optional, only one synonym map per field is currently supported),
      "fields" : [ ... ] (optional, a list of sub-fields if this is a field of type Edm.ComplexType or Collection(Edm.ComplexType). Must be null or empty for simple fields.)
    }  
  ],  
  "suggesters": [  
    {  
      "name": "name of suggester",  
      "searchMode": "analyzingInfixMatching" (other modes may be added in the future),  
      "sourceFields": ["field1", "field2", ...]  
    }  
  ],  
  "scoringProfiles": [  
    {  
      "name": "name of scoring profile",  
      "text": (optional, only applies to searchable fields) {  
        "weights": {  
          "searchable_field_name": relative_weight_value (positive #'s),  
          ...  
        }  
      },  
      "functions": (optional) [  
        {  
          "type": "magnitude | freshness | distance | tag",  
          "boost": # (positive number used as multiplier for raw score != 1),  
          "fieldName": "...",  
          "interpolation": "constant | linear (default) | quadratic | logarithmic",  
          "magnitude": {  
            "boostingRangeStart": #,  
            "boostingRangeEnd": #,  
            "constantBoostBeyondRange": true | false (default)  
          },  
          "freshness": {  
            "boostingDuration": "..." (value representing timespan leading to now over which boosting occurs)  
          },  
          "distance": {  
            "referencePointParameter": "...", (parameter to be passed in queries to use as reference location)  
            "boostingDistance": # (the distance in kilometers from the reference location where the boosting range ends)  
          },  
          "tag": {  
            "tagsParameter": "..." (parameter to be passed in queries to specify a list of tags to compare against target fields)  
          }  
        }  
      ],  
      "functionAggregation": (optional, applies only when functions are specified)   
        "sum (default) | average | minimum | maximum | firstMatching"  
    }  
  ],  
  "analyzers":(optional)[ ... ],
  "charFilters":(optional)[ ... ],
  "tokenizers":(optional)[ ... ],
  "tokenFilters":(optional)[ ... ],
  "defaultScoringProfile": (optional) "...",  
  "corsOptions": (optional) {  
    "allowedOrigins": ["*"] | ["origin_1", "origin_2", ...],  
    "maxAgeInSeconds": (optional) max_age_in_seconds (non-negative integer)  
  }  
} 
```  

## Response  
 For a successful request, you should see "204 No Content".  

 By default the response body will be empty. However, if the `Prefer` request header is set to `return=representation`, the response body will contain the JSON for the index definition that was updated. In this case, the success status code will be "200 OK.  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Create Index &#40;Azure Cognitive Search REST API&#41;](create-index.md)   
 [Index operations &#40;Azure Cognitive Search REST API&#41;](index-operations.md)   
 [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions)  
 [Azure Cognitive Search .NET library](https://docs.microsoft.com/dotnet/api/overview/azure/search?view=azure-dotnet)   
 [Create an index in the portal](https://azure.microsoft.com/documentation/articles/search-create-index-portal/)  
