---
title: "Autocomplete (Azure Cognitive Search REST API)"
description: Send queries and obtain results based on partial inputs.
ms.date: 04/17/2020
ms.service: cognitive-search

ms.topic: "language-reference"

author: "yahnoosh"
ms.author: "jlembicz"
manager: "pablocas"
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
# Autocomplete (Azure Cognitive Search REST API)

The **Autocomplete API** helps users issue better search queries by completing partial search terms based on terms from an index. For example, if the query term is "medic", the Autocomplete API will return "medicare", "medicaid", "medicine" if those terms are in the index. Specifically, the search engine looks for matching terms in fields that have a [**Suggester**](https://docs.microsoft.com/azure/search/index-add-suggesters) configured.

 HTTPS is required for service requests. The **Autocomplete** request can be constructed using the GET or POST methods.

```http  
GET https://[service name].search.windows.net/indexes/[index name]/docs/autocomplete?[query parameters]
  Content-Type: application/json   
  api-key: [admin or query key]      
```  

```http  
POST https://[service name].search.windows.net/indexes/[index name]/docs/autocomplete?api-version=[api-version]
  Content-Type: application/json   
  api-key: [admin or query key]  
```  

 **When to use POST instead of GET**  

 With HTTP GET, the call to the **Autocomplete** API is limited to request URLs of length 8 KB. Some applications can produce large queries. For these applications, HTTP POST is a better choice. The request size limit for POST is approximately 16 MB.

 As a best practice when creating GET requests, remember to [URL-encode](https://docs.microsoft.com/uwp/api/windows.foundation.uri.escapecomponent) specific query parameters when calling the REST API directly. For **Autocomplete** operations, this includes:  

- **$filter**
- **highlightPreTag**
- **highlightPostTag**
- **search**

 URL encoding is only recommended on the above query parameters. If you inadvertently URL-encode the entire query string (everything after the `?`), requests will break.  

 Also, URL encoding is only necessary when calling the REST API directly using GET. No URL encoding is necessary when calling **Autocomplete** using POST, or when using the [Azure Cognitive Search .NET client library](https://docs.microsoft.com/dotnet/api/overview/azure/search?view=azure-dotnet) handles URL encoding for you. 

## URI Parameters

| Parameter	  | Description  | 
|-------------|--------------|
| service name | Required. Set this to the unique, user-defined name of your search service. |
| index name  | Required. The request URI specifies the name of the index to query. Query parameters are specified on the query string for GET requests and in the request body for POST requests.   |
| api-version | Required. The current version is `api-version=2019-05-06`. See [API versions in Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-api-versions) for a list of available versions.|

### Query Parameters  
 **Autocomplete** accepts several [query parameters](https://docs.microsoft.com/azure/search/search-query-overview) that provide criteria and specify search behavior. You provide these parameters in the URL query string when calling **Autocomplete** via GET, and as JSON properties in the request body when calling **Autocomplete** via POST. The syntax for some parameters is slightly different between GET and POST. These differences are noted in the following table.  

|Parameter|Description|  
|---------------|-----------------|  
|`api-version=[string]`|Required. See [API versions in Azure Cognitive Search](https://go.microsoft.com/fwlink/?linkid=834796) for details. For this operation, the `api-version` is specified as a query parameter in the URL regardless of whether you call **Autocomplete** with GET or POST.|  
|`autocompleteMode=[string] (optional, defaults to oneTerm)`| Valid values are `oneTerm`; `twoTerm`; `oneTermWithContext`. For descriptions of each mode, see below.|
|`$filter=[string] (optional)`|An expression that filters the documents considered for producing the completed term suggestions. When calling **Autocomplete** using POST, this parameter is named `filter` instead of `$filter`. For more information, see [OData expression syntax for filters](https://docs.microsoft.com/azure/search/query-odata-filter-orderby-syntax). Filter expressions **search.ismatch** and **search.ismatchscoring** are not supported in the Autocomplete API.|
|`fuzzy=[boolean] (optional, default = false)`|When set to true, this API finds suggestions even if there is a substituted or missing character in the search text. This provides a better experience in some scenarios but it comes at a performance cost as fuzzy suggestion searches are slower and consume more resources.|
|`highlightPreTag=[string] (optional, defaults to an empty string)`|A string tag that prepends to search hits. Must be set with `highlightPostTag`.   When calling **Autocomplete** using GET, the reserved characters in the URL must be percent-encoded (for example, %23 instead of #).|  
|`highlightPostTag=[string] (optional, defaults to an empty string)`|A string tag that appends to search hits. Must be set with `highlightPreTag`.   When calling **Autocomplete** using GET, the reserved characters in the URL must be percent-encoded (for example, %23 instead of #).|
|`minimumCoverage (optional, defaults to 80)`|A number between 0 and 100 indicating the percentage of the index that must be covered by an autocomplete query in order for the query to be reported as a success. By default, at least 80% of the index must be available or the Autocomplete operation returns HTTP status code 503. If you set `minimumCoverage` and Autocomplete succeeds, it returns HTTP 200 and include a `@search.coverage` value in the response indicating the percentage of the index that was included in the query.   Setting this parameter to a value lower than 100 can be useful for ensuring search availability even for services with only one replica. However, not all matching autocomplete suggestions are guaranteed to be present in the search results. If search recall is more important to your application than availability, then it's best not to lower `minimumCoverage` below its default value of 80.|  
|`search=[string]`|Required. The search text to complete. Must be at least 1 character, and no more than 100 characters. It cannot contain operators, query syntax, or quoted phrases. |     
|`searchFields=[string] (optional)`|The list of comma-separated field names to search for the specified search text. Target fields must be part of a Suggester for the index. For more information, see [Suggesters](https://docs.microsoft.com/azure/search/index-add-suggesters).|  
|`suggesterName=[string]`| Required. The name of the **suggester** as specified in the **suggesters** collection that's part of the index definition. A **suggester** determines which fields are scanned for suggested query terms. For more information, see [Suggesters](https://docs.microsoft.com/azure/search/index-add-suggesters).| 
|`$top=# (optional, default = 5)`|The number of autocomplete suggestions to retrieve. The value must be a number between 1 and 100.   When calling **Autocomplete** using POST, this parameter is named `top` instead of `$top`.|

### Autocomplete Modes

The Autocomplete API supports three different modes.

| Mode | Description | Example |
|------|-------------|---------|
| **oneTerm** |  Only one term is suggested. If the query has two terms, only the last term is completed. | `"washington medic"` -> `"medicaid", "medicare", "medicine"`| 
| **twoTerms** | Matching two-term phrases in the index will be suggested. | `"medic"` -> `"medicare coverage", "medical assistant"` | 
| **oneTermWithContext** |  Completes the last term in a query with two or more terms, where the last two terms are a phrase that exists in the index. | `"washington medic"` -> `"washington medicaid", "washington medical"` |

The result of this operation is a list of suggested terms or phrases depending on the mode.

## Request Headers 

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service URL. Query requests against the `docs` collection can specify either an admin-key or query-key as the `api-key`. The query-key is used for query-only operations.|  

You can get the api-key value from your service dashboard in the Azure portal. For more information, see [Find existing keys](https://docs.microsoft.com/azure/search/search-security-api-keys#find-existing-keys).

## Request Body 

 For GET: None.  

 For POST:  

```json
{  
  "autocompleteMode": "oneTerm" (default) | "twoTerms" | "oneTermWithContext",
  "filter": "odata_filter_expression",
  "fuzzy": true | false (default),  
  "highlightPreTag": "pre_tag",  
  "highlightPostTag": "post_tag",  
  "minimumCoverage": # (% of index that must be covered to declare query successful; default 80),
  "search": "partial_search_input",  
  "searchFields": "field_name_1, field_name_2, ...",
  "suggesterName": "suggester_name",  
  "top": # (default 5)  
}  
```  

## Response 
 Status Code: "200 OK" is returned for a successful response. 
 The response payload has two properties:

-   text – the completed term or phrase
-   queryPlusText – the completed search query text

```json 
{  
  "@search.coverage": # (if minimumCoverage was provided in the query),  
  "value": [
    {
      "text": "...",
      "queryPlusText": "..."
    },
    ...  
  ]
}  
```  

## Examples  

1. Retrieve three autocomplete suggestions where the partial search input is 'washington medic' with default mode (oneTerm):  

  ```http
  GET /indexes/insurance/docs/autocomplete?search=washington%20medic&$top=3&suggesterName=sg&api-version=2019-05-06
  ```  

  ```http
  POST /indexes/insurance/docs/autocomplete?api-version=2019-05-06
  {  
    "search": "washington medic",
    "filter": "search.in(roleId, 'admin,manager')",
    "top": 3,
    "suggesterName": "sg"  
  }  
  ``` 
  Response:
  ```json  
  {    
    "value": [
      {
        "text": "medicaid",
        "queryPlusText": "washington medicaid"
      },
      {
        "text": "medicare",
        "queryPlusText": "washington medicare"
      },
      {
        "text": "medicine",
        "queryPlusText": "washington medicine"
      }
    ]
  }  
  ```  
  
2. Retrieve three autocomplete suggestions where the partial search input is 'washington medic' and `autocompleteMode=twoTerms`:  

  ```http 
  GET /indexes/insurance/docs/autocomplete?search=washington%20medic&$top=3&suggesterName=sg&autocompleteMode=twoTerms&api-version=2019-05-06
  ```  

  ```http 
  POST /indexes/insurance/docs/autocomplete?api-version=2019-05-06
  {  
    "search": "washington medic",  
    "autocompleteMode": "twoTerms",
    "filter": "planDuration ge 1",
    "top": 3,  
    "suggesterName": "sg"  
  }  
  ```  
  Response:
  ```json
  {    
    "value": [
      {
        "text": "medicaid insurance",
        "queryPlusText": "washington medicaid insurance"
      },
      {
        "text": "medicare plan",
        "queryPlusText": "washington medicare plan"
      },
      {
        "text": "medicine book",
        "queryPlusText": "washington medicine book"
      }
    ]
  }  
  ```

 Notice that **suggesterName** is required in an Autocomplete operation.  

## See also
 [Adding Suggestions or Autocomplete to an application](https://docs.microsoft.com/azure/search/search-autocomplete-tutorial)  
 [Examples showing simple query syntax](https://docs.microsoft.com/azure/search/search-query-simple-examples)  
 [Examples showing full Lucene query syntax](https://docs.microsoft.com/azure/search/search-query-lucene-examples)  
 [Azure Cognitive Search REST APIs](index.md)   
 [HTTP status codes &#40;Azure Cognitive Search&#41;](http-status-codes.md)   
 [Suggesters](https://docs.microsoft.com/azure/search/index-add-suggesters)   
 [Azure Cognitive Search .NET SDK](https://docs.microsoft.com/dotnet/api/overview/azure/search?view=azure-dotnet)  
