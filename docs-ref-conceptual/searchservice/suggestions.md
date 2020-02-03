---
title: "Suggestions (Azure Cognitive Search REST API)"
description: A query request composed of partial query input, returning matching strings from documents in an Azure Cognitive Search index. Type-ahead query suggestions can populate dropdown search bars or other UI experiences.
ms.date: 01/30/2020

ms.service: cognitive-search
ms.topic: "language-reference"
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
# Suggestions (Azure Cognitive Search REST API)

A **Suggestions** request is a "search-as-you-type" query consisting of a partial string input (three character minimum). It returns matching text found in suggester-aware fields. Azure Cognitive Search looks for matching values in fields that are predefined in a [**Suggester**](https://docs.microsoft.com/azure/search/index-add-suggesters). For example, if you enable suggestions on a *city* field, typing "sea" produces documents containing "Seattle", "Sea Tac", and "Seaside" (all actual city names) for that field.

The results of this operation return a list of suggested text from matching documents, plus the document key.
If matching text is identical across documents, the suggested text is repeated. To improve the structure of results, consider using the `$select` filter to return additional fields that provide more differentiation and context.  

This request is different than a [Search Documents API](search-documents.md) request. In application code, you might bind a suggestions call to keyboard input, and a search call to a search button. 

 A **Suggestions** operation is issued as a GET or POST request.  

```http
GET https://[service name].search.windows.net/indexes/[index name]/docs/suggest?[query parameters]  
  Content-Type: application/json  
  api-key: [admin or query key]   
```  

```http
POST https://[service name].search.windows.net/indexes/[index name]/docs/suggest?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin or query key]  
```  

 **When to use POST instead of GET**  

 When you use HTTP GET to call **Suggestions**, the length of the request URL cannot exceed 8 KB. This length is usually enough for most applications. However, some applications produce very large queries, specifically when OData filter expressions are used. For these applications, HTTP POST is a better choice because it allows larger filters than GET. With POST, the number of clauses in a filter is the limiting factor, not the size of the raw filter string since the request size limit for POST is approximately 16 MB.  

> [!NOTE]  
>  Even though the POST request size limit is very large, filter expressions cannot be arbitrarily complex. For more information about filter complexity limitations, see [OData Expression Syntax for Azure Cognitive Search](https://docs.microsoft.com/azure/search/query-odata-filter-orderby-syntax).  

 ## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required. The request URI specifies the name of the index to query. Query parameters are specified on the query string for GET requests and in the request body for POST requests.   |
| query parameters| For GET, a multi-part construction that includes a fully specified search or filter expression (optional) and `api-version=2019-05-06` (required). For this operation, the api-version is specified as a query parameter. Query syntax is covered further down in this page.|

### URL-encoding recommendations

 As a best practice when creating GET requests, remember to [URL-encode](https://docs.microsoft.com/dotnet/api/system.uri.escapedatastring) specific query parameters when calling the REST API directly. For **Suggestions** operations, this includes:  

-   **$filter**  

-   **highlightPreTag**  

-   **highlightPostTag**  

-   **search**  

 URL encoding is only recommended on the above query parameters. If you inadvertently URL-encode the entire query string (everything after the `?`), requests will break.  

 Also, URL encoding is only necessary when calling the REST API directly using GET. No URL encoding is necessary when calling **Suggestions** using POST, or when using the [Azure Cognitive Search .NET client library](https://docs.microsoft.com/dotnet/api/overview/azure/search) handles URL encoding for you.  

### Query Parameters  
 **Suggestions** accepts several parameters that provide query criteria and also specify search behavior. You provide these parameters in the URL query string when calling **Suggestions** via GET, and as JSON properties in the request body when calling **Suggestions** via POST. The syntax for some parameters is slightly different between GET and POST. These differences are noted in the following table.  

|Parameter|Description|  
|---------------|-----------------|  
|`search=[string]`|The search text to use to suggest queries. Must be at least 1 character, and no more than 100 characters. It cannot contain operators, query syntax, or quoted phrases. |  
|`highlightPreTag=[string] (optional, defaults to an empty string)`|A string tag that prepends to search hits. Must be set with `highlightPostTag`. **Note:**  When calling **Suggestions** using GET, the reserved characters in the URL must be percent-encoded (for example, %23 instead of #).|  
|`highlightPostTag=[string] (optional, defaults to an empty string)`|A string tag that appends to search hits. Must be set with `highlightPreTag`. **Note:**  When calling **Suggestions** using GET, the reserved characters in the URL must be percent-encoded (for example, %23 instead of #).|  
|`suggesterName=[string]`|The name of the **suggester** as specified in the **suggesters** collection that's part of the index definition. A **suggester** determines which fields are scanned for suggested query terms. See [Suggesters](https://docs.microsoft.com/azure/search/index-add-suggesters) for more information.|  
|`fuzzy=[boolean] (optional, default = false)`|When set to true, this API finds suggestions even if there is a substituted or missing character in the search text. While this provides a better experience in some scenarios, it comes at a performance cost, as fuzzy suggestion searches are slower and consume more resources. |  
|`searchFields=[string] (optional)`|The list of comma-separated field names to search for the specified search text. Target fields must be enabled for suggestions.|  
|`$top=# (optional, default = 5)`|The number of suggestions to retrieve. The value must be a number between 1 and 100. **Note:**  When calling **Suggestions** using POST, this parameter is named `top` instead of `$top`.|  
|`$filter=[string] (optional)`|An expression that filters the documents considered for suggestions. When calling **Suggestions** using POST, this parameter is named `filter` instead of `$filter`. For more information, see [OData expression syntax for filters](https://docs.microsoft.com/azure/search/query-odata-filter-orderby-syntax).|
|`$orderby=[string] (optional)`|A list of comma-separated expressions to sort the results by. Each expression can be either a field name or a call to the `geo.distance()` function. Each expression can be followed by `asc` to indicated ascending, and `desc` to indicate descending. The default is ascending order. There is a limit of 32 clauses for `$orderby`. **Note:**  When calling **Suggestions** using POST, this parameter is named `orderby` instead of `$orderby`.|  
|`$select=[string] (optional)`|A list of comma-separated fields to retrieve. If unspecified, only the document key and suggestion text is returned. You can explicitly request all fields by setting this parameter to `*`. **Note:**  When calling **Suggestions** using POST, this parameter is named `select` instead of `$select`.|  
|`minimumCoverage (optional, defaults to 80)`|A number between 0 and 100 indicating the percentage of the index that must be covered by a suggestions query in order for the query to be reported as a success. By default, at least 80% of the index must be available or the Suggest operation returns HTTP status code 503. If you set `minimumCoverage` and Suggest succeeds, it returns HTTP 200 and include a `@search.coverage` value in the response indicating the percentage of the index that was included in the query. **Note:**  Setting this parameter to a value lower than 100 can be useful for ensuring search availability even for services with only one replica. However, not all matching suggestions are guaranteed to be present in the search results. If search recall is more important to your application than availability, then it's best not to lower `minimumCoverage` below its default value of 80.|  
|`api-version=[string]`|The `api-version` parameter is required. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for details. For this operation, the `api-version` is specified as a query parameter in the URL regardless of whether you call **Suggestions** with GET or POST.|  

> [!NOTE]  
>  Filter expressions **search.ismatch** and **search.ismatchscoring** are not supported with Suggestions API.

## Request Header 

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service URL. Query requests against the `docs` collection can specify either an admin-key or query-key as the `api-key`. The query-key is used for query-only operations.|  

You can get the api-key value from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys).  

## Request Body  
 For GET: None.  

 For POST:  

```http
{  
      "filter": "odata_filter_expression",  
      "fuzzy": true | false (default),  
      "highlightPreTag": "pre_tag",  
      "highlightPostTag": "post_tag",  
      "minimumCoverage": # (% of index that must be covered to declare query successful; default 80),  
      "orderby": "orderby_expression",  
      "search": "partial_search_input",  
      "searchFields": "field_name_1, field_name_2, ...",  
      "select": "field_name_1, field_name_2, ...",  
      "suggesterName": "suggester_name",  
      "top": # (default 5)  
    }  
```  

## Response 
 Status Code: "200 OK" is returned for a successful response.  

```json  
{  
  "@search.coverage": # (if minimumCoverage was provided in the query),  
  "value": [  
    {  
      "@search.text": "...",  
      "<key field>": "..."  
    },  
    ...  
  ]  
}  
```  

 If the projection option is used to retrieve fields, they are included in each element of the array:  

```json 
{  
  "value": [  
    {  
      "@search.text": "...",  
      "<key field>": "..."  
      <other projected data fields>  
    },  
    ...  
  ]  
}  
```  

## Examples  
 Retrieve 5 suggestions where the partial search input is 'lux':  

```http  
GET /indexes/hotels/docs/suggest?search=lux&$top=5&suggesterName=sg&api-version=2019-05-06 
```  

```http
POST /indexes/hotels/docs/suggest?api-version=2019-05-06 
    {  
      "search": "lux",  
      "top": 5,  
      "suggesterName": "sg"  
    }  
```  

 Notice that **suggesterName** is required in a Suggestions operation.  

## See also  
 [Adding Suggestions or Autocomplete to an application](https://docs.microsoft.com/azure/search/search-autocomplete-tutorial)  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Suggesters](https://docs.microsoft.com/azure/search/index-add-suggesters)   
 [Azure Cognitive Search .NET SDK](https://docs.microsoft.com/dotnet/api/overview/azure/search?view=azure-dotnet)  
