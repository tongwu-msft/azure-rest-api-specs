---
title: "Update Index (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2016-08-10"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to: 
  - "Azure"
ms.assetid: f26a6d3c-823c-401e-a27e-0699aad8fd8c
caps.latest.revision: 29
author: "Brjohnstmsft"
ms.author: "brjohnst"
manager: "jhubbard"
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
# Update Index (Azure Search Service REST API)
  You can update an existing index within Azure Search to change its schema, including adding new fields, modifying CORS options, and adding or changing scoring profiles (see [Add scoring profiles to a search index &#40;Azure Search Service REST API&#41;](add-scoring-profiles-to-a-search-index.md) for more information). You can specify the name of the index to update on the request URI.  
  
```  
PUT https://[search service name].search.windows.net/indexes/[index name]?api-version=[api-version]  
Content-Type: application/json  
api-key: [admin key]  
  
```  
  
> [!IMPORTANT]  
>  Support for index schema updates is limited to operations that don't require rebuilding the search index. Any changes that require re-indexing, such as changing field types, are not currently supported. New fields can be added at any time, although existing fields cannot be changed or deleted. The same applies to **suggesters**. New fields may be added to **suggesters** at the time the fields are added, but fields cannot be removed from **suggesters** and existing fields cannot be added. For more information, see [Suggesters](suggesters.md).  
  
 When adding a new field to an index, all existing documents in the index be automatically have a null value for that field. No additional storage space will be consumed until new documents are added to the index.  
  
## Request  
 HTTPS is required for all service requests. The **Update Index** request is constructed using HTTP PUT. With PUT, the index name is part of the URL. If the index doesn't exist, it is created. If it already exists, it is updated to the new definition.  
  
 The index name must be lower case, start with a letter or number, have no slashes or dots, and be less than 128 characters. After starting the index name with a letter or number, the rest of the name can include any letter, number and dashes, as long as the dashes are not consecutive.  
  
 The `api-version` parameter is required. See [Azure Search Service Versioning](../Topic/Azure%20Search%20Service%20Versioning.md) for a list of available versions.  
  
### Request Headers  
 The following table describes the required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set this to `application/json`|  
|*api-key:*|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service. The **Update Index** request must include an `api-key` header set to your admin key (as opposed to a query key).|  
  
 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure classic portal. See [Create an Azure Search service in the portal](http://azure.microsoft.com/en-us/documentation/articles/search-create-service-portal/) for page navigation help.  
  
### Request Body Syntax  
 When updating an existing index, the body must include the original schema definition, plus the new fields you are adding, as well as the modified scoring profiles and CORS options, if any. If you are not modifying the scoring profiles and CORS options, you must include the original values from when the index was created. In general, the best pattern to use for updates is to retrieve the index definition with a GET, modify it, and then update it with PUT.  
  
 The schema syntax used to create an index is reproduced here for convenience. See [Create Index &#40;Azure Search Service REST API&#41;](create-index.md) for descriptions of the index attributes, suggesters, scoring profiles, and corsOptions.  
  
```  
{  
  "name": (optional on PUT; required on POST) "name_of_index",  
  "fields": [  
    {  
      "name": "name_of_field",  
      "type": "Edm.String | Collection(Edm.String) | Edm.Int32 | Edm.Int64 | Edm.Double | Edm.Boolean | Edm.DateTimeOffset | Edm.GeographyPoint",  
      "searchable": true (default where applicable) | false (only Edm.String and Collection(Edm.String) fields can be searchable),  
      "filterable": true (default) | false,  
      "sortable": true (default where applicable) | false (Collection(Edm.String) fields cannot be sortable),  
      "facetable": true (default where applicable) | false (Edm.GeographyPoint fields cannot be facetable),  
      "key": true | false (default, only Edm.String fields can be keys),  
      "retrievable": true (default) | false,  
      "analyzer": "name of text analyzer"  
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
  
## See Also  
 [Azure Search Service REST](service-rest.md)   
 [Create Index &#40;Azure Search Service REST API&#41;](create-index.md)   
 [Index operations &#40;Azure Search Service REST API&#41;](index-operations.md)   
 [Azure Search Service Versioning](../Topic/Azure%20Search%20Service%20Versioning.md)   
 [Azure Search .NET library](https://msdn.microsoft.com/en-us/library/azure/dn951165.aspx)   
 [Create an index in the portal](https://azure.microsoft.com/documentation/articles/search-create-index-portal/)  
  
  