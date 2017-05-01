---
title: Bing Web Search API v7 Reference | Microsoft Docs
description: Describes the programming elements of the Bing Web Search API.
services: cognitive-services
author: swhite-msft
manager: ehansen

ms.assetid: 3C83E605-6455-4114-952B-2DD7786C86C9
ms.service: cognitive-services
ms.technology: bing-web-search
ms.topic: article
ms.date: 04/15/2017
ms.author: scottwhi
---

# Web Search API v7 Reference

> [!NOTE]
> Beta release of the Web Search API. All aspects of the API and documentation are subject to change. 

The Web Search API lets you send a search query to Bing and get back search results that include links to webpages, images, and more. This section provides technical details about the webpages, related searches, and ranking results in addition to the query parameters that affect the search results. For examples that show how to make requests, see [Searching the Web](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/searching-the-web) 
  
For details about headers that requests should include, see [Request Headers](#headers).  
  
For details about query parameters that requests should include, see [Query Parameters](#query-parameters).  
  
For details about the JSON objects that the response may include, see [Response Body](#response-objects). This reference contains JSON object specific to web answers. For details about the JSON objects for other answer types that the search results may include, see the API-specific reference documentation. For example, if the search result contains the images and news answers, see the [Image Search API](https://docs.microsoft.com/azure/cognitive-services/bing-image-search/search-the-web) and [News Search API](https://docs.microsoft.com/azure/cognitive-services/bing-news-search/search-the-web).
  
  
## Endpoints  
To request web search results, send a GET request to:  
  
```
https://api.cognitive.microsoft.com/bing/v7.0/search
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
|<a name="market" />BingAPIs-Market|Response header.<br /><br /> The market used by the request. The form is \<languageCode\>-\<countryCode\>. For example, en-US.<br /><br /> If you specify a market that is not listed in [Market Codes](#market-codes), this value may differ from the market you specified in the [mkt](#mkt) query parameter. The same is true if you specify values for [cc](#cc) and [Accept-Language](#acceptlanguage) that can't be reconciled.|  
|<a name="traceid" />BingAPIs-TraceId|Response header.<br /><br /> The ID of the log entry that contains the details of the request. When an error occurs, capture this ID. If you are not able to determine and resolve the issue, include this ID along with the other information that you provide the Support team.|  
|<a name="subscriptionkey" />Ocp-Apim-Subscription-Key|Required request header.<br /><br /> The subscription key that you received when you signed up for this service in [Cognitive Services](https://www.microsoft.com/cognitive-services/).|  
|<a name="pragma" />Pragma|Optional request header<br /><br /> By default, Bing returns cached content, if available. To prevent cached content, set the Pragma header to no-cache (for example, Pragma: no-cache).
|<a name="retryafter" />Retry-After|Response header.<br /><br /> The response includes this header if you exceed the number of queries allowed per second (QPS) or per month (QPM). The header contains the number of seconds that you must wait before sending another request.|  
|<a name="useragent" />User-Agent|Optional request header.<br /><br /> The user agent originating the request. Bing uses the user agent to provide mobile users with an optimized experience. Although optional, you are encouraged to always specify this header.<br /><br /> The user-agent should be the same string that any commonly used browser sends. For information about user agents, see [RFC 2616](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html).<br /><br /> The following are examples of user-agent strings.<br /><ul><li>Windows Phone&mdash;Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 822)<br /><br /></li><li>Android&mdash;Mozilla/5.0 (Linux; U; Android 2.3.5; en-us; SCH-I500 Build/GINGERBREAD) AppleWebKit/533.1 (KHTML; like Gecko) Version/4.0 Mobile Safari/533.1<br /><br /></li><li>iPhone&mdash;Mozilla/5.0 (iPhone; CPU iPhone OS 6_1 like Mac OS X) AppleWebKit/536.26 (KHTML; like Gecko) Mobile/10B142 iPhone4;1 BingWeb/3.03.1428.20120423<br /><br /></li><li>PC&mdash;Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko<br /><br /></li><li>iPad&mdash;Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53</li></ul>|
|<a name="clientid" />X-MSEdge-ClientID|Optional request and response header.<br /><br /> Bing uses this header to provide users with consistent behavior across Bing API calls. Bing often flights new features and improvements, and it uses the client ID as a key for assigning traffic on different flights. If you do not use the same client ID for a user across multiple requests, then Bing may assign the user to multiple conflicting flights. Being assigned to multiple conflicting flights can lead to an inconsistent user experience. For example, if the second request has a different flight assignment than the first, the experience may be unexpected. Also, Bing can use the client ID to tailor web results to that client ID’s search history, providing a richer experience for the user.<br /><br /> Bing also uses this header to help improve result rankings by analyzing the activity generated by a client ID. The relevance improvements help with better quality of results delivered by Bing APIs and in turn enables higher click-through rates for the API consumer.<br /><br /> **IMPORTANT:** Although optional, you should consider this header required. Persisting the client ID across multiple requests for the same end user and device combination enables 1) the API consumer to receive a consistent user experience, and 2) higher click-through rates via better quality of results from the Bing APIs.<br /><br /> The following are the basic usage rules that apply to this header.<br /><ul><li>Each user that uses your application on the device must have a unique, Bing generated client ID.<br /><br/>If you do not include this header in the request, Bing generates an ID and returns it in the X-MSEdge-ClientID response header. The only time that you should NOT include this header in a request is the first time the user uses your app on that device.<br /><br/></li><li>Use the client ID for each Bing API request that your app makes for this user on the device.<br /><br/></li><li>Persist the client ID. To persist the ID in a browser app, use a persistent HTTP cookie to ensure the ID is used across all sessions. Do not use a session cookie. For other apps such as mobile apps, use the device's persistent storage to persist the ID.<br /><br/>The next time the user uses your app on that device, get the client ID that you persisted.</li></ul><br /> **NOTE:** Bing responses may or may not include this header. If the response includes this header, capture the client ID and use it for all subsequent Bing requests for the user on that device.<br /><br /> **NOTE** If you include the X-MSEdge-ClientID, you must not include cookies in the request.|  
|<a name="clientip" />X-Search-ClientIP|Optional request header.<br /><br /> The IPv4 or IPv6 address of the client device. The IP address is used to discover the user's location. Bing uses the location information to determine safe search behavior.<br /><br /> **NOTE:** Although optional, you are encouraged to always specify this header and the X-Search-Location header.<br /><br /> Do not obfuscate the address (for example, by changing the last octet to 0). Obfuscating the address results in the location not being anywhere near the device's actual location, which may result in Bing serving erroneous results.|  
|<a name="location" />X-Search-Location|Optional request header.<br /><br /> A semicolon-delimited list of key/value pairs that describe the client's geographical location. Bing uses the location information to determine safe search behavior and to return relevant local content. Specify the key/value pair as \<key\>:\<value\>. The following are the keys that you use to specify the user's location.<br /><br /><ul><li>lat&mdash;Required. The latitude of the client's location, in degrees. The latitude must be greater than or equal to -90.0 and less than or equal to +90.0. Negative values indicate southern latitudes and positive values indicate northern latitudes.<br /><br /></li><li>long&mdash;Required. The longitude of the client's location, in degrees. The longitude must be greater than or equal to -180.0 and less than or equal to +180.0. Negative values indicate western longitudes and positive values indicate eastern longitudes.<br /><br /></li><li>re&mdash;Required. The radius, in meters, which specifies the horizontal accuracy of the coordinates. Pass the value returned by the device's location service. Typical values might be 22m for GPS/Wi-Fi, 380m for cell tower triangulation, and 18,000m for reverse IP lookup.<br /><br /></li><li>ts&mdash;Optional. The UTC UNIX timestamp of when the client was at the location. (The UNIX timestamp is the number of seconds since January 1, 1970.)<br /><br /></li><li>head&mdash;Optional. The client's relative heading or direction of travel. Specify the direction of travel as degrees from 0 through 360, counting clockwise relative to true north. Specify this key only if the `sp` key is nonzero.<br /><br /></li><li>sp&mdash;Optional. The horizontal velocity (speed), in meters per second, that the client device is traveling.<br /><br /></li><li>alt&mdash;Optional. The altitude of the client device, in meters.<br /><br /></li><li>are&mdash;Optional. The radius, in meters, that specifies the vertical accuracy of the coordinates. Specify this key only if you specify the `alt` key.<br /><br /></li></ul> **NOTE:** Although many of the keys are optional, the more information that you provide, the more accurate the location results are.<br /><br /> **NOTE:** Although optional, you are encouraged to always specify the user's geographical location. Providing the location is especially important if the client's IP address does not accurately reflect the user's physical location (for example, if the client uses VPN). For optimal results, you should include this header and the X-Search-ClientIP header, but at a minimum, you should include this header.|

> [!NOTE] 
> Remember that the Terms of Use require compliance with all applicable laws, including regarding use of these headers. For example, in certain jurisdictions, such as Europe, there are requirements to obtain user consent before placing certain tracking devices on user devices.
  
## Query Parameters  
The following are the query parameters that the request may include. The Required column indicates whether you must specify the parameter. You must URL encode the query parameter values.  
  
|Name|Value|Type|Required|  
|----------|-----------|----------|--------------|
|<a name="answercount" />answerCount|The number of answers that you want the response to include. The answers that Bing returns are based on ranking. For example, if Bing returns webpages, images, videos, and relatedSearches for a request and you set this parameter to two (2), the response includes webpages and images.<br /><br />If you included the `responseFilter` query parameter in the same request and set it to webpages and news, the response would include only webpages.<br /><br />For information about promoting a ranked answer into the response, see [promote](#promote).|Unsigned Integer|No
|<a name="cc" />cc|A 2-character country code of the country where the results come from. For a list of possible values, see [Market Codes](#market-codes).<br /><br /> If you set this parameter, you must also specify the [Accept-Language](#acceptlanguage) header. Bing uses the first supported language it finds in the specified languages and combines it with the country code to determine the market to return results for. If the languages list does not include a supported language, Bing finds the closest language and market that supports the request. Or, Bing may use an aggregated or default market for the results.<br /><br /> Use this query parameter and the `Accept-Language` header only if you specify multiple languages. Otherwise, you should use the `mkt` and `setLang` query parameters.<br /><br /> This parameter and the [mkt](#mkt) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="count" />count|The number of search results to return in the response. The default is 10 and the maximum value is 50. The actual number delivered may be less than requested.<br /><br /> Use this parameter along with the `offset` parameter to page results. For more information, see [Paging Webpages](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/paging-webpages).<br /><br /> For example, if your user interface displays 10 search results per page, set `count` to 10 and `offset` to 0 to get the first page of results. For each subsequent page, increment `offset` by 10 (for example, 0, 10, 20). It is possible for multiple pages to include some overlap in results.|UnsignedShort|No|  
|<a name="freshness" />freshness|Filter search results by the following age values: <br /><ul><li>Day&mdash;Return webpages that Bing discovered within the last 24 hours<br /><br /></li><li>Week&mdash;Return webpages that Bing discovered within the last 7 days<br /><br /></li><li>Month&mdash;Return webpages that discovered within the last 30 days</li></ul><br /> This filter applies only to webpage results and not to the other results such as news and images.|String|No|  
|<a name="mkt" />mkt|The market where the results come from. Typically, `mkt` is the country where the user is making the request from. However, it could be a different country if the user is not located in a country where Bing delivers results. The market must be in the form \<language code\>-\<country code\>. For example, en-US. The string is case insensitive. For a list of possible market values, see [Market Codes](#market-codes).<br /><br /> **NOTE:** If known, you are encouraged to always specify the market. Specifying the market helps Bing route the request and return an appropriate and optimal response. If you specify a market that is not listed in [Market Codes](#market-codes), Bing uses a best fit market code based on an internal mapping that is subject to change.<br /><br /> This parameter and the [cc](#cc) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="offset" />offset|The zero-based offset that indicates the number of search results to skip before returning results. The default is 0. The offset should be less than ([totalEstimatedMatches](#totalmatches) - `count`).<br /><br /> Use this parameter along with the `count` parameter to page results. For example, if your user interface displays 10 search results per page, set `count` to 10 and `offset` to 0 to get the first page of results. For each subsequent page, increment `offset` by 10 (for example, 0, 10, 20). it is possible for multiple pages to include some overlap in results.|Unsigned Short|No|  
|<a name="promote" />promote|A comma-delimited list of answers that you want the response to include regardless of their ranking. For example, if you set [answerCount](#answercount)) to two (2) so Bing returns the top two ranked answers, but you also want the response to include news, you'd set `promote` to news. If the top ranked answers are webpages, images, videos, and relatedSearches, the response includes webpages and images because news is not a ranked answer. But if you set `promote` to video, Bing would promote the video answer into the response and return webpages, images, and videos.<br /><br /> The answers that you want to promote do not count against the `answerCount` limit. For example, if the ranked answers are news, images, and videos, and you set `answerCount` to 1 and `promote` to news, the response contains news and images. Or, if the ranked answers are videos, images, and news, the response contains videos and news.<br /><br /> The following are the possible values.<br /><ul><li>Computation</li><li>Images</li><li>News</li><li>RelatedSearches</li><li>SpellSuggestions</li><li>TimeZone</li><li>Videos</li><li>Webpages</li></ul><br />**NOTE:** Use only if you specify [answerCount](#answercount).|String|No 
|<a name="query" />q|The user's search query term. The term may not be empty.<br /><br /> The term may contain [Bing Advanced Operators](http://msdn.microsoft.com/library/ff795620.aspx). For example, to limit results to a specific domain, use the [site:](http://msdn.microsoft.com/library/ff795613.aspx) operator.|String|Yes|  
|<a name="responsefilter" />responseFilter|A comma-delimited list of answers to include in the response. If you do not specify this parameter, the response includes all search answers for which there's relevant data.<br /><br /> The following are the possible filter values.<br /><ul><li>Computation</li><li>Images</li><li>News</li><li>RelatedSearches</li><li>SpellSuggestions</li><li>TimeZone</li><li>Videos</li><li>Webpages</li></ul><br /> Although you may use this filter to get a single answer, you should instead use the answer-specific endpoint in order to get richer results. For example, to receive only images, send the request to one of the [Image Search API](./bing-images-api-v7-reference.md) endpoints.<br /><br /> The RelatedSearches and SpellSuggestions answers do not support a separate endpoint like the Image Search API does (only the Web Search API returns them).<br /><br /> To include answers that would otherwise be excluded because of ranking, see the [promote](#promote) query parameter.|String|No|  
|<a name="safesearch" />safeSearch|A filter used to filter webpages for adult content. The following are the possible filter values.<br /><ul><li>Off&mdash;Return webpages with adult text, images, or videos.<br /><br/></li><li>Moderate&mdash;Return webpages with adult text, but not adult images or videos.<br /><br/></li><li>Strict&mdash;Do not return webpages with adult text, images, or videos.</li></ul><br /> The default is Moderate.<br /><br /> **NOTE:** If the request comes from a market that Bing's adult policy requires that `safeSearch` is set to Strict, Bing ignores the `safeSearch` value and uses Strict.<br/><br/>**NOTE:** If you use the `site:` query operator, there is the chance that the response may contain adult content regardless of what the `safeSearch` query parameter is set to. Use `site:` only if you are aware of the content on the site and your scenario supports the possibility of adult content. |String|No|  
|<a name="setlang" />setLang|The language to use for user interface strings. Specify the language using the ISO 639-1 2-letter language code. For example, the language code for English is EN. The default is EN (English).<br /><br /> Although optional, you should always specify the language. Typically, you set `setLang` to the same language specified by `mkt` unless the user wants the user interface strings displayed in a different language.<br /><br /> This parameter and the [Accept-Language](#acceptlanguage) header are mutually exclusive&mdash;do not specify both.<br /><br /> A user interface string is a string that's used as a label in a user interface. There are few user interface strings in the JSON response objects. Also, any links to Bing.com properties in the response objects apply the specified language.|String|No|  
|<a name="textdecorations" />textDecorations|A Boolean value that determines whether display strings should contain decoration markers such as hit highlighting characters. If **true**, the strings may include markers. The default is **false**.<br /><br /> To specify whether to use Unicode characters or HTML tags as the markers, see the [textFormat](#textformat) query parameter.<br /><br /> For information about hit highlighting, see [Hit Highlighting](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/hit-highlighting).|Boolean|No|  
|<a name="textformat" />textFormat|The type of markers to use for text decorations (see the `textDecorations` query parameter).<br /><br /> The following are the possible values.<br /><ul><li>Raw&mdash;Use Unicode characters to mark content that needs special formatting. The Unicode characters are in the range E000 through E019. For example, Bing uses E000 and E001 to mark the beginning and end of query terms for hit highlighting.<br /><br/></li><li>HTML&mdash;Use HTML tags to mark content that needs special formatting. For example, use \<b> tags to highlight query terms in display strings.</li></ul><br /> The default is Raw.<br /><br />For a list of markers, see [Hit Highlighting](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/hit-highlighting).<br /><br /> For display strings that contain escapable HTML characters such as <, >, and &, if `textFormat` is set to HTML, Bing escapes the characters as appropriate (for example, < is escaped to \&lt;).<br /><br />For information about processing strings with the embedded Unicode characters, see [Hit Highlighting](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/hit-highlighting).|String|No| 
  
  
## Response Objects  
The following are the JSON response objects that the response may include. If the request succeeds, the top-level object in the response is the [SearchResponse](#searchresponse) object. If the request fails, the top-level object is the [ErrorResponse](#errorresponse) object.

This list contains JSON objects that are specific to web answers. For details about the JSON objects for other answer types that the search results may include, see the API-specific reference documentation. For example, if the search result contains the images and news answers, see the [Image API](./bing-images-api-v7-reference.md) and [News API](./bing-news-api-v7-reference.md).
  
|Object|Description|  
|------------|-----------------|  
|[Computation](#computation)|Defines an expression and its answer.|  
|[Error](#error)|Defines an error that occurred.|  
|[ErrorResponse](#errorresponse)|The top-level object that the response includes when the request fails.|  
|[Identifiable](#identifiable)|Defines a resource ID.|  
|[Query](#query_obj)|Defines a query string.|  
|[QueryContext](#querycontext)|Defines the query context that Bing used for the request, if the specified query string contains a spelling error.|  
|[RankingGroup](#rankinggroup)|Defines a search results group, such as mainline.|  
|[RankingItem](#rankingitem)|Defines a ranking group item to display.|  
|[RankingResponse](#rankingresponse)|Defines where on the search results page content should be placed and in what order.|  
|[RelatedSearchAnswer](#relatedsearchanswer)|Defines a list of related queries made by others.|  
|[SearchResponse](#searchresponse)|The top-level object that the response includes when the request succeeds.|  
|[SpellSuggestions](#spellsuggestions)|Defines a suggested query string that likely represents the user's intent.|  
|[TimeZone](#timezone)|Defines the date and time of one or more geographic locations.|  
|[TimeZoneInformation](#timezoneinfo)|Defines the time zone information about a geographical location.|  
|[WebAnswer](#webanswer)|Defines a list of relevant webpage links.|  
|[Webpage](#webpage)|Defines a webpage that is relevant to the query.|  
  
<a name="computation"></a>   
### Computation  
Defines an expression and its answer.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|<a name="computation-expression" />expression|The math or conversion expression.<br /><br /> If the query contains a request to convert units of measure (for example, meters to feet), this field contains the *from* units and `value` contains the *to* units.<br /><br /> If the query contains a mathematical expression such as 2+2, this field contains the expression and `value` contains the answer.<br /><br /> Note that mathematical expressions may be normalized. For example, if the query was sqrt(4^2+8^2), the normalized expression may be sqrt((4^2)+(8^2)).<br /><br /> If the user's query is a math question and the [textDecorations](#textdecorations) query parameter is set to **true**, the expression string may include formatting markers. For example, if the user's query is *log(2)*, the normalized expression includes the subscript markers. For more information, see [Hit Highlighting](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/hit-highlighting).|String|  
|<a name="computation-value" />value|The expression's answer.|String|  
  
<a name="error"></a>   
### Error  
Defines the error that occurred.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|<a name="error-code" />code|The error code that identifies the cateory of error. For a list of possible codes, see [Error Codes](#errorcodes).|String|  
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
  
<a name="identifiable"></a>   
### Identifiable  
Defines the identify of a resource.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|id|An identifier.|String|  
  
<a name="metatag"></a>   
### MetaTag  
Defines a webpage's metadata.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|content|The metadata.|String|  
|name|The name of the metadata.|String|  
  
<a name="query_obj"></a>   
### Query  
Defines a search query.  
  
The [SpellSuggestions](#spellsuggestions) object uses this object to suggest a query string that likely represents the user's intent. It's also used by [RelatedSearchAnswer](#relatedsearchanswer) to return a related query that other users have made.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="query-displaytext" />displayText|The display version of the query term. This version of the query term may contain special characters that highlight the search term found in the query string. The string contains the highlighting characters only if the query enabled hit highlighting (see the [textDecorations](#textdecorations) query parameter). For details about hit highlighting, see [Hit Highlighting](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/hit-highlighting).|String|  
|<a name="query-text" />text|The query string. Use this string as the query term in a new search request.|String|  
|<a name="query-websearchurl" />webSearchUrl|The URL that takes the user to the Bing search results page for the query.<br /><br /> Only related search results include this field.|String|  
  
<a name="querycontext"></a>   
### QueryContext  
Defines the query string that Bing used for the request. The response includes the context only if the specified query string contains a spelling mistake.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|<a name="querycontext-adultintent" />adultIntent|A Boolean value that indicates whether the specified query has adult intent. The value is **true** if the query has adult intent.<br /><br /> If **true**, and the request's [safeSearch](#safesearch) query parameter is set to Strict, then the response will not contain results except for news results, if applicable.|Boolean|  
|<a name="querycontext-alterationoverridequery" />alterationOverrideQuery|The query string to use to force Bing to use the original string. For example, if the query string is *saling downwind*, the override query string is *+saling downwind*. Remember to encode the query string which results in *%2Bsaling+downwind*.<br /><br /> the object includes this field only if the original query string contains a spelling mistake.|String|  
|<a name="querycontext-alteredquery" />alteredQuery|The query string that Bing used to perform the query. Bing uses the altered query string if the original query string contained spelling mistakes. For example, if the query string is `saling downwind`, the altered query string is `sailing downwind`.<br /><br /> The object includes this field only if the original query string contains a spelling mistake.|String|  
|<a name="querycontext-originalquery" />originalQuery|The query string as specified in the request.|String|  
  
<a name="rankinggroup"></a>   
### RankingGroup  
Defines a search results group, such as mainline.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="rankinggroup-items" />items|A list of search result items to display in the group.|[RankingItem](#rankingitem)[]|  
  
<a name="rankingitem"></a>   
### RankingItem  
Defines a search result item to display. For more information about how to use the IDs, see [Using Ranking to Display Results](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/ranking-results).  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="rankingitem-answertype" />answerType|The answer that contains the item to display. For example, News.<br /><br /> Use the type to find the answer in the [SearchResponse](#searchresponse) object. The type is the name of a `SearchResponse` field.|String|  
|<a name="rankingitem-resultindex" />resultIndex|A zero-based index of the item in the answer.<br /><br /> If the item does not include this field, display all items in the answer. For example, display all news articles in the News answer.|Integer|  
|<a name="rankingitem-value" />value|The ID that identifies either an answer to display or an item of an answer to display. If the ID identifies an answer, display all items of the answer.|[Identifiable](#identifiable)|  
  
<a name="rankingresponse"></a>   
### RankingResponse  
Defines where on the search results page content should be placed and in what order.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="ranking-mainline" />mainline|The search results to display in the mainline.|[RankingGroup](#rankinggroup)|  
|<a name="ranking-pole" />pole|The search results that should be afforded the most visible treatment (for example, displayed above the mainline and sidebar).|[RankingGroup](#rankinggroup)|  
|<a name="ranking-sidebar" />sidebar|The search results to display in the sidebar.|[RankingGroup](#rankinggroup)|  
  
<a name="relatedsearchanswer"></a>   
### RelatedSearchAnswer  
Defines a list of related queries made by others.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|id|An ID that uniquely identifies the related search answer.<br /><br /> The object includes this field only if the Ranking answer specifies that you display all related searches in a group. For more information about how to use the ID, see [Using Ranking to Display Results](assetId:///8460d9f3-f98f-4e08-8847-9e05c4ac4a3d#ranking).|String|  
|<a name="relatedsearch-value" />value|A list of related queries that were made by others.|[Query](#query_obj)[]|  
  
<a name="searchresponse"></a>   
### SearchResponse  
The response's top-level object for search requests.  
  
By default, the Search API includes all answers unless:  
  
-   The query specifies the [responseFilter](#responsefilter) query parameter to limit the answers  
  
-   One or more of the search components does not return results (for example, no news results are relevant to the query)  
  
-   The subscription key does not have access to the search component.  
  
If the service suspects a denial of service attack, the request succeeds (HTTP status code is 200 OK), but the body of the response is empty.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|Type hint.|String|  
|<a name="searchresponse-computation" />computation|The answer to a math expression or units conversion expression.|[Computation](#computation)|  
|<a name="searchresponse-images" />images|A list of images that are relevant to the search query.|[Images](assetId:///d46fcc3e-dc6f-4131-8a63-d74b0911bddf#images)|  
|<a name="searchresponse-news" />news|A list of news articles that are relevant to the search query.|[News](assetId:///3f21b448-e4d5-4bc6-b407-6e645c2e05b8#news)|  
|<a name="searchresponse-querycontext" />queryContext|The query string that Bing used for the request.<br /><br /> The response includes the context only if the query string contains a spelling mistake or has adult intent.|[QueryContext](#querycontext)|  
|<a name="searchresponse-ranking" />rankingResponse|The order that Bing suggests that you display the search results in.|[RankingResponse](#rankingresponse)|  
|<a name="searchresponse-relatedsearches" />relatedSearches|A list of related queries made by others.|[RelatedSearchAnswer](#relatedsearchanswer)|  
|<a name="searchresponse-spellsuggestions" />spellSuggestions|The query string that likely represents the user's intent.|[SpellSuggestions](#spellsuggestions)|  
|<a name="searchresponse-timezone" />timeZone|The date and time of one or more geographic locations.|[TimeZone](#timezone)|  
|<a name="searchresponse-videos" />videos|A list of videos that are relevant to the search query.|[Videos](assetId:///1fdb10b1-50c2-4c40-9b78-efebfa0f4b0e#videos)|  
|<a name="search-response-webpages" />webPages|A list of webpages that are relevant to the search query.|[WebAnswer](#webanswer)|  
  
<a name="spellsuggestions"></a>   
### SpellSuggestions  
Defines a suggested query string that likely represents the user's intent.  
  
The search results include this response if Bing determines that the user may have intended to search for something different. For example, if the user searches for *alon brown*, Bing may determine that the user likely intended to search for Alton Brown instead (based on past searches by others of Alon Brown).  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|id|An ID that uniquely identifies the spelling suggestion answer.<br /><br /> You use this field when you use the [ranking response](#rankingresponse) to display the spelling suggestions. For more information about how to use the ID, see [Using Ranking to Display Results](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/ranking-results).|String|  
|<a name="spell-value" />value|A list of suggested query strings that may represent the user's intention.<br /><br /> The list contains only one `Query` object.|[Query](#query_obj)[]|  
  
<a name="timezone"></a>   
### TimeZone  
Defines the data and time of one or more geographic locations.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="othercitytimes" />otherCityTimes|A list of dates and times of nearby time zones.|[TimeZoneInformation](#timezoneinfo)[]|  
|<a name="primarycitytime" />primaryCityTime|The data and time, in UTC, of the geographic location specified in the query.<br /><br /> If the query specified a specific geographic location (for example, a city), this object contains the name of the geographic location and the current date and time of the location, in UTC.<br /><br /> If the query specified a general geographic location, such as a state or country, this object contains the date and time of the primary city or state found in the specified state or country. If the location contains additional time zones, the `otherCityTimes` field contains the data and time of cities or states located in the other time zones.|[TimeZoneInformation](#timezoneinfo)|  
  
<a name="timezoneinfo"></a>   
### TimeZoneInformation  
Defines a date and time for a geographical location.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="tzinfo-location" />location|The name of the geographical location.<br /><br /> For example, County; City; City, State; City, State, Country; or Time Zone.|String|  
|<a name="tzinfo-time" />time|The data and time specified in the form, YYYY-MM-DDThh;mm:ss.ssssssZ.|String|  
|<a name="tzinfo-utcoffset" />utcOffset|The offset from UTC. For example, UTC-7.|String|  
  
<a name="webanswer"></a>   
### WebAnswer  
Defines a lsit of relevant webpage links.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|id|An ID that uniquely identifies the web answer.<br /><br /> The object includes this field only if the Ranking answer suggests that you display all web results in a group. For more information about how to use the ID, see [Using Ranking to Display Results](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/ranking-results).|String|  
|<a name="someresultsremoved" />someResultsRemoved|A Boolean value that indicates whether the response excluded some results from the answer. If Bing excluded some results, the value is **true**.|Boolean|  
|<a name="totalmatches" />totalEstimatedMatches|The estimated number of webpages that are relevant to the query. Use this number along with the [count](#count) and [offset](#offset) query parameters to page the results.|Long|  
|<a name="webanswer-value" />value|A list of webpages that are relevant to the query.|[WebPage](#webpage)[]|  
|<a name="webanswer-websearchurl" />webSearchUrl|The URL to the Bing search results for the requested webpages.|String|  
  
<a name="webpage"></a>   
### Webpage  
Defines a webpage that is relevant to the query.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|about|For internal use only.|Object|  
|<a name="datelastcrawled" />dateLastCrawled|The last time that Bing crawled the webpage. The date is in the form, YYYY-MM-DDTHH:MM:SS. For example, 2015-04-13T05:23:39.|String|  
|<a name="deeplinks" />deepLinks|A list of links to related content that Bing found in the website that contains this webpage.<br /><br /> The `Webpage` object in this context includes only the `name`, `url`, `urlPingSuffix`, and `snippet` fields.|[Webpage](#webpage)[]|  
|<a name="displayurl" />displayUrl|The display URL of the webpage. The URL is meant for display purposes only and is not well formed.|String|  
|id|An ID that uniquely identifies this webpage in the list of web results.<br /><br /> The object includes this field only if the Ranking answer specifies that you mix the webpages with the other search results. Each webpage contains an ID that matches an ID in the Ranking answer. For more information, see [Using Ranking to Display Results](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/ranking-results).|String|  
|<a name="name" />name|The name of the webpage.<br /><br /> Use this name along with `url` to create a hyperlink that when clicked takes the user to the webpage.|String|  
|mentions|For internal use only.|Object|  
|<a name="searchtags" />searchTags|A list of search tags that the webpage owner specified on the webpage. The API returns only indexed search tags.<br /><br /> The `name` field of the `MetaTag` object contains the indexed search tag. Search tags begin with search.* (for example, search.assetId). The `content` field contains the tag's value.|[MetaTag](#metatag)[]|  
|snippet|A snippet of text from the webpage that describe its contents.|String|  
|<a name="url" />url|The URL to the webpage.<br /><br /> Use this URL along with `name` to create a hyperlink that when clicked takes the user to the webpage.|String|  
  

## Error Codes 

[!INCLUDE [bing-error-codes](../includes/bing-error-codes-v7.md)]

## Market Codes 

[!INCLUDE [bing-market-codes](../includes/bing-market-codes.md)]
