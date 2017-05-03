---
title: Bing News Search API v5 Reference | Microsoft Docs
description: Describes the programming elements of the Bing News Search API.
services: cognitive-services
author: swhite-msft
manager: ehansen

ms.assetid: CD3BE837-2928-4278-AC5B-F6E5D9943880
ms.service: cognitive-services
ms.technology: bing-news-search
ms.topic: article
ms.date: 04/15/2017
ms.author: scottwhi
---

# News Search API v5 Reference

The News Search API lets you send a search query to Bing and get back a list of relevant news articles. This section provides technical details about the query parameters and headers that you use to request news articles and the JSON response objects that contain them. For examples that show how to make requests, see [Searching the Web for News](https://docs.microsoft.com/azure/cognitive-services/bing-news-search/searching-the-web).  

For details about the headers that requests should include, see [Request Headers](#headers).  
  
For details about the query parameters that requests should include, see [Query Parameters](#query-parameters).  
  
For details about the JSON objects that the response may include, see [Response Objects](#response-objects).  
  
## Endpoints
  
To request news articles, send a GET request to one of the following URLs:
  
|URL|Description|  
|---------|-----------------|  
|`https://api.cognitive.microsoft.com/bing/v5.0/news`|Returns the top news articles by category. For example, you can request the top sports or entertainment articles. For information about specifying categories, see the [category](#category) query parameter.|  
|`https://api.cognitive.microsoft.com/bing/v5.0/news/search`|Returns news articles based on the user's search query. If the search query is empty, the call returns the top news articles.|  
|`https://api.cognitive.microsoft.com/bing/v5.0/news/trendingtopics`|Returns trending news topics that are currently trending on social networks.<br /><br /> **NOTE:** Available only in the en-US and zh-CN markets.|  

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
|<a name="retryafter" />Retry-After|Response header.<br /><br /> The response includes this header if you exceed the number of queries allowed per second (QPS) or per month (QPM). The header contains the number of seconds that you must wait before sending another request.|  
|<a name="useragent" />User-Agent|Optional request header.<br /><br /> The user agent originating the request. Bing uses the user agent to provide mobile users with an optimized experience. Although optional, you are encouraged to always specify this header.<br /><br /> The user-agent should be the same string that any commonly used browser sends. For information about user agents, see [RFC 2616](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html).<br /><br /> The following are examples of user-agent strings.<br /><ul><li>Windows Phone&mdash;Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 822)<br /><br /></li><li>Android&mdash;Mozilla/5.0 (Linux; U; Android 2.3.5; en-us; SCH-I500 Build/GINGERBREAD) AppleWebKit/533.1 (KHTML; like Gecko) Version/4.0 Mobile Safari/533.1<br /><br /></li><li>iPhone&mdash;Mozilla/5.0 (iPhone; CPU iPhone OS 6_1 like Mac OS X) AppleWebKit/536.26 (KHTML; like Gecko) Mobile/10B142 iPhone4;1 BingWeb/3.03.1428.20120423<br /><br /></li><li>PC&mdash;Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko<br /><br /></li><li>iPad&mdash;Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53</li></ul>|
|<a name="clientid" />X-MSEdge-ClientID|Optional request and response header.<br /><br /> Bing uses this header to provide users with consistent behavior across Bing API calls. Bing often flights new features and improvements, and it uses the client ID as a key for assigning traffic on different flights. If you do not use the same client ID for a user across multiple requests, then Bing may assign the user to multiple conflicting flights. Being assigned to multiple conflicting flights can lead to an inconsistent user experience. For example, if the second request has a different flight assignment than the first, the experience may be unexpected. Also, Bing can use the client ID to tailor web results to that client ID’s search history, providing a richer experience for the user.<br /><br /> Bing also uses this header to help improve result rankings by analyzing the activity generated by a client ID. The relevance improvements help with better quality of results delivered by Bing APIs and in turn enables higher click-through rates for the API consumer.<br /><br /> **IMPORTANT:** Although optional, you should consider this header required. Persisting the client ID across multiple requests for the same end user and device combination enables 1) the API consumer to receive a consistent user experience, and 2) higher click-through rates via better quality of results from the Bing APIs.<br /><br /> The following are the basic usage rules that apply to this header.<br /><ul><li>Each user that uses your application on the device must have a unique, Bing generated client ID.<br /><br/>If you do not include this header in the request, Bing generates an ID and returns it in the X-MSEdge-ClientID response header. The only time that you should NOT include this header in a request is the first time the user uses your app on that device.<br /><br/></li><li>Use the client ID for each Bing API request that your app makes for this user on the device.<br /><br/></li><li>Persist the client ID. To persist the ID in a browser app, use a persistent HTTP cookie to ensure the ID is used across all sessions. Do not use a session cookie. For other apps such as mobile apps, use the device's persistent storage to persist the ID.<br /><br/>The next time the user uses your app on that device, get the client ID that you persisted.</li></ul><br /> **NOTE:** Bing responses may or may not include this header. If the response includes this header, capture the client ID and use it for all subsequent Bing requests for the user on that device.<br /><br /> **NOTE** If you include the X-MSEdge-ClientID, you must not include cookies in the request.|  
|<a name="clientip" />X-Search-ClientIP|Optional request header.<br /><br /> The IPv4 or IPv6 address of the client device. The IP address is used to discover the user's location. Bing uses the location information to determine safe search behavior.<br /><br /> **NOTE:** Although optional, you are encouraged to always specify this header and the X-Search-Location header.<br /><br /> Do not obfuscate the address (for example, by changing the last octet to 0). Obfuscating the address results in the location not being anywhere near the device's actual location, which may result in Bing serving erroneous results.|  
|<a name="location" />X-Search-Location|Optional request header.<br /><br /> A semicolon-delimited list of key/value pairs that describe the client's geographical location. Bing uses the location information to determine safe search behavior and to return relevant local content. Specify the key/value pair as \<key\>:\<value\>. The following are the keys that you use to specify the user's location.<br /><br /><ul><li>lat&mdash;Required. The latitude of the client's location, in degrees. The latitude must be greater than or equal to -90.0 and less than or equal to +90.0. Negative values indicate southern latitudes and positive values indicate northern latitudes.<br /><br /></li><li>long&mdash;Required. The longitude of the client's location, in degrees. The longitude must be greater than or equal to -180.0 and less than or equal to +180.0. Negative values indicate western longitudes and positive values indicate eastern longitudes.<br /><br /></li><li>re&mdash;Required. The radius, in meters, which specifies the horizontal accuracy of the coordinates. Pass the value returned by the device's location service. Typical values might be 22m for GPS/Wi-Fi, 380m for cell tower triangulation, and 18,000m for reverse IP lookup.<br /><br /></li><li>ts&mdash;Optional. The UTC UNIX timestamp of when the client was at the location. (The UNIX timestamp is the number of seconds since January 1, 1970.)<br /><br /></li><li>head&mdash;Optional. The client's relative heading or direction of travel. Specify the direction of travel as degrees from 0 through 360, counting clockwise relative to true north. Specify this key only if the `sp` key is nonzero.<br /><br /></li><li>sp&mdash;Optional. The horizontal velocity (speed), in meters per second, that the client device is traveling.<br /><br /></li><li>alt&mdash;Optional. The altitude of the client device, in meters.<br /><br /></li><li>are&mdash;Optional. The radius, in meters, that specifies the vertical accuracy of the coordinates. Specify this key only if you specify the `alt` key.<br /><br /></li></ul> **NOTE:** Although many of the keys are optional, the more information that you provide, the more accurate the location results are.<br /><br /> **NOTE:** Although optional, you are encouraged to always specify the user's geographical location. Providing the location is especially important if the client's IP address does not accurately reflect the user's physical location (for example, if the client uses VPN). For optimal results, you should include this header and the X-Search-ClientIP header, but at a minimum, you should include this header.|

> [!NOTE] 
> Remember that the Terms of Use require compliance with all applicable laws, including regarding use of these headers. For example, in certain jurisdictions, such as Europe, there are requirements to obtain user consent before placing certain tracking devices on user devices.
  
## Query Parameters  
The following are the query parameters that the request may include. See the Required column for required parameters. The query parameter values must be URL encoded.  
  
|Name|Value|Type|Required|  
|----------|-----------|----------|--------------|  
|<a name="cc" />cc|A 2-character country code of the country where the results come from. For a list of possible values, see [Market Codes](#market-codes).<br /><br /> If you set this parameter, you must also specify the [Accept-Language](#acceptlanguage) header. Bing uses the first supported language it finds in the specified languages and combines it with the country code to determine the market to return results for. If the languages list does not include a supported language, Bing finds the closest language and market that supports the request. Or, Bing may use an aggregated or default market for the results.<br /><br /> Use this query parameter and the `Accept-Language` header only if you specify multiple languages. Otherwise, you should use the `mkt` and `setLang` query parameters.<br /><br /> This parameter and the [mkt](#mkt) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="category" />category|The category of articles to return. For example, Sports articles or Entertainment articles. For a list of possible categories, see [News Categories by Market](#categoriesbymarket).<br /><br /> **NOTE:** This parameter applies only to news category requests.<br /><br /> If you do not specify this parameter, the response includes both:<br /><ul><li>Headline articles typically published in the last 24 hours from any category; however, some articles may be older. <br/><br/>If the article is a headline, the article's [headline](#newsarticle-headline) field is set to **true**. By default, the response includes up to 12 headline articles and clusters. To specify the number of headline articles to return, set the `headlineCount` query parameter.<br /><br/></li><li>Articles from each parent category (up to four articles and clusters from each category).</li></ul><br />If you do not specify `headlineCount`, and the market supports eight categories, the response includes up to 44 articles and clusters (12 headline articles and clusters plus 32 category-specific articles and clusters). Because a cluster contains more than one article, the number of articles in this example, 44, could be more. For example, the response may include 11 headline articles and one cluster, which contains four related headline articles for a total of 15 headline articles.|String|No|  
|<a name="count" />count|The number of news articles to return in the response. The actual number delivered may be less than requested. The default is 10 and the maximum value that you may specify is 100.<br /><br /> For trending topics, the default is all trending news topics (approximately 55 articles).<br /><br /> You may use this parameter along with the `offset` parameter to page results. For example, if your user interface presents 20 articles per page, you would set `count` to 20 and `offset` to 0 to get the first page of results. For each subsequent page, you would increment `offset` by 20 (for example, 0, 20, 40). It is possible for multiple pages to include some overlap in results.<br /><br /> **NOTE:** Clusters are counted as a single item. For example, if you set the count to 10, the response may include 9 articles and 1 cluster but the cluster may contain 5 articles.<br /><br /> **NOTE:** If requesting news categories, specify this parameter only if you specify the category parameter. If you do not specify the category parameter, this parameter is ignored.|UnsignedShort|No|  
|<a name="freshness" />freshness|Filter news articles by age. Age refers to the date and time that Bing discovered the article. The following are the possible filter values.<br /><ul><li>Day&mdash;Return news articles discovered within the last 24 hours<br /><br /></li><li>Week&mdash;Return news articles discovered within the last 7 days<br /><br /></li><li>Month&mdash;Return news articles discovered within the last 30 days</li></ul><br /> **NOTE:** Trending News ignores this parameter.|String|No|  
|<a name="headlinecount" />headlineCount|The number of headline articles and clusters to return. The default is 12.<br /><br /> Specify this parameter only if you do not specify the category parameter. If you specify the category parameter, this parameter is ignored.<br /><br /> **NOTE:** This parameter applies only to news category requests.|UnsignedShort|No|  
|<a name="mkt" />mkt|The market where the results come from. Typically, `mkt` is the country where the user is making the request from. However, it could be a different country if the user is not located in a country where Bing delivers results. The market must be in the form \<language code\>-\<country code\>. For example, en-US. The string is case insensitive. For a list of possible market values, see [Market Codes](#market-codes).<br /><br /> **NOTE:** If known, you are encouraged to always specify the market. Specifying the market helps Bing route the request and return an appropriate and optimal response. If you specify a market that is not listed in [Market Codes](#market-codes), Bing uses a best fit market code based on an internal mapping that is subject to change.<br /><br /> This parameter and the [cc](#cc) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="offset" />offset|The zero-based offset that indicates the number of news articles to skip before returning articles. The default is 0. The offset should be less than ([totalEstimatedMatches](#news-totalmatches) - `count`).<br /><br /> Use this parameter along with the `count` parameter to page results. For example, if your user interface presents 20 articles per page, you would set `count` to 20 and `offset` to 0 to get the first page of results. For each subsequent page, you would increment `offset` by 20 (for example, 0, 20, 40). It is possible for multiple pages to include some overlap in results.<br /><br /> **NOTE:** Clusters are counted as a single item. For example, if you set the count to 10, the response may include 9 articles and 1 cluster but the cluster may contain 5 articles.<br /><br /> **NOTE:** If requesting news categories, specify this parameter only if you specify the category parameter. If you do not specify the category parameter, this parameter is ignored.|Unsigned Short|No|  
|<a name="originalimg" />originalImg|A Boolean value that determines whether the image's `contentUrl` contains a URL that points to a thumbnail of the original article's image or the image itself.<br /><br /> If the article includes an image, and this parameter is set to **true**, use the URL in the image's `contentUrl` field to download the original image from the publisher's website. Otherwise, if this parameter is **false**, the image's `contentUrl` and `thumbnailUrl` URLs both point to the same thumbnail image.<br /><br /> The default is false.<br /><br /> Only the News Search API supports this parameter. Do not specify this parameter when calling the Web Search API.<br /><br /> **NOTE:** Trending News ignores this parameter.|Boolean|No|  
|<a name="query" />q|The user's search query string. If the query string is empty (for example, q=), the response includes the top news stories.<br /><br /> The query string may contain [Bing Advanced Operators](http://msdn.microsoft.com/library/ff795620.aspx). For example, to limit news to a specific domain, use the [site:](http://msdn.microsoft.com/library/ff795613.aspx) operator.<br /><br /> Do not include this parameter if you're getting news articles by category.<br /><br /> **NOTE:** Trending News ignores this parameter.|String|Yes|  
|<a name="safesearch" />safeSearch|A filter used to filter news articles for adult content. The following are the possible filter values.<br /><ul><li>Off&mdash;Return news articles with adult text, images, or videos.<br /><br/></li><li>Moderate&mdash;Return news articles with adult text; however, the articles does not include adult images or videos.<br /><br/></li><li>Strict&mdash;Do not return news articles with adult text, images, or videos.</li></ul><br /> If not specified, the default is Moderate.<br /><br /> **NOTE:** If the request comes from a market that Bing's adult policy requires that `safeSearch` is set to Strict, Bing ignores the `safeSearch` value and uses Strict.|String|No|  
|<a name="setlang" />setLang|The language to use for user interface strings. Specify the language using the ISO 639-1 2-letter language code. For example, the language code for English is EN. The default is EN (English).<br /><br /> Although optional, you should always specify the language. Typically, you set `setLang` to the same language specified by `mkt` unless the user wants the user interface strings displayed in a different language.<br /><br /> This parameter and the [Accept-Language](#acceptlanguage) header are mutually exclusive&mdash;do not specify both.<br /><br /> A user interface string is a string that's used as a label in a user interface. There are few user interface strings in the JSON response objects. Also, any links to Bing.com properties in the response objects apply the specified language.|String|No|  
|<a name="textdecorations" />textDecorations|A Boolean value that determines whether display strings should contain decoration markers such as hit highlighting characters. If **true**, the strings may include markers; otherwise, **false**. The default is **false**.<br /><br /> To specify whether to use Unicode characters or HTML tags as the markers, see the [textFormat](#textformat) query parameter.<br /><br /> For information about hit highlighting, see [Hit Highlighting](https://docs.microsoft.com/azure/cognitive-services/bing-news-search/hit-highlighting).|Boolean|No|  
|<a name="textformat" />textFormat|The type of markers to use for text decorations (see the `textDecorations` query parameter).<br /><br /> The following are the possible values.<br /><ul><li>Raw&mdash;Use Unicode characters to mark content that needs special formatting. The Unicode characters are in the range E000 through E019. For example, Bing uses E000 and E001 to mark the beginning and end of query terms for hit highlighting.<br /><br/></li><li>HTML&mdash;Use HTML tags to mark content that needs special formatting. For example, use \<b> tags to highlight query terms in display strings.</li></ul><br /> The default is Raw.<br /><br />For a list of markers, see [Hit Highlighting](https://docs.microsoft.com/azure/cognitive-services/bing-news-search/hit-highlighting).<br /><br /> For display strings that contain escapable HTML characters such as <, >, and &, if `textFormat` is set to HTML, Bing escapes the characters as appropriate (for example, < is escaped to \&lt;).<br /><br />For information about processing strings with the embedded Unicode characters, see [Hit Highlighting](https://docs.microsoft.com/azure/cognitive-services/bing-news-search/hit-highlighting).|String|No|  
 
  
## Response Objects  

The following are the JSON objects that the response may include. If the request succeeds, the top-level object in the response is the [News](#news) object if the endpoint is /news/search or /news, and [TrendingTopicAnswer](#trendingtopicanswer) if the endpoint is /news/trendingtopics. If the request fails, the top-level object is the [ErrorResponse](#errorresponse) object. 
  
|Object|Description|  
|------------|-----------------|  
|[Error](#error)|Defines an error that occurred.|  
|[ErrorResponse](#errorresponse)|Defines the top-level object that the response includes when the request fails.|  
|[Image](#image)|Defines a thumbnail of a news-related image.|  
|[News](#news)|Defines the top-level object that the response includes when the news request succeeds.|  
|[NewsArticle](#newsarticle)|Defines a news article.|  
|[Organization](#organization)|Defines the provider that ran the article.|  
|[Query](#query_object)|Defines the search query string.|  
|[RelatedTopic](#relatedtopic)|Defines a list of news articles that are related to the search query.|  
|[Thumbnail](#thumbnail)|Defines a link to the related image.|  
|[Topic](#topic)|Defines a trending news topic.|  
|[TrendingTopics](#trendingtopicanswer)|Defines the top-level object that the response includes when the trending topics request succeeds.|  
  
<a name="error"></a>   
### Error  
Defines an error that occurred.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|<a name="error-code" />code|The error code that identifies the error. For a list of possible codes, see [Error Codes](#error-codes).|String|  
|<a name="error-message" />message|A description of the error.|String|  
|<a name="error-parameter" />parameter|The query parameter in the request that caused the error.|String|  
|<a name="error-value" />value|The query parameter's value that was not valid.|String|  
  
<a name="errorresponse"></a>   
### ErrorResponse  
Defines the top-level object that the response includes when the request fails.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|Type hint.|String|  
|<a name="errors" />errors|An array of [Error](#error) objects that describe the reasons why the request failed.|[Error](#error)[]|  
  
<a name="image"></a>   
### Image  
Defines a thumbnail of a news-related image.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|provider|An array of [Organization](#organization) objects that identify the owner of the image.|[Organization](#organization)|  
|thumbnail|A link to a thumbnail of the news-related image.|[Thumbnail](#thumbnail)|  
|url|The URL to the image.|String|  
  
<a name="news"></a>   
### News  
Defines the top-level object that the response includes when the news request succeeds.  
  
If the service suspects a denial of service attack, the request succeeds (HTTP status code is 200 OK), but the body of the response is empty.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|Type hint.|String|  
|id|An ID that uniquely identifies the news answer.<br /><br /> For information about how to use this field, see [Using Ranking to Display Results](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/rank-results) in Web Search API.|String|  
|readLink|The URL that returns this answer. To use the URL, you must append query parameters as appropriate and include the [Ocp-Apim-Subscription-Key](#subscriptionkey) header.<br /><br /> Both the News Search API and Web Search API include this field. Typically, you'd use the URL when it's included in a Search response and you want to query the News Search API directly.|String|  
|<a name="news-relatedtopics" />relatedTopics|A list of news articles that are related to the search query.|[RelatedTopic](#relatedtopic)[]|  
|<a name="news-totalmatches" />totalEstimatedMatches|The estimated number of news articles that are relevant to the query. Use this number along with the [count](#count) and [offset](#offset) query parameters to page the results.<br /><br /> The response includes this field only when calling the News Search API. The Web Search API does not include this field in the response.|Long|  
|<a name="news-value" />value|An array of [NewsArticle](#newsarticle) objects that contain information about news articles that are relevant to the query.<br /><br /> If there are no results to return for the request, the array is empty.|[NewsArticle](#newsarticle)[]|  
  
<a name="newsarticle"></a>   
### NewsArticle  
Defines a news article.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="newsarticle-category" />category|The news category that the article belongs to. For example, Sports. If the news category cannot be determined, the article does not include this field.<br /><br /> For a list of possible categories, see [News Categories by Market](#categoriesbymarket).<br /><br /> If your request specifies the Sports-Tennis category, the `category` property may contain Sports-Tennis or Sports.|String|  
|<a name="newsarticle-clusteredarticles" />clusteredArticles|A list of related news articles.|NewsArticle[]|  
|<a name="newsarticle-datepublished" />datePublished|The date and time that Bing discovered the article. The date is in the format, YYYY-MM-DDTHH:MM:SS.|String|  
|<a name="newsarticle-description" />description|A short description of the news article.|String|  
|<a name="newsarticle-headline" />headline|A Boolean value that indicates whether the news article is a headline. If **true**, the article is a headline; otherwise, `false` (or not present).<br /><br /> **NOTE:** The article includes this field only for news categories requests that do not specify the category query parameter.|Boolean|  
|id|An ID that uniquely identifies this article in the list of articles.<br /><br /> For information about how to use this field, see [Using Ranking to Display Results](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/rank-results) in Web Search API.|String|  
|<a name="newsarticle-image" />image|An image related to the new article.<br /><br /> The `Image` object in this context contains only the `thumbnail` field.|[Image](#image)|  
|<a name="newsarticle-name" />name|The name of the article.<br /><br /> Use this name along with the URL to create a hyperlink that when clicked takes the user to the news article.|String|  
|<a name="newsarticle-provider" />provider|A list of providers that ran the article.|[Organization](#organization)[]|  
|<a name="newsarticle-url" />url|The URL to the news article.<br /><br /> Use this URL along with `name` to create a hyperlink that when clicked takes the user to the news article.|String|  
  
<a name="organization"></a>   
### Organization  
Defines the provider that ran the article.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|Type hint.|String|  
|name|The name of the provider that ran the article.|String|  
  
<a name="query_object"></a>   
### Query  
Defines the search query string.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="query-text" />text|A query string that returns the trending topic.|String|  
  
<a name="relatedtopic"></a>   
### RelatedTopic  
Defines a list of news articles that are related to the search query.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="relatedtopic-relatednews" />relatedNews|A list of related news articles.|[NewsArticle](#newsarticle)|  
|<a name="relatedtopic-name" />name|The related query string that returned the related news articles.|String|  
|webSearchUrl|The URL that takes the user to the Bing search results for the related query.|String|  
  
<a name="thumbnail"></a>   
### Thumbnail  
Defines a link to the related image.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="thumbnail-contenturl" />contentUrl|The URL to the image.|String|  
|<a name="thumbnail-height" />height|The height of the image, in pixels.|Unsigned Short|  
|<a name="thumbnail-width" />width|The width of the image, in pixels.|Unsigned Short|  
  
<a name="topic"></a>   
### Topic  
Defines a trending news topic.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="topic-image" />image|A link to a related image.<br /><br /> The `Image` object in this context contains only the `url` and `provider` field. The `provider` field is an array of `Organization` objects that identify the image providers.|Image|  
|<a name="topic-isbreakingnews" />isBreakingNews|A Boolean value that indicates whether the topic is considered breaking news. The value is **true** if the topic is considered breaking news; otherwise, **false**.|Boolean|  
|<a name="topic-name" />name|The title of the trending topic.|String|  
|<a name="topic-query" />query|A search query string that returns this trending topic.|[Query](#query_object)|  
|webSearchUrl|The URL to the Bing search results for the trending news topic.|String|  
  
<a name="trendingtopicanswer"></a>   
<a name="trendingtopicanswer"></a>   
### TrendingTopics  
Defines the top-level object that the response includes when the trending topics request succeeds.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="trendingtopic-value" />value|A list of trending news topics on Bing.<br /><br /> If there are no results to return for the request, the array is empty.|[Topic](#topic)[]|  
  
## News Categories by Market  
The following is a list of possible news categories that you may set the [category](#category) query parameter to. You may set `category` to a parent category such as Entertainment or one of its subcategories such as Entertainment_MovieAndTV. If you set `category` to a parent category, it includes articles from one or more of its subcategories. If you set `category` to a subcategory, it includes articles only from the subcategory.  
  
|Market|Supported Categories|  
|------------|--------------------------|  
|United Kingdom (en-GB)|<ul><li>Business</li><li>Entertainment</li><li>Health</li><li>Politics</li><li>ScienceAndTechnology</li><li>Sports</li><li>UK</li><li>World|  
|United States (en-US)|<ul><li>Business</li><li>Entertainment<br /><br /> <ul><li>Entertainment_MovieAndTV</li><li>Entertainment_Music</li></ul></li><li>Health</li><li>Politics</li><li>ScienceAndTechnology<br /><br /> <ul><li>Technology</li><li>Science</li></ul></li><li>Sports<br /><br /> <ul><li>Sports_Golf</li><li>Sports_MLB</li><li>Sports_NBA</li><li>Sports_NFL</li><li>Sports_NHL</li><li>Sports_Soccer</li><li>Sports_Tennis</li><li>Sports_CFB</li><li>Sports_CBB</li></ul></li><li>US<br /><br /> <ul><li>US_Northeast</li><li>US_South</li><li>US_Midwest</li><li>US_West</li></ul></li><li>World<br /><br /> <ul><li>World_Africa</li><li>World_Americas</li><li>World_Asia</li><li>World_Europe</li><li>World_MiddleEast</li></ul></li></ul>|  
  

## Error Codes 

[!INCLUDE [bing-error-codes](./includes/bing-error-codes.md)]

## Market Codes 

[!INCLUDE [bing-market-codes](./includes/bing-market-codes.md)]
