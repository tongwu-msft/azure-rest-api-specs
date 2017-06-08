---
title: "Lucene query syntax in Azure Search"
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
ms.assetid: 1aeb47a4-21a9-45cd-80b6-3d5f79a7d0c3
caps.latest.revision: 26
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
# Lucene query syntax in Azure Search
  You can write queries against Azure Search based on the rich [Lucene Query Parser](https://lucene.apache.org/core/4_10_2/queryparser/org/apache/lucene/queryparser/classic/package-summary.html) syntax. Much of the syntax is [implemented intact in Azure Search](https://docs.microsoft.com/azure/search/search-lucene-query-architecture), with the exception of *range searches* which are constructed in Azure Search through `$filter` expressions. See [Lucene query syntax examples for building queries in Azure Search](https://azure.microsoft.com/documentation/articles/search-query-lucene-examples/) for examples of how the syntax is used.  

> [!NOTE]  
>  Azure Search also supports [Simple Query Syntax](simple-query-syntax-in-azure-search.md), a simple and robust query language that can be used for straightforward keyword search.  

## Key scenarios enabled by Lucene query syntax  
 The Lucene query syntax is more powerful than the alternative [Simple Query Syntax](simple-query-syntax-in-azure-search.md) supported by Azure Search. You should plan on using Lucene query syntax if you want to implement any of these query operations:  

-   [Field-scoped queries](#bkmk_fields)  

-   [Fuzzy search](#bkmk_fuzzy)  

-   [Proximity search](#bkmk_proximity)  

-   [Term boosting](#bkmk_termboost)  

-   [Regular expression search](#bkmk_regex)  

-   [Wildcard search](#bkmk_wildcard)  

-   [Syntax fundamentals](#bkmk_syntax)  

-   [Boolean operators](#bkmk_boolean)  

-   [Query size limitations](#bkmk_querysizelimits)  

-   [Search score for wildcard and regex queries](#bkmk_searchscoreforwildcardandregexqueries)  

-   [Example](#bkmk_example)  

 Both Lucene and simple query syntax are functionally similar for [Wildcard search](#bkmk_wildcard) and [Boolean operators](#bkmk_boolean). The sections on wildcard search and boolean operators are mostly the same for both syntax.  

## Designate the Lucene query parser for query execution  
 Use the `queryType` search parameter to specify which parser to use. Valid values include `simple|full`, with `simple` as the default.

For details about specifying query parameter, see [Search Documents &#40;Azure Search Service REST API&#41;](search-documents.md). Refer to the [Example](#bkmk_example) at the end of this page for an illustration of how to structure the request.  

##  <a name="bkmk_fields"></a> Field-scoped queries  
 You can specify a `fieldname:searchterm` construction to define a fielded query operation, where the field is a single word, and the search term is also a single word or a phrase, optionally with boolean operators. Some examples include the following:  

-   genre:jazz NOT history  

-   artists:("Miles Davis" "John Coltrane")

 Be sure to put multiple strings within quotation marks if you want both strings to be evaluated as a single entity, in this case searching for two distinct artists in the `artists` field.  

 The field specified in `fieldname:searchterm` must be a `searchable` field.  See [Create Index](create-index.md) for details on how index attributes are used in field definitions.  

##  <a name="bkmk_fuzzy"></a> Fuzzy search  
 A fuzzy search finds matches in terms that have a similar construction. Per [Lucene documentation](https://lucene.apache.org/core/4_10_2/queryparser/org/apache/lucene/queryparser/classic/package-summary.html), fuzzy searches are based on [Damerau-Levenshtein Distance](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance).  

 To do a fuzzy search, use the tilde "~" symbol at the end of a single word with an optional parameter, a number between 0 and 2 (default), that specifies the edit distance. For example, "blue~" or "blue~1" would return "blue", "blues", and "glue".

 Fuzzy search can only be applied to terms, not phrases. Fuzzy searches can expand a term up to the maximum of 50 terms that meet the distance criteria.

##  <a name="bkmk_proximity"></a> Proximity search  
 Proximity searches are used to find terms that are near each other in a document. Insert a tilde "~" symbol at the end of a phrase followed by the number of words that create the proximity boundary. For example, `"hotel airport"~5` will find the terms "hotel" and "airport" within 5 words of each other in a document.  

##  <a name="bkmk_termboost"></a> Term boosting  
 Term boosting refers to ranking a document higher if it contains the boosted term, relative to documents that do not contain the term. This differs from scoring profiles in that scoring profiles boost certain fields, rather than specific terms.  

The following example helps illustrate the differences. Suppose that there's a scoring profile that boosts matches in a certain field, say *genre* in the  [musicstoreindex example](https://msdn.microsoft.com/library/azure/dn798928.aspx). Term boosting could be used to further boost certain search terms higher than others. For example, `rock^2 electronic` will boost documents that contain the search terms in the genre field higher than other searchable fields in the index. Further, documents that contain the search term *rock* will be ranked higher than the other search term *electronic* as a result of the term boost value (2).  

 To boost a term use the caret, "^", symbol with a boost factor (a number) at the end of the term you are searching. You can also boost phrases. The higher the boost factor, the more relevant the term will be relative to other search terms. By default, the boost factor is 1. Although the boost factor must be positive, it can be less than 1 (for example, 0.20).  

##  <a name="bkmk_regex"></a> Regular expression search  
 A regular expression search finds a match based on the contents between forward slashes "/", as documented in the [RegExp class](http://lucene.apache.org/core/4_10_2/core/org/apache/lucene/util/automaton/RegExp.html).  

 For example, to find documents containing "motel" or "hotel", specify `/[mh]otel/`.  Regular expression searches are matched against single words.   

##  <a name="bkmk_wildcard"></a> Wildcard search  
 You can use generally recognized syntax for multiple (*) or single (?) character wildcard searches. Note the Lucene query parser supports the use of these symbols with a single term, and not a phrase.  

 For example to find documents containing the words with the prefix "note", such as "notebook" or "notepad", specify "note*".  

> [!NOTE]  
>  You cannot use a * or ? symbol as the first character of a search.  
>  No text analysis is performed on wildcard search queries. At query time, wildcard query terms are compared against analyzed terms in the search index and expanded. 

##  <a name="bkmk_syntax"></a> Syntax fundamentals  
 The following syntax fundamentals apply to all queries that use the Lucene syntax.  

### Escaping special characters  
 As with simple syntax, you should escape special characters, by prefixing them with backslash (\\) characters. Special characters that need to be escaped include the following:  
`+ - && || ! ( ) { } [ ] ^ " ~ * ? : \ /`  

 For example, to escape a wildcard character, use \\*.  

### Precedence operators: grouping and field grouping  
 You can use parentheses to create subqueries, including operators within the parenthetical statement. For example, `motel+(wifi||luxury)` will search for documents containing the "motel" term and either "wifi" or "luxury" (or both).

Field grouping is similar but scopes the grouping to a single field. For example, `hotelAmenities:(gym+(wifi||pool))` searches the field "hotelAmenities" for "gym" and "wifi", or "gym" and "pool".  

### SearchMode parameter considerations  
 The impact of `searchMode` on queries, as described in [Simple query syntax in Azure Search](simple-query-syntax-in-azure-search.md), applies equally to the Lucene query syntax. Namely, `searchMode` in conjunction with NOT operators can result in query outcomes that might seem unusual if you aren't clear on the implications of how you set the parameter. If you retain the default, `searchMode=any`, and use a NOT operator, the operation is computed as an OR action, such that "New York" NOT "Seattle" returns all cities that are not Seattle.  

##  <a name="bkmk_boolean"></a> Boolean operators  
 Always specify text boolean operators (AND, OR, NOT) in all caps.  

#### OR operator `||`

The OR operator is a vertical bar or pipe character. For example: `wifi || luxury` will search for documents containing either "wifi" or "luxury" or both. Because OR is the default conjunction operator, you could also leave it out, such that `wifi luxury` is the equivalent of  `wifi || luxuery`.

#### AND operator `&&` or `+`

The AND operator is an ampersand or a plus sign. For example: `wifi && luxury` will search for documents containing both "wifi" and "luxury". The plus character (+) is used for required terms. For example, `+wifi +luxury` stipulates that both terms must appear somewhere in the field of a single document.


#### NOT operator `!` or `-`

The NOT operator is an exclamation point or the minus sign. For example: `wifi !luxury` will search for documents that have the "wifi" term and/or do not have "luxury". The `searchMode` option controls whether a term with the NOT operator is ANDed or ORed with the other terms in the query in the absence of a + or || operator. Recall that `searchMode` can be set to either `any`(default) or `all`.

Using `searchMode=any` increases the recall of queries by including more results, and by default - will be interpreted as "OR NOT". For example, `wifi -luxury` will match documents that either contain the term *wifi* or those that do not contain the term *luxury.*

Using `searchMode=all` increases the precision of queries by including fewer results, and by default - will be interpreted as "AND NOT". For example, `wifi -luxury` will match documents that contain the term `wifi` and do not contain the term `luxury`. This is arguably a more intuitive behavior for the - operator. Therefore, you should consider choosing `searchMode=all` over `searchMode=any` if you want to optimize searches for precision instead of recall *and* your users frequently use the `-` operator in searches.

##  <a name="bkmk_querysizelimits"></a> Query size limitations  
 There is a limit to the size of queries that you can send to Azure Search. Specifically, you can have at most 1024 clauses (expressions separated by AND, OR, and so on). There is also a limit of approximately 32 KB on the size of any individual term in a query. If your application generates search queries programmatically, we recommend designing it in such a way that it does not generate queries of unbounded size.  

##  <a name="bkmk_searchscoreforwildcardandregexqueries"></a> Search score for wildcard and regex queries
 Azure Search uses frequency-based scoring ([TF-IDF](https://en.wikipedia.org/wiki/Tf%E2%80%93idf)) for text queries. However, for wildcard and regex queries where scope of terms can potentially be broad, the frequency factor is ignored to prevent the ranking from biasing towards matches from rarer terms. All matches are treated equally for wildcard and regex searches. 

##  <a name="bkmk_example"></a> Example  
 Find documents in the index using the Lucene query syntax.  

 This query returns hotels where the category field contains the term "budget" and all searchable fields containing the phrase "recently renovated". Documents containing the phrase "recently renovated" are ranked higher as a result of the term boost value (3).  

```  
GET /indexes/hotels/docs?search=category:budget AND \"recently renovated\"^3&searchMode=all&api-version=2015-02-28&querytype=full  
```  

 Alternatively, use POST:  

```  
POST /indexes/hotels/docs/search?api-version=2015-02-28  
{  
  "search": "category:budget AND \"recently renovated\"^3",  
  "queryType": "full",  
  "searchMode": "all"  
}  
```  

## See also  
[Search Documents](search-documents.md)
 [OData Expression Syntax for Azure Search](odata-expression-syntax-for-azure-search.md)   
 [Simple query syntax in Azure Search](simple-query-syntax-in-azure-search.md)   
  
