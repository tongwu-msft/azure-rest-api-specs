---
title: Suggestions (Azure Cognitive Search REST API)
description: A query request composed of partial query input, returning matching strings from documents in an Azure Cognitive Search index. Type-ahead query suggestions can populate dropdown search bars or other UI experiences.
ms.date: 03/23/2020

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---

# Suggestions (Azure Cognitive Search REST API)

A **Suggestions** request is a search-as-you-type query that looks for matching values in suggester-aware fields and returns documents that contain a match. For example, if you enable suggestions on a *city* field, typing "sea" produces documents containing "Seattle", "Sea Tac", and "Seaside" (all actual city names) for that field.

The response is a content from a matching document plus the document key. In contrast with Autocomplete, which returns a completed term or phrase used in a secondary query, this request returns information that resolves to actual documents. If matching terms or phrases are identical across documents, the matching content is repeated. To improve the structure of results, consider using the `$select` filter to return additional fields that provide more differentiation and context.  

HTTPS is required for service requests. The **Suggest** request can be constructed using the GET or POST methods.

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

In contrast with a [Search Documents](search-documents.md) request, you might bind a Suggestions call to keyboard input, whereas a Search call might be bound to a click event. 

When called with GET, the length of the request URL cannot exceed 8 KB. This length is usually enough for most applications. However, some applications produce very large queries, specifically when OData filter expressions are used. For these applications, HTTP POST is a better choice because it allows larger filters than GET. 

With POST, the number of clauses in a filter is the limiting factor, not the size of the raw filter string since the request size limit for POST is approximately 16 MB. Even though the POST request size limit is very large, filter expressions cannot be arbitrarily complex. For more information about filter complexity limitations, see [OData Expression Syntax for Azure Cognitive Search](/azure/search/query-odata-filter-orderby-syntax).  

## URI Parameters

| Parameter      | Description  | 
|-------------|--------------|
| [service name] | Required. Set this to the unique, user-defined name of your search service. |
| [index name]/docs  | Required. Specifies the documents collection of a named index. |
| api-version | Required. The current stable version is `api-version=2020-06-30`. See [API versions](search-service-api-versions.md) for more versions. For queries, the api-version is always specified as a URI parameter for both GET and POST.|

### URL-encoding recommendations

Remember to [URL-encode](/dotnet/api/system.uri.escapedatastring) specific query parameters when calling the GET REST API directly. For **Suggestions** operations, this includes:  

+ search
+ $filter
+ highlightPreTag
+ highlightPostTag

URL encoding is only recommended for individual parameters. If you inadvertently URL-encode the entire query string (everything after the `?`), requests will break.  

Also, URL encoding is only necessary when calling the REST API directly using GET. No URL encoding is necessary when calling **Suggestions** using POST, or when using the [Azure Cognitive Search .NET client library](/dotnet/api/overview/azure/search) handles URL encoding for you.  

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

## Query parameters

A query accepts several parameters on the URL when called with GET, and as JSON properties in the request body when called with POST. The syntax for some parameters is slightly different between GET and POST. These differences are noted as applicable below. 

| Name      | Type | Description |
|-----------|------|-------------|
| api-version | string | Required. Version of the REST API used for the request. For a list of supported versions, see [API versions](search-service-api-versions.md). For this operation, the api-version is specified as a query parameter in the URL regardless of whether you call the API with GET or POST.|  
| $filter | string | Optional. An expression that filters the documents considered for suggestions. Only filterable fields can be used in a filter. Filter expressions "search.ismatch" and "search.ismatchscoring*" are not supported in the Autocomplete API. When called with POST, this parameter is named filter instead of $filter. See [OData Expression Syntax for Azure Cognitive Search](/azure/search/query-odata-filter-orderby-syntax) for details on the subset of the OData expression grammar that Azure Cognitive Search supports.|
| fuzzy | boolean | Optional. Defaults to false. When set to true, this API finds suggestions even if there is a substituted or missing character in the search text. The edit distance is 1 per query string. If the query string is multiple terms, there can only be one missing, extra, substituted, or transposed character in the entire string. Enabling fuzzy match can be a better experience in some scenarios, it does come at a performance cost, as fuzzy suggestion searches are slower and consume more resources. |  
| highlightPostTag | string | Optional. Defaults to an empty string. A string tag that appends to the highlighted term. Must be set with highlightPreTag. Reserved characters in URL must be percent-encoded (for example, %23 instead of #). When called using GET, the reserved characters in the URL must be percent-encoded (for example, %23 instead of #). |
| highlightPreTag | string | Optional. Defaults to an empty string. A string tag that prepends to the highlighted term. Must be set with highlightPostTag. When called using GET, the reserved characters in the URL must be percent-encoded (for example, %23 instead of #).|
| $orderby | string | Optional. A list of comma-separated expressions to sort the results by. Each expression can be either a field name or a call to the `geo.distance()` function. Each expression can be followed by "asc" (ascending) or "desc" (descending). The default is ascending order. There is a limit of 32 clauses for $orderby. When called with POST, this parameter is named order instead of $orderby.| 
| minimumCoverage | integer | Optional. Defaults to 80. A number between 0 and 100 indicating the percentage of the index that must be available to service the query before it can be reported as a success. </br></br>The default reflects a bias towards speed and efficiency over full coverage. Reducing coverage constrains query expansion, allowing results to come back faster. It also allows the query to succeed on partial index availability, even if one shard is slow to respond or unavailable due to service health issues or index maintenance. </br></br>Whatever the value of minimumCoverage, that percentage of the index must be available or Suggestions returns HTTP status code 503. If Suggestions succeed at the minimumCoverage level, it returns HTTP 200 and includes a @search.coverage value in the response indicating the percentage of the index that was available when servicing the query. </br></br>Lowering this value might be helpful if 503 errors are occurring. Otherwise, you might consider raising the value if the response is providing insufficient matches.|  
| search | string | Required. The search text to use to suggest queries. Must be at least 1 character, and no more than 100 characters. It cannot contain operators, query syntax, or quoted phrases. |  
| searchFields | string | Optional. The list of comma-separated field names to search for the specified search text. Target fields must be listed in the [Suggesters](/azure/search/index-add-suggesters) definition in the index. |  
|$select | string | Optional. A list of comma-separated fields to retrieve. If unspecified, only the document key and suggestion text are returned. You can explicitly request all fields by setting this parameter to `*`. When calling with POST, this parameter is named select instead of $select.|  
| suggesterName | string | Required. The name of the suggester as specified in the [Suggesters](/azure/search/index-add-suggesters) collection that's part of the index definition. A suggester determines which fields are scanned for suggested query terms. | 
| $top | integer | Optional. Defaults to 5). The number of autocompleted suggestions to retrieve. The value must be a number between 1 and 100. When calling with POST, this parameter is named top instead of $top.|

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
GET /indexes/hotels/docs/suggest?search=lux&$top=5&suggesterName=sg&api-version=2020-06-30 
```  

```http
POST /indexes/hotels/docs/suggest?api-version=2020-06-30 
    {  
      "search": "lux",  
      "top": 5,  
      "suggesterName": "sg"  
    }  
```  

 Notice that **suggesterName** is required in a Suggestions operation.  

## See also

+ [Add suggesters to an index](/azure/search/index-add-suggesters)
+ [Add suggestions or autocomplete to an application](/azure/search/search-autocomplete-tutorial)
+ [HTTP status codes](http-status-codes.md)
