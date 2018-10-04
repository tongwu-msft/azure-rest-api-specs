---
title: Bing Custom Autosuggest API v7 Reference | Microsoft Docs
description: Describes the programming elements of the Bing Custom Autosuggest API.
services: cognitive-services
author: swhite-msft
manager: ehansen

ms.assetid: 08E5011C-BF3C-46F7-906F-6930E0026EFC
ms.service: cognitive-services
ms.technology: bing-custom-autosuggest
ms.topic: article
ms.date: 04/15/2017
ms.author: scottwhi
---

# Custom Autosuggest API v7 reference

The Custom Autosuggest API lets you send a partial search query string to Bing and get back a list of suggested queries. Typically, you use this API to support a richer search experience. For example, as the user enters each character of their search term, you'd call this API and populate the search box's drop-down list with the suggested query strings.  
  
For information about configuring custom suggestions, see [Configure your Custom Autosuggest experience](https://docs.microsoft.com/azure/cognitive-services/bing-custom-search/define-custom-suggestions).
  
For information about the headers that you should include in the request, see [Request Headers](#headers).  
  
For information about the query parameters that you should include in the request, see [Query Parameters](#query-parameters).  
  
For information about the JSON objects that the response may include, see [Response Objects](#response-objects). 

For information about permitted use and display of results, see [Bing Search API Use and Display requirements](https://docs.microsoft.com/azure/cognitive-services/bing-custom-search/use-and-display-requirements).
 
  
## Endpoint  

To request custom query suggestions, send a GET request to:

```
https://api.cognitive.microsoft.com/bingcustomsearch/v7.0/Suggestions
```  
  
The request must use the HTTPS protocol.  
  
> [!NOTE]
> The maximum URL length is 2,048 characters. To ensure that your URL length does not exceed the limit, the maximum length of your query parameters should be less than 1,500 characters. If the URL exceeds 2,048 characters, the server returns 404 Not found.  
  
## Headers  
The following are the headers that a request and response may include.  
  
|Header|Description|  
|------------|-----------------|
|<a name="subscriptionkey" />Ocp-Apim-Subscription-Key|Required request header.<br /><br /> The subscription key that you received when you signed up for this service in [Cognitive Services](https://www.microsoft.com/cognitive-services/).|    
|<a name="retryafter" />Retry-After|Response header.<br /><br /> The response includes this header if you exceed the number of queries allowed per second (QPS) or per month (QPM). The header contains the number of seconds that you must wait before sending another request.|  

> [!NOTE] 
> Remember that the Terms of Use require compliance with all applicable laws, including regarding use of these headers. For example, in certain jurisdictions, such as Europe, there are requirements to obtain user consent before placing certain tracking devices on user devices.
  
## Query parameters  

The following are the query parameters that the request may include. The Required column indicates whether you must specify the parameter. You must URL encode the query parameter values.  
  
|Name|Value|Type|Required|  
|----------|-----------|----------|--------------|  
|<a name="customconfig" />customConfig|Unique identifier that identifies your custom search instance.<br /><br />|String|Yes
|<a name="query" />q|The user's search query string.<br /><br /> The query string must not be empty. If empty or not specified, the list of suggestions in the response is empty.<br /><br /> The API does not support the [Bing Advanced Operators](http://msdn.microsoft.com/library/ff795620.aspx). If the query string includes Bing operators, the operators are treated as part of the query string, not as an operator.|String|No|  
  
## Response objects  

The following are the JSON objects that the response may include. If the request is successful, the top-level object in the response is the [Suggestions](#suggestions) object. If the request fails, the top-level object is [ErrorResponse](#errorresponse).  
  
|Object|Description|  
|------------|-----------------|  
|[Error](#error)|Defines the error that occurred.|  
|[ErrorResponse](#errorresponse)|The top-level object that the response includes when the request fails.|  
|[QueryContext](#querycontext)|Defines the query term that Bing used for the request.|  
|[SearchAction](#searchaction)|Defines the suggested search query.|  
|[SuggestionGroup](#suggestgroup)|Defines a group of suggestions of the same type.|  
|[Suggestions](#suggestions)|The top-level object that the response includes when the request succeeds.|  
  
<a name="error"></a>   
### Error  
Defines the error that occurred.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|<a name="error-code" />code|The error code that identifies the category of error. For a list of possible codes, see [Error Codes](#errorcodes).|String|  
|<a name="error-message" />message|A description of the error.|String|  
|<a name="error-moredetails" />moreDetails|A description that provides additional information about the error.|String|  
|<a name="error-parameter" />parameter|The query parameter in the request that caused the error.|String|  
|<a name="error-subcode" />subCode|The error code that identifies the error. For example, if `code` is InvalidRequest, `subCode` may be ParameterInvalid or ParameterInvalidValue. |String|  
|<a name="error-value" />value|The query parameter's value that was not valid.|String|  
  
<a name="errorresponse"></a>   
### ErrorResponse  
The top-level object that the response includes when the request fails.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|Type hint.|String|  
|<a name="errors" />errors|A list of errors that describe the reasons why the request failed.|[Error](#error)[]|  
   
<a name="searchaction"></a>   
### SearchAction  
Defines a query search suggestion.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|displayText|The suggested query term to display in a user interface. |String|  
|<a name="searchaction-query" />query|The suggested query term.<br /><br /> If the user selects the query term from the list of suggestions, use the term in a Bing API request and display the search results yourself. Or, use the URL in the `url` field to send the user to the Bing search results page for the suggested query.|String|  
|<a name="searchaction-searchkind" />searchKind|The type of suggestion. The following are the possible values.<br /><ul><li>CustomSearch&mdash;The suggestion is from a non-Web search suggestion data source.<br /></li><li>WebSearch&mdash;The suggestion is from a web search suggestion data source.</li></ul>|String|  
  
<a name="suggestgroup"></a>   
### SuggestionGroup  
Defines a group of suggestions of the same type.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="suggestgroup-name" />name|The name of the group. The name identifies the type of suggestions that the group contains. For example, web search suggestions. The following are the possible group names.<br /><ul><li>Custom&mdash;The group contains suggestions from a non-web search suggestions data source.</li><li>Web&mdash;The group contains web search suggestions.</li></ul>|String|  
|<a name="suggestgroup-searchsuggestions" />searchSuggestions|A list of up to 8 suggestions. If there are no suggestions, the array is empty.<br /><br /> You must display all suggestions in the order provided. The list is in order of decreasing relevance. The first suggestion is the most relevant and the last suggestion is the least relevant. The size of the list is subject to change.|[SearchAction](#searchaction)[]|  
  
<a name="suggestions"></a>   
### Suggestions  
The top-level object that the response includes when the request succeeds.  
  
If the service suspects a denial of service attack, the request succeeds (HTTP status code is 200 OK). However, the body of the response is empty.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|The type hint, which is set to Suggestions.|String|  
|queryContext|The user's query string.|[QueryContext](#querycontext)|  
|<a name="suggestions-suggestiongroups" />suggestionGroups|A list of suggested query strings grouped by type. For example, web search suggestions.|[SuggestionGroup](#suggestgroup)[]|  
  
## Error codes 

The following are the possible HTTP status codes that a request returns.  
  
|Status Code|Description|  
|-----------------|-----------------|  
|200|Success.|  
|400|One of the query parameters is missing or not valid.|  
|401|The subscription key is missing or is not valid.|  
|410|The request used HTTP instead of the HTTPS protocol. HTTPS is the only supported protocol.|  
|429|The caller exceeded their queries per second quota.|  
|500|Unexpected server error.|

If the request fails, the response contains an [ErrorResponse](#errorresponse) object, which contains a list of [Error](#error) objects that describe what caused of error. If the error is related to a parameter, the `parameter` field identifies the parameter that is the issue. And if the error is related to a parameter value, the `value` field identifies the value that is not valid.

```json
{
  "_type": "ErrorResponse", 
  "errors": [
    {
      "code": "InvalidRequest", 
      "subCode": "ParameterMissing", 
      "message": "Required parameter is missing.", 
      "parameter": "q" 
    }
  ]
}

{
  "_type": "ErrorResponse", 
  "errors": [
    {
      "code": "InvalidAuthorization", 
      "subCode": "AuthorizationMissing", 
      "message": "Authorization is required.", 
      "moreDetails": "Subscription key is not recognized."
    }
  ]
}
```

The following are the possible error code and sub-error code values.

|Code|SubCode|Description
|-|-|-
|ServerError|UnexpectedError<br/>ResourceError<br/>NotImplemented|HTTP status code is 500.
|InvalidRequest|ParameterMissing<br/>ParameterInvalidValue<br/>HttpNotAllowed<br/>Blocked|Bing returns InvalidRequest whenever any part of the request is not valid. For example, a required parameter is missing or a parameter value is not valid.<br/><br/>If the error is ParameterMissing or ParameterInvalidValue, the HTTP status code is 400.<br/><br/>If you use the HTTP protocol instead of HTTPS, Bing returns HttpNotAllowed, and the HTTP status code is 410.
|RateLimitExceeded|No sub-codes|Bing returns RateLimitExceeded whenever you exceed your queries per second (QPS) or queries per month (QPM) quota.<br/><br/>If you exceed QPS, Bing returns HTTP status code 429, and if you exceed QPM, Bing returns 403.
|InvalidAuthorization|AuthorizationMissing<br/>AuthorizationRedundancy|Bing returns InvalidAuthorization when Bing cannot authenticate the caller. For example, the `Ocp-Apim-Subscription-Key` header is missing or the subscription key is not valid.<br/><br/>Redundancy occurs if you specify more than one authentication method.<br/><br/>If the error is InvalidAuthorization, the HTTP status code is 401.
|NoSuggestions|No sub-codes|No suggestions found, the HTTP status code is 404. 

## Market codes 

[!INCLUDE [bing-market-codes](./includes/bing-market-codes.md)]
