---
title: "Suggesters"
ms.custom: ""
ms.date: "2017-07-17"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: 1dbc2c8d-5dfb-4662-bf5c-acd289848985
caps.latest.revision: 13
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
# Suggesters

A **Suggester** is a construct supporting the search-as-you-type [Suggestions](suggestions.md) feature in Azure Search. Before you can call the Suggestions API, you must define which fields support the behavior.

Although a **suggester** has several properties, it is primarily a collection of fields for which you are enabling the Suggestions API. For example, a travel app might want to enable typeahead search on destinations, cities, and attractions. As such, all three fields would go in the field collection.

Requirements for construction include:

+ One **suggester** per index (one **suggester** allowed in the **suggesters** collection)  
+ Index rebuild is required when adding fields that already exist. Although there is no index attribute explicitly applied to fields in the collection, Azure Search updates the field definition to be suggester-aware. As such, an index rebuild is required whenever a field is redefined. Conversely, a rebuild is not required when simultaneously creating the field and adding it to the `sourceFields` collection.

## Usage  

 **Suggesters** work best when used to suggest specific documents rather than loose terms or phrases. The best candidate fields are titles, names, and other relatively short phrases that can identify an item. Less effective are repetitive fields, such as categories and tags, or very long fields such as descriptions or comments fields.  

After a suggester is created, add the [Suggestions API](suggestions.md) in your query logic to invoke the feature.  

Properties that define a **suggester** include the following:  

|Property|Description|  
|--------------|-----------------|  
|`name`|The name of the **suggester**. You use the name of the **suggester** when calling the [Suggestions &#40;Azure Search Service REST API&#41;](suggestions.md).|  
|`searchMode`|The strategy used to search for candidate phrases. The only mode currently supported is `analyzingInfixMatching`, which performs flexible matching of phrases at the beginning or in the middle of sentences.|  
|`sourceFields`|A list of one or more fields that are the source of the content for suggestions. Only fields of type `Edm.String` and `Collection(Edm.String)` may be sources for suggestions. Only fields that don't have a custom language analyzer set can be used. |  

## Suggester example  
 A **suggester** is part of the index. Only one **suggester** can exist in the **suggesters** collection in the current version, alongside the **fields** collection and **scoringProfiles**.  

```  
{  
  "name": "hotels",  
  "fields": [  
     . . .   
   ],  
  "suggesters": [  
    {  
    "name": "sg",  
    "searchMode": "analyzingInfixMatching",  
    "sourceFields": ["hotelName", "category"]  
    }  
  ],  
  "scoringProfiles": [  
     . . .   
  ]  
}  

```  

## See also  
 [Create Index &#40;Azure Search Service REST API&#41;](create-index.md)   
 [Update Index &#40;Azure Search Service REST API&#41;](update-index.md)   
 [Suggestions &#40;Azure Search Service REST API&#41;](suggestions.md)   
 [Index operations &#40;Azure Search Service REST API&#41;](index-operations.md)   
 [Azure Search Service REST](index.md)   
 [Azure Search .NET SDK](https://msdn.microsoft.com/en-us/library/azure/dn951165.aspx)  
