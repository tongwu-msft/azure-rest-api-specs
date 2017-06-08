---
title: "Suggestions (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2017-06-07"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: b3fed159-774d-42e0-8ded-ee453f6cd857
caps.latest.revision: 32
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
# Suggestions (Azure Search Service REST API)
  The **Suggestions** operation retrieves suggestions based on partial search input. It's typically used in search boxes to provide type-ahead suggestions as users are entering search terms. A code example demonstrating this feature can be found at [Azure Search Suggestions Demo](https://azsearchsuggestions.codeplex.com/) on Codeplex.  

 Suggestions requests aim at suggesting target documents, so the suggested text may be repeated if multiple candidate documents match the same search input. You can use `$select` to retrieve other document fields (including the document key) so that you can tell which document is the source for each suggestion.  

 A **Suggestions** operation is issued as a GET or POST request.  

```  
GET https://[service name].search.windows.net/indexes/[index name]/docs/suggest?[query parameters]  
api-key: [admin key]  
```  

```  
POST https://[service name].search.windows.net/indexes/[index name]/docs/suggest?api-version=[api-version]  
Content-Type: application/json  
api-key: [admin or query key]  
```  

 **When to use POST instead of GET**  

 When you use HTTP GET to call **Suggestions**, you need to be aware that the length of the request URL cannot exceed 8 KB. This is usually enough for most applications. However, some applications produce very large queries, specifically OData filter expressions. For these applications, using HTTP POST is a better choice because it allows larger filters than GET. With POST, the number of clauses in a filter is the limiting factor, not the size of the raw filter string since the request size limit for POST is approximately 16 MB.  

> [!NOTE]  
>  Even though the POST request size limit is very large, filter expressions cannot be arbitrarily complex. See [OData Expression Syntax for Azure Search](odata-expression-syntax-for-azure-search.md) for more information about filter complexity limitations.  

## Request  
 HTTPS is required for service requests. The **Suggestions** request can be constructed  using the GET or POST methods.  

 The request URI specifies the name of the index to query. Parameters, such as the partially input search term, are specified on the query string in the case of GET requests, and in the request body in the case of POST requests.  

 As a best practice when creating GET requests, remember to [URL-encode](https://msdn.microsoft.com/library/system.uri.escapedatastring.aspx) specific query parameters when calling the REST API directly. For **Suggestions** operations, this includes:  

-   **$filter**  

-   **highlightPreTag**  

-   **highlightPostTag**  

-   **search**  

 URL encoding is only recommended on the above query parameters. If you inadvertently URL-encode the entire query string (everything after the **?**), requests will break.  

 Also, URL encoding is only necessary when calling the REST API directly using GET. No URL encoding is necessary when calling **Suggestions** using POST, or when using the [Azure Search .NET client library](https://msdn.microsoft.com/library/azure/dn951165.aspx) handles URL encoding for you.  

### Query Parameters  
 **Suggestions** accepts several parameters that provide query criteria and also specify search behavior. You provide these parameters in the URL query string when calling **Suggestions** via GET, and as JSON properties in the request body when calling **Suggestions** via POST. The syntax for some parameters is slightly different between GET and POST. These differences are noted as applicable below.  

|Parameter|Description|  
|---------------|-----------------|  
|`search=[string]`|The search text to use to suggest queries. Must be at least 1 character, and no more than 100 characters.|  
|`highlightPreTag=[string] (optional, defaults to an empty string)`|A string tag that prepends to search hits. Must be set with `highlightPostTag`. **Note:**  When calling **Suggestions** using GET, the reserved characters in the URL must be percent-encoded (for example, %23 instead of #).|  
|`highlightPostTag=[string] (optional, defaults to an empty string)`|A string tag that appends to search hits. Must be set with `highlightPreTag`. **Note:**  When calling **Suggestions** using GET, the reserved characters in the URL must be percent-encoded (for example, %23 instead of #).|  
|`suggesterName=[string]`|The name of the **suggester** as specified in the **suggesters** collection that's part of the index definition. A **suggester** determines which fields are scanned for suggested query terms. See [Suggesters](suggesters.md) for more information.|  
|`fuzzy=[boolean] (optional, default = false)`|When set to true, this API will find suggestions even if there is a substituted or missing character in the search text. While this provides a better experience in some scenarios, it comes at a performance cost as fuzzy suggestion searches are slower and consume more resources.|  
|`searchFields=[string] (optional)`|The list of comma-separated field names to search for the specified search text. Target fields must be enabled for suggestions.|  
|`$top=# (optional, default = 5)`|The number of suggestions to retrieve. The value must be a number between 1 and 100. **Note:**  When calling **Suggestions** using POST, this parameter is named `top` instead of `$top`.|  
|`$filter=[string] (optional)`|An expression that filters the documents considered for suggestions. **Note:**  When calling **Suggestions** using POST, this parameter is named `filter` instead of `$filter`.|  
|`$orderby=[string] (optional)`|A list of comma-separated expressions to sort the results by. Each expression can be either a field name or a call to the `geo.distance()` function. Each expression can be followed by `asc` to indicated ascending, and `desc` to indicate descending. The default is ascending order. There is a limit of 32 clauses for `$orderby`. **Note:**  When calling **Suggestions** using POST, this parameter is named `orderby` instead of `$orderby`.|  
|`$select=[string] (optional)`|A list of comma-separated fields to retrieve. If unspecified, only the document key and suggestion text is returned. You can explicitly request all fields by setting this parameter to `*`. **Note:**  When calling **Suggestions** using POST, this parameter is named `select` instead of `$select`.|  
|`minimumCoverage (optional, defaults to 80)`|A number between 0 and 100 indicating the percentage of the index that must be covered by a suggestions query in order for the query to be reported as a success. By default, at least 80% of the index must be available or the Suggest operation will return HTTP status code 503. If you set `minimumCoverage` and Suggest succeeds, it will return HTTP 200 and include a `@search.coverage` value in the response indicating the percentage of the index that was included in the query. **Note:**  Setting this parameter to a value lower than 100 can be useful for ensuring search availability even for services with only one replica. However, not all matching suggestions are guaranteed to be present in the search results. If search recall is more important to your application than availability, then it's best not to lower `minimumCoverage` below its default value of 80.|  
|`api-version=[string]`|The `api-version` parameter is required. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details. For this operation, the `api-version` is specified as a query parameter in the URL regardless of whether you call **Suggestions** with GET or POST.|  

### Request Headers  
 The following table describes the required and optional request headers  

|Request Header|Description|  
|--------------------|-----------------|  
|*api-key*|The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service URL. The **Suggestions** request can specify either an admin-key or query-key as the `api-key`. The query-key is used for query-only operations.|  

 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure Preview Portal. See [Create an Azure Search service in the portal](http://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body  
 For GET: None.  

 For POST:  

```  
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

## Response:  
 Status Code: "200 OK" is returned for a successful response.  

```  
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

```  
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

## Example  
 Retrieve 5 suggestions where the partial search input is 'lux':  

```  
GET /indexes/hotels/docs/suggest?search=lux&$top=5&suggesterName=sg&api-version=2016-09-01  
```  

```  
POST /indexes/hotels/docs/suggest?api-version=2016-09-01  
    {  
      "search": "lux",  
      "top": 5,  
      "suggesterName": "sg"  
    }  
```  

 Notice that **suggesterName** is required in a Suggestions operation.  

## See also  
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Suggesters](suggesters.md)   
 [Azure Search .NET SDK](https://msdn.microsoft.com/library/azure/dn951165.aspx)  
