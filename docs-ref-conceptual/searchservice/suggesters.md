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

The suggestions feature in Azure Search is a type-ahead query capability used to return a list of matching documents in response to partial string inputs entered into a search box. There is a design -time and query-time component to this feature. 
  
During index design, you construct a **suggester** to enable suggestions on specific fields. For example, enabling suggestions on a *cityName* field might produce "Seattle", "Seaside", and "Seatac" (all three are actual city names) in response to a partial search input of "Sea".  
  
As a separate step, add a call to the [Suggestions API](suggestions.md) in your query logic. The suggestions request operates over fields specified in a **suggester**.  

## Usage  

 **Suggesters** are typically created during index development, prior to a production roll out, to avoid rebuilding an index that is actively used.

 **Suggesters** work best when used to suggest specific documents rather than loose terms or phrases. The best candidate fields are titles, names, and other relatively short phrases that can identify an item. Less effective are repetitive fields, such as categories and tags, or very long fields such as descriptions or comments fields.  

 As part of the index definition, you can add a single **suggester** to the **suggesters** collection. Properties that define a **suggester** include the following:  

|Property|Description|  
|--------------|-----------------|  
|`name`|The name of the **suggester**. You use the name of the **suggester** when calling the [Suggestions &#40;Azure Search Service REST API&#41;](suggestions.md).|  
|`searchMode`|The strategy used to search for candidate phrases. The only mode currently supported is `analyzingInfixMatching`, which performs flexible matching of phrases at the beginning or in the middle of sentences.|  
|`sourceFields`|A list of one or more fields that are the source of the content for suggestions. Only fields of type `Edm.String` and `Collection(Edm.String)` may be sources for suggestions. Only fields that don't have a custom language analyzer set can be used.|  

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
