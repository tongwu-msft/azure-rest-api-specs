---
title: "Search Documents (Azure Search Service REST API)"
ms.custom: ""
ms.date: "2016-09-20"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to: 
  - "Azure"
ms.assetid: 716ef056-adf4-4b16-85b8-2cb777bc8458
caps.latest.revision: 69
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
# Search Documents (Azure Search Service REST API)
  Queries in Azure Search are implemented using the .NET library or REST API. For an overview of querying documents and different methodologies available, see [Queries in Azure Search](https://azure.microsoft.com/documentation/articles/search-query-overview/).  
  
 In the REST API, a **Search Documents** operation is issued as a GET or POST request and specifies query parameters that give the criteria for selecting matching documents.  
  
```  
GET https://[service name].search.windows.net/indexes/[index name]/docs?[query parameters]  
api-key: [admin key]  
```  
  
```  
POST https://[service name].search.windows.net/indexes/[index name]/docs/search?api-version=[api-version]  
Content-Type: application/json  
api-key: [admin or query key]  
```  
  
 **When to use POST instead of GET**  
  
 When you use HTTP GET to call the **Search Documents** API, you need to be aware that the length of the request URL cannot exceed 8 KB. This is usually enough for most applications. However, some applications produce very large queries or OData filter expressions. For these applications, using HTTP POST is a better choice because it allows larger filters and queries than GET. With POST, the number of terms or clauses in a query is the limiting factor, not the size of the raw query since the request size limit for POST is approximately 16 MB.  
  
> [!NOTE]  
>  Even though the POST request size limit is very large, search queries and filter expressions cannot be arbitrarily complex. See [Lucene query syntax in Azure Search](lucene-query-syntax-in-azure-search.md) and [OData Expression Syntax for Azure Search](odata-expression-syntax-for-azure-search.md) for more information about search query and filter complexity limitations.  
  
## Request  
 HTTPS is required for service requests. The **Search Documents** request can be constructed using the GET or POST methods.  
  
 The request URI specifies which index to query, for all documents that match the query parameters. Parameters are specified on the query string in the case of GET requests, and in the request body in the case of POST requests.  
  
 As a best practice when creating GET requests, remember to [URL-encode](https://msdn.microsoft.com/library/system.uri.escapedatastring.aspx) specific query parameters when calling the REST API directly. For **Search Documents** operations, this includes:  
  
-   **$filter**  
  
-   **facet**  
  
-   **highlightPreTag**  
  
-   **highlightPostTag**  
  
-   **search**  
  
 URL encoding is only recommended on the above query parameters. If you inadvertently URL-encode the entire query string (everything after the **?**), requests will break.  
  
 Also, URL encoding is only necessary when calling the REST API directly using GET. No URL encoding is necessary when calling **Search Documents** using POST, or when using the [Azure Search .NET client library](https://msdn.microsoft.com/library/azure/dn951165.aspx), which handles URL encoding for you.  
  
### Query Parameters  
A query accepts several parameters that provide query criteria and also specify search behavior. You provide these parameters in the URL query string when calling via GET, and as JSON properties in the request body when calling via POST. The syntax for some parameters is slightly different between GET and POST. These differences are noted as applicable below.  
 
#### search=[string] (optional)
 
The text to search for. All `searchable` fields are searched by default unless `searchFields` is specified. When searching `searchable` fields, the search text itself is tokenized, so multiple terms can be separated by white space (e.g.: search=hello world). To match any term, use \* (this can be useful for boolean filter queries). Omitting this parameter has the same effect as setting it to \*. See  [Simple query syntax](simple-query-syntax-in-azure-search.md) for specifics on the search syntax.

> [!NOTE]  
>  The results can sometimes be surprising when querying over searchable fields. The tokenizer includes logic to handle cases common to English text like apostrophes, commas in numbers, and so forth. For example, `search=123,456` will match a single term 123,456 rather than the individual terms 123 and 456, since commas are used as thousand-separators for large numbers in English. For this reason, we recommend using white space rather than punctuation to separate terms in the `search` parameter.
  
#### searchMode=any | all (optional)
Defaults to `any`. Specifies whether any or all of the search terms must be matched in order to count the document as a match.

#### searchFields=[string] (optional)
The list of comma-separated field names to search for the specified text. Target fields must be marked as `searchable`.

#### queryType=simple | full (optional)

Defaults to `simple`. When set to `simple`, search text is interpreted using a simple query language that allows for symbols such as +, \* and "". Queries are evaluated across all `searchable` fields (or fields indicated in `searchFields`) in each document by default.
  
When the query type is set to `full`, search text is interpreted using the Lucene query language which allows field-specific and weighted searches. See [Simple query syntax in Azure Search](simple-query-syntax-in-azure-search.md) and [Lucene query syntax in Azure Search](lucene-query-syntax-in-azure-search.md) for specifics on the search syntaxes. 

> [!NOTE]  
>  Range search in the Lucene query language is not supported in favor of `$filter` which offers similar functionality.
  
#### $skip=# (optional)

The number of search results to skip. When calling via POST, this parameter is named `skip` instead of `$skip`. This value cannot be greater than 100,000. If you need to scan documents in sequence, but cannot use `$skip` due to this limitation, consider using `$orderby` on a totally-ordered key and `$filter` with a range query instead. 
  
#### $top=# (optional)
The number of search results to retrieve. This defaults to 50. When calling via POST, this parameter is named `top` instead of `$top`. If you specify a value greater than 1000 and there are more than 1000 results, only the first 1000 results will be returned, along with a link to the next page of results (see @odata.nextLink in the example below).

Azure Search uses *server-side paging* to prevent queries from retrieving too many documents at once. The default page size is 50, while the maximum page size is 1000. This means that by default **Search Documents** returns at most 50 results if you don't specify `$top`. If there are more than 50 results, the response includes information to retrieve the next page of at most 50 results (see `@odata.nextLink` and `@search.nextPageParameters` in the [Examples](#bkmk_examples) below. Similarly, if you specify a value greater than 1000 for `$top` and there are more than 1000 results, only the first 1000 results are returned, along with information to retrieve the next page of at most 1000 results. 
  
#### $count=true | false

Optional, defaults to `false`. When calling via POST, this parameter is named `count` instead of `$count`. Specifies whether to fetch the total count of results. This is the count of all documents that match the \`search\` and \`$filter\` parameters, ignoring \`$top\` and \`$skip\`. Setting this value to \`true\` may have a performance impact. Note that the count returned is an approximation. 
  
#### $orderby=[string] (optional)

A list of comma-separated expressions to sort the results by. When calling via POST, this parameter is named `orderby` instead of `$orderby`. Each expression can be either a field name or a call to the `geo.distance()` function. Each expression can be followed by `asc` to indicate ascending, and `desc` to indicate descending. The default is ascending order. Ties will be broken by the match scores of documents. If no `$orderby` is specified, the default sort order is descending by document match score. There is a limit of 32 clauses for `$orderby`. 
  
#### $select=[string] (optional)

A list of comma-separated fields to retrieve. When calling via POST, this parameter is named `select` instead of `$select`. If unspecified, all fields marked as retrievable in the schema are included. You can also explicitly request all fields by setting this parameter to `*`. 
 
#### facet=[string] (zero or more)

A field to facet by. Optionally, the string may contain parameters to customize the faceting, expressed as comma-separated `name:value` pairs. When calling via POST, this parameter is named `facets` instead of `$facet`.

`count` and `sort` can be combined in the same facet specification, but they cannot be combined with `interval` or `values`, and `interval` and `values` cannot be combined together. 

Interval facets on date time are computed based on the UTC time if `timeoffset` is not specified. For example: for `facet=lastRenovationDate,interval:day`, the day boundary starts at 00:00:00 UTC.

Valid parameters are:

- `count` (max # of facet terms; default is 10). There is no upper limit on the number of terms, but higher values incur a corresponding performance penalty, especially if the faceted field contains a large number of unique terms. For example, `facet=category,count:5` gets the top five categories in facet results. Note that if the `count` parameter is less than the number of unique terms, the results may not be accurate. This is due to the way faceting queries are distributed across shards. Increasing `count` generally increases the accuracy of term counts, but at a performance cost.

- `sort` (one of `count` to sort descending by count, `-count` to sort ascending by count, `value` to sort ascending by value, or `-value` to sort descending by value). For example, `facet=category,count:3,sort:count` gets the top three categories in facet results in descending order by the number of documents with each city name. If the top three categories are Budget, Motel, and Luxury, and Budget has 5 hits, Motel has 6, and Luxury has 4, then the buckets will be in the order Motel, Budget, Luxury. `facet=rating,sort:-value` produces buckets for all possible ratings, in descending order by value. For example, if the ratings are from 1 to 5, the buckets will be ordered 5, 4, 3, 2, 1, irrespective of how many documents match each rating.

- `values` (pipe-delimited numeric or `Edm.DateTimeOffset` values specifying a dynamic set of facet entry values). For example, `facet=baseRate,values:10 | 20` produces three buckets: one for base rate 0 up to but not including 10, one for 10 up to but not including 20, and one for 20 and higher. `facet=lastRenovationDate,values:2010-02-01T00:00:00Z` produces two buckets: one for hotels renovated before February 2010, and one for hotels renovated February 1st, 2010 or later.

- `interval` (integer interval greater than 0 for numbers, or `minute, hour, day, week, month, quarter, year` for date time values). For example, `facet=baseRate,interval:100` produces buckets based on base rate ranges of size 100. If base rates are all between $60 and $600, there will be buckets for 0-100, 100-200, 200-300, 300-400, 400-500, and 500-600. `facet=lastRenovationDate,interval:year` produces one bucket for each year when hotels were renovated.

- `timeoffset ([+-]hh:mm, [+-]hhmm, or [+-]hh)`. If used, the `timeoffset` parameter must be combined with the `interval` option, and only when applied to a field of type `Edm.DateTimeOffset`. The value specifies the UTC time offset to account for in setting time boundaries. For example: `facet=lastRenovationDate,interval:day,timeoffset:-01:00` uses the day boundary that starts at 01:00:00 UTC (midnight in the target time zone). 
  
  
#### $filter=[string] (optional)

A structured search expression in standard OData syntax. When calling via POST, this parameter is named `filter` instead of `$filter`. See [OData Expression Syntax for Azure Search](odata-expression-syntax-for-azure-search.md) for details on the subset of the OData expression grammar that Azure Search supports. 

  
#### highlight=[string] (optional)

A set of comma-separated field names used for hit highlights. Only `searchable` fields can be used for hit highlighting. Azure Search returns only up to 5 highlights per field. This limit is not configurable.

#### highlightPreTag=[string] (optional)

Defaults to `</em>`. A string tag that appends to hit highlights. Must be set with `highlightPostTag`. Reserved characters in URL must be percent-encoded (for example, %23 instead of #).  

#### highlightPostTag=[string] (optional)

Defaults to `</em>`. A string tag that appends to hit highlights. Must be set with `highlightPreTag`. Reserved characters in URL must be percent-encoded (for example, %23 instead of #).  

#### scoringProfile=[string] (optional)

The name of a scoring profile to evaluate match scores for matching documents in order to sort the results. 

#### scoringParameter=[string] (zero or more)

Indicates the values for each parameter defined in a scoring function (such as `referencePointParameter`) using the format `name-value1,value2,...` When calling via POST, this parameter is named `scoringParameters` instead of `scoringParameter`. Also, you specify it as a JSON array of strings where each string is a separate name:values pair. 

- For scoring profiles that include a function, separate the function from its input list with a - character. For example, a function called "mylocation" would be `&scoringParameter=mylocation--122.2,44.8`. The first dash separates the function name from the value list, while the second dash is part of the first value (longitude in this example).

- For scoring parameters such as for tag boosting that can contain commas, you can escape any such values in the list using single quotes. If the values themselves contain single quotes, you can escape them by doubling. Suppose you have a tag boosting parameter called "mytag" and you want to boost on the tag values "Hello, O'Brien" and "Smith", the query string option would then be `&scoringParameter=mytag-'Hello, O''Brien',Smith`. Note that quotes are only required for values that contain commas.   

#### minimumCoverage (optional, defaults to 100)

A number between 0 and 100 indicating the percentage of the index that must be covered by a search query in order for the query to be reported as a success. By default, the entire index must be available or the Search operation will return HTTP status code 503. If you set `minimumCoverage` and Search succeeds, it will return HTTP 200 and include a `@search.coverage` value in the response indicating the percentage of the index that was included in the query.

   > [!NOTE]  
   >   Setting this parameter to a value lower than 100 can be useful for ensuring search availability even for services with only one replica. However, not all matching documents are guaranteed to be present in the search results. If search recall is more important to your application than availability, then it's best to leave `minimumCoverage` at its default value of 100. 
   
#### api-version=[string] (required)

The `api-version` parameter is required. See [API versioning in Azure Search](https://azure.microsoft.com/documentation/articles/search-api-versions/) for a list of available versions. For this operation, the `api-version` is specified as a query parameter in the URL regardless of whether you call **Search Documents** with GET or POST.  
  
### Request Headers  
 The following table describes the required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Accept:|Specifies the content type of the results returned by the service. This value must be set to `application/json`.|  
|api-key|The `api-key` is used to authenticate the request to your Search service. It is a string value, unique to your service URL. The **Search Documents** request can specify either an admin key or query key for `api-key`.|  
  
 You will also need the service name to construct the request URL. You can get the service name and `api-key` from your service dashboard in the Azure Portal. See 
  
### Request Body  
 For GET: None.  
  
 For POST:  
  
```  
{  
     "count": true | false (default),  
     "facets": [ "facet_expression_1", "facet_expression_2", ... ],  
     "filter": "odata_filter_expression",  
     "highlight": "highlight_field_1, highlight_field_2, ...",  
     "highlightPreTag": "pre_tag",  
     "highlightPostTag": "post_tag",  
     "minimumCoverage": # (% of index that must be covered to declare query successful; default 100),  
     "orderby": "orderby_expression",  
     "scoringParameters": [ "scoring_parameter_1", "scoring_parameter_2", ... ],  
     "scoringProfile": "scoring_profile_name",  
     "search": "simple_query_expression",  
     "searchFields": "field_name_1, field_name_2, ...",  
     "searchMode": "any" (default) | "all",  
     "select": "field_name_1, field_name_2, ...",  
     "skip": # (default 0),  
     "top": #  
   }  
```  
  
 **Continuation of Partial Search Responses**  
  
 Sometimes Azure Search can't return all the requested results in a single Search response. This can happen for different reasons, such as when the query requests too many documents by not specifying `$top` or specifying a value for `$top` that is too large. In such cases, Azure Search will include the `@odata.nextLink` annotation in the response body, and also `@search.nextPageParameters` if it was a POST request. You can use the values of these annotations to formulate another Search request to get the next part of the search response. This is called a *continuation* of the original Search request, and the annotations are generally called *continuation tokens*. See the example in Response below for details on the syntax of these annotations and where they appear in the response body.  
  
 The reasons why Azure Search might return continuation tokens are implementation-specific and subject to change. Robust clients should always be ready to handle cases where fewer documents than expected are returned and a continuation token is included to continue retrieving documents. Also note that you must use the same HTTP method as the original request in order to continue. For example, if you sent a GET request, any continuation requests you send must also use GET (and likewise for POST).  
  
## Response  
 Status Code: "200 OK" is returned for a successful response.  
  
```  
{  
  "@odata.count": # (if $count=true was provided in the query),  
  "@search.coverage": # (if minimumCoverage was provided in the query),  
  "@search.facets": { (if faceting was specified in the query)  
    "facet_field": [  
      {  
        "value": facet_entry_value (for non-range facets),  
        "from": facet_entry_value (for range facets),  
        "to": facet_entry_value (for range facets),  
        "count": number_of_documents  
      }  
    ],  
    ...  
  },  
       "@search.nextPageParameters": { (request body to fetch the next page of results if result count exceeds page size and Search was called with POST)  
        "count": ... (value from request body if present),  
        "facets": ... (value from request body if present),  
        "filter": ... (value from request body if present),  
        "highlight": ... (value from request body if present),  
        "highlightPreTag": ... (value from request body if present),  
        "highlightPostTag": ... (value from request body if present),  
        "minimumCoverage": ... (value from request body if present),  
        "orderby": ... (value from request body if present),  
        "scoringParameters": ... (value from request body if present),  
        "scoringProfile": ... (value from request body if present),  
        "search": ... (value from request body if present),  
        "searchFields": ... (value from request body if present),  
        "searchMode": ... (value from request body if present),  
        "select": ... (value from request body if present),  
        "skip": ... (page size plus value from request body if present),  
        "top": ... (value from request body if present minus page size),  
      },  
 "value": [  
    {  
      "@search.score": document_score (if a text query was provided),  
      "@search.highlights": {  
        field_name: [subset of text, ... ],  
        ...  
      },  
      key_field_name: document_key,  
      field_name: field_value (retrievable fields or specified projection),  
      ...  
    },  
    ...  
  ],  
      "@odata.nextLink": (URL to fetch the next page of results if result count exceeds page size; Applies to both GET and POST)  
}  
```  
  
##  <a name="bkmk_examples"></a> Examples  
 You can find additional examples in  [OData Expression Syntax for Azure Search](odata-expression-syntax-for-azure-search.md).  
  
1.  Search the Index sorted descending by date:  
  
    ```  
    GET /indexes/hotels/docs?search=*&$orderby=lastRenovationDate desc&api-version=2015-02-28  
    ```  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
          "search": "*",  
          "orderby": "lastRenovationDate desc" 
        }  
    ```  
  
2.  In a faceted search, search the index and retrieve facets for categories, ratings, tags, as well as items with baseRate in specific ranges. In this example, the search string is a wildcard (*) but it could just as easily be a string.  
  
    ```  
    GET /indexes/hotels/docs?search=*&facet=category&facet=rating&facet=tags&facet=baseRate,values:80|150|220&api-version=2015-02-28  
    ```  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
          "search": "test",  
          "facets": [ "category", "rating", "tags", "baseRate,values:80|150|220" ]  
        }  
    ```  
  
3.  Using a filter, narrow down the previous faceted query result after the user clicks on Rating 3 and category "Motel".  
  
    ```  
    GET /indexes/hotels/docs?search=*&facet=tags&facet=baseRate,values:80|150|220&$filter=rating eq 3 and category eq 'Motel'&api-version=2015-02-28  
    ```  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
          "search": "test",  
          "facets": [ "tags", "baseRate,values:80|150|220" ],  
          "filter": "rating eq 3 and category eq 'Motel'"  
        }  
    ```  
  
4.  In a faceted search, set an upper limit on unique terms returned in a query. The default is 10, but you can increase or decrease this value using the count parameter on the facet attribute. This example returns facets for city, limited to 5.  
  
    ```  
    GET /indexes/hotels/docs?search=*&facet=city,count:5&api-version=2015-02-28  
    ```  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
          "search": "test",  
          "facets": [ "city,count:5" ]  
        }  
    ```  
  
5.  Search the Index within specific fields (for example, a language field):  
  
    ```  
    GET /indexes/hotels/docs?search=hôtel&searchFields=description_fr&api-version=2015-02-28  
    ```  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
          "search": "hôtel",  
          "searchFields": "description_fr" 
        }  
    ```  
  
6.  Search the Index across multiple fields. For example, you can store and query searchable fields in multiple languages, all within the same index. If English and French descriptions co-exist in the same document, you can return any or all in the query results:  
  
    ```  
    GET /indexes/hotels/docs?search=hotel&searchFields=description,description_fr&api-version=2015-02-28  
    ```  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
          "search": "hotel",  
          "searchFields": "description", "description_fr" 
        }  
    ```  
  
     Note that you can only query index at a time. Do not create multiple indexes for each language unless you plan to query one at a time.  
  
7.  Paging - Get the 1st page of items (page size is 10):  
  
    ```  
    GET /indexes/hotels/docs?search=*&$skip=0&$top=10&api-version=2015-02-28  
    ```  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
          "search": "*",  
          "skip": 0,  
          "top": 10  
        }  
    ```  
  
8.  Paging - Get the 2nd page of items (page size is 10):  
  
    ```  
    GET /indexes/hotels/docs?search=*&$skip=10&$top=10&api-version=2015-02-28  
    ```  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
          "search": "*",  
          "skip": 10,  
          "top": 10  
        }  
    ```  
  
9. Retrieve a specific set of fields:  
  
    ```  
    GET /indexes/hotels/docs?search=*&$select=hotelName,description&api-version=2015-02-28  
    ```  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
          "search": "*",  
          "select": "hotelName", "description" 
        }  
    ```  
  
10. Retrieve documents matching a specific filter expression:  
  
    ```  
    GET /indexes/hotels/docs?$filter=(baseRate ge 60 and baseRate lt 300) or hotelName eq 'Fancy Stay'&api-version=2015-02-28  
    ```  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
          "filter": "(baseRate ge 60 and baseRate lt 300) or hotelName eq 'Fancy Stay'"  
        }  
    ```  
  
11. Search the index and return fragments with hit highlights:  
  
    ```  
    GET /indexes/hotels/docs?search=something&highlight=description&api-version=2015-02-28  
    ```  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
          "search": "something",  
          "highlight": "description"  
        }  
    ```  
  
12. Search the index and return documents sorted from closer to farther away from a reference location:  
  
    ```  
    GET /indexes/hotels/docs?search=something&$orderby=geo.distance(location, geography'POINT(-122.12315 47.88121)')&api-version=2015-02-28  
    ```  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
          "search": "something",  
          "orderby": "geo.distance(location, geography'POINT(-122.12315 47.88121)')" 
        }  
    ```  
  
13. Search the index assuming there's a scoring profile called "geo" with two distance scoring functions, one defining a parameter called "currentLocation" and one defining a parameter called "lastLocation":  
  
    ```  
    GET /indexes/hotels/docs?search=something&scoringProfile=geo&scoringParameter=currentLocation--122.123,44.77233&scoringParameter=lastLocation--121.499,44.2113&api-version=2015-02-28  
    ```  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
          "search": "something",  
          "scoringProfile": "geo",  
          "scoringParameters": [ "currentLocation--122.123,44.77233", "lastLocation--121.499,44.2113" ]  
        }  
    ```  
  
14. Find documents in the index using simple query syntax. This query returns hotels where searchable fields contain the terms "comfort" and "location" but not "motel":  
  
    ```  
    Get /indexes/hotels/docs?search=comfort +location –motel&searchMode=all&api-version=2015-02-28  
    ```  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
          "search": "comfort +location -motel",  
          "searchMode": "all"  
        }  
    ```  
  
    > [!TIP]  
    >  The use of `searchMode=all` overrides the default of `searchMode=any`, ensuring that `-motel` means "AND NOT" instead of "OR NOT". Without `searchMode=all`, you get "OR NOT" which expands rather than restricts search results, and this can be counter-intuitive to some users.  
  
15. Find documents in the index using Lucene query syntax (see [Lucene query syntax in Azure Search](lucene-query-syntax-in-azure-search.md)). This query returns hotels where the category field contains the term "budget" and all searchable fields containing the phrase "recently renovated". Documents containing the phrase "recently renovated" are ranked higher as a result of the term boost value (3)  
  
     `GET /indexes/hotels/docs?search=category:budget AND \"recently renovated\"^3&searchMode=all&api-version=2015-02-28&querytype=full`  
  
    ```  
    POST /indexes/hotels/docs/search?api-version=2015-02-28  
        {  
         "search": "category:budget AND \"recently renovated\"^3",  
          "queryType": "full",  
          "searchMode": "all"  
    }  
    ```  
  
## See Also  
 [Azure Search Service REST](service-rest.md)   
 [HTTP status codes &#40;Azure Search&#41;](http-status-codes.md)   
 [OData Expression Syntax for Azure Search](odata-expression-syntax-for-azure-search.md)   
 [Simple query syntax in Azure Search](simple-query-syntax-in-azure-search.md)    
 [Azure Search .NET library](https://msdn.microsoft.com/library/azure/dn951165.aspx)  
  
  