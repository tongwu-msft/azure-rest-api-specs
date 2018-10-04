---
title: Bing Custom Videos Search API v7 Reference | Microsoft Docs
description: Describes the programming elements of the Bing Custom Videos Search API.
services: cognitive-services
author: swhite-msft
manager: ehansen

ms.service: cognitive-services
ms.technology: bing-custom-image-search
ms.topic: article
ms.date: 09/06/2018
ms.author: scottwhi
---

# Custom Videos Search API v7 reference

The Custom Videos Search API lets you send a search query to Bing and get back a list of relevant videos from the slice of Web that your Custom Search instance defines. For information about configuring a Custom Search instance, see [Configure your custom search experience](https://docs.microsoft.com/azure/cognitive-services/bing-custom-search/define-your-custom-view).

For information about the headers that requests should include, see [Request Headers](#headers).  
  
For information about the query parameters that requests should include, see [Query Parameters](#query-parameters).  
  
For information about the JSON objects that the response may include, see [Response Objects](#response-objects).  

For information about permitted use and display of results, see [Bing Search API Use and Display requirements](https://docs.microsoft.com/azure/cognitive-services/bing-custom-search/use-and-display-requirements).

 
  
## Endpoints  

To request images from your Custom Search instance, send a GET request to the following URL:

`https://api.cognitive.microsoft.com/bingcustomsearch/v7.0/videos/search`

The request must use the HTTPS protocol.

> [!NOTE]
> The maximum URL length is 2,048 characters. To ensure that your URL length does not exceed the limit, the maximum length of your query parameters should be less than 1,500 characters. If the URL exceeds 2,048 characters, the server returns 404 Not found.  

  
## Headers  

The following are the headers that a request and response may include.  
  
|Header|Description|  
|------------|-----------------|  
|Accept|Optional request header.<br /><br /> The default media type is application/json. To specify that the response use [JSON-LD](http://json-ld.org/), set the Accept header to application/ld+json.|  
|<a name="acceptlanguage" />Accept-Language|Optional request header.<br /><br /> A comma-delimited list of languages to use for user interface strings. The list is in decreasing order of preference. For more information, including expected format, see [RFC2616](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html).<br /><br /> This header and the [setLang](#setlang) query parameter are mutually exclusive&mdash;do not specify both.<br /><br /> If you set this header, you must also specify the [cc](#cc) query parameter. To determine the market to return results for, Bing uses the first supported language it finds from the list and combines it with the `cc` parameter value. If the list does not include a supported language, Bing finds the closest language and market that supports the request or it uses an aggregated or default market for the results. To determine the market that Bing used, see the BingAPIs-Market header.<br /><br /> Use this header and the `cc` query parameter only if you specify multiple languages. Otherwise, use the [mkt](#mkt) and [setLang](#setlang) query parameters.<br /><br /> A user interface string is a string that's used as a label in a user interface. There are few user interface strings in the JSON response objects. Any links to Bing.com properties in the response objects apply the specified language.|  
|<a name="market" />BingAPIs-Market|Response header.<br /><br /> The market used by the request. The form is \<languageCode\>-\<countryCode\>. For example, en-US.<br /><br /> If you specify a market that is not listed in [Market Codes](#market-codes), this value may differ from the market you specified in the [mkt](#mkt) query parameter. The same is true if you specify values for [cc](#cc) and [Accept-Language](#acceptlanguage) that can't be reconciled.|  
|<a name="traceid" />BingAPIs-TraceId|Response header.<br /><br /> The ID of the log entry that contains the details of the request. When an error occurs, capture this ID. If you are not able to determine and resolve the issue, include this ID along with the other information that you provide the Support team.|  
|<a name="subscriptionkey" />Ocp-Apim-Subscription-Key|Required request header.<br /><br /> The subscription key that you received when you signed up for this service in [Cognitive Services](https://www.microsoft.com/cognitive-services/).|  
|<a name="retryafter" />Retry-After|Response header.<br /><br /> The response includes this header if you exceed the number of queries allowed per second (QPS) or per month (QPM). The header contains the number of seconds that you must wait before sending another request.|  
|<a name="useragent" />User-Agent|Optional request header.<br /><br /> The user agent originating the request. Bing uses the user agent to provide mobile users with an optimized experience. Although optional, you are encouraged to always specify this header.<br /><br /> The user-agent should be the same string that any commonly used browser sends. For information about user agents, see [RFC 2616](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html).<br /><br /> The following are examples of user-agent strings.<br /><ul><li>Windows Phone&mdash;Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 822)<br /><br /></li><li>Android&mdash;Mozilla/5.0 (Linux; U; Android 2.3.5; en-us; SCH-I500 Build/GINGERBREAD) AppleWebKit/533.1 (KHTML; like Gecko) Version/4.0 Mobile Safari/533.1<br /><br /></li><li>iPhone&mdash;Mozilla/5.0 (iPhone; CPU iPhone OS 6_1 like Mac OS X) AppleWebKit/536.26 (KHTML; like Gecko) Mobile/10B142 iPhone4;1 BingWeb/3.03.1428.20120423<br /><br /></li><li>PC&mdash;Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko<br /><br /></li><li>iPad&mdash;Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53</li></ul>|
|<a name="clientid" />X-MSEdge-ClientID|Optional request and response header.<br /><br /> Bing uses this header to provide users with consistent behavior across Bing API calls. Bing often flights new features and improvements, and it uses the client ID as a key for assigning traffic on different flights. If you do not use the same client ID for a user across multiple requests, then Bing may assign the user to multiple conflicting flights. Being assigned to multiple conflicting flights can lead to an inconsistent user experience. For example, if the second request has a different flight assignment than the first, the experience may be unexpected. Also, Bing can use the client ID to tailor web results to that client ID’s search history, providing a richer experience for the user.<br /><br /> Bing also uses this header to help improve result rankings by analyzing the activity generated by a client ID. The relevance improvements help with better quality of results delivered by Bing APIs and in turn enables higher click-through rates for the API consumer.<br /><br /> **IMPORTANT:** Although optional, you should consider this header required. Persisting the client ID across multiple requests for the same end user and device combination enables 1) the API consumer to receive a consistent user experience, and 2) higher click-through rates via better quality of results from the Bing APIs.<br /><br /> The following are the basic usage rules that apply to this header.<br /><ul><li>Each user that uses your application on the device must have a unique, Bing generated client ID.<br /><br/>If you do not include this header in the request, Bing generates an ID and returns it in the X-MSEdge-ClientID response header. The only time that you should NOT include this header in a request is the first time the user uses your app on that device.<br /><br/></li><li>**ATTENTION:** You must ensure that this Client ID is not linkable to any authenticatable user account information.</li><br/><li>Use the client ID for each Bing API request that your app makes for this user on the device.<br /><br/></li><li>Persist the client ID. To persist the ID in a browser app, use a persistent HTTP cookie to ensure the ID is used across all sessions. Do not use a session cookie. For other apps such as mobile apps, use the device's persistent storage to persist the ID.<br /><br/>The next time the user uses your app on that device, get the client ID that you persisted.</li></ul><br /> **NOTE:** Bing responses may or may not include this header. If the response includes this header, capture the client ID and use it for all subsequent Bing requests for the user on that device.<br /><br /> **NOTE:** If you include the X-MSEdge-ClientID, you must not include cookies in the request.|  
|<a name="clientip" />X-MSEdge-ClientIP|Optional request header.<br /><br /> The IPv4 or IPv6 address of the client device. The IP address is used to discover the user's location. Bing uses the location information to determine safe search behavior.<br /><br /> **NOTE:** Although optional, you are encouraged to always specify this header and the X-Search-Location header.<br /><br /> Do not obfuscate the address (for example, by changing the last octet to 0). Obfuscating the address results in the location not being anywhere near the device's actual location, which may result in Bing serving erroneous results.|  
|<a name="location" />X-Search-Location|Optional request header.<br /><br /> A semicolon-delimited list of key/value pairs that describe the client's geographical location. Bing uses the location information to determine safe search behavior and to return relevant local content. Specify the key/value pair as \<key\>:\<value\>. The following are the keys that you use to specify the user's location.<br /><br /><ul><li>lat&mdash;Required. The latitude of the client's location, in degrees. The latitude must be greater than or equal to -90.0 and less than or equal to +90.0. Negative values indicate southern latitudes and positive values indicate northern latitudes.<br /><br /></li><li>long&mdash;Required. The longitude of the client's location, in degrees. The longitude must be greater than or equal to -180.0 and less than or equal to +180.0. Negative values indicate western longitudes and positive values indicate eastern longitudes.<br /><br /></li><li>re&mdash;Required. The radius, in meters, which specifies the horizontal accuracy of the coordinates. Pass the value returned by the device's location service. Typical values might be 22m for GPS/Wi-Fi, 380m for cell tower triangulation, and 18,000m for reverse IP lookup.<br /><br /></li><li>ts&mdash;Optional. The UTC UNIX timestamp of when the client was at the location. (The UNIX timestamp is the number of seconds since January 1, 1970.)<br /><br /></li><li>head&mdash;Optional. The client's relative heading or direction of travel. Specify the direction of travel as degrees from 0 through 360, counting clockwise relative to true north. Specify this key only if the `sp` key is nonzero.<br /><br /></li><li>sp&mdash;Optional. The horizontal velocity (speed), in meters per second, that the client device is traveling.<br /><br /></li><li>alt&mdash;Optional. The altitude of the client device, in meters.<br /><br /></li><li>are&mdash;Optional. The radius, in meters, that specifies the vertical accuracy of the coordinates. Specify this key only if you specify the `alt` key.<br /><br /></li></ul> **NOTE:** Although many of the keys are optional, the more information that you provide, the more accurate the location results are.<br /><br /> **NOTE:** Although optional, you are encouraged to always specify the user's geographical location. Providing the location is especially important if the client's IP address does not accurately reflect the user's physical location (for example, if the client uses VPN). For optimal results, you should include this header and the X-Search-ClientIP header, but at a minimum, you should include this header.|

> [!NOTE] 
> Remember that the Terms of Use require compliance with all applicable laws, including regarding use of these headers. For example, in certain jurisdictions, such as Europe, there are requirements to obtain user consent before placing certain tracking devices on user devices.
  
  
## Query parameters

The following lists the query parameters that a request may include. See the Required column for required parameters. You must URL encode the query parameter values. For information about query parameters used to filter the videos that Bing returns, see [Filter Query Parameters](#filter).  
  
|Name|Value|Type|Required|  
|----------|-----------|----------|--------------|  
|<a name="cc" />cc|A 2-character country code of the country where the results come from. For a list of possible values, see [Market Codes](#market-codes).<br /><br /> If you set this parameter, you must also specify the [Accept-Language](#acceptlanguage) header. Bing uses the first supported language it finds in the specified languages and combines it with the country code to determine the market to return results for. If the languages list does not include a supported language, Bing finds the closest language and market that supports the request. Or, Bing may use an aggregated or default market for the results.<br /><br /> Use this query parameter and the `Accept-Language` header only if you specify multiple languages. Otherwise, you should use the `mkt` and `setLang` query parameters.<br /><br /> This parameter and the [mkt](#mkt) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="count" />count|The number of videos to return in the response. The actual number delivered may be less than requested. The default is 35. The maximum is 105.<br /><br /> You may use this parameter along with the `offset` parameter to page results. For example, if your user interface presents 20 videos per page, set `count` to 20 and `offset` to 0 to get the first page of results. For each subsequent page, increment `offset` by 20 (for example, 0, 20, 40).|UnsignedShort|No|  
|<a name="customconfig" />customConfig|Unique identifier that identifies your custom search instance.<br /><br />|String|Yes
|<a name="id" />id|An ID that uniquely identifies a video. The [Video](#video) object's `videoId` field contains the ID that you set this parameter to.<br /><br /> For the /videos/search endpoint, you use this parameter to ensure that the specified video is the first video in the list of videos that Bing returns.<br /><br /> For the /videos/details endpoint, you use this parameter to identify the video to get insights of.|String|No|  
|<a name="mkt" />mkt|The market where the results come from. Typically, `mkt` is the country where the user is making the request from. However, it could be a different country if the user is not located in a country where Bing delivers results. The market must be in the form \<language code\>-\<country code\>. For example, en-US. The string is case insensitive. For a list of possible market values, see [Market Codes](#market-codes).<br /><br /> **NOTE:** If known, you are encouraged to always specify the market. Specifying the market helps Bing route the request and return an appropriate and optimal response. If you specify a market that is not listed in [Market Codes](#market-codes), Bing uses a best fit market code based on an internal mapping that is subject to change.<br /><br /> This parameter and the [cc](#cc) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="offset" />offset|The zero-based offset that indicates the number of videos to skip before returning videos. The default is 0. The offset should be less than ([totalEstimatedMatches](#videos-totalmatches) - `count`).<br /><br /> Use this parameter along with the `count` parameter to page results. For example, if your user interface displays 20 videos per page, set `count` to 20 and `offset` to 0 to get the first page of results. For each subsequent page, increment `offset` by 20 (for example, 0, 20, 40).<br /><br /> It is possible for multiple pages to include some overlap in results. To prevent duplicates, see [nextOffset](#videos-nextoffset).|Unsigned Short|No|  
|<a name="query" />q|The user's search query string. The query string cannot be empty.<br /><br />**NOTE:** The query string must not contain [Bing Advanced Operators](http://msdn.microsoft.com/library/ff795620.aspx). Including them may adversely affect the custom search experience.|String|Yes|  
|<a name="safesearch" />safeSearch|Filter videos for adult content. The following are the possible filter values.<br /><ul><li>Off&mdash;Return videos with adult content.</li><li>Moderate&mdash;Don't include videos with adult content.</li><li>Strict&mdash;Don't include videos with adult content.</li></ul><br /> The default is Moderate.<br /><br /> **NOTE:** If the request comes from a market that Bing's adult policy requires `safeSearch` be set to Strict, Bing ignores the `safeSearch` value and uses Strict.<br/><br/>**NOTE:** If you use the `site:` query operator, there is the chance that the response may contain adult content regardless of what the `safeSearch` query parameter is set to. Use `site:` only if you are aware of the content on the site and your scenario supports the possibility of adult content.|String|No|  
|<a name="setlang" />setLang|The language to use for user interface strings. Specify the language using the ISO 639-1 2-letter language code. For example, the language code for English is EN. The default is EN (English).<br /><br /> Although optional, you should always specify the language. Typically, you set `setLang` to the same language specified by `mkt` unless the user wants the user interface strings displayed in a different language.<br /><br /> This parameter and the [Accept-Language](#acceptlanguage) header are mutually exclusive&mdash;do not specify both.<br /><br /> A user interface string is a string that's used as a label in a user interface. There are few user interface strings in the JSON response objects. Also, any links to Bing.com properties in the response objects apply the specified language.|String|No|  

  
## Filter query parameters 

The following are the optional filter query parameters that you can use to filter the videos that Bing returns. You must URL encode the query parameters.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="freshness" />freshness|Filter videos by the date and time that Bing discovered the video. The following are the possible filter values.<br /><ul><li>Day&mdash;Return videos discovered within the last 24 hours<br /><br /></li><li>Week&mdash;Return videos discovered within the last 7 days<br /><br /></li><li>Month&mdash;Return videos discovered within the last 30 days</li><li>Year&mdash;Return images discovered within the last year</li><li>2017-06-15..2018-06-15&mdash;Return images discovered within the specified range of dates</li></ul>|String|No|  
|<a name="pricing" />pricing|Filter videos by the following pricing options:<br /><ul><li>Free&mdash;Return videos that are free to view</li><li>Paid&mdash;Return videos that require a subscription or payment to view</li><li>All&mdash;Do not filter by pricing. Specifying this value is the same as not specifying the `pricing` parameter.</li></ul>|String|  
|<a name="resolution" />resolution|Filter videos by the following resolutions:<br /><ul><li>480p&mdash;Return videos with a 480p or higher resolution</li><li>720p&mdash;Return videos with a 720p or higher resolution</li><li>1080p&mdash;Return videos with a 1080p or higher resolution</li><li>All&mdash;Do not filter by resolution. Specifying this value is the same as not specifying the `resolution` parameter.</li></ul>|String|  
|<a name="videolength" />videoLength|Filter videos by the following lengths:<br /><ul><li>Short&mdash;Return videos that are less than 5 minutes</li><li>Medium&mdash;Return videos that are between 5 and 20 minutes, inclusive</li><li>Long&mdash;Return videos that are longer than 20 minutes</li><li>All&mdash;Do not filter by length. Specifying this value is the same as not specifying the `videoLength` parameter.</li></ul>|String|  
  
  
## Response objects  

The following are the JSON response objects that the response may include. If the request succeeds, the top-level object in the response is the [Videos](#videos) object. If the request fails, the top-level object is the [ErrorResponse](#errorresponse) object.  
  
|Object|Description|  
|------------|-----------------|  
|[Error](#error)|Defines an error that occurred.|  
|[ErrorResponse](#errorresponse)|The top-level object that the response includes when the request fails.|  
|[MediaSize](#mediasize)|Defines the size of the media content.|  
|[Pivot](#pivot)|Defines the pivot segment.|  
|[Publisher](#publisher)|Defines a publisher or creator.|  
|[Query](#query_obj)|Defines a search query string.|  
|[Thing](#thing)|Defines the name of the main entity shown in the video.|  
|[Thumbnail](#thumbnail)|Defines a thumbnail image.|  
|[Video](#video)|Defines a video that is relevant to the query.|  
|[Videos](#videos)|The top-level object that the response includes when the video request succeeds.|  
  
  
<a name="error"></a>   
### Error  
Defines the error that occurred.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|<a name="error-code" />code|The error code that identifies the category of error. For a list of possible codes, see [Error Codes](#error-codes).|String|  
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
  
  
<a name="mediasize"></a>   
### MediaSize  
Defines the size of the media content.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|height|The height of the media content, in pixels.|Integer|  
|width|The width of the media content, in pixels.|Integer|  


<a name="pivot"></a>   
### Pivot  
Defines the pivot segment.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="pivot-pivot" />pivot|The segment from the original query to pivot on.|String|  
|<a name="pivot-suggestions" />suggestions|A list of suggested query strings for the pivot.|[Query](#query_obj)|  
  

<a name="publisher"></a>   
### Publisher  
Defines a publisher or creator.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|name|The publisher's or creator's name.|String|  


<a name="query_obj"></a>   
### Query  
Defines a search query term.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="query-displaytext" />displayText|The display version of the query term.|String|  
|<a name="query-searchurl" />searchUrl|The URL that you use to get the results of the related search. Before using the URL, you must append query parameters as appropriate and include the [Ocp-Apim-Subscription-Key](#subscriptionkey) header.<br /><br /> Use this URL if you're displaying the results in your own user interface. Otherwise, use the `webSearchUrl` URL.|String|  
|<a name="query-text" />text|The query term.|String|  
|<a name="query-thumbnail" />thumbnail|The URL to a thumbnail of a related image.<br /><br /> The object includes this field only for pivot suggestions and related searches.|[Thumbnail](#thumbnail)|  
|<a name="query-websearchurl" />webSearchUrl|The URL that takes the user to the Bing search results page for the query.|String|  
  
  
<a name="thing"></a>   
### Thing  
Defines the main entity shown in the video.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|name|The name of the main entity shown in the video.|String|  


<a name="thumbnail"></a>   
### Thumbnail  
Defines the URL to a thumbnail of an image.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|url|The URL to a thumbnail of an image.|String|  


<a name="video"></a>   
### Video  
Defines a video that is relevant to the query.  
  
> [!NOTE]
> Because the URL format and parameters are subject to change without notice, use all URLs as-is. You should not take dependencies on the URL format or parameters.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="video-allowhttpsembed" />allowHttpsEmbed|A Boolean value that determines whether you may embed the video (see the `embedHtml` field) on pages that use the HTTPS protocol.|Boolean|  
|<a name="video-allowmobileembed" />allowMobileEmbed|A Boolean value that determines whether you may embed the video (see the `embedHtml` field) on a mobile device. If `true`, you may use the HTML on a mobile device.|Boolean|  
|<a name="video-creator" />creator|The name of the video's creator.<br /><br /> Only Video Search API responses include this field.|[Publisher](#publisher)|  
|<a name="video-contenturl" />contentUrl|The URL to the video on the host website.|String|  
|<a name="video-datepublished" />datePublished|The date and time that Bing discovered the video. The date is in the format, YYYY-MM-DDTHH:MM:SS.|String|  
|<a name="video-description" />description|A short description of the video.|String|  
|<a name="video-duration" />duration|The video's duration or length. For example, PT2M50S. For information about the format, see [http://en.wikipedia.org/wiki/ISO_8601#Durations](http://en.wikipedia.org/wiki/ISO_8601#Durations).|String|  
|<a name="video-embedhtml" />embedHtml|An iframe that lets you embed and run the video in your webpage.|String|  
|<a name="video-encodingformat" />encodingFormat|The video's mime type (for example, mp4).|String|  
|height|The height of the video, in pixels.|Integer|  
|<a name="video-hostpagedisplayurl" />hostPageDisplayUrl|The display URL of the webpage that hosts the video.<br /><br /> Use this URL in your user interface to identify the host webpage that contains the video. The URL is not a well-formed and should not be used to access the host webpage. To access the host webpage, use the `hostPageUrl` URL.|String|  
|<a name="video-hostpageurl" />hostPageUrl|The URL to the webpage that hosts the video.<br /><br /> This URL and `contentUrl` URL may be the same URL.|String|  
|<a name="video-isaccessibleforfree" />isAccessibleForFree|A Boolean value that indicates whether the video requires payment or a paid subscription to view. If **true**, the video is free to watch. Otherwise, if **false**, a payment or subscription is required.<br /><br /> **NOTE:** If Bing is unable to determine whether payment is required, the object may not include this field.<br /><br /> To ensure that Bing returns only free videos, set the [pricing](#pricing) query parameter to Free.|Boolean|  
|<a name="video-issuperfresh" />isSuperfresh|A Boolean value that indicates whether the video was recently discovered by Bing. If **true**, the video was recently discovered.<br /><br /> To get videos discovered within the last 24 hours or the last week, use the [freshness](#freshness) query parameter.|Boolean|  
|<a name="video-mainentity" />mainEntity|The name of the main entity shown in the video.<br /><br /> The object includes this field only when `scenario` is SingleDominantVideo (see [Videos](#videos)).|[Thing](#thing)|  
|<a name="video-motionthumbnailurl" />motionThumbnailUrl|The URL to an animated thumbnail that shows a preview of the video. Typically, you would use this URL to play a preview of the video when the user mouses over the thumbnail of the video on your results page.|String|  
|<a name="video-name" />name|The name of the video.|String|  
|<a name="video-publisher" />publisher|A list of the publishers that published the video.|[Publisher](#publisher)|  
|<a name="video-thumbnail" />thumbnail|The width and height of the thumbnail image (see `thumbnailUrl`).|[MediaSize](#mediasize)|  
|<a name="video-thumbnailurl" />thumbnailUrl|The URL to a thumbnail image of the video. For information about resizing the image, see [Resizing Thumbnails](https://docs.microsoft.com/azure/cognitive-services/bing-video-search/resize-and-crop-thumbnails).|String|  
|<a name="video-videoid" />videoId|An ID that uniquely identifies this video in the list of videos. You can use the ID in a subsequent request to ensure that this video is the first video returned in the list of videos. To ensure the video is the first video in the list, set the request's [id](#id) query parameter to this ID.|String|  
|<a name="video-viewcount" />viewCount|The number of times that the video has been watched at the source site.|Integer|  
|<a name="video-websearchurl" />webSearchUrl|The URL that takes the user to the Bing video search results and plays the video.|String|  
|width|The width of the video, in pixels.|Integer|  


<a name="videos"></a>   
### Videos  
The top-level object that the response includes when the video request succeeds.  
  
If the service suspects a denial of service attack, the request succeeds (HTTP status code is 200 OK), but the body of the response is empty.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|Type hint.|String|  
|<a name="videos-nextoffset" />nextOffset|The offset value that you set the [offset](#offset) query parameter to.<br /><br /> If you set `offset` to 0 and `count` to 30 on your first request, and then set `offset` to 30 on your second request, some of the results in the second response may be duplicates of the first response.<br /><br /> To prevent duplicates, set `offset` to the value of `nextOffset`.|Integer|  
|<a name="videos-pivotsuggestions" />pivotSuggestions|A list of pivots that segment the original query. For example, if the query was *Cleaning Gutters*, Bing might segment the query into *Cleaning* and *Gutters*.<br /><br /> The Cleaning pivot may contain query suggestions such as Gutter Installation and Gutter Repair, and the Gutters pivot may contain query suggestions such as Roof Cleaning and Window Cleaning.|[Pivot](#pivot)[]|  
|<a name="videos-queryexpansion" />queryExpansions|A list of expanded queries that narrows the original query. For example, if the query was *Cleaning+Gutters*, the expanded queries might be: Gutter Cleaning **Tools**, Cleaning Gutters **From the Ground**, Gutter Cleaning **Machine**, and **Easy** Gutter Cleaning.|[Query](#query_obj)[]|  
|<a name="videos-totalestimatedmatches" />totalEstimatedMatches|The estimated number of videos that match the query. Use this number along with the [count](#count) and [offset](#offset) query parameters to page the results.<br /><br /> Only Video Search API responses include this field.|Long|  
|<a name="videos-value" />value|A list of videos that are relevant to the query.|[Video](#video)[]|  
|<a name="videos-websearchurl" />webSearchUrl|The URL to the Bing search results for the requested videos.|String|  
  

## Error codes 

[!INCLUDE [bing-error-codes](./includes/bing-error-codes-v7.md)]

## Market codes 

The following table lists the market code values that you may use to specify the `mkt` query parameter. Bing returns content for only these markets. The list is subject to change.  

  
For a list of country codes that you may specify in the `cc` query parameter, see [Country codes](#countrycodes).  
  
|Country/Region|Language|Market code|  
|---------------------|--------------|-----------------|  
|Argentina|Spanish|es-AR|  
|Australia|English|en-AU|  
|Austria|German|de-AT|  
|Belgium|Dutch|nl-BE|  
|Belgium|French|fr-BE|  
|Brazil|Portuguese|pt-BR|  
|Canada|English|en-CA|  
|Canada|French|fr-CA|  
|Chile|Spanish|es-CL|  
|Denmark|Danish|da-DK|  
|Finland|Finnish|fi-FI|  
|France|French|fr-FR|  
|Germany|German|de-DE|  
|Hong Kong SAR|Traditional Chinese|zh-HK|  
|India|English|en-IN|  
|Indonesia|English|en-ID|  
|Italy|Italian|it-IT|  
|Japan|Japanese|ja-JP|  
|Korea|Korean|ko-KR|  
|Malaysia|English|en-MY|  
|Mexico|Spanish|es-MX|  
|Netherlands|Dutch|nl-NL|  
|New Zealand|English|en-NZ|
|People's republic of China|Chinese|zh-CN|  
|Poland|Polish|pl-PL|  
|Portugal|Portuguese|pt-PT|  
|Republic of the Philippines|English|en-PH|  
|Russia|Russian|ru-RU|  
|Saudi Arabia|Arabic|ar-SA|  
|South Africa|English|en-ZA|  
|Spain|Spanish|es-ES|  
|Sweden|Swedish|sv-SE|  
|Switzerland|French|fr-CH|  
|Switzerland|German|de-CH|  
|Taiwan|Traditional Chinese|zh-TW|  
|Turkey|Turkish|tr-TR|  
|United Kingdom|English|en-GB|  
|United States|English|en-US|  
|United States|Spanish|es-US|  
  
<a name="countrycodes"></a>   
### Country codes  

The following are the country codes that you may specify in the `cc` query parameter. The list is subject to change.  
  
|Country/Region|Country code|  
|---------------------|------------------|  
|Argentina|AR|  
|Australia|AU|  
|Austria|AT|  
|Belgium|BE|  
|Brazil|BR|  
|Canada|CA|  
|Chile|CL|  
|Denmark|DK|  
|Finland|FI|  
|France|FR|  
|Germany|DE|  
|Hong Kong SAR|HK|  
|India|IN|  
|Indonesia|ID|  
|Italy|IT|  
|Japan|JP|  
|Korea|KR|  
|Malaysia|MY|  
|Mexico|MX|  
|Netherlands|NL|  
|New Zealand|NZ|  
|Norway|NO|  
|People's Republic of China|CN|  
|Poland|PL|  
|Portugal|PT|  
|Republic of the Philippines|PH|  
|Russia|RU|  
|Saudi Arabia|SA|  
|South Africa|ZA|  
|Spain|ES|  
|Sweden|SE|  
|Switzerland|CH|  
|Taiwan|TW|  
|Turkey|TR|  
|United Kingdom|GB|  
|United States|US|
