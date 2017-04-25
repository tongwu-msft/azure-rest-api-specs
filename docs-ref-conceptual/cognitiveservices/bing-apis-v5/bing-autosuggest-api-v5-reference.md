---
ms.assetid:
title: Bing Autosuggest API v5 Reference | Microsoft Docs
description: Describes the programming elements of the Bing Autosuggest API.
services: cognitive-services
author: swhite-msft
manager: ehansen

ms.assetid: A3BBA60D-6E9B-4CC2-A6A6-240D3029986C
ms.service: cognitive-services
ms.technology: bing-autosuggest
ms.topic: article
ms.date: 04/15/2017
ms.author: scottwhi
---

# Autosuggest API v5 Reference

The Autosuggest API lets you send a partial search query term to Bing and get back a list of suggested queries that other users have searched on. In addition to including searches made by others, the list may include suggestions based on user intent.  

Typically, you use this API to support a richer search box experience. For example, as the user enters each character of their search term, you'd call this API and populate the search box's drop-down list with the suggested query strings.  
  
This section provides technical details about the query parameters and headers that the request may include, and the JSON response that contains the suggested queries. For examples that show how to make requests, see [Getting suggested query strings](https://docs.microsoft.com/azure/cognitive-services/bing-autosuggest/get-suggested-query-strings).  
  
For information about the headers that you should include in the request, see [Request Headers](#headers).  
  
For information about the query parameters that you should include in the request, see [Query Parameters](#query-parameters).  
  
For information about the JSON objects that the response may include, see [Response Objects](#response-objects).  
  
## Endpoint  

To request query suggestions, send a GET request to:

```
https://api.cognitive.microsoft.com/bing/v5.0/Suggestions
```  
  
The request must use the HTTPS protocol.  
  
> [!NOTE]
> The maximum URL length is 2,048 characters. To ensure that your URL length does not exceed the limit, the maximum length of your query parameters should be less than 1,500 characters. If the URL exceeds 2,048 characters, the server returns 404 Not found.  
  
## Headers  
The following are the headers that a request and response may include.  
  
|Header|Description|  
|------------|-----------------|  
|Accept|Optional request header.<br /><br /> The default media type is application/json. To specify that the response use [JSON-LD](http://json-ld.org/), set the Accept header to application/ld+json.|  
|<a name="acceptlanguage" />Accept-Language|Optional request header.<br /><br /> A comma-delimited list of languages to use for user interface strings. The list is in decreasing order of preference. For more information, including expected format, see [RFC2616](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html).<br /><br /> This header and the [setLang](#setlang) query parameter are mutually exclusive&mdash;do not specify both.<br /><br /> If you set this header, you must also specify the [cc](#cc) query parameter. To to determine the market to return results for, Bing uses the first supported language it finds from the list and combines it with the `cc` parameter value. If the list does not include a supported language, Bing finds the closest language and market that supports the request or it uses an aggregated or default market for the results. To determine the market that Bing used, see the BingAPIs-Market header.<br /><br /> Use this header and the `cc` query parameter only if you specify multiple languages. Otherwise, use the [mkt](#mkt) and [setLang](#setlang) query parameters.<br /><br /> A user interface string is a string that's used as a label in a user interface. There are few user interface strings in the JSON response objects. Any links to Bing.com properties in the response objects apply the specified language.|  
|<a name="market" />BingAPIs-Market|Response header.<br /><br /> The market used by the request. The form is <languageCode\>-<countryCode\>. For example, en-US.<br /><br /> If you specify a market that is not listed in [Market Codes](#market-codes), this value may differ from the market you specified in the [mkt](#mkt) query parameter. The same is true if you specify values for [cc](#cc) and [Accept-Language](#acceptlanguage) that can't be reconciled.|  
|<a name="traceid" />BingAPIs-TraceId|Response header.<br /><br /> The ID of the log entry that contains the details of the request. When an error occurs, capture this ID. If you are not able to determine and resolve the issue, include this ID along with the other information that you provide the Support team.|  
|<a name="subscriptionkey" />Ocp-Apim-Subscription-Key|Required request header.<br /><br /> The subscription key that you received when you signed up for this service in [Cognitive Services](https://www.microsoft.com/cognitive-services/).|  
|<a name="retryafter" />Retry-After|Response header.<br /><br /> The response includes this header if you exceed the number of queries allowed per second (QPS) or per month (QPM). The header contains the number of seconds that you must wait before sending another request.|  
|<a name="useragent" />User-Agent|Optional request header.<br /><br /> The user agent originating the request. Bing uses the user agent to provide mobile users with an optimized experience. Although optional, you are encouraged to always specify this header.<br /><br /> The user-agent should be the same string that any commonly used browser sends. For information about user agents, see [RFC 2616](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html).<br /><br /> The following are examples of user-agent strings.<br /><br /><ul><li>Windows Phone&mdash;Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 822)<br /><br /></li><li>Android&mdash;Mozilla/5.0 (Linux; U; Android 2.3.5; en-us; SCH-I500 Build/GINGERBREAD) AppleWebKit/533.1 (KHTML; like Gecko) Version/4.0 Mobile Safari/533.1<br /><br /></li><li>iPhone&mdash;Mozilla/5.0 (iPhone; CPU iPhone OS 6_1 like Mac OS X) AppleWebKit/536.26 (KHTML; like Gecko) Mobile/10B142 iPhone4;1 BingWeb/3.03.1428.20120423<br /><br /></li><li>PC&mdash;Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko<br /><br /></li><li>iPad&mdash;Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53</li></ul>|
|<a name="clientid" />X-MSEdge-ClientID|Optional request and response header.<br /><br /> Bing uses this header to provide users with consistent behavior across Bing API calls. Bing often flights new features and improvements, and it uses the client ID as a key for assigning traffic on different flights. If you do not use the same client ID for a user across multiple requests, then Bing may assign the user to multiple conflicting flights. Being assigned to multiple conflicting flights can lead to an inconsistent user experience. For example, if the second request has a different flight assignment than the first, the experience may be unexpected. Also, Bing can use the client ID to tailor web results to that client ID’s search history, providing a richer experience for the user.<br /><br /> Bing also uses this header to help improve result rankings by analyzing the activity generated by a client ID. The relevance improvements help with better quality of results delivered by Bing APIs and in turn enables higher click-through rates for the API consumer.<br /><br /> **IMPORTANT:** Although optional, you should consider this header required. Persisting the client ID across multiple requests for the same end user and device combination enables 1) the API consumer to receive a consistent user experience, and 2) higher click-through rates via better quality of results from the Bing APIs.<br /><br /> The following are the basic usage rules that apply to this header.<br /><br /><ul><li>Each user that uses your application on the device must have a unique, Bing generated client ID.<br /><br/>If you do not include this header in the request, Bing generates an ID and returns it in the X-MSEdge-ClientID response header. The only time that you should NOT include this header in a request is the first time the user uses your app on that device.</li><li>Use the client ID for each Bing API request that your app makes for this user on the device.<br /><br/></li><li>Persist the client ID. To persist the ID in a browser app, use a persistent HTTP cookie to ensure the ID is used across all sessions. Do not use a session cookie. For other apps such as mobile apps, use the device's persistent storage to persist the ID.<br /><br/>The next time the user uses your app on that device, get the client ID that you persisted.</li><ul><br /><br /> **NOTE:** Bing responses may or may not include this header. If the response includes this header, capture the client ID and use it for all subsequent Bing requests for the user on that device.<br /><br /> **NOTE** If you include the X-MSEdge-ClientID, you must not include cookies in the request.|  
|<a name="clientip" />X-Search-ClientIP|Optional request header.<br /><br /> The IPv4 or IPv6 address of the client device. The IP address is used to discover the user's location. Bing uses the location information to determine safe search behavior.<br /><br /> **NOTE:** Although optional, you are encouraged to always specify this header and the X-Search-Location header.<br /><br /> Do not obfuscate the address (for example, by changing the last octet to 0). Obfuscating the address results in the location not being anywhere near the device's actual location, which may result in Bing serving erroneous results.|  
|<a name="location" />X-Search-Location|Optional request header.<br /><br /> A semicolon-delimited list of key/value pairs that describe the client's geographical location. Bing uses the location information to determine safe search behavior and to return relevant local content. Specify the key/value pair as <key\>:<value\>. The following are the keys that you use to specify the user's location.<br /><br /><ul><li>lat&mdash;Required. The latitude of the client's location, in degrees. The latitude must be greater than or equal to -90.0 and less than or equal to +90.0. Negative values indicate southern latitudes and positive values indicate northern latitudes.<br /><br /></li><li>long&mdash;Required. The longitude of the client's location, in degrees. The longitude must be greater than or equal to -180.0 and less than or equal to +180.0. Negative values indicate western longitudes and positive values indicate eastern longitudes.<br /><br /></li><li>re&mdash;Required. The radius, in meters, which specifies the horizontal accuracy of the coordinates. Pass the value returned by the device's location service. Typical values might be 22m for GPS/Wi-Fi, 380m for cell tower triangulation, and 18,000m for reverse IP lookup.<br /><br /></li><li>ts&mdash;Optional. The UTC UNIX timestamp of when the client was at the location. (The UNIX timestamp is the number of seconds since January 1, 1970.)<br /><br /></li><li>head&mdash;Optional. The client's relative heading or direction of travel. Specify the direction of travel as degrees from 0 through 360, counting clockwise relative to true north. Specify this key only if the `sp` key is nonzero.<br /><br /></li><li>sp&mdash;Optional. The horizontal velocity (speed), in meters per second, that the client device is traveling.<br /><br /></li><li>alt&mdash;Optional. The altitude of the client device, in meters.<br /><br /></li><li>are&mdash;Optional. The radius, in meters, that specifies the vertical accuracy of the coordinates. Specify this key only if you specify the `alt` key.</li></ul><br /><br /> **NOTE:** Although many of the keys are optional, the more information that you provide, the more accurate the location results are.<br /><br /> **NOTE:** Although optional, you are encouraged to always specify the user's geographical location. Providing the location is especially important if the client's IP address does not accurately reflect the user's physical location (for example, if the client uses VPN). For optimal results, you should include this header and the X-Search-ClientIP header, but at a minimum, you should include this header.|

> [!NOTE] 
> Remember that the Terms of Use require compliance with all applicable laws, including regarding use of these headers. For example, in certain jurisdictions, such as Europe, there are requirements to obtain user consent before placing certain tracking devices on user devices.
  
## Query Parameters  

The following are the query parameters that the request may include. The Required column indicates whether you must specify the parameter. You must URL encode the query parameter values.  
  
|Name|Value|Type|Required|  
|----------|-----------|----------|--------------|  
|<a name="cc" />cc|A 2-character country code of the country where the results come from. For a list of possible values, see [Market Codes](#market-codes).<br /><br /> If you set this parameter, you must also specify the [Accept-Language](#acceptlanguage) header. Bing uses the first supported language it finds in the specified languages and combines it with the country code to determine the market to return results for. If the languages list does not include a supported language, Bing finds the closest language and market that supports the request. Or, Bing may use an aggregated or default market for the results.<br /><br /> Use this query parameter and the `Accept-Language` header only if you specify multiple languages. Otherwise, you should use the `mkt` and `setLang` query parameters.<br /><br /> This parameter and the [mkt](#mkt) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="mkt" />mkt|The market where the results come from. Typically, `mkt` is the country where the user is making the request from. However, it could be a different country if the user is not located in a country where Bing delivers results. The market must be in the form <language code\>-<country code\>. For example, en-US. The string is case insensitive. For a list of possible market values, see [Market Codes](#market-codes).<br /><br /> **NOTE:** If known, you are encouraged to always specify the market. Specifying the market helps Bing route the request and return an appropriate and optimal response. If you specify a market that is not listed in [Market Codes](#market-codes), Bing uses a best fit market code based on an internal mapping that is subject to change.<br /><br /> This parameter and the [cc](#cc) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="query" />q|The user's search query string.<br /><br /> The query string must not be empty. If empty or not specified, the list of suggestions in the response is empty.<br /><br /> The API does not support the [Bing Advanced Operators](http://msdn.microsoft.com/library/ff795620.aspx). If the query string includes Bing operators, the operators are treated as part of the query string, not as an operator.|String|No|  
|<a name="setlang" />setLang|The language to use for user interface strings. Specify the language using the ISO 639-1 2-letter language code. For example, the language code for English is EN. The default is EN (English).<br /><br /> Although optional, you should always specify the language. Typically, you set `setLang` to the same language specified by `mkt` unless the user wants the user interface strings displayed in a different language.<br /><br /> This parameter and the [Accept-Language](#acceptlanguage) header are mutually exclusive&mdash;do not specify both.<br /><br /> A user interface string is a string that's used as a label in a user interface. There are few user interface strings in the JSON response objects. Also, any links to Bing.com properties in the response objects apply the specified language.|String|No|  
  
## Response Objects  

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
|<a name="error-code" />code|The error code that identifies the error. For a list of possible codes, see [Error Codes](#error-codes).|String|  
|<a name="error-message" />message|A description of the error.|String|  
|<a name="error-parameter" />parameter|The query parameter in the request that caused the error.|String|  
|<a name="error-value" />value|The query parameter's value that was not valid.|String|  
  
<a name="errorresponse"></a>   
### ErrorResponse  
The top-level object that the response includes when the request fails.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|Type hint.|String|  
|<a name="errors" />errors|A list of errors that describe the reasons why the request failed.|[Error](#error)[]|  
  
<a name="querycontext"></a>   
### QueryContext  
Defines the query term that Bing used for the request.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|adultIntent|Not used.|Boolean|  
|alterationOverrideQuery|Not used.|String|  
|alteredQuery|Not used.|String|  
|originalQuery|The user's query term.|String|  
  
<a name="searchaction"></a>   
### SearchAction  
Defines a query search suggestion.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|displayText|The suggested query term to display in a user interface. |String|  
|<a name="searchaction-query" />query|The suggested query term.<br /><br /> If the user selects the query term from the list of suggestions, use the term in a Bing API request and display the search results yourself. Or, use the URL in the `url` field to send the user to the Bing search results page for the suggested query.|String|  
|<a name="searchaction-searchkind" />searchKind|The type of suggestion. The following are the possible values.<br /><br /><ul><li>CustomSearch&mdash;The suggestion is from a non-Web search suggestion data source.<br /></li><li>WebSearch&mdash;The suggestion is from a web search suggestion data source.</li></ul>|String|  
|<a name="searchaction-url" />url|The URL that takes the user to the Bing search results page for the suggested query.|String|  
  
<a name="suggestgroup"></a>   
### SuggestionGroup  
Defines a group of suggestions of the same type.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="suggestgroup-name" />name|The name of the group. The name identifies the type of suggestions that the group contains. For example, web search suggestions. The following are the possible group names.<br /><br /><ul><li>Custom&mdash;The group contains suggestions from a non-web search suggestions data source.<br /></li><li>Web&mdash;The group contains web search suggestions.</li></ul>|String|  
|<a name="suggestgroup-searchsuggestions" />searchSuggestions|A list of up to 8 suggestions. If there are no suggestions, the array is empty.<br /><br /> You must display all suggestions in the order provided. The list is in order of decreasing relevance. The first suggestion is the most relevant and the last suggestion is the least relevant. The size of the list is subject to change.|[SearchAction](#searchaction)[]|  
  
<a name="suggestions"></a>   
### Suggestions  
The top-level object that the response includes when the request succeeds.  
  
If the service suspects a denial of service attack, the request succeeds (HTTP status code is 200 OK). However, the body of the response is empty.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|Type hint.|String|  
|queryContext|The user's query string.|[QueryContext](#querycontext)|  
|<a name="suggestions-suggestiongroups" />suggestionGroups|A list of suggested query strings grouped by type. For example, web search suggestions.|[SuggestionGroup](#suggestgroup)[]|  
  
## Error Codes 

[!INCLUDE [bing-error-codes](../includes/bing-error-codes.md)]

## Market Codes 

[!INCLUDE [bing-market-codes](../includes/bing-market-codes.md)]
