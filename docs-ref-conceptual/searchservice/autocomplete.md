---
title: "Autocomplete (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2018-02-28"
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
author: "jlembicz"
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
# Autocomplete (Azure Search Service REST API)

> [!NOTE]  
> Autocomplete API is a preview feature and is not intended to be used in production code. Preview features are subject to change and are exempt from the service level agreement (SLA).

The **Autocomplete API** helps users issue better search queries by completing partial search terms based on terms from an index. For example, if the query term is “medic”, the Autocomplete API will return “medicare”, “medicaid”, “medicine” if those terms are in the index. Specifically, the search engine looks for matching terms in fields that have a [**Suggester**](suggesters.md) configured.

 **Autocomplete Modes**  

The Autocomplete API support three different modes: 

1. **oneTerm** – only one term is suggested as in the example above. If the query has two terms, only the last term is completed, for example:
  
        “washington medic” -> “medicaid”, “medicare”, “medicine”

2. **twoTerms** – matching two term phrases existing in the index will be suggested, for example: 

        “medic” -> “medicare coverage”, ”medical assistant”

3. **oneTermWithContext** – completes the last term in a query with two or more therms, where the last two terms are a phrase that exists in the index, for example: 

        “washington medic” -> “washington medicaid”, ”washington medical”

The result of this operation is a list of suggested terms or phrases depending on the mode.

An **Autocomplete** operation is issued as a GET or POST request.  

```  
GET https://[service name].search.windows.net/indexes/[index name]/docs/autocomplete?[query parameters]  
api-key: [admin or query key]  
```  

```  
POST https://[service name].search.windows.net/indexes/[index name]/docs/autocomplete?api-version=[api-version]  
Content-Type: application/json  
api-key: [admin or query key]  
```  

 **When to use POST instead of GET**  

 When you use HTTP GET to call **Autocomplete**, the length of the request URL cannot exceed 8 KB. This length is usually enough for most applications. However, some applications produce very large queries, specifically when OData filter expressions are used. For these applications, HTTP POST is a better choice because it allows larger filters than GET. With POST, the number of clauses in a filter is the limiting factor, not the size of the raw filter string since the request size limit for POST is approximately 16 MB.  

> [!NOTE]  
>  Even though the POST request size limit is very large, filter expressions cannot be arbitrarily complex. For more information about filter complexity limitations, see [OData Expression Syntax for Azure Search](odata-expression-syntax-for-azure-search.md).  

## Request  
 HTTPS is required for service requests. The **Autocomplete** request can be constructed using the GET or POST methods.  

 The request URI specifies the name of the index to query. Parameters, such as the partially input search term, are specified on the query string in the case of GET requests, and in the request body in the case of POST requests.  

 As a best practice when creating GET requests, remember to [URL-encode](https://msdn.microsoft.com/library/system.uri.escapedatastring.aspx) specific query parameters when calling the REST API directly. For **Autocomplete** operations, this includes:  

-   **$filter**  

-   **highlightPreTag**  

-   **highlightPostTag**  

-   **search**  

 URL encoding is only recommended on the above query parameters. If you inadvertently URL-encode the entire query string (everything after the **?**), requests will break.  

 Also, URL encoding is only necessary when calling the REST API directly using GET. No URL encoding is necessary when calling **Autocomplete** using POST, or when using the [Azure Search .NET client library](https://msdn.microsoft.com/library/azure/dn951165.aspx) handles URL encoding for you.  

### Query Parameters  
 **Autocomplete** accepts several parameters that provide query criteria and specify search behavior. You provide these parameters in the URL query string when calling **Autocomplete** via GET, and as JSON properties in the request body when calling **Autocomplete** via POST. The syntax for some parameters is slightly different between GET and POST. These differences are noted in the following table.  

|Parameter|Description|  
|---------------|-----------------|  
|`search=[string]`|The search text to complete. Must be at least 1 character, and no more than 100 characters.|  
|`autocompleteMode=oneTerm | twoTerms | oneTermWithContext (optional, defaults to oneTerm)`|	Sets the autocomplete mode as described above.|
|`highlightPreTag=[string] (optional, defaults to an empty string)`|A string tag that prepends to search hits. Must be set with `highlightPostTag`. **Note:**  When calling **Autocomplete** using GET, the reserved characters in the URL must be percent-encoded (for example, %23 instead of #).|  
|`highlightPostTag=[string] (optional, defaults to an empty string)`|A string tag that appends to search hits. Must be set with `highlightPreTag`. **Note:**  When calling **Autocomplete** using GET, the reserved characters in the URL must be percent-encoded (for example, %23 instead of #).|  
|`suggesterName=[string]`|The name of the **suggester** as specified in the **suggesters** collection that's part of the index definition. A **suggester** determines which fields are scanned for suggested query terms. See [Suggesters](suggesters.md) for more information.|  
|`fuzzy=[boolean] (optional, default = false)`|When set to true, this API finds suggestions even if there is a substituted or missing character in the search text. While this provides a better experience in some scenarios, it comes at a performance cost as fuzzy suggestion searches are slower and consume more resources.|  
|`searchFields=[string] (optional)`|The list of comma-separated field names to search for the specified search text. Target fields must be enabled for suggestions. See [Suggesters](suggesters.md) for more information.|  
|`$top=# (optional, default = 5)`|The number of autocomplete suggestions to retrieve. The value must be a number between 1 and 100. **Note:**  When calling **Autocomplete** using POST, this parameter is named `top` instead of `$top`.|  
|`$filter=[string] (optional)`|An expression that filters the documents considered for autocomplete. **Note:**  When calling **Autocomplete** using POST, this parameter is named `filter` instead of `$filter`.| 
|`minimumCoverage (optional, defaults to 80)`|A number between 0 and 100 indicating the percentage of the index that must be covered by an autocomplete query in order for the query to be reported as a success. By default, at least 80% of the index must be available or the Autocomplete operation returns HTTP status code 503. If you set `minimumCoverage` and Autocomplete succeeds, it returns HTTP 200 and include a `@search.coverage` value in the response indicating the percentage of the index that was included in the query. **Note:**  Setting this parameter to a value lower than 100 can be useful for ensuring search availability even for services with only one replica. However, not all matching autocomplete suggestions are guaranteed to be present in the search results. If search recall is more important to your application than availability, then it's best not to lower `minimumCoverage` below its default value of 80.|  
|`api-version=[string]`|The `api-version` parameter is required. See [API versions in Azure Search](https://go.microsoft.com/fwlink/?linkid=834796) for details. For this operation, the `api-version` is specified as a query parameter in the URL regardless of whether you call **Autocomplete** with GET or POST.|  

### Request Headers  
 The following table describes the required and optional request headers  

|Request Header|Description|  
|--------------------|-----------------|  
|*api-key*|The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service URL. The **Autocomplete** request can specify either an admin-key or query-key as the `api-key`. The query-key is used for query-only operations.|  

 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure Preview Portal. See [Create an Azure Search service in the portal](https://azure.microsoft.com/documentation/articles/search-create-service-portal/) for page navigation help.  

### Request Body  
 For GET: None.  

 For POST:  

```  
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

```  
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

1. Retrieve 3 autocomplete suggestions where the partial search input is 'washington medic' with default mode (oneTerm):  

  ```  
  GET /indexes/hotels/docs/autocomplete?search=washington medic&$top=3&suggesterName=sg&api-version=2016-09-01-Preview
  ```  

  ```  
  POST /indexes/hotels/docs/autocomplete?api-version=2016-09-01-Preview
  {  
    "search": "washington medic",      
    "top": 3,  
    "suggesterName": "sg"  
  }  
  ```  
  Response:
  ```  
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
  
2. Retrieve 3 autocomplete suggestions where the partial search input is 'washington medic' and `autocompleteMode=twoTerms`:  

  ```  
  GET /indexes/hotels/docs/autocomplete?search=washington medic&$top=3&suggesterName=sg&autocompleteMode=twoTerms&api-version=2016-09-01-Preview
  ```  

  ```  
  POST /indexes/hotels/docs/autocomplete?api-version=2016-09-01-Preview
  {  
    "search": "washington medic",  
    "autocompleteMode": "twoTerms",
    "top": 3,  
    "suggesterName": "sg"  
  }  
  ```  
  Response:
  ```  
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
 [Azure Search Service REST](index.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [Suggesters](suggesters.md)   
 [Azure Search .NET SDK](https://msdn.microsoft.com/library/azure/dn951165.aspx)  
