---
title: "Suggesters"
ms.custom: ""
ms.date: "2016-11-09"
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
  The suggestions feature in Azure Search is a type-ahead or auto-complete query capability, providing a list of potential search terms in response to partial string inputs entered into a search box. You've probably noticed query suggestions when using commercial web search engines: typing ".NET" in Bing produces a list of terms for ".NET 4.5", ".NET Framework 3.5", and so forth. Using the service REST API, implementing suggestions in a custom Azure Search application requires the following:  

-   Enable suggestions by adding a **suggester** construction in your index, giving the name, search mode, and a list of fields for which type-ahead is invoked. For example, if you specify "cityName" as a source field, typing a partial search string of "Sea" will result in "Seattle", "Seaside", and "Seatac" (all three are actual city names) offered up as query suggestions to the user.  

-   Invoke suggestions by calling the [Suggestions &#40;Azure Search Service REST API&#41;](suggestions.md) in your application code. Typically partial search strings are sent to the service while the user is typing a search query, and this API returns a set of suggested phrases.  

 This article explains how to configure a **Suggester**. You should also review the [Suggestions &#40;Azure Search Service REST API&#41;](suggestions.md) for details on how a **Suggester** is used.  

## Usage  
 **Suggesters** are created in the index and work best when used to suggest specific documents rather than loose terms or phrases. The best candidate fields are titles, names, and other relatively short phrases that can identify an item. Less effective are repetitive fields, such as categories and tags, or very long fields such as descriptions or comments fields.  

 As part of the index definition, you can add a single **suggester** to the **suggesters** collection. Properties that define a **suggester** include the following:  

|Property|Description|  
|--------------|-----------------|  
|`name`|The name of the **suggester**. You use the name of the **suggester** when calling the [Suggestions &#40;Azure Search Service REST API&#41;](suggestions.md).|  
|`searchMode`|The strategy used to search for candidate phrases. The only mode currently supported is `analyzingInfixMatching`, which performs flexible matching of phrases at the beginning or in the middle of sentences.|  
|`sourceFields`|A list of one or more fields that are the source of the content for suggestions. Only fields of type `Edm.String` and `Collection(Edm.String)` may be sources for suggestions. Only fields that don't have a custom language analyzer set can be used.|  

> [!NOTE]  
>  If you used the public preview version of Azure Search, **suggesters** replaces an older boolean field property (`"suggestions": false`) that only supported prefix suggestions for short strings (3-25 characters). Its replacement, **suggesters**, supports infix matching that finds matching terms at the beginning or in the middle of field content, with better tolerance for mistakes in search strings. Starting with the generally available release, this is now the only implementation of the suggestions API. The older `suggestions` property that was introduced in `api-version=2014-07-31-Preview` continues to work in that version, but is not operational in 2015-02-28 or later versions  of Azure Search. See [Transition code from preview to the generally available release](http://azure.microsoft.com/en-us/documentation/articles/search-transition-from-preview/) for guidance on how to update your code.  

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
    "sourceFields: ["hotelName", "category"]  
    }  
  ],  
  "scoringProfiles": [  
     . . .   
  ]  
}  

```  

## See Also  
 [Create Index &#40;Azure Search Service REST API&#41;](create-index.md)   
 [Update Index &#40;Azure Search Service REST API&#41;](update-index.md)   
 [Suggestions &#40;Azure Search Service REST API&#41;](suggestions.md)   
 [Index operations &#40;Azure Search Service REST API&#41;](index-operations.md)   
 [Azure Search Service REST](index.md)   
 [Azure Search .NET SDK](https://msdn.microsoft.com/en-us/library/azure/dn951165.aspx)  
