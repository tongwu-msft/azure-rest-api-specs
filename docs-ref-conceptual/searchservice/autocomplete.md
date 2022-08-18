---
title: "Autocomplete (Azure Cognitive Search REST API)"
description: Send queries and obtain results based on partial inputs.
ms.date: 03/23/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Autocomplete (Azure Cognitive Search REST API)

The **Autocomplete API** finishes a partially typed query input using existing terms in the search index for use in a secondary query. For example, if the query input is "medic", the Autocomplete API will return "medicare", "medicaid", "medicine" if those terms are in the index. Internally, the search engine looks for matching terms in fields that have a [**Suggester**](/azure/search/index-add-suggesters) configured.

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

When called with GET, the length of the request URL cannot exceed 8 KB. This length is usually enough for most applications. However, some applications produce very large queries, specifically when OData filter expressions are used. For these applications, HTTP POST is a better choice because it allows larger filters than GET. 

With POST, the number of clauses in a filter is the limiting factor, not the size of the raw filter string since the request size limit for POST is approximately 16 MB. Even though the POST request size limit is very large, filter expressions cannot be arbitrarily complex. For more information about filter complexity limitations, see [OData Expression Syntax for Azure Cognitive Search](/azure/search/query-odata-filter-orderby-syntax). 

## URI Parameters

| Parameter  | Description  |
|------------|--------------|
| [service name] | Required. Set this to the unique, user-defined name of your search service. |
| [index name]/docs  | Required. Specifies the documents collection of a named index. |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions. For queries, the api-version is always specified as a URI parameter for both GET and POST.|

### URL-encoding recommendations

Remember to [URL-encode](/dotnet/api/system.uri.escapedatastring) specific query parameters when calling the GET REST API directly. For **Autocomplete**, URL-encoding might be necessary for the following query parameters:  

+ search
+ $filter
+ highlightPreTag
+ highlightPostTag

URL encoding is only recommended for individual parameters. If you inadvertently URL-encode the entire query string (everything after the `?`), requests will break.  

Also, URL encoding is only necessary when calling the REST API directly using GET. No URL encoding is necessary when using POST, or when using the [Azure Cognitive Search .NET client library](/dotnet/api/overview/azure/search), which handles encoding for you.  

## Request Headers 

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to `application/json`|  
|api-key|Required. The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service URL. Query requests against the `docs` collection can specify either an admin-key or query-key as the `api-key`. The query-key is used for query-only operations.|  

You can get the api-key value from your service dashboard in the Azure portal. For more information, see [Find existing keys](/azure/search/search-security-api-keys#find-existing-keys).

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

## Query parameters

A query accepts several parameters on the URL when called with GET, and as JSON properties in the request body when called with POST. The syntax for some parameters is slightly different between GET and POST. These differences are noted as applicable below. 

| Name      | Type | Description |
|-----------|------|-------------|
| api-version | string | Required. Version of the REST API used for the request. For a list of supported versions, see [API versioning](search-service-api-versions.md). For this operation, the api-version is specified as a URI parameter regardless of whether you call **Autocomplete** with GET or POST.  |  
| autocompleteMode | string| Optional. Defaults to oneTerm. Valid values are oneTerm, twoTerm, oneTermWithContext. </br></br>"oneTerm" returns a single term. If the query has two terms, only the last term is completed. For example, given "washington medic", the response might be any one of these single terms: "medicaid", "medicare", "medicine". </br></br>"twoTerms" matches on two-term phrases in the index. For example, given "medic", the response might be "medicare coverage", or "medical assistant". </br></br>"oneTermWithContext " completes the last term in a query with two or more terms, where the last two terms are a phrase that exists in the index. For example, given "washington medic", the response might be "washington medicaid", "washington medical". |
| $filter | string | Optional. A structured search expression in standard OData syntax that filters the documents considered for producing the completed term suggestions. Filter expressions "search.ismatch" and "search.ismatchscoring*" are not supported in the Autocomplete API. Only filterable fields can be used in a filter. When calling with POST, this parameter is named filter instead of $filter. See [OData Expression Syntax for Azure Cognitive Search](/azure/search/query-odata-filter-orderby-syntax) for details on the subset of the OData expression grammar that Azure Cognitive Search supports. |
| fuzzy | boolean | Optional. Defaults to false. When set to true, this API finds suggestions even if there is a substituted or missing character in the search text <sup>(1)</sup>. This provides a better experience in some scenarios but it comes at a performance cost as fuzzy suggestion searches are slower and consume more resources.|
| highlightPostTag | string | Optional. Defaults to an empty string. A string tag that appends to the highlighted term. Must be set with highlightPreTag. Reserved characters in URL must be percent-encoded (for example, %23 instead of #). When called using GET, the reserved characters in the URL must be percent-encoded (for example, %23 instead of #). |
| highlightPreTag | string | Optional. Defaults to an empty string. A string tag that prepends to the highlighted term. Must be set with highlightPostTag. When called using GET, the reserved characters in the URL must be percent-encoded (for example, %23 instead of #).|
| minimumCoverage | integer | Optional. Defaults to 80. A number between 0 and 100 indicating the percentage of the index that must be available to service the query before it can be reported as a success. </br></br>The default reflects a bias towards speed and efficiency over full coverage. Reducing coverage constrains query expansion, allowing results to come back faster. It also allows the query to succeed on partial index availability, even if one shard is slow to respond or unavailable due to service health issues or index maintenance. </br></br>Whatever the value of minimumCoverage, that percentage of the index must be available or Autocomplete returns HTTP status code 503. If Autocomplete succeeds at the minimumCoverage level, it returns HTTP 200 and includes a @search.coverage value in the response indicating the percentage of the index that was available when servicing the query. Lowering this value might be helpful if 503 errors are occurring. Otherwise, you might consider raising the value if the response is providing insufficient matches.|  
| search | string | Required. The text to search for. The search text to complete. Must be at least 1 character, and no more than 100 characters. It cannot contain operators, query syntax, or quoted phrases. |
| searchFields | string | Optional. The list of comma-separated field names to search for the specified search text. Target fields must be listed in the [Suggesters](/azure/search/index-add-suggesters) definition in the index. |  
| suggesterName | string | Required. The name of the suggester as specified in the [Suggesters](/azure/search/index-add-suggesters) collection that's part of the index definition. A suggester determines which fields are scanned for suggested query terms. | 
| $top | integer | Optional. Defaults to 5. The number of autocompleted suggestions to retrieve. The value must be a number between 1 and 100. When calling with POST, this parameter is named top instead of $top.|

(1) **Limitations of fuzzy in Autocomplete:**

First, the edit distance is limited to just one character difference per token unlike the [fuzzy parameter in search](/azure/search/search-query-fuzzy). Capping the edit distance to one character means that not all candidate matches will be found, but the cap is necessary to ensure an acceptable level of performance.

Second, the fuzzy step happens after the partial token expansion and only terms from the same index shard are considered for fuzzy matches. This constraint increases the performance of the Autocomplete API by eliminating the aggregation of fuzzy matches over all shards. This constraint becomes less noticeable as more terms are added to the index, resulting in similar term distribution for each shard. As terms are distributed evenly, fuzzy matches within a shard are a good approximation of fuzzy matches in the entire index. However, results could be inferior if the index has fewer terms, such as in a test or prototype index, resulting in the uneven representation across shards. For more information about how indexes are divided into shards, see [partition and replica combinations](/azure/search/search-capacity-planning#partition-and-replica-combinations).

## Response

Status Code: "200 OK" is returned for a successful response. 

The response payload has two properties.

|Property | Description |
|---------|-------------|
| "text" | The completed term or phrase |
| "queryPlusText" | The initial query input plus the completed term or phrase |

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

**Example 1:** Retrieve three autocomplete suggestions where the partial search input is 'washington medic' with default mode (oneTerm):  

```http
GET /indexes/insurance/docs/autocomplete?search=washington%20medic&$top=3&suggesterName=sg&api-version=2020-06-30
```  

```http
POST /indexes/insurance/docs/autocomplete?api-version=2020-06-30
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
  
**Example 2**: Retrieve three autocomplete suggestions where the partial search input is 'washington medic' and `autocompleteMode=twoTerms`:  

```http
GET /indexes/insurance/docs/autocomplete?search=washington%20medic&$top=3&suggesterName=sg&autocompleteMode=twoTerms&api-version=2020-06-30
```  

```http
POST /indexes/insurance/docs/autocomplete?api-version=2020-06-30
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

+ [Add suggesters to an index](/azure/search/index-add-suggesters)
+ [Add suggestions or autocomplete to an application](/azure/search/search-autocomplete-tutorial)
+ [HTTP status codes](http-status-codes.md)