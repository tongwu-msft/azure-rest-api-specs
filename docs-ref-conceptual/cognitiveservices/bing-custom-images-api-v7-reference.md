---
title: Bing Custom Images Search API v7 Reference | Microsoft Docs
description: Describes the programming elements of the Bing Custom Images Search API.
services: cognitive-services
author: swhite-msft
manager: ehansen

ms.service: cognitive-services
ms.technology: bing-custom-image-search
ms.topic: article
ms.date: 04/15/2017
ms.author: scottwhi
---

# Custom Image Search API v7 reference

The Custom Image Search API lets you send a search query to Bing and get back a list of relevant images from your Custom Search instance. This section provides technical details about the query parameters and headers that you use to request images and the JSON response objects that contain them. 

For informaiton about configuring a Custom Search instance, see [Configure your custom search experience](https://docs.microsoft.com/azure/cognitive-services/bing-custom-search/define-your-custom-view

For information about the headers that requests should include, see [Request Headers](#headers).  
  
For information about the query parameters that requests should include, see [Query Parameters](#query-parameters).  
  
For information about the JSON response objects that responses may include, see [Response Objects](#response-objects).  

For information about permitted use and display of results, see [Bing Search API Use and Display requirements](https://docs.microsoft.com/azure/cognitive-services/bing-image-search/useanddisplayrequirements).

  
## Endpoints  

To request images from your Custom Search instance, send a GET request to the following URL:
  
|Endpoint|Description|  
|--------------|-----------------|  
|https://api.cognitive.microsoft.com/bingcustomsearch/v7.0/images/search|Returns images that are relevant to the users search query.|  

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

The following are the query parameters that a request may include. See the Required column for required parameters. You must URL encode the query parameter values. For information about query parameters that you use to filter the images that Bing returns, see [Filter Query Parameters](#filter).  
  
|Name|Value|Type|Required|  
|----------|-----------|----------|--------------|  
|<a name="cc" />cc|A 2-character country code of the country where the results come from. For a list of possible values, see [Market Codes](#market-codes).<br /><br /> If you set this parameter, you must also specify the [Accept-Language](#acceptlanguage) header. Bing uses the first supported language it finds in the specified languages and combines it with the country code to determine the market to return results for. If the languages list does not include a supported language, Bing finds the closest language and market that supports the request. Or, Bing may use an aggregated or default market for the results.<br /><br /> Use this query parameter and the `Accept-Language` header only if you specify multiple languages. Otherwise, you should use the `mkt` and `setLang` query parameters.<br /><br /> This parameter and the [mkt](#mkt) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="count" />count|The number of images to return in the response. The actual number delivered may be less than requested. The default is 35. The maximum value is 150.<br /><br /> You use this parameter along with the `offset` parameter to page results. For example, if your user interface displays 20 images per page, set `count` to 20 and `offset` to 0 to get the first page of results. For each subsequent page, increment `offset` by 20 (for example, 0, 20, 40).<br /><br /> Use this parameter only with the Image Search API. Do not specify this parameter when calling the Insights, Trending Images, or Web Search APIs.|UnsignedShort|No|  
|<a name="customconfig" />customConfig|Unique identifier that identifies your custom search instance.<br /><br />|String|Yes
|<a name="mkt" />mkt|The market where the results come from. Typically, `mkt` is the country where the user is making the request from. However, it could be a different country if the user is not located in a country where Bing delivers results. The market must be in the form \<language code\>-\<country code\>. For example, en-US. The string is case insensitive. For a list of possible market values, see [Market Codes](#market-codes).<br /><br /> **NOTE:** If known, you are encouraged to always specify the market. Specifying the market helps Bing route the request and return an appropriate and optimal response. If you specify a market that is not listed in [Market Codes](#market-codes), Bing uses a best fit market code based on an internal mapping that is subject to change.<br /><br /> This parameter and the [cc](#cc) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="offset" />offset|The zero-based offset that indicates the number of images to skip before returning images. The default is 0. The offset should be less than ([totalEstimatedMatches](#totalestimatedmatches) - `count`).<br /><br /> To page results, use this parameter along with the `count` parameter. For example, if your user interface displays 20 images per page, set `count` to 20 and `offset` to 0 to get the first page of results. For each subsequent page, increment `offset` by 20 (for example, 0, 20, 40).<br /><br /> It is possible for multiple pages to include some overlap in results. To prevent duplicates, see [nextOffset](#nextoffset).<br /><br /> Use this parameter only with the Image API. Do not specify this parameter when calling the Trending Images API or the Web Search API.|Unsigned Short|No|  
|<a name="query" />q|The user's search query term. The term cannot be empty.<br /><br />**NOTE:** The query string must not contain [Bing Advanced Operators](http://msdn.microsoft.com/library/ff795620.aspx). Including them may adversely affect the custom search experience.|String|Yes|  
|<a name="safesearch" />safeSearch|Filter images for adult content. The following are the possible filter values.<br /><ul><li>Off&mdash;May return images with adult content. If the request is through the Image Search API, the response includes thumbnail images that are clear (non-fuzzy). However, if the request is through the Web Search API, the response includes thumbnail images that are pixelated (fuzzy).<br /><br /></li><li>Moderate&mdash;If the request is through the Image Search API, the response doesn't include images with adult content. If the request is through the Web Search API, the response may include images with adult content (the thumbnail images are pixelated (fuzzy)).<br /><br /></li><li>Strict&mdash;Do not return images with adult content.</li></ul><br /> The default is Moderate.<br /><br /> **NOTE:** If the request comes from a market that Bing's adult policy requires that `safeSearch` is set to Strict, Bing ignores the `safeSearch` value and uses Strict.<br/><br/>**NOTE:** If you use the `site:` query operator, there is the chance that the response may contain adult content regardless of what the `safeSearch` query parameter is set to. Use `site:` only if you are aware of the content on the site and your scenario supports the possibility of adult content.|String|No|  
|<a name="setlang" />setLang|The language to use for user interface strings. Specify the language using the ISO 639-1 2-letter language code. For example, the language code for English is EN. The default is EN (English).<br /><br /> Although optional, you should always specify the language. Typically, you set `setLang` to the same language specified by `mkt` unless the user wants the user interface strings displayed in a different language.<br /><br /> This parameter and the [Accept-Language](#acceptlanguage) header are mutually exclusive&mdash;do not specify both.<br /><br /> A user interface string is a string that's used as a label in a user interface. There are few user interface strings in the JSON response objects. Also, any links to Bing.com properties in the response objects apply the specified language.|String|No|  


## Filter query parameters  
The following are the optional filter query parameters that you can use to filter the images that Bing returns. You must URL encode the query parameters.  
  
Use these parameters only with the Image Search API. Do not specify these parameters when calling the Trending Images API or Web Search API.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="aspect" />aspect|Filter images by the following aspect ratios: <br /><ul><li>Square&mdash;Return images with standard aspect ratio</li><li>Wide&mdash;Return images with wide screen aspect ratio</li><li>Tall&mdash;Return images with tall aspect ratio<br /></li><li>All&mdash;Do not filter by aspect. Specifying this value is the same as not specifying the `aspect` parameter.</li></ul>|String|  
|<a name="color" />color|Filter images by the following color options:<br /><ul><li>ColorOnly&mdash;Return color images</li><li>Monochrome&mdash;Return black and white images</li></ul><br />Return images with one of the following dominant colors:<br/><ul><li>Black</li><li>Blue</li><li>Brown</li><li>Gray</li><li>Green</li><li>Orange</li><li>Pink</li><li>Purple</li><li>Red</li><li>Teal</li><li>White</li><li>Yellow</li></ul>|String|  
|<a name="height" />height|Filter images that have the specified height, in pixels.<br /><br /> You may use this filter with the `size` filter to return small images that have a height of 150 pixels.|UnsignedShort|  
|<a name="imagecontent" />imageContent|Filter images by the following content types:<br /><ul><li>Face&mdash;Return images that show only a person's face</li><li>Portrait&mdash;Return images that show only a person's head and shoulders|String|  
|<a name="imagetype" />imageType|Filter images by the following image types:<br /><ul><li>AnimatedGif&mdash;Return only animated GIFs<br /><br/></li><li>Clipart&mdash;Return only clip art images<br /><br/></li><li>Line&mdash;Return only line drawings<br /><br/></li><li>Photo&mdash;Return only photographs (excluding line drawings, animated Gifs, and clip art)<br /><br/></li><li>Shopping&mdash;Return only images that contain items where Bing knows of a merchant that is selling the items. This option is valid in the en-US market only.<br /><br/></li><li>Transparent&mdash;Return only images with a transparent background.</li></ul>|String|  
|<a name="license" />license|Filter images by the following license types:<br /><ul><li>Any&mdash;Return images that are under any license type. The response doesn't include images that do not specify a license or the license is unknown.<br /><br/></li><li>Public&mdash;Return images where the creator has waived their exclusive rights, to the fullest extent allowed by law.<br /><br/></li><li>Share&mdash;Return images that may be shared with others. Changing or editing the image might not be allowed. Also, modifying, sharing, and using the image for commercial purposes might not be allowed. Typically, this option returns the most images.<br /><br/></li><li>ShareCommercially&mdash;Return images that may be shared with others for personal or commercial purposes. Changing or editing the image might not be allowed.<br /><br/></li><li>Modify&mdash;Return images that may be modified, shared, and used. Changing or editing the image might not be allowed. Modifying, sharing, and using the image for commercial purposes might not be allowed.<br /><br/></li><li>ModifyCommercially&mdash;Return images that may be modified, shared, and used for personal or commercial purposes. Typically, this option returns the fewest images.<br /><br/></li><li>All&mdash;Do not filter by license type. Specifying this value is the same as not specifying the `license` parameter.</li></ul><br /> For more information about these license types, see [Filter Images By License Type](http://go.microsoft.com/fwlink/?LinkId=309768).|String|  
|<a name="maxfilesize" />maxFileSize|Filter images that are less than or equal to the specified file size.<br /><br /> The maximum file size that you may specify is 520,192 bytes. If you specify a larger value, the API uses 520,192. It is possible that the response may include images that are slightly larger than the specified maximum.<br /><br /> You may specify this filter and `minFileSize` to filter images within a range of file sizes.|Integer|  
|<a name="maxheight" />maxHeight|Filter images that have a height that is less than or equal to the specified height. Specify the height in pixels.<br /><br /> You may specify this filter and `minHeight` to filter images within a range of heights.<br /><br /> This filter and the `height` filter are mutually exclusive.|Integer|  
|<a name="maxwidth" />maxWidth|Filter images that have a width that is less than or equal to the specified width. Specify the width in pixels.<br /><br /> You may specify this filter and `maxWidth` to filter images within a range of widths.<br /><br /> This filter and the `width` filter are mutually exclusive.|Integer|  
|<a name="minfilesize" />minFileSize|Filter images that are greater than or equal to the specified file size.<br /><br /> The maximum file size that you may specify is 520,192 bytes. If you specify a larger value, the API uses 520,192. It is possible that the response may include images that are slightly smaller than the specified minimum.<br /><br /> You may specify this filter and `maxFileSize` to filter images within a range of file sizes.|Integer|  
|<a name="minheight" />minHeight|Filter images that have a height that is greater than or equal to the specified height. Specify the height in pixels.<br /><br /> You may specify this filter and `maxHeight` to filter images within a range of heights.<br /><br /> This filter and the `height` filter are mutually exclusive.|Integer|  
|<a name="minwidth" />minWidth|Filter images that have a width that is greater than or equal to the specified width. Specify the width in pixels.<br /><br /> You may specify this filter and `maxWidth` to filter images within a range of widths.<br /><br /> This filter and the `width` filter are mutually exclusive.|Integer|  
|<a name="size" />size|Filter images by the following sizes:<br /><ul><li>Small&mdash;Return images that are less than 200x200 pixels<br /><br/></li><li>Medium&mdash;Return images that are greater than or equal to 200x200 pixels but less than 500x500 pixels<br /><br/></li><li>Large&mdash;Return images that are 500x500 pixels or larger<br /><br/></li><li>Wallpaper&mdash;Return wallpaper images.<br /><br/></li><li>All&mdash;Do not filter by size. Specifying this value is the same as not specifying the `size` parameter.</li></ul><br /> You may use this parameter along with the `height` or `width` parameters. For example, you may use `height` and `size` to request small images that are 150 pixels tall.|String|  
|<a name="width" />width|Filter images that have the specified width, in pixels.<br /><br /> You may use this filter with the `size` filter to return small images that have a width of 150 pixels.|UnsignedShort|  
  
## Response objects  
The following are the JSON objects that the response may include. If the request succeeds, the top-level object in the response is the [Images](#images) object if the endpoint is /images/search, [ImageInsightsResponse](#imageinsightsresponse) if endpoint is /images/details, and [TrendingImages](#trendingimages) if the endpoint is /images/trending. If the request fails, the top-level object is the [ErrorResponse](#errorresponse) object. 
  
|Object|Description|  
|------------|-----------------|  
|[AggregateOffer](#aggregateoffer)|Defines a list of offers from merchants that are related to the image.|  
|[AggregateRating](#aggregaterating)|Defines the metrics that indicate how well an item was rated by others.|  
|[Category](#category)|Defines the category of trending images.|  
|[Error](#error)|Defines an error that occurred.|  
|[ErrorResponse](#errorresponse)|The top-level object that the response includes when the request fails.|  
|[Image](#image)|Defines an image that is relevant to the query.|  
|[ImageCaption](#imagecaption)|Defines an image's caption.|  
|[ImageGallery](#imagegallery)|Defines a link to a webpage that contains a collection of related images.|  
|[ImageInsights](#imageinsightsresponse)|The top-level object that the response includes when an image insights request succeeds.|  
|[Images](#images)|The top-level object that the response includes when an image request succeeds.|  
|[ImagesModule](#imagesmodule)|Defines a list of images.|  
|[ImageTagsModule](#imagetagsmodule)|Defines the characteristics of the content found in the image.|  
|[InsightsMetadata](#insightsmetadata)|Defines a count of the number of websites where you can shop or perform other actions related to the image.|  
|[MediaSize](#mediasize)|Defines the size of the media content.|  
|[NormalizedRectangle](#normalizedrectangle)|Defines a region of an image.|  
|[Instrumentation](#instrumentation)|Defines the Bing instrumentation URLs.|  
|[Offer](#offer)|Defines a merchant's offer.|  
|[Organization](#organization)|Defines information about a merchant.|  
|[Person](#person)|Defines a person.|  
|[Pivot](#pivot)|Defines the pivot segment.|  
|[Query](#query_obj)|Defines a search query string.|  
|[Recipe](#recipe)|Defines a cooking recipe.|  
|[RecipesModule](#recipesmodule)|Defines a list of cooking recipes.|  
|[RecognizedEntity](#recognizedentity)|Defines a recognized entity.|  
|[RecognizedEntityGroup](#recognizedentitygroup)|Defines a group of previously recognized entities.|  
|[RecognizedEntitiesModule](#recognizedentitiesmodule)|Defines a list of previously recognized entities.|  
|[RecognizedEntityRegion](#recognizedentityregion)|Defines a region where an entity was found and a list of entities that might match it.|  
|[RelatedCollectionsModule](#relatedcollectionsmodule)|Defines a list of links to webpages that contain related images.|  
|[RelatedSearchesModule](#relatedsearchesmodule)|Defines a list of related searches made by others.|  
|[Tag](#tag)|Defines a characteristic found in the image.|  
|[Thumbnail](#thumbnail)|Defines a thumbnail image.|  
|[Tile](#thumbnail)|Defines an image tile.|  
|[TrendingImages](#trendingimages)|The top-level object that the response includes when a trending images request succeeds.|  
  
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
