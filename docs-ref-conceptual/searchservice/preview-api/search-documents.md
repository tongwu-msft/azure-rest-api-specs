---
title: Search Documents (api-version=2020-06-30-Preview)
description: Preview version of the Search Documents REST API for Cognitive Search.
ms.date: 05/19/2021
ms.service: cognitive-search
ms.topic: language-reference
ms.devlang: rest-api

author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: nitinme
---
# Search Documents (Preview REST API)

**API Version: 2020-06-30-Preview**

> [!Important]
> This preview API adds a **semantic** query type and responses, a **speller** parameter that provides spell correction, and  a **featuresMode** parameter that can report on per-field term frequency, per-field similarity score, and per-field number of unique matches. A new **queryLanguage** parameter is required for both semantic queries and **speller**.

A query request targets the documents collection of a single index on a search service. It includes parameters that define the match criteria, and parameters that shape the response.

You can use GET or POST. [Query parameters](#query-parameters) are specified on the query string in the case of GET requests, and in the request body in the case of POST requests.

```http
GET https://[service name].search.windows.net/indexes/[index name]/docs?[query parameters] 
  Content-Type: application/json   
  api-key: [admin or query key]  
```  

If you are using POST, add the "search" action as a URI parameter.

```http
POST https://[service name].search.windows.net/indexes/[index name]/docs/search?api-version=[api-version]  
  Content-Type: application/json  
  api-key: [admin or query key]  
```  

When called with GET, the length of the request URL cannot exceed 8 KB. This length is usually enough for most applications. However, some applications produce very large queries, specifically when OData filter expressions are used. For these applications, HTTP POST is a better choice because it allows larger filters than GET. 

With POST, the number of clauses in a filter is the limiting factor, not the size of the raw filter string since the request size limit for POST is approximately 16 MB. Even though the POST request size limit is very large, filter expressions cannot be arbitrarily complex. For more information about filter complexity limitations, see [OData Expression Syntax for Azure Cognitive Search](/azure/search/query-odata-filter-orderby-syntax). 

## URI Parameters

| Parameter   | Description  |
|-------------|--------------|
| [service name] | Required. Set this to the unique, user-defined name of your search service. |
| [index name]/docs  | Required. Specifies the documents collection of a named index. |
| [query parameters] | Query parameters are specified on the URI for GET requests and in the request body for POST requests. |
| api-version | Required. For preview features, the current version is `api-version=2020-06-30-Preview`. For **Search Documents**, the api-version is always specified as a URI parameter for both GET and POST. |

### URL-encoding recommendations

Remember to [URL-encode](/dotnet/api/system.uri.escapedatastring) specific query parameters when calling the GET REST API directly. For a **Search Documents** operation, URL-encoding might be necessary for the following query parameters:  

+ search
+ $filter
+ facet
+ highlightPreTag
+ highlightPostTag

URL encoding is only recommended for individual parameters. If you inadvertently URL-encode the entire query string (everything after the `?`), requests will break.  

Also, URL encoding is only necessary when calling the REST API directly using GET. No URL encoding is necessary when using POST, or when using the [Azure Cognitive Search .NET client library](/dotnet/api/overview/azure/search), which handles encoding for you.  

## Request Headers

The following table describes the required and optional request headers.  

|Fields              |Description      |  
|--------------------|-----------------|  
|Content-Type|Required. Set this to "application/json"|  
|api-key|Required. A unique, system-generated string that authenticates the request to your search service. Query requests against the documents collection can specify either an admin-key or query-key as the API key. The query-key is used for read-only operations against the documents collection. You can get keys from the Azure portal. For more information, see [Find existing keys](/azure/search/search-security-api-keys#find-existing-keys).|  

## Request Body

For GET: None.  

For POST:  

```json
{  
     "answers": "none" (default) | "extractive", 
     "count": true | false (default),  
     "facets": [ "facet_expression_1", "facet_expression_2", ... ],  
     "featuresMode" : "disabled" (default) | "enabled",
     "filter": "odata_filter_expression",  
     "highlight": "highlight_field_1, highlight_field_2, ...",  
     "highlightPreTag": "pre_tag",  
     "highlightPostTag": "post_tag",  
     "minimumCoverage": # (% of index that must be covered to declare query successful; default 100),  
     "orderby": "orderby_expression",
     "queryLanguage": "none" (default) | "en-us", 
     "queryType": "simple" (default) | "full" | "semantic",
     "scoringParameters": [ "scoring_parameter_1", "scoring_parameter_2", ... ],  
     "scoringProfile": "scoring_profile_name",  
     "scoringStatistics" : "local" (default) | "global",
     "search": "simple_query_expression",  
     "searchFields": "field_name_1, field_name_2, ...",  
     "searchMode": "any" (default) | "all",  
     "select": "field_name_1, field_name_2, ...",  
     "sessionId" : "session_id",
     "skip": # (default 0), 
     "speller": "none" (default) | "lexicon",  
     "top": #  
   }  
```  

**Continuation of Partial Search Responses**

Sometimes Azure Cognitive Search can't return all the requested results in a single Search response. This can happen for different reasons, such as when the query requests too many documents by not specifying $top or specifying a value for $top that is too large. In such cases, Azure Cognitive Search will include the @odata.nextLink annotation in the response body, and also @search.nextPageParameters if it was a POST request. You can use the values of these annotations to formulate another Search request to get the next part of the search response. This is called a *continuation* of the original Search request, and the annotations are generally called *continuation tokens*. See the example in Response below for details on the syntax of these annotations and where they appear in the response body.  

The reasons why Azure Cognitive Search might return continuation tokens are implementation-specific and subject to change. Robust clients should always be ready to handle cases where fewer documents than expected are returned and a continuation token is included to continue retrieving documents. Also note that you must use the same HTTP method as the original request in order to continue. For example, if you sent a GET request, any continuation requests you send must also use GET (and likewise for POST).

> [!NOTE]
> The purpose of @odata.nextLink and @search.nextPageParameters is to protect the service from queries that request too many results, not to provide a general mechanism for paging. If you want to page through results, use $top and $skip together. For example, if you want pages of size 10, your first request should have $top=10 and $skip=0, the second request should have $top=1` and $skip=10, the third request should have $top=10 and $skip=20, and so on.

<a name="query-parameters"></a>

## Query Parameters

A query accepts several parameters on the URL when called with GET, and as JSON properties in the request body when called with POST. The syntax for some parameters is slightly different between GET and POST. These differences are noted as applicable below.

| Name      | Type | Description |
|-----------|------|-------------|
| answers (preview) | string | Optional. Valid values are "none" and "extractive". Defaults to "none". This parameter is only valid if the query type is "semantic". When set to "extractive", the query formulates and returns answers from key passages in the highest semantically ranked documents. The default is one answer, but you can specify up to five by adding a count. For example, "answers": "extractive\|count-3" returns three answers. For an answer to be returned, there must be sufficient information in the searchFields to formulate one. In addition, the query itself must look like a question. A keyword search won't return an answer. |
| api-version | string | Required. Version of the REST API used for the request. For a list of supported versions, see [API versioning](/azure/search/search-api-versions). For this operation, the api-version is specified as a URI parameter regardless of whether you call **Search Documents** with GET or POST.  |
| $count | boolean | Optional. Valid values are "true" or "false". Defaults to "false". When called with POST, this parameter is named count instead of $count. Specifies whether to fetch the total count of results. This is the count of all documents that match the search and $filter parameters, ignoring $top and $skip. Setting this value to "true" may degrade performance. The count returned is an approximation. If you’d like to get only the count without any documents, you can use $top=0. |
| facet | string | Optional. A field to facet by. The string may contain parameters to customize the faceting, expressed as comma-separated name:value pairs. When called with POST, this parameter is named facets instead of facet. </br></br>Valid are "count", "sort", "values", "interval", and "timeoffset". </br></br>"count" is the maximum number of facet terms; default is 10. There is no upper limit on the number of terms, but higher values will degrade performance, especially if the faceted field contains a large number of unique terms. For example, "facet=category,count:5" gets the top five categories in facet results. If the count parameter is less than the number of unique terms, the results may not be accurate. This is due to the way faceting queries are distributed across shards. Increasing count generally increases the accuracy of term counts, but at a performance cost. </br></br>"sort" can be set to "count", "-count", "value", "-value". Use count to sort descending by count. Use -count to sort ascending by count. Use value to sort ascending by value. Use -value to sort descending by value (for example, "facet=category,count:3,sort:count" gets the top three categories in facet results in descending order by the number of documents with each city name). If the top three categories are Budget, Motel, and Luxury, and Budget has 5 hits, Motel has 6, and Luxury has 4, then the buckets will be in the order Motel, Budget, Luxury. For -value, "facet=rating,sort:-value" produces buckets for all possible ratings, in descending order by value (for example, if the ratings are from 1 to 5, the buckets will be ordered 5, 4, 3, 2, 1, irrespective of how many documents match each rating). </br></br>"values" can set to pipe-delimited numeric or Edm.DateTimeOffset values specifying a dynamic set of facet entry values (for example, "facet=baseRate,values:10 \| 20" produces three buckets: one for base rate 0 up to but not including 10, one for 10 up to but not including 20, and one for 20 and higher). A string "facet=lastRenovationDate,values:2010-02-01T00:00:00Z" produces two buckets: one for hotels renovated before February 2010, and one for hotels renovated February 1, 2010 or later. </br></br>"interval" is an integer interval greater than 0 for numbers, or minute, hour, day, week, month, quarter, year for date time values. For example, "facet=baseRate,interval:100" produces buckets based on base rate ranges of size 100. If base rates are all between $60 and $600, there will be buckets for 0-100, 100-200, 200-300, 300-400, 400-500, and 500-600. The string "facet=lastRenovationDate,interval:year" produces one bucket for each year when hotels were renovated. </br></br>"timeoffset" can be set to ([+-]hh:mm, [+-]hhmm, or [+-]hh). If used, the timeoffset parameter must be combined with the interval option, and only when applied to a field of type Edm.DateTimeOffset. The value specifies the UTC time offset to account for in setting time boundaries. For example: "facet=lastRenovationDate,interval:day,timeoffset:-01:00" uses the day boundary that starts at 01:00:00 UTC (midnight in the target time zone). </br></br>count and sort can be combined in the same facet specification, but they cannot be combined with interval or values, and interval and values cannot be combined together. </br></br>Interval facets on date time are computed based on the UTC time if time offset is not specified. For example: for "facet=lastRenovationDate,interval:day", the day boundary starts at 00:00:00 UTC. |
| featuresMode (preview) | boolean | Optional. Valid values are "enabled" and "disabled". Default is "disabled". A value that specifies whether the results should include *query result features*, used to compute the relevance score of a document in relation to the query, such as per field similarity. Use "enabled" to expose additional query result features: per field similarity score, per field term frequency, and per field number of unique tokens matched. For more information, see [Similarity and scoring](/azure/search/index-similarity-and-scoring). |
| $filter | string | Optional. A structured search expression in standard OData syntax. Only filterable fields can be used in a filter. When called with POST, this parameter is named filter instead of $filter. See [OData Expression Syntax for Azure Cognitive Search](/azure/search/query-odata-filter-orderby-syntax) for details on the subset of the OData expression grammar that Azure Cognitive Search supports. |
| highlight | string | Optional. A set of comma-separated field names used for hit highlights. Only searchable fields can be used for hit highlighting. By default, Azure Cognitive Search returns up to 5 highlights per field. The limit is configurable per field by appending "-<max # of highlights>" following the field name. For example, "highlight=title-3,description-10" returns up to 3 highlighted hits from the title field and up to 10 hits from the description field. The maximum number of highlights must be an integer between 1 and 1000 inclusive. |
| highlightPostTag | string | Optional. Defaults to `"</em>"`. A string tag that appends to the highlighted term. Must be set with highlightPreTag. Reserved characters in URL must be percent-encoded (for example, %23 instead of #).  |
| highlightPreTag | string | Optional. Defaults to `"</em>"`. A string tag that prepends to the highlighted term. Must be set with highlightPostTag. Reserved characters in URL must be percent-encoded (for example, %23 instead of #).  |
| minimumCoverage | integer | Optional. Valid values are a number between 0 and 100, indicating the percentage of the index that must be available to service the query before it can be reported as a success. Defaults to "100". </br></br>One hundred percent coverage means that all shards responded to the request (neither service health issues nor maintenance activities reduced coverage). Under the default setting, less than full coverage will return HTTP status code 503.</br></br>Lowering minimumCoverage can be useful if 503 errors are occurring and you want to increase the probability of query success, especially for services that are configured for one replica. If you set minimumCoverage and Search succeeds, it will return HTTP 200 and include a @search.coverage value in the response indicating the percentage of the index that was included in the query. In this scenario, not all matching documents are guaranteed to be present in the search results, but if search availability is more important than recall, then reducing coverage can be a viable mitigation strategy. |
| $orderby | string | Optional. A list of comma-separated expressions to sort the results by. When called with POST, this parameter is named orderby instead of $orderby. Each expression can be either a field name or a call to the geo.distance() function. Each expression can be followed by "asc" to indicate ascending, and "desc" to indicate descending. If there are null values in the sort field, nulls appear first in ascending order and last in descending order. The default is ascending order. Ties will be broken by the match scores of documents. If no $orderby is specified, the default sort order is descending by document match score. There is a limit of 32 clauses for $orderby. |
| queryLanguage (preview) | string | Optional. Valid values are a [supported language](#queryLanguage) or "none". Defaults to "none". This parameter must be set if you use either speller or queryType=semantic. The language specified in queryLanguage is used for spell check and by the semantic models that identify a caption or answer. The libraries used for queryLanguage is independent of other locale-based field attributes, such as [language analyzers](/azure/search/index-add-language-analyzers#supported-language-analyzers) used for indexing and full text search. When queryLanguage is used with speller, the language determines which lexicons are used for spelling corrections. When used with queryType=semantic, the queryLanguage value is used for a secondary semantic ranking over an initial result set. |
| queryType| string | Optional. Valid values are "simple", "full", or "semantic" (preview). Defaults to "simple". </br></br>"simple" interprets query strings using the [simple query syntax](/azure/search/query-simple-syntax) that allows for symbols such as `+`, `*` and `""`. Queries are evaluated across all searchable fields (or fields indicated in searchFields) in each document by default. </br></br>"full" interprets query strings using the [full Lucene query syntax](/azure/search/query-lucene-syntax) which allows field-specific and weighted searches. Range search in the Lucene query language is not supported in favor of $filter which offers similar functionality.</br></br>"semantic" improves precision of search results by reranking the top 50 matches using a ranking model trained on the Bing corpus for queries expressed in natural language as opposed to keywords. If you set the query type to semantic, you must also set queryLanguage. You can optionally set searchFields to specify a priority order for calculating the semantic score, and optionally set answers if you want to also return the top 3 answers if the query input was formulated in natural language (*"what is a ...*). |
| scoringParameter | string | Optional. Indicates the values for each parameter defined in a scoring function (such as referencePointParameter) using the format "name-value1,value2,..." When called with POST, this parameter is named scoringParameters instead of scoringParameter. Also, you specify it as a JSON array of strings where each string is a separate name-values pair. </br></br>For scoring profiles that include a function, separate the function from its input list with a `-` character. For example, a function called `"mylocation"` would be "&scoringParameter=mylocation--122.2,44.8". The first dash separates the function name from the value list, while the second dash is part of the first value (longitude in this example). </br></br>For scoring parameters such as for tag boosting that can contain commas, you can escape any such values in the list using single quotes. If the values themselves contain single quotes, you can escape them by doubling. Suppose you have a tag boosting parameter called `"mytag"` and you want to boost on the tag values "Hello, O'Brien" and "Smith", the query string option would then be "&scoringParameter=mytag-'Hello, O''Brien',Smith". Quotes are only required for values that contain commas. |
| scoringProfile | string | Optional. The name of a scoring profile to evaluate match scores for matching documents in order to sort the results. |
| scoringStatistics | string | Optional. Valid values are "local" or "global". Defaults to "local". Specify whether to calculate scoring statistics, such as document frequency, globally (across all shards) for more consistent scoring, or locally (on the current shard) for lower latency. See [Scoring Statistics in Azure Cognitive Search](/azure/search/index-similarity-and-scoring#scoring-statistics). Scoring statistics will always be calculated locally for terms that use [fuzzy search ('~')](/azure/search/search-query-fuzzy#how-to-use-fuzzy-search). |
| search | string | Optional. The text to search for. All searchable fields are searched by default unless searchFields is specified. In the index, text in a searchable field is tokenized, so multiple terms can be separated by white space (for example: 'search=hello world'). To match any term, use `*` (this can be useful for boolean filter queries). Omitting this parameter has the same effect as setting it to `*`. See [Simple query syntax](/azure/search/query-simple-syntax) for specifics on the search syntax. </br></br>Results can sometimes be surprising when querying over searchable fields. The tokenizer includes logic to handle cases common to English text like apostrophes, commas in numbers, and so forth. For example, 'search=123,456' will match a single term '123,456' rather than the individual terms '123' and '456', since commas are used as thousand-separators for large numbers in English. For this reason, we recommend using white space rather than punctuation to separate terms in the search parameter. |
| searchMode | string | Optional. Valid values are "any" or "all" Defaults to "any". Specifies whether any or all of the search terms must be matched in order to count the document as a match. |
| searchFields | string | Optional. The list of comma-separated field names to search for the specified text. Target fields must be marked as searchable in the index schema. |
| $select | string | Optional. A list of comma-separated fields to include in the result set. Only fields marked as retrievable can be included in this clause. If unspecified or set to `*`, all fields marked as retrievable in the schema are included in the projection. When called with POST, this parameter is named select instead of $select. |
| sessionId | string | Optional. Using sessionId help improve relevance score consistency for search services with multiple replicas. In multi-replica configurations, there can be slight differences between relevance scores of individual documents for the same query. When a session ID is provided, the service will make best-effort to route a given request to the same replica for that session. Be wary that reusing the same session ID values repeatedly can interfere with load balancing of the requests across replicas and adversely affect the performance of the search service. The value used as sessionId cannot start with a '_' character. If a service doesn't have any replicas, this parameter has no effect on performance or score consistency. |
| $skip | integer | Optional. The number of search results to skip. When called with POST, this parameter is named skip instead of $skip. This value cannot be greater than 100,000. If you need to scan documents in sequence, but cannot use $skip due to this limitation, consider using $orderby on a field that has unique values for every document in the index (like the document key, for example) and $filter with a range query instead. |
| speller (preview) | String|  Optional. Valid values are "none" and "lexicon". Default is "none". Improve recall by spell-correcting individual search query terms. You can use it on simple, full, and semantic query types. If used, the speller parameter requires queryLanguage. For more information and examples, see [Add spell check to queries](/azure/search/speller-how-to-add). |
|$top | integer | Optional. The number of search results to retrieve. This defaults to 50. When called with POST, this parameter is named top instead of $top. If you specify a value greater than 1000 and there are more than 1000 results, only the first 1000 results will be returned, along with a link to the next page of results (see "@odata.nextLink" in the example below). </br></br>Azure Cognitive Search uses *server-side paging* to prevent queries from retrieving too many documents at once. The default page size is 50, while the maximum page size is 1000. This means that by default **Search Documents** returns at most 50 results if you don't specify $top. If there are more than 50 results, the response includes information to retrieve the next page of at most 50 results (see "@odata.nextLink" and "@search.nextPageParameters" in the [Examples](#bkmk_examples) below. Similarly, if you specify a value greater than 1000 for $top and there are more than 1000 results, only the first 1000 results are returned, along with information to retrieve the next page of at most 1000 results. |

## Response  

Status Code: 200 OK is returned for a successful response. There are two sample responses in this article, one each for featuresMode and semantic search.

The first example shows the full response for the topmost result for the semantic query "how do clouds form". 

+ "@search.answers" appears when you specify the answers parameter, and when the query and underlying searchFields are conducive to producing an answer. The @search.answers array that has a key, text, and highlights. The score is an indicator of the strength of the answer.

+ "value" is the body of the response. The @search.rerankerScore is assigned by the semantic ranking algorithm and is used to rank results (@search.score is from the BM25 similarity algorithm, used when scoring the initial results). Captions include plain text and highlighted versions. This example was created using OCR and entity recognition skills. Fields for the extracted and merged content are included in the response.

```json
{
    "@search.answers": [
        {
            "key": "aHR0cHM6Ly9oZWlkaXN0YmxvYnN0b3JhZ2UuYmxvYi5jb3JlLndpbmRvd3MubmV0L25hc2EtZWJvb2stMS01MC9wYWdlLTQ1LnBkZg2",
            "text": "Sunlight heats the land all day, warming that moist air and causing it to rise high into the   atmosphere until it cools and condenses into water droplets. Clouds generally form where air is ascending (over land in this case),   but not where it is descending (over the river).",
            "highlights": "Sunlight heats the land all day, warming that moist air and causing it to rise high into the   atmosphere until it cools and condenses into water droplets. Clouds generally form<em> where air is ascending</em> (over land in this case),   but not where it is<em> descending</em> (over the river).",
            "score": 0.94639826
        }
    ],
    "value": [
        {
            "@search.score": 0.5479723,
            "@search.rerankerScore": 1.0321671911515296,
            "@search.captions": [
                {
                    "text": "Like all clouds, it forms when the air reaches its dew point—the temperature at    which an air mass is cool enough for its water vapor to condense into liquid droplets. This false-color image shows valley fog, which is common in the Pacific Northwest of North America.",
                    "highlights": "Like all<em> clouds</em>, it<em> forms</em> when the air reaches its dew point—the temperature at    which an air mass is cool enough for its water vapor to condense into liquid droplets. This false-color image shows valley<em> fog</em>, which is common in the Pacific Northwest of North America."
                }
            ],
            "content": "\nA\nT\n\nM\nO\n\nS\nP\n\nH\nE\n\nR\nE\n\nE\nA\n\nR\nT\n\nH\n\n34\n\nValley Fog\nCanada\n\nFog is essentially a cloud lying on the ground. Like all clouds, it forms when the air reaches its dew point—the temperature at  \n\nwhich an air mass is cool enough for its water vapor to condense into liquid droplets.\n\nThis false-color image shows valley fog, which is common in the Pacific Northwest of North America. On clear winter nights, the \n\nground and overlying air cool off rapidly, especially at high elevations. Cold air is denser than warm air, and it sinks down into the \n\nvalleys. The moist air in the valleys gets chilled to its dew point, and fog forms. If undisturbed by winds, such fog may persist for \n\ndays. The Terra satellite captured this image of foggy valleys northeast of Vancouver in February 2010.\n\n\n",
            "metadata_storage_path": "aHR0cHM6Ly9oZWlkaXN0YmxvYnN0b3JhZ2UuYmxvYi5jb3JlLndpbmRvd3MubmV0L25hc2EtZWJvb2stMS01MC9wYWdlLTQxLnBkZg2",
            "people": [],
            "locations": [
                "Pacific Northwest",
                "North America",
                "Vancouver"
            ],
            "merged_content": "\nA\nT\n\nM\nO\n\nS\nP\n\nH\nE\n\nR\nE\n\nE\nA\n\nR\nT\n\nH\n\n34\n\nValley Fog\nCanada\n\nFog is essentially a cloud lying on the ground. Like all clouds, it forms when the air reaches its dew point—the temperature at  \n\nwhich an air mass is cool enough for its water vapor to condense into liquid droplets.\n\nThis false-color image shows valley fog, which is common in the Pacific Northwest of North America. On clear winter nights, the \n\nground and overlying air cool off rapidly, especially at high elevations. Cold air is denser than warm air, and it sinks down into the \n\nvalleys. The moist air in the valleys gets chilled to its dew point, and fog forms. If undisturbed by winds, such fog may persist for \n\ndays. The Terra satellite captured this image of foggy valleys northeast of Vancouver in February 2010.\n\n\n",
            "text": [],
            "layoutText": []
        }
```

This example shows "@search.features" output from a query that includes featuresMode.

```json
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
    "@search.nextPageParameters": { (request body to fetch the next page of results if not all results could be returned in this response and Search was called with POST)
      "count": ... (value from request body if present),
      "facets": ... (value from request body if present),
      "featuresMode" : ... (value from request body if present),
      "filter": ... (value from request body if present),
      "highlight": ... (value from request body if present),
      "highlightPreTag": ... (value from request body if present),
      "highlightPostTag": ... (value from request body if present),
      "minimumCoverage": ... (value from request body if present),
      "orderby": ... (value from request body if present),
      "scoringParameters": ... (value from request body if present),
      "scoringProfile": ... (value from request body if present),
      "scoringStatistics": ... (value from request body if present),
      "search": ... (value from request body if present),
      "searchFields": ... (value from request body if present),
      "searchMode": ... (value from request body if present),
      "select": ... (value from request body if present),
      "sessionId" : ... (value from request body if present),
      "skip": ... (page size plus value from request body if present),
      "top": ... (value from request body if present minus page size),
    },
    "value": [
      {
        "@search.score": document_score (if a text query was provided),
        "@search.highlights": {
          field_name: [ subset of text, ... ],
          ...
        },
        "@search.features": {
          "field_name": {
            "uniqueTokenMatches": feature_score,
            "similarityScore": feature_score,
            "termFrequency": feature_score,
          },
          ...
        },
        key_field_name: document_key,
        field_name: field_value (retrievable fields or specified projection),
        ...
      },
      ...
    ],
    "@odata.nextLink": (URL to fetch the next page of results if not all results could be returned in this response; Applies to both GET and POST)
  }
```

<a name="bkmk_examples"></a>

## Examples

You can find additional examples in [OData Expression Syntax for Azure Cognitive Search](/azure/search/query-odata-filter-orderby-syntax).

1. Invoke the semantic ranking model with answers, captions, and highlighted content. The response for this query can be found in the previous section.

    ```http  
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview 
    {
      "search": "how do clouds form",
      "queryType": "semantic",
      "queryLanguage": "en-us",
      "answers": "extractive",
      "count": "true"
    }
    ```

1. Search the Index sorted descending by date:  

    ```http 
    GET /indexes/hotels/docs?search=*&$orderby=LastRenovationDate desc&api-version=2020-06-30-Preview 
    ```  

    ```http  
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview 
        {  
          "search": "*",  
          "orderby": "LastRenovationDate desc"
        }  
    ```  

1. In a faceted search, search the index and retrieve facets for categories, ratings, tags, as well as items with baseRate in specific ranges.

    ```http  
    GET /indexes/hotels/docs?search=*&facet=Category&facet=Rating&facet=Tags&facet=Rooms/BaseRate,values:80|150|220&api-version=2020-06-30-Preview  
    ```  

    ```http
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview
        {  
          "search": "test",  
          "facets": [ "Category", "Rating", "Tags", "Rooms/BaseRate,values:80|150|220" ]  
        }  
    ```  

    Notice the last facet is on a sub-field. Facets count the parent document (Hotels) and not intermediate sub-documents (Rooms), so the response will determine the number of hotels that have any rooms in each price bucket.

1. Using a filter, narrow down the previous faceted query result after the user selects Rating 3 and category "Motel".  

    ```http  
    GET /indexes/hotels/docs?search=*&facet=tags&facet=Rooms/BaseRate,values:80|150|220&$filter=Rating eq 3 and Category eq 'Motel'&api-version=2020-06-30-Preview  
    ```  

    ```http 
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview 
        {  
          "search": "test",  
          "facets": [ "tags", "Rooms/BaseRate,values:80|150|220" ],  
          "filter": "Rating eq 3 and Category eq 'Motel'"  
        }  
    ```  

1. In a faceted search, set an upper limit on unique terms returned in a query. The default is 10, but you can increase or decrease this value using the count parameter on the facet attribute. This example returns facets for city, limited to 5.  

    ```http 
    GET /indexes/hotels/docs?search=*&facet=Address/City,count:5&api-version=2020-06-30-Preview  
    ```  

    ```http  
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview 
        {  
          "search": "test",  
          "facets": [ "Address/City,count:5" ]  
        }  
    ```  

1. Search the Index within specific fields (for example, a language field):  

    ```http 
    GET /indexes/hotels/docs?search=hôtel&searchFields=Description_fr&api-version=2020-06-30-Preview  
    ```  

    ```http 
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview 
        {  
          "search": "hôtel",  
          "searchFields": "Description_fr"
        }  
    ```  

1. Search the Index across multiple fields. For example, you can store and query searchable fields in multiple languages, all within the same index. If English and French descriptions co-exist in the same document, you can return any or all in the query results:  

    ```http 
    GET /indexes/hotels/docs?search=hotel&searchFields=Description,Description_fr&api-version=2020-06-30-Preview
    ```  

    ```http 
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview
        {  
          "search": "hotel",  
          "searchFields": "Description, Description_fr"
        }  
    ```  

     You can only query index at a time. Do not create multiple indexes for each language unless you plan to query one at a time.  

1. Paging - Get the first page of items (page size is 10):  

    ```http
    GET /indexes/hotels/docs?search=*&$skip=0&$top=10&api-version=2020-06-30-Preview 
    ```  

    ```http 
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview
        {  
          "search": "*",  
          "skip": 0,  
          "top": 10  
        }  
    ```  

1. Paging - Get the second page of items (page size is 10):  

    ```http  
    GET /indexes/hotels/docs?search=*&$skip=10&$top=10&api-version=2020-06-30-Preview 
    ```  

    ```http 
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview
        {  
          "search": "*",  
          "skip": 10,  
          "top": 10  
        }  
    ```  

1. Retrieve a specific set of fields:  

    ```http 
    GET /indexes/hotels/docs?search=*&$select=HotelName,Description&api-version=2020-06-30-Preview  
    ```  

    ```http  
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview  
        {  
          "search": "*",  
          "select": "HotelName, Description"
        }  
    ```  

1. Retrieve documents matching a specific filter expression:  

    ```http 
    GET /indexes/hotels/docs?$filter=(Rooms/BaseRate ge 60 and Rooms/BaseRate lt 300) or HotelName eq 'Fancy Stay'&api-version=2020-06-30-Preview  
    ```  

    ```http  
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview  
        {  
          "filter": "(Rooms/BaseRate ge 60 and Rooms/BaseRate lt 300) or HotelName eq 'Fancy Stay'"  
        }  
    ```  

1. Search the index and return fragments with hit highlights:  

    ```http 
    GET /indexes/hotels/docs?search=something&highlight=Description&api-version=2020-06-30-Preview
    ```  

    ```http  
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview 
        {  
          "search": "something",  
          "highlight": "Description"  
        }  
    ```  

1. Search the index and return documents sorted from closer to farther away from a reference location:  

    ```http 
    GET /indexes/hotels/docs?search=something&$orderby=geo.distance(Location, geography'POINT(-122.12315 47.88121)')&api-version=2020-06-30-Preview 
    ```  

    ```http 
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview
        {  
          "search": "something",  
          "orderby": "geo.distance(Location, geography'POINT(-122.12315 47.88121)')"
        }  
    ```  

1. Search the index assuming there's a scoring profile called "geo" with two distance scoring functions, one defining a parameter called "currentLocation" and one defining a parameter called "lastLocation":  

    ```http  
    GET /indexes/hotels/docs?search=something&scoringProfile=geo&scoringParameter=currentLocation--122.123,44.77233&scoringParameter=lastLocation--121.499,44.2113&api-version=2020-06-30-Preview 
    ```  

    ```http 
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview
        {  
          "search": "something",  
          "scoringProfile": "geo",  
          "scoringParameters": [ "currentLocation--122.123,44.77233", "lastLocation--121.499,44.2113" ]  
        }  
    ```  

1. Find documents in the index using simple query syntax. This query returns hotels where searchable fields contain the terms "comfort" and "location" but not "motel":  

    ```http  
    Get /indexes/hotels/docs?search=comfort +location –motel&searchMode=all&api-version=22020-06-30-Preview
    ```  

    ```http 
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview
        {  
          "search": "comfort +location -motel",  
          "searchMode": "all"  
        }  
    ```  

    > [!TIP]  
    >  The use of `searchMode=all` overrides the default of `searchMode=any`, ensuring that `-motel` means "AND NOT" instead of "OR NOT". Without `searchMode=all`, you get "OR NOT" which expands rather than restricts search results, and this can be counter-intuitive to some users.  

1. Find documents in the index using Lucene query syntax (see [Lucene query syntax in Azure Cognitive Search](/azure/search/query-lucene-syntax)). This query returns hotels where the category field contains the term "budget" and all searchable fields containing the phrase "recently renovated". Documents containing the phrase "recently renovated" are ranked higher as a result of the term boost value (3)  

    ```http
    GET /indexes/hotels/docs?search=Category:budget AND \"recently renovated\"^3&searchMode=all&api-version=2020-06-30-Preview&querytype=full` 
    ``` 

    ```http  
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview
        {  
         "search": "Category:budget AND \"recently renovated\"^3",  
          "queryType": "full",  
          "searchMode": "all"  
    }  
    ```  

1. Find documents in the index while favoring consistent scoring over lower latency. This query will calculate document frequencies across the whole index, and will do a best effort to target the same replica for all queries within the same "session", which will help generating stable and reproducible ranking. 

    ```http 
    GET /indexes/hotels/docs?search=hotel&sessionId=mySessionId&scoringStatistics=global&api-version=2020-06-30-Preview
    ```  

    ```http  
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview
        {  
          "search": "hotel",  
          "sessionId": "mySessionId",
          "scoringStatistics" :"global"
        }  
    ```  

1. Find documents in the index and return a list of information retrieval features for each result describing the scoring between the matched document and the query. The query also calculates document frequencies across the whole index to produce more consistent scoring.

    ```http 
    GET /indexes/hotels/docs?search=hotel&featuresMode=enabled&scoringStatistics=global&api-version=2020-06-30-Preview 
    ```  

    ```http  
    POST /indexes/hotels/docs/search?api-version=2020-06-30-Preview
        {  
          "search": "hotel",  
          "featuresMode": "enabled",
          "scoringStatistics" :"global"
        }  
    ```

    An example of a response that includes `search.features` looks similar to the following:

    ```http
        "@search.score": 0.91875637,
        "@search.features": {
            "Description": {
                "uniqueTokenMatches": 1,
                "similarityScore": 0.2917966,
                "termFrequency": 2
            },
            "HotelName": {
                "uniqueTokenMatches": 1,
                "similarityScore": 0.44458693,
                "termFrequency": 1
            }
          . . .

## Definitions

This section provides details about parameters that are too complex to cover in the main table.

[queryLanguage](#queryLanguage)

<a name="queryLanguage"></a>

### queryLanguage supported languages

Default is "none".

| Language | queryLanguage | Semantic caption | Semantic answer | Speller |
|----------|---------------|------------------|-----------------|---------|
| English [EN] | EN, EN-US (default), EN-GB, EN-IN, EN-CA, EN-AU | production-ready | production-ready | production-ready |
| Spanish [ES] | ES, ES-ES (default), ES-MX | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| French [FR] | FR, FR-FR (default), FR-CA | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| German [DE] | DE, DE-DE (default) | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| Portuguese [PT] | PT, PT-BR (default), PT-PT | :heavy_check_mark: | preview | :x: |
| Chinese [ZH] | ZH, ZH-CN (default), ZH-TW | :heavy_check_mark: | preview | :x:  |
| Italian [IT] | IT, IT-IT (default) | production-ready | preview |  |
| Japanese [JA] | JA, JA-JP (default) | :heavy_check_mark: | preview | :x: |
| Korean [KO] | KO, KO-KR (default) | preview | preview | :x:  |
| Russian [RU] | RU, RU-RU (default) | preview | preview | :x: |
| Czech [CS] | CS, CS-CZ (default) | preview | preview | :x: |
| Dutch [NL] | NL, NL-BE (default), NL-N | preview | preview | :x: |
Polish [PL]  | PL, PL-PL (default)  | preview | preview | :x: |
Swedish [SV] | SV, SV-SE (default)  | preview | preview | :x: |
Turkish [TR] | TR, TR-TR (default)  | preview | preview | :x: |
Hindi [HI] | HI, HI-IN (default)  | preview | preview | :x: |
Arabic [AR] | AR, AR-SA (default), AR-EG, AR-MA. AR-KW, AR-JO  | preview | preview | :x: |
Danish [DA] | DA, DA-DK (default)  | preview | preview | :x: |
Norwegian [NO] | NO, NO-NO (default)  | preview | preview | :x: |
Bulgarian [BG] | BG, BG-BG (default)  | preview | preview | :x: |
Croatian [HR]  | HR, HR-HR (default), HR-BA  | preview | preview | :x: |
Malaysian [MS]  | MS, MS-MY (default), MS-BN  | preview | preview | :x: |
Slovenian [SL] | SL, SL-SL (default)  | preview | preview | :x: |
Tamil [TA] | TA, TA-IN (default)  | preview | preview | :x: |
Vietnamese [VA] | VA, VI-VN (default)  | preview | preview | :x: |
Greek [EL] | EL, EL-GR (default)  | preview | preview | :x: |
Romanian [RO] | RO, RO-RO (default)  | preview | preview | :x: |
Icelandic [IS] | IS, IS-IS (default)  | preview | preview | :x: |
Indonesian [ID] | ID, ID-ID (default)  | preview | preview | :x: |
Thai [TH] | TH, TH-TH (default)  | preview | preview | :x: |
Lithuanian [LT]  | LT, LT-LT (default)  | preview | preview | :x: |
Ukrainian [UK] | UK, UK-UA (default)  | preview | preview | :x: |
Latvian [LV] | LV, LV-LV (default) 
Estonian [ET] | ET, ET-EE (default)  | preview | preview | :x: |
Catalan [CA] | CA, CA-ES (default)  | preview | preview | :x: |
Finnish [FI] | FI, FI-FI (default)  | preview | preview | :x: |
Serbian [SR] (Cyrillic or Latin) | SR, SR-BA (default), SR-ME, SR-RS  | preview | preview | :x: |
Slovak [SK] | SK, SK-SK (default)  | preview | preview | :x: |

## See also

+ [Creating queries in Azure Cognitive Search](/azure/search/search-query-create)
+ [Queries in Azure Cognitive Search](/azure/search/search-query-overview)
+ [How full text search works in Azure Cognitive Search](/azure/search/search-lucene-query-architecture)
+ [OData Expression Syntax for Azure vSearch](/azure/search/query-odata-filter-orderby-syntax)
+ [Simple query syntax in Azure Cognitive Search](/azure/search/query-simple-syntax) 