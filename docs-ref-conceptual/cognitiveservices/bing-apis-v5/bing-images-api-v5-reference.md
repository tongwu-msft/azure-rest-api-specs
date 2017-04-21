---
title: Bing Images Search API v5 Reference | Microsoft Docs
description: Describes the programming elements of the Bing Images Search API.
services: cognitive-services
author: swhite-msft
manager: ehansen

ms.service: cognitive-services
ms.technology: bing-image-search
ms.topic: article
ms.date: 04/15/2017
ms.author: scottwhi
---

# Image Search API v5 Reference

The Image Search API lets you send a search query to Bing and get back a list of relevant images. This section provides technical details about the query parameters and headers that you use to request images and the JSON response objects that contain them. For examples that show how to make requests, see [Searching the Web for Images](https://docs.microsoft.com/azure/cognitive-services/bing-image-search/searching-the-web).  

For details about the headers that requests should include, see [Request Headers](#headers).  
  
For details about the query parameters that requests should include, see [Query Parameters](#parameters-parameters).  
  
For details about the JSON response objects that responses may include, see [Response Objects](#response-objects).  
  
## Endpoints  

To request images, send a GET request to one of the following URLs:   
  
|Endpoint|Description|  
|--------------|-----------------|  
|https://api.cognitive.microsoft.com/bing/v5.0/images/search|Returns images that are relevant to the users search query. You can also use this endpoint to get insights about an image, such as webpages that include the image.|  
|https://api.cognitive.microsoft.com/bing/v5.0/images/trending|Returns images that are trending based on search requests made by others. The images are broken out into different categories. For example, Popular People Searches.<br /><br /> For a list of markets that support trending images, see [Trending Images](https://docs.microsoft.com/azure/cognitive-services/bing-image-search/trending-images).|  

The request must use the HTTPS protocol.

> [!NOTE]
> The maximum URL length is 2,048 characters. To ensure that your URL length does not exceed the limit, the maximum length of your query parameters should be less than 1,500 characters. If the URL exceeds 2,048 characters, the server returns 404 Not found.  
  
  
## Headers  
The following are the headers that a request and response may include.  
  
|Header|Description|  
|------------|-----------------|  
|Accept|Optional request header.<br /><br /> The default media type is application/json. To specify that the response use [JSON-LD](http://json-ld.org/), set the Accept header to application/ld+json.|  
|<a name="acceptlanguage" />Accept-Language|Optional request header.<br /><br /> A comma-delimited list of languages to use for user interface strings. The list is in decreasing order of preference. For more information, including expected format, see [RFC2616](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html).<br /><br /> This header and the [setLang](#setlang) query parameter are mutually exclusive&mdash;do not specify both.<br /><br /> If you set this header, you must also specify the [cc](#cc) query parameter. Bing uses the first supported language it finds from the list, and combine that language with the `cc` parameter value to determine the market to return results for. If the list does not include a supported language, Bing finds the closest language and market that supports the request or it uses an aggregated or default market for the results.<br /><br /> Use this header and the `cc` query parameter only if you specify multiple languages. Otherwise, use the `mkt` and `setLang` query parameters.<br /><br /> A user interface string is a string that's used as a label in a user interface. There are few user interface strings in the JSON response objects. Any links in the response objects to Bing.com properties will apply the specified language.|  
|<a name="market" />BingAPIs-Market|Response header.<br /><br /> The market used in the request. The form is <languageCode\>-<countryCode\>. For example, en-US.<br /><br /> This market may differ from the market specified in the [mkt](#mkt) query parameter if you specify a market that is not listed in [Market Codes](#market-codes). The same is true if you specify values for [cc](#cc) and [Accept-Language](#acceptlanguage) that can't be reconciled.|  
|<a name="traceid" />BingAPIs-TraceId|Response header.<br /><br /> The ID of the log entry that contains the details of the request. When an error occurs, capture this ID. If you are not able to determine and resolve the issue, include this ID along with the other information that you provide the Support team.|  
|<a name="subscriptionkey" />Ocp-Apim-Subscription-Key|Required request header.<br /><br /> The subscription key that you received when you signed up for this service in [Cognitive Services](https://www.microsoft.com/cognitive-services/).|  
|<a name="retryafter" />Retry-After|Response header.<br /><br /> The response includes this header if you exceed the number of queries allowed per second (QPS) or per month (QPM). The header contains the number of seconds that you must wait before sending another request.|  
|<a name="useragent" />User-Agent|Optional request header.<br /><br /> The user agent originating the request. Bing uses the user agent to provide mobile users with an optimized experience. Although optional, you are encouraged to always specify this header.<br /><br /> The user-agent should be the same string that any commonly used browser would send. For information about user agents, see [RFC 2616](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html).<br /><br /> The following are examples of user-agent strings.<br /><br />&nbsp;&nbsp;* Windows Phone&mdash;Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 822)<br /><br />&nbsp;&nbsp;* Android&mdash;Mozilla/5.0 (Linux; U; Android 2.3.5; en-us; SCH-I500 Build/GINGERBREAD) AppleWebKit/533.1 (KHTML; like Gecko) Version/4.0 Mobile Safari/533.1<br /><br />&nbsp;&nbsp;* iPhone&mdash;Mozilla/5.0 (iPhone; CPU iPhone OS 6_1 like Mac OS X) AppleWebKit/536.26 (KHTML; like Gecko) Mobile/10B142 iPhone4;1 BingWeb/3.03.1428.20120423<br /><br />&nbsp;&nbsp;* PC&mdash;Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko<br /><br />&nbsp;&nbsp;* iPad&mdash;Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53|  
|<a name="clientid" />X-MSEdge-ClientID|Optional request and response header.<br /><br /> Bing uses this header to provide users with consistent behavior across Bing API calls. Bing often flights new features and improvements, and it uses the client ID as a key for assigning traffic on different flights. If you do not use the same client ID for a user across multiple requests, then the user may be assigned to multiple conflicting flights. Being assigned to multiple conflicting flights can lead to an inconsistent experience for that user. For example, the second page of results could provide a different experience than the first page of results if the second request has a different flight assignment. Also, Bing can use the client ID to tailor web results to that client ID’s search history, providing a richer experience for the user.<br /><br /> Bing also uses this header to help improve result rankings by analyzing the activity generated by a client ID. The relevance improvements help with better quality of results delivered by Bing APIs and in turn enables higher click-through rates for the API consumer.<br /><br /> **IMPORTANT:** Although optional, you should consider this header required. Persisting the client ID across multiple requests for the same end user and device combination enables 1) the API consumer to receive a consistent user experience, and 2) higher click-through rates via better quality of results from the Bing APIs.<br /><br /> The following are the basic usage rules that apply to this header.<br /><br />&nbsp;&nbsp;* Each user that uses your application on the device must have a unique, Bing generated client ID.<br /><br/>&nbsp;&nbsp;&nbsp;&nbsp; If you do not include this header in the request, Bing generates the ID and returns it in the X-MSEdge-ClientID response header. The only time that you should NOT include this header in a request is the first time the user uses your app on that device.<br /><br/>&nbsp;&nbsp;* Use the client ID for each Bing API request that your app makes for this user on the device.<br /><br/>&nbsp;&nbsp;* Persist the client ID. To persist the ID in a browser app, use a persistent HTTP cookie, not a session cookie to ensure the ID is used across all sessions. For other apps such as a mobile app, use the device's persistent storage to persist the ID.<br /><br/>&nbsp;&nbsp;&nbsp;&nbsp; The next time the user uses your app on that device, get the client ID that you persisted.<br /><br /> **NOTE:** Bing responses may or may not include this header. If the response includes this header, capture the client ID and use it for all subsequent Bing requests for the user on that device.<br /><br /> **NOTE** If you include the X-MSEdge-ClientID, you must not include cookies in the request.|  
|<a name="clientip" />X-MSEdge-ClientIP|Optional request header.<br /><br /> The IPv4 or IPv6 address of the client device. The IP address is used to discover the user's location. Bing uses the location information to determine safe search behavior.<br /><br /> **NOTE:** Although optional, you are encouraged to always specify this header and the X-Search-Location header.<br /><br /> Do not obfuscate the address (for example, by changing the last octet to 0). Obfuscating the address results in the location not be anywhere near the device's actual location, which results in erroneous images being served.|  
|<a name="location" />X-Search-Location|Optional request header.<br /><br /> A semicolon-delimited list of key/value pairs that describe the client's geographical location. Bing uses the location information to determine safe search behavior and to return relevant local content.  Specify the key/value pair as <key\>:<value\>. The following are the keys that you use to specify the user's location.<br /><br />&nbsp;&nbsp;* lat&mdash;Required. The latitude of the client's location, in degrees. The latitude must be greater than or equal to -90.0 and less than or equal to +90.0. Negative values indicate southern latitudes and positive values indicate northern latitudes.<br /><br />&nbsp;&nbsp;* long&mdash;Required. The longitude of the client's location, in degrees. The longitude must be greater than or equal to -180.0 and less than or equal to +180.0. Negative values indicate western longitudes and positive values indicate eastern longitudes.<br /><br />&nbsp;&nbsp;* re&mdash;Required. The radius, in meters, which specifies the horizontal accuracy of the coordinates. Pass the value returned by the device's location service. Typical values might be 22m for GPS/Wi-Fi, 380m for cell tower triangulation, and 18,000m for reverse IP lookup.<br /><br />&nbsp;&nbsp;* ts&mdash;Optional. The UTC UNIX timestamp of when the client was at the location. (The UNIX timestamp is the number of seconds since January 1, 1970.)<br /><br />&nbsp;&nbsp;* head&mdash;Optional. The client's relative heading or direction of travel. Specify the direction of travel as degrees from 0 through 360, counting clockwise relative to true north. Specify this key only if the `sp` key is nonzero.<br /><br />&nbsp;&nbsp;* sp&mdash;Optional. The horizontal velocity (speed), in meters per second, that the client device is traveling.<br /><br />&nbsp;&nbsp;* alt&mdash;Optional. The altitude of the client device, in meters.<br /><br />&nbsp;&nbsp;* are&mdash;Optional. The radius, in meters, that specifies the vertical accuracy of the coordinates. Specify this key only if you specify the `alt` key.<br /><br /> **NOTE:** Although many of the keys are optional, the more information that you provide, the more accurate the location results are.<br /><br /> **NOTE:** Although optional, you are encouraged to always specify the user's geographical location. Providing the location is especially important if the client's IP address does not accurately reflect the user's physical location (for example, if the client uses VPN). For optimal results, you should include this header and the X-Search-ClientIP header, but at a minimum, you should include this header.|  

> [!NOTE] 
> Remember that the Terms of Use require compliance with all applicable laws, including regarding use of these headers. For example, in certain jurisdictions, such as Europe, there are requirements to obtain user consent before placing certain tracking devices on user devices.
  
## Query Parameters  
The following are the query parameters that the request may include. See the Required column for required parameters. The query parameter values must be URL encoded. For information about query parameters used to filter the images that Bing returns, see [Filter Query Parameters](#filter).  
  
|Name|Value|Type|Required|  
|----------|-----------|----------|--------------|  
|<a name="cab" />cab|The bottom coordinate of the region to crop.<br /><br /> The coordinate is a fractional value of the original image's height and is measured from the top, left corner of the image. Specify the coordinate as a value from 0.0 through 1.0.<br /><br /> This parameter is supported only by the Insights API; do not specify this parameter when calling the Images, Trending Images, or Web Search APIs.|Float|No|  
|<a name="cal" />cal|The left coordinate of the region to crop.<br /><br /> The coordinate is a fraction of the original image's width and is measured from the top, left corner of the image. Specify the coordinate as a value from 0.0 through 1.0.<br /><br /> This parameter is supported only by the Insights API; do not specify this parameter when calling the Images, Trending Images, or Web Search APIs.|Float|No|  
|<a name="car" />car|The right coordinate of the region to crop.<br /><br /> The coordinate is a fraction of the original image's width and is measured from the top, left corner of the image. Specify the coordinate as a value from 0.0 through 1.0.<br /><br /> This parameter is supported only by the Insights API; do not specify this parameter when calling the Images, Trending Images, or Web Search APIs.|Float|No|  
|<a name="cat" />cat|The top coordinate of the region to crop.<br /><br /> The coordinate is a fraction of the original image's height and is measured from the top, left corner of the image. Specify the coordinate as a value from 0.0 through 1.0.<br /><br /> This parameter is supported only by the Insights API; do not specify this parameter when calling the Images, Trending Images, or Web Search APIs.|Float|No|  
|<a name="ct" />ct|The crop type to use to crop the image based on the coordinates specified in the cal, cat, car, and cab parameters.<br /><br /> The following are the possible values.<br /><br />&nbsp;&nbsp;* 0&mdash;Rectangular (default)<br /><br /> This parameter is supported only by the Insights API; do not specify this parameter when calling the Images, Trending Images, or Web Search APIs.|Unsigned Integer|No|  
|<a name="cc" />cc|A 2-character country code of the country where the results come from. For a list of possible values, see [Market Codes](#market-codes).<br /><br /> If you set this parameter, you must also specify the [Accept-Language](#acceptlanguage) header. Bing uses the first supported language it finds in the specified languages and combines it with the country code to determine the market to return results for. If the languages list does not include a supported language, Bing finds the closest language and market that supports the request or it uses an aggregated or default market for the results.<br /><br /> Use this query parameter and the `Accept-Language` header only if you specify multiple languages; otherwise, you should use the `mkt` and `setLang` query parameters.<br /><br /> This parameter and the [mkt](#mkt) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="count" />count|The number of images to return in the response. The actual number delivered may be less than requested. The default is 35. The maximum value is 150.<br /><br /> You may use this parameter along with the `offset` parameter to page results. For example, if your user interface presents 20 images per page, you would set `count` to 20 and `offset` to 0 to get the first page of results. For each subsequent page, you would increment `offset` by 20 (for example, 0, 20, 40).<br /><br /> This parameter is supported only by the Image Search API; do not specify this parameter when calling the Insights, Trending Images, or Web Search APIs.|UnsignedShort|No|  
|<a name="id" />id|An ID that uniquely identifies an image. You can use this parameter to ensure that the specified image is the first image in the images list. The [Image](#image) object's `imageId` field contains the ID that you would set this parameter to.|String|No|  
|<a name="imgurl" />imgUrl|The URL to an image that you want to get insights of. Use this parameter as an alternative to specifying the image by using the `insightsToken` parameter.<br /><br /> To specify the image, you may use this parameter or you may place the binary of the image in the body of a POST request (see the [Content-Type](#contenttype) header.<br /><br /> The maximum supported image size is 1 MB.<br /><br /> This parameter is supported only by the Insights API; do not specify this parameter when calling the Images, Trending Images, or Web Search APIs.|String|No|  
|<a name="insightstoken" />insightsToken|The token from a previous Image Search API call (see [imageInsightsToken](#image-imageinsightstoken)). Specify this parameter to get additional information about an image, such as a caption or shopping source. For a list of the additional information that you can get, see the [modulesRequested](#modulesrequested) query parameter.<br /><br /> This parameter is supported only by the Insights API; do not specify this parameter when calling the Images, Trending Images, or Web Search APIs.|String|No|  
|<a name="mkt" />mkt|The market where the results come from. Typically, `mkt` is the country where the user is making the request from. However, it could be a different country if the user is not located in a country where Bing delivers results. The market must be in the form <language code\>-<country code\>. For example, en-US. The string is case insensitive. For a list of possible values that you may specify, see [Market Codes](#market-codes).<br /><br /> **NOTE:** If known, you are encouraged to always specify the market. Specifying the market helps Bing route the request and return an appropriate and optimal response. If you specify a market that is not listed in [Market Codes](#market-codes), Bing uses a best fit market code based on an internal mapping that is subject to change.<br /><br /> This parameter and the [cc](#cc) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="modulesrequested" />modulesRequested|A comma-delimited list of one or more insights to request. (When you URL encode the query string, the commas change to %2C.) The following are the possible case-insensitive values.<br /><br />&nbsp;&nbsp;* All&mdash;Return all insights, if available, except RecognizedEntities.<br /><br />&nbsp;&nbsp;* Annotations&mdash;Provides characteristics of the type of content found in the image. For example, if the image is of a person, the annotations might indicate the person's gender and the type of clothes they're wearing.<br /><br />&nbsp;&nbsp;* BRQ&mdash;Best representative query that describes the image.<br /><br />&nbsp;&nbsp;* Caption&mdash;A caption that provides information about the image. If the caption contains entities, the response may include links to images of those entities.<br /><br />&nbsp;&nbsp;* Collections&mdash;A list of related images.<br /><br />&nbsp;&nbsp;* Recipes&mdash;A list of recipes for cooking the food shown in the images.<br />&nbsp;&nbsp;* PagesIncluding&mdash;A list of webpages that include the image.<br /><br />&nbsp;&nbsp;* RecognizedEntities&mdash;A list of entities (people) that were recognized in the image.<br /><br/>&nbsp;&nbsp;&nbsp;&nbsp; **NOTE:** You may not specify this module with any other module. If you specify it with other modules, the response will not include this module.<br /><br />&nbsp;&nbsp;* RelatedSearches&mdash;A list of related searches that were made by others.<br /><br />&nbsp;&nbsp;* ShoppingSources&mdash;A list of merchants where you can buy related offerings.<br /><br />&nbsp;&nbsp;* SimilarImages&mdash;A list of images that are visually similar to the original image.<br /><br />&nbsp;&nbsp;* SimilarProducts&mdash;A list of images that contain a product that is similar to a product found in the original image.<br /><br /> If you specify a module and there is no data for the module, the response object will not include the related field. For example, if you specify Caption and it does not exist, the response will not include the `imageCaption` field.<br /><br /> To include related searches, the request must include the original query string.<br /><br /> Although the original query string is not required for similar images or products, you should always include it because it can help improve relevance and the results.<br /><br /> This parameter is supported only by the Image Search API; do not specify this parameter when calling the Trending Images API or the Search API.|String|No|  
|<a name="offset" />offset|The zero-based offset that indicates the number of images to skip before returning images. The default is 0. The offset should be less than ([totalEstimatedMatches](#totalestimatedmatches) - `count`).<br /><br /> Use this parameteralong with the `count` parameter to page results. For example, if your user interface presents 20 images per page, you would set `count` to 20 and `offset` to 0 to get the first page of results. For each subsequent page, you would increment `offset` by 20 (for example, 0, 20, 40).<br /><br /> It is possible for multiple pages to include some overlap in results. To prevent duplicates, see [nextOffsetAddCount](#nextoffsetaddcount).<br /><br /> This parameter is supported only by the Image Search API; do not specify this parameter when calling the Trending Images API or the Search API.|Unsigned Short|No|  
|<a name="query" />q|The user's search query string. The query string cannot be empty.<br /><br /> The query string may contain [Bing Advanced Operators](http://msdn.microsoft.com/library/ff795620.aspx). For example, to limit images to a specific domain, use the [site:](http://msdn.microsoft.com/library/ff795613.aspx) operator.<br /><br /> To help improve relevance of an insights query (see [insightsToken](#insightstoken)), you should always include the user's query string.<br /><br /> This parameter is supported only by the Image Search API; do not specify this parameter when calling the Trending Images API.|String|Yes|  
|<a name="safesearch" />safeSearch|Filter images for adult content. The following are the possible filter values.<br /><br />&nbsp;&nbsp;* Off&mdash;May return images with adult content. If the request is through the Image Search API, the response includes thumbnail images that are clear (non-fuzzy). If the request is through the Web Search API, the response includes thumbnail images that are pixelated (fuzzy).<br /><br />&nbsp;&nbsp;* Moderate&mdash;If the request is through the Image Search API, the response will not include images with adult content. If the request is through the Web Search API, the response may include images with adult content (the thumbnail images are pixelated (fuzzy)).<br /><br />&nbsp;&nbsp;* Strict&mdash;Do not return images with adult content.<br /><br /> If not specified, the default is Moderate.<br /><br /> **NOTE:** If the request comes from a market that Bing's adult policy requires `safeSearch` be set to Strict, Bing ignores the `safeSearch` value and uses Strict.<br/><br/>**NOTE:** If you use the `site:` query operator, there is the chance that the response may contain adult content regardless of what the `safeSearch` query parameter is set to. Use `site:` only if you are aware of the content on the site and your scenario supports the possibility of adult content.|String|No|  
|<a name="setlang" />setLang|The language to use for user interface strings. Specify the language using the ISO 639-1 2-letter language code. For example, the language code for English is EN. The default is EN (English).<br /><br /> Although optional, you should always specify the language. Typically, you set `setLang` to the same language specified by `mkt` unless the user wants the user interface strings displayed in a different language.<br /><br /> This parameter and the [Accept-Language](#acceptlanguage) header are mutually exclusive&mdash;do not specify both.<br /><br /> A user interface string is a string that's used as a label in a user interface. There are few user interface strings in the JSON response objects. Any links in the response objects to Bing.com properties will apply the specified language.|String|No|  
  
  
## Filter Query Parameters  

The following are the optional filter query parameters that you can use to filter the images that Bing returns. The query parameter values must be URL encoded.  
  
Only the Image Search API supports these query parameters; do not specify these parameters when calling the Trending Images API or Web Search API.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="aspect" />aspect|Filter images by aspect ratio. The following are the possible filter values.<br /><br />&nbsp;&nbsp;* Square&mdash;Return images with standard aspect ratio<br />&nbsp;&nbsp;* Wide&mdash;Return images with wide screen aspect ratio<br />&nbsp;&nbsp;* Tall&mdash;Return images with tall aspect ratio<br />&nbsp;&nbsp;* All&mdash;Do not filter by aspect. Specifying this value is the same as not specifying the `aspect` parameter.|String|  
|<a name="color" />color|Filter images by color. The following are the possible filter values.<br /><br />&nbsp;&nbsp;* ColorOnly&mdash;Return color images<br />&nbsp;&nbsp;* Monochrome&mdash;Return black and white images<br /><br/>Return images with one of the following dominant colors:<br/><br/>&nbsp;&nbsp;* Black<br />&nbsp;&nbsp;* Blue<br />&nbsp;&nbsp;* Brown<br />&nbsp;&nbsp;* Gray<br />&nbsp;&nbsp;* Green<br />&nbsp;&nbsp;* Orange<br />&nbsp;&nbsp;* Pink<br />&nbsp;&nbsp;* Purple<br />&nbsp;&nbsp;* Red<br />&nbsp;&nbsp;* Teal<br />&nbsp;&nbsp;* White<br />&nbsp;&nbsp;* Yellow|String|  
|<a name="freshness" />freshness|Filter images by when Bing discovered the image. The following are the possible filter values.<br /><br />&nbsp;&nbsp;* Day&mdash;Return images discovered within the last 24 hours<br />&nbsp;&nbsp;* Week&mdash;Return images discovered within the last 7 days<br />&nbsp;&nbsp;* Month&mdash;Return images discovered within the last 30 days|String|  
|<a name="height" />height|Filter images that have the specified height, in pixels.<br /><br /> You may use this filter along with the `size` filter. For example, return small images that have a height of 150 pixels.|UnsignedShort|  
|<a name="imagecontent" />imageContent|Filter images by content. The following are the possible filter values.<br /><br />&nbsp;&nbsp;* Face&mdash;Return images that show only a person's face<br />&nbsp;&nbsp;* Portrait&mdash;Return images that show only a person's head and shoulders|String|  
|<a name="imagetype" />imageType|Filter images by image type. The following are the possible filter values.<br /><br />&nbsp;&nbsp;* AnimatedGif&mdash;Return only animated GIFs<br /><br/>&nbsp;&nbsp;* Clipart&mdash;Return only clip art images<br /><br/>&nbsp;&nbsp;* Line&mdash;Return only line drawings<br /><br/>&nbsp;&nbsp;* Photo&mdash;Return only photographs (excluding line drawings, animated Gifs, and clip art)<br /><br/>&nbsp;&nbsp;* Shopping&mdash;Return only images that contain items where Bing knows of a merchant that is selling the items. This option is valid in the en-US market only.<br /><br/>&nbsp;&nbsp;* Transparent&mdash;Return only images with a transparent background.|String|  
|<a name="license" />license|Filter images by its type of license. The following are the possible filter values.<br /><br />&nbsp;&nbsp;* Any&mdash;Return images that are under any license type. The response only includes images that explicitly specify a license.<br /><br/>&nbsp;&nbsp;* Public&mdash;Return images where the creator has waived their exclusive rights, to the fullest extent allowed by law.<br /><br/>&nbsp;&nbsp;* Share&mdash;Return images that may be shared with others. Changing or editing the image might not be allowed. Also, modifying, sharing, and using the image for commercial purposes might not be allowed. Typically, this option returns the most images.<br /><br/>&nbsp;&nbsp;* ShareCommercially&mdash;Return images that may be shared with others for personal or commercial purposes. Changing or editing the image might not be allowed.<br /><br/>&nbsp;&nbsp;* Modify&mdash;Return images that may be modified, shared, and used. Changing or editing the image might not be allowed. Modifying, sharing, and using the image for commercial purposes might not be allowed.<br /><br/>&nbsp;&nbsp;* ModifyCommercially&mdash;Return images that may be modified, shared, and used for personal or commercial purposes. Typically, this option returns the fewest images.<br /><br/>&nbsp;&nbsp;* All&mdash;Do not filter by license type. Specifying this value is the same as not specifying the `license` parameter.<br /><br /> For more information about these license types, see [Filter Images By License Type](http://go.microsoft.com/fwlink/?LinkId=309768).|String|  
|<a name="size" />size|Filter images by size. The following are the possible filter values.<br /><br />&nbsp;&nbsp;* Small&mdash;Return images that are less than 200x200 pixels<br /><br/>&nbsp;&nbsp;* Medium&mdash;Return images that are greater than or equal to 200x200 pixels but less than 500x500 pixels<br /><br/>&nbsp;&nbsp;* Large&mdash;Return images that are 500x500 pixels or larger<br /><br/>&nbsp;&nbsp;* Wallpaper&mdash;Return wallpaper images.<br /><br/>&nbsp;&nbsp;* All&mdash;Do not filter by size. Specifying this value is the same as not specifying the `size` parameter.<br /><br /> You may use this parameter along with the `height` or `width` parameters. For example, you may use `height` and `size` to request small images that are 150 pixels tall.|String|  
|<a name="width" />width|Filter images that have the specified width, in pixels.<br /><br /> you may use this filter along with the `size` filter. For example, return small images that have a width of 150 pixels.|UnsignedShort|  
  
## Response Objects  

The following are the JSON objects that the response may include. If the request succeeds, the top-level object in the response is the [Images](#images) object if the endpoint is /images/search, [ImageInsightsResponse](#imageinsightsresponse) if the request is for image insights, and [TrendingImages](#trendingimages) if the endpoint is /images/trending. If the request fails, the top-level object is the [ErrorResponse](#errorresponse) object. 
  
|Object|Description|  
|------------|-----------------|  
|[AggregateOffer](#aggregateoffer)|Defines a list of offers from merchants that have offerings that are related to the image.|  
|[AggregateRating](#aggregaterating)|Defines the metrics that indicate how well an item was rated by others.|  
|[Category (ImageInsights)](#category_insights)|Defines a characteristic found in the image.|  
|[Category (TrendingImages)](#category)|Defines the category of trending images.|  
|[CategoryClassification](#categoryclassification)|Defines the categories of the characteristics found in an image.|  
|[Error](#error)|Defines an error that occurred.|  
|[ErrorResponse](#errorresponse)|The top-level object that the response includes when the request fails.|  
|[Image](#image)|An object that contains information about an image that is relevant to the query.|  
|[ImageCaption](#imagecaption)|Defines a caption about the image.|  
|[ImageGallery](#imagegallery)|Defines a link to a webpage that contains the collection of related images.|  
|[ImageInsightsResponse](#imageinsightsresponse)|The top-level object that the response includes when an image insights request succeeds.|  
|[Images](#images)|The top-level object that the response includes when an image request succeeds.|  
|[InsightsSourcesSummary](#insightssourcessummary)|Defines a count of the number of websites where you can shop or perform other actions related to the image.|  
|[MediaSize](#mediasize)|Defines the size of the media content.|  
|[NormalizedRectangle](#normalizedrectangle)|Defines a region of an image.|  
|[Instrumentation](#instrumentation)|Defines the Bing instrumentation URLs.|  
|[Offer](#offer)|Defines a merchant's offer.|  
|[Organization](#organization)|Defines information about a merchant.|  
|[Person](#person)|Defines a person.|  
|[Pivot](#pivot)|Defines the pivot segment.|  
|[ProductSummaryImage](#productsummaryimage)|Defines an image of a product and provides summary information about offers that Bing found online for the product.|  
|[Query](#query_obj)|Defines a search query string.|  
|[Recipe](#recipe)|Defines a cooking recipe.|  
|[RecognizedEntity](#recognizedentity)|Defines a recognized entity.|  
|[RecognizedEntityGroup](#recognizedentitygroup)|Defines a group of previously recognized entities.|  
|[RecognizedEntityRegion](#recognizedentityregion)|Defines a region where an entity was found and a list of entities that might match it.|  
|[Thumbnail](#thumbnail)|Defines a thumbnail image.|  
|[Tile](#thumbnail)|Defines an image tile.|  
|[TrendingImages](#trendingimages)|The top-level object that the response includes when a trending images request succeeds.|  
  
<a name="aggregateoffer"></a>   
### AggregateOffer  
Defines a list of offers from merchants that are related to the image.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|<a name="offers" />offers|A list of offers from merchants that have offerings that are related to the image.|[Offer](#offer)[]|  
  
<a name="aggregaterating"></a>   
### AggregateRating  
Defines the metrics that indicate how well an item was rated by others.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="bestrating" />bestRating|The highest rated review. The possible values are 1.0 through 5.0.|float|  
|<a name="ratingvalue" />ratingValue|The mean (average) rating. The possible values are 1.0 through 5.0.|float|  
|<a name="reviewcount" />reviewCount|The number of times the recipe has been rated or reviewed.|Unsigned Integer|  
|<a name="rating-text" />text|The mean (average) rating, in string form.|String|  
  
<a name="category"></a>   
### Category (TrendingImages)  
Defines the category of trending images.  
  
The TrendingImages namespace defines this object.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|tiles|A list of images that are trending in the category. Each tile contains an image and a Bing query that returns more images of the subject. For example, if the category is Popular People Searches, the image is of a popular person and the query would be to more images of that person.|[Tile](#tile)[]|  
|title|The name of the image category. For example, Popular People Searches.|String|  
  
<a name="category_insights"></a>   
### Category (ImageInsights)  
Defines a characteristic found in the image.  
  
The ImageInsights namespace defines this object.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|confidence|The confidence that Bing has that it correctly identified the category. The possible values are 0.0 through 1.0 where 1.0 indicates that Bing is 100% confident that the category is correct.|Float|  
|name|The name of the category.|String|  
  
<a name="categoryclassification"></a>   
### CategoryClassification  
Defines the categories of the characteristics found in an image.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|categories|A list of characteristics found in the image. For example, if the image is of a musical artist, the array might include Female, Dress, and Music to indicate the person is female, wearing a dress, and is a musical artist.|[Category](#category_insights)[]|  
  
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
The top-level object that the response includes when the request fails.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|Type hint.|String|  
|<a name="errors" />errors|A list of errors that describe the reasons why the request failed.|[Error](#error)[]|  
  
<a name="image"></a>   
### Image  
Defines an image that is relevant to the query.  
  
> [!NOTE]
> Because the URL format and parameters are subject to change without notice, all URLs should be used as-is; you should not take dependencies on the URL format or parameters. The exception is those parameters and values discussed by [Resizing and Cropping Thumbnails](https://docs.microsoft.com/azure/cognitive-services/bing-image-search/resize-and-crop-thumbnails).  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="image-accentcolor" />accentColor|A three-byte hexadecimal number that represents the color that dominates the image. Clients may use the color as the temporary background until the image is loaded.|String|  
|<a name="image-contentsize" />contentSize|The image's file size. The format of the string is {size} {units}, where {units} may be set to B for byte, KB for Kilobyte, etc. For example, 12345 B indicates that the size of the image is 12,345 bytes.|String|  
|<a name="image-contenturl" />contentUrl|The URL to the image on the source website.|String|  
|<a name="image-datepublished" />datePublished|The date and time, in UTC, that Bing discovered the image. The date is in the format, YYYY-MM-DDTHH:MM:SS.|String|  
|<a name="image-encodingformat" />encodingFormat|The image's mime type (for example, jpeg).|String|  
|<a name="image-height" />height|The height of the source image, in pixels.|Unsigned Short|  
|<a name="image-hostpagedisplayurl" />hostPageDisplayUrl|The display URL of the webpage that hosts the image.<br /><br /> You would use this URL in your user interface to identify the host webpage that contains the image. This URL is not a well-formed so don't use it to access the host webpage. The URL does not include the protocol (for example, HTTP) and may include hit highlighting characters. To access the host webpage, use the `hostPageUrl` URL.|String|  
|<a name="image-hostpageurl" />hostPageUrl|The URL of the webpage that includes the image.<br /><br /> This URL and `contentUrl` may be the same URL.|String|  
|id|An ID that uniquely identifies this image in the list of images.<br /><br /> The Image object includes this field only when the image is included in the Search API search results and the ranking response specifies a specific position for the image. For information about how to use this field, see [Using Ranking to Display Results](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/rank-results) in the Web Search API guide.|String|  
|<a name="image-imageid" />imageId|An ID that uniquely identifies this image in the list of images. If you want the image to be the first image in the response, set the [id](#id) query parameter to this ID in your request.|String|  
|<a name="image-imageinsightstoken" />imageInsightsToken|A token that you use in a subsequent call to the Image Search API to get additional information about the image. For information about using this token, see the [insightsToken](#insightstoken) query parameter.|String|  
|insightsSourcesSummary|A count of the number of websites where you can shop or perform other actions related to the image.<br /><br /> For example, if the image is of an apple pie, this object includes a count of the number of websites where you can buy an apple pie. You could then include badging (for example, a shopping cart icon) and the count to indicate the number of offers. When the user clicks the icon, you could use `imageInisghtsToken` to get the list of websites.<br /><br /> For related information about when to display badging, see [displayRecipeSourcesBadges](#displayrecipesourcesbadges) and [displayShoppingSourcesBadges](#displayshoppingsourcesbadges).|[InsightsSourcesSummary](#insightssourcessummary)|  
|<a name="image-name" />name|A title of the image.|String|  
|<a name="image-thumbnail" />thumbnail|The width and height of the thumbnail image (see `thumbnailUrl`).|[MediaSize](#mediasize)|  
|<a name="image-thumbnailurl" />thumbnailUrl|The URL to a thumbnail of the image. For information about resizing the image, see [Resizing Thumbnails](https://docs.microsoft.com/azure/cognitive-services/bing-video-search/resize-and-crop-thumbnails).|String|  
|webSearchUrl|The URL to the Bing search results for this image.|String|  
|<a name="image-width" />width|The width of the source image, in pixels.|Unsigned Short|  
  
<a name="imagecaption"></a>   
### ImageCaption  
Defines an image's caption.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="caption" />caption|A caption about the image.|String|  
|<a name="caption-datasourceurl" />dataSourceUrl|The URL to the website where the caption was found. You must attribute the caption to the source. For example, display the domain name from the URL next to the caption and use the URL to link to the source website.|String|  
|<a name="caption-relatedsearches" />relatedSearches|A list of entities found in the caption. To take the user to images of the entity, use the links in the `Query` object.|[Query](#query)|  
  
<a name="imagegallery"></a>   
### ImageGallery  
Defines a link to a webpage that contains a collection of related images.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="gallery-creator" />creator|The person that owns the collection. You must attribute the collection to the creator.|[Person](#person)|  
|<a name="gallery-description" />description|A description of the collection. The description may be empty.|String|  
|<a name="gallery-followerscount" />followersCount|The number of users on the social network that follow the creator.|Unsigned Integer|  
|<a name="gallery-imagescount" />imagesCount|The number of related images found in the collection.|Unsigned Integer|  
|<a name="gallery-source" />source|The publisher or social network where the images were found. You must attribute the publisher as the source where the collection was found.|String|  
|<a name="gallery-thumbnailurl" />thumbnailUrl|The URL to a thumbnail of one of the images found in the collection.|String|  
|<a name="gallery-url" />url|The URL to the webpage that contains the collection of related images.|String|  
  
<a name="imageinsightsresponse"></a>   
### ImageInsightsResponse  
The top-level object that the response includes when an image insights request succeeds.  
  
For information about requesting image insights, see the [insightsToken](#insightstoken) query parameter.  
  
The [modulesRequested](#modulesrequested) query parameter affects the fields that Bing includes in the response. If you set `modulesRequested` to only Caption, then this object includes only the `imageCaption` field.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|Type hint.|String|  
|<a name="insights-bestrepresentativequery" />bestRepresentativeQuery|The query string that best represents the image. Clicking the link in the `Query` object, takes the user to a webpage with more pictures of the image.|[Query](#query)|  
|categoryClassification|A list of categories that identify the characteristics of the content found in the image. For example, if the image is of a person, the annotations might indicate the person's gender and the type of clothes they're wearing.|[CategoryClassification](#categoryclassification)|  
|<a name="insights-imagecaption" />imageCaption|The caption to use for the image.|[ImageCaption](#imagecaption)|  
|<a name="insights-imageinsightstoken" />imageInsightsToken|A token that you use in a subsequent call to the Image Search API to get additional information about the image. For information about using this token, see the [insightsToken](#insightstoken) query parameter.<br /><br /> This token has the same usage as the token that's included in an [Image](#image) object. Typically, you use this token in the recognize entity scenario where you send Bing an image by using the [imgUrl](#imgurl) query parameter and set the [modulesRequested](#modulesrequested) parameter to RecognizedEntities. The response includes the recognized entities and an insights token that you can use to get additional insights about the image.<br /><br /> If you set modulesRequested to All, you get all available insights in addition to the recognized entities (you do not have to use the insights token in a subsequent call).|String|  
|<a name="insights-pagesincluding" />pagesIncluding|A list of webpages that contain the image. To access the webpage, use the URL in the image's `hostPageUrl` field.|[Image](#image)[]|  
|<a name="insights-recipes" />recipes|A list of recipes related to the image. For example, if the image is of an apple pie, the list would contain recipes for making an apple pie.|[Recipe](#recipe)[]|  
|<a name="insights-recognizedentitygroups" />recognizedEntityGroups|A list of groups that contain images of entities that match the entity found in the specified image. For example, the response might include images from the general celebrity group if the entity was recognized in that group.|[recognizedEntityGroup](#recognizedentitygroup)[]|  
|<a name="insights-relatedcollections" />relatedCollections|A list of links to webpages that contains related images.|[ImageGallery](#imagegallery)[]|  
|<a name="insights-relatedsearches" />relatedSearches|A list of related queries made by others.|[Query](#query)[]|  
|<a name="insights-shoppingsources" />shoppingSources|A list of merchants that are offering items related to the image. For example, if the image is of an apple pie, the list would contain merchants that are selling apple pies.|[AggregateOffer](#aggregateoffer)[]|  
|<a name="insights-visuallysimilarimages" />visuallySimilarImages|A list of images that are visually similar to the original image. For example, if the specified image is of a sunset over a body of water, the list of similar images of other sunsets over a body of water.<br /><br /> If the specified image is of a person, similar images might be of the same person or they might be of persons dressed similarly or in a similar setting.<br /><br /> Note that the criteria for similarity continues to evolve.|[Image](#image)[]|  
|<a name="insights-visuallysimilarproducts" />visuallySimilarProducts|A list of images that contain products that are visually similar to products found in the original image. For example, if the specified image contains a dress, the list of similar images would contain a dress.|[ProductSummaryImage](#productsummaryimage)[]|  
  
<a name="images"></a>   
### Images  
The top-level object that the response includes when an image request succeeds.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|Type hint.|String|  
|displayRecipeSourcesBadges|A Boolean value that determines whether you should include badging to indicate that there are recipes available. Bing sets this flag to **true** when it believes the user's intent is to find recipes. If Bing does not believe the user's intent is to find recipes, this flag is set to **false**.<br /><br /> It is possible for `displayRecipeSourcesBadges` to be **false** although the `recipeSourcesCount` field of [insightsSourcesSummary](#insightssourcessummary) has a value greater than zero.<br /><br /> This flag merely indicates the user's intent. Typically, if the image's `recipeSourcesCount` is greater than zero and `displayRecipeSourcesBadges` is **true**, you would display the recipe badge and count on the image. Otherwise, if `displayRecipeSourcesBadges` is **false**, you would not. For your application, you must decide how to use these fields to determine whether to display the badge.|Boolean|  
|displayShoppingSourcesBadges|A Boolean value that determines whether you should include badging (for example, a shopping cart icon) to indicate that there are shopping sources available. Bing sets this flag to **true** when it believes the user's intent is to shop. If Bing does not believe the user's intent is to shop, this flag is set to **false**.<br /><br /> It is possible for `displayShoppingSourcesBadges` to be **false** although the `shoppingSourcesCount` field of [insightsSourcesSummary](#insightssourcessummary) has a value greater than zero.<br /><br /> This flag merely indicates the user's intent. Typically, if the image's `shoppingSourcesCount` is greater than zero and `displayShoppingSourcesBadges` is **true**, you would display the shopping badge and count on the image. Otherwise, if `displayShoppingSourcesBadges` is **false**, you would not. For your application, you must decide how to use these fields to determine whether to display the badge.|Boolean|  
|id|An ID that uniquely identifies the image answer.<br /><br /> The object includes this field only if the images are included as part of the Web Search API search results. For information about how to use this field, see [Using Ranking to Display Results](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/rank-results) in the Web Search API guide.|String|  
|isFamilyFriendly|A Boolean value that determines whether one or more of the images contain adult content. If none of the images contain adult content, `isFamilyFriendly` is set to **true**. Otherwise, if one or more of the images contain adult content, `isFamilyFriendly` is set to **false**.<br /><br /> If **false**, the thumbnail images are pixelated (fuzzy).<br /><br /> **NOTE:** This field is included only in Web Search API responses, not in Image Search API responses.|Boolean|  
|<a name="nextoffsetaddcount" />nextOffsetAddCount|The number to add to the [offset](#offset) query parameter to ensure that you don't receive duplicates when paging results.<br /><br /> If you set `offset` to 0 and `count` to 30 on your first request, and then set `offset` to 30 on your second request, some of the results in the second response may be duplicates of the first response.<br /><br /> To prevent duplicates, add the value of `nextOffsetAddCount` to the sum of `count` and `offset`. For example, if the current value of `offset` and `count` is 30 and the value of `nextOffsetAddCount` is 9, set `offset` to 69 (count + offset + nextOffsetAddCount).|Integer|  
|<a name="pivotsuggestions" />pivotSuggestions|A list of segments in the original query. For example, if the query was *Red Flowers*, Bing might segment the query into Red and Flowers.<br /><br /> The Flowers pivot may contain query suggestions such as Red Peonies and Red Daisies, and the Red pivot may contain query suggestions such as Green Flowers and Yellow Flowers.|[Pivot](#pivot)|  
|<a name="queryexpansions" />queryExpansions|A list of expanded queries that narrows the original query. For example, if the query was *Microsoft Surface*, the expanded queries might be: Microsoft Surface **Pro 3**, Microsoft Surface **RT**, Microsoft Surface **Phone**, and Microsoft Surface **Hub**.|[Query](#query)|  
|readLink|The URL that returns this answer. To use the URL, you must append query parameters as appropriate and include the [Ocp-Apim-Subscription-Key](#subscriptionkey) header.<br /><br /> Both the Image Search API and Search API responses include this field. Typically, you'd use the URL when it's included in a Search response and you want to query the Image Search API directly.|String|  
|<a name="totalestimatedmatches" />totalEstimatedMatches|The estimated number of images that are relevant to the query. Use this number along with the [count](#count) and [offset](#offset) query parameters to page the results.<br /><br /> The object includes this field only when calling the Image Search API, the object will not include this field when you call the Web Search API.|Long|  
|<a name="images-value" />value|A list of images that are relevant to the query.<br /><br /> If there are no results, the array is empty.|[Image](#image)[]|  
|webSearchUrl|The URL to the Bing search results for the requested images.|String|  
  
<a name="insightssourcessummary"></a>   
### InsightsSourcesSummary  
 Defines a count of the number of websites where you can shop or perform other actions related to the image.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|recipeSourcesCount|The number of websites that offer recipes related to the subject of the image.|Unsigned Integer|  
|shoppingSourcesCount|The number of websites that offer goods or services related to the subject of the image.|Unsigned Integer|  
  
  
<a name="mediasize"></a>   
### MediaSize  
Defines the size of the media content.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|height|The height of the media content, in pixels.|Integer|  
|width|The width of the media content, in pixels.|Integer|  
  
<a name="normalizedrectangle"></a>   
### NormalizedRectangle  
Defines a region of an image. The region is defined by the coordinates of the top, left corner and bottom, right corner of the region. The coordinates are fractional values of the original image's width and height in the range 0.0 through 1.0.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|bottom|The bottom coordinate.|Float|  
|left|The left coordinate.|Float|  
|right|The right coordinate|Float|  
|top|The top coordinate|Float|  
  
<a name="offer"></a>   
### Offer  
Defines a merchant's offer.  
  
This object is used by both ShoppingSources insights and SimilarProducts insights. For the insight that the field applies to, see the description.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|aggregateRating|An aggregated rating that indicates how well the product has been rated by others.<br /><br /> Used by SimilarProducts.|[AggregateRating](#aggregaterating)|  
|availability|The availability of the item being offered. The following are the possible values.<br /><br />&nbsp;&nbsp;* Discontinued<br />&nbsp;&nbsp;* InStock<br />&nbsp;&nbsp;* InStoreOnly<br />&nbsp;&nbsp;* LimitedAvailability<br />&nbsp;&nbsp;* OnlineOnly<br />&nbsp;&nbsp;* OutOfStock<br />&nbsp;&nbsp;* PreOrder<br />&nbsp;&nbsp;* SoldOut<br /><br /> Used by ShoppingSources.|String|  
|lowPrice|The lowest price for the product that Bing found online.<br /><br /> Used by SimilarProducts.|Float|  
|name|The name of the product being offered.|String|  
|<a name="offer-offercount" />offerCount|The number of offers that Bing found online.<br /><br /> Used by SimilarProducts.|Unsigned Integer|  
|price|The price at which the product is being offered.<br /><br /> Used by ShoppingSources.|Float|  
|priceCurrency|The monetary currency. For example, USD.|String|  
|seller|The merchant's name.<br /><br /> Used by ShoppingSources.|[Organization](#organization)|  
|url|The URL that takes the user to the offer on the merchant's website.<br /><br /> Used by ShoppingSources.|String|  
  
<a name="organization"></a>   
### Organization  
Defines information about a merchant.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|image|The merchant's logo. The `Image` object will include only the `url` field.|[Image](#image)|  
|name|The merchant's name.|String|  
  
<a name="person"></a>   
### Person  
Defines a person.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|Type hint.|String|  
|description|A short description of the person|String|  
|image|An image of the person.|[Image](#image)|  
|jobTitle|The person's job title|String|  
|name|The person's name.|String|  
|url|The URL to the person's social network home page, if applicable.|String|  
|webSearchUrl|The URL that takes the user to the Bing search results page for a query that contains this person's name.|String|  
  
<a name="pivot"></a>   
### Pivot  
Defines the pivot segment.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="pivot-pivot" />pivot|The segment from the original query to pivot on.|String|  
|<a name="pivot-suggestions" />suggestions|A list of suggested queries for the pivot.|[Query](#query)|  
  
<a name="productsummaryimage"></a>   
### ProductSummaryImage  
Defines an image of a product and provides summary information about offers that Bing found online for the product.  
  
> [!NOTE]
> Because the URL format and parameters are subject to change without notice, all URLs should be used as-is; you should not take dependencies on the URL format or parameters. The exception is those parameters and values discussed by [Resizing and Cropping Thumbnails](https://docs.microsoft.com/azure/cognitive-services/bing-image-search/resize-and-crop-thumbnails).  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|accentColor|A three-byte hexadecimal number that represents the color that dominates the image. Clients may use the color as the temporary background until the image is loaded.|String|  
|aggregateOffer|A summary of the offers that Bing found online for the product in the image. For example, if the image is of a dress, the offer identifies the lowest price of the dress and the number of offers found.|[Offer](#offer)|  
|contentSize|The image's file size. The format of the string is {size} {units}, where {units} may be set to B for byte, KB for Kilobyte, and so on. For example, 12345 B indicates that the size of the image is 12,345 bytes.|String|  
|contentUrl|The URL to the image on the source website.|String|  
|datePublished|The date and time that Bing discovered the image. The date is in the format, YYYY-MM-DDTHH:MM:SS.|String|  
|encodingFormat|The image's mime type (for example, jpeg).|String|  
|height|The height of the source image, in pixels.|Unsigned Short|  
|hostPageDisplayUrl|The display URL of the webpage that hosts the image.<br /><br /> You may use this URL in your user interface to identify the host webpage that contains the image. This URL is not a well-formed so don't use it to access the host webpage. The URL does not include the protocol (for example, HTTP) and may include hit highlighting characters.. To access the host webpage, use the URL found in the `hostPageUrl` property.|String|  
|hostPageUrl|The URL of the webpage that includes the image.<br /><br /> This URL and `contentUrl` may be the same URL.|String|  
|id|An ID that uniquely identifies this image in the list of images.<br /><br /> The Image object includes this field only when the image is included in the Web Search API search results and the ranking response specifies a specific position for the image. For information about how to use this field, see [Using Ranking to Display Results](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/rank-results) in the Web Search API guide.|String|  
|imageId|An ID that uniquely identifies this image in the list of images. You can use the ID in a subsequent request to ensure that this image is the first returned image in the list of images. To ensure that this image is the first image in the list, include the `id` query parameter and set it to the image ID.|String|  
|imageInsightsToken|A token that you use in a subsequent call to the Image Search API to get additional information about the image. For information about using this token, see the [insightsToken](#insightstoken) query parameter.|String|  
|insightsSourcesSummary|A count of the number of websites where you can shop or perform other actions related to the image.<br /><br /> For example, if the image is of an apple pie, this object includes a count of the number of websites where you can buy an apple pie. You could then include badging (for example, a shopping cart icon) and the count to indicate the number of offers. When the user clicks the icon, you could use `imageInisghtsToken` to get the list of websites.<br /><br /> For related information about when to display badging, see [displayRecipeSourcesBadges](#displayrecipesourcesbadges) and [displayShoppingSourcesBadges](#displayshoppingsourcesbadges).|[InsightsSourcesSummary](#insightssourcessummary)|  
|name|A title of the image.|String|  
|thumbnail|The width and height of the thumbnail image (see `thumbnailUrl`).|[MediaSize](#mediasize)|  
|thumbnailUrl|The URL to a thumbnail of the image. For information about resizing the image, see [Resizing Thumbnails](https://docs.microsoft.com/azure/cognitive-services/bing-image-search/resize-and-crop-thumbnails).|String|  
|webSearchUrl|A URL to the Bing search results for this image.|String|  
|width|The width of the source image, in pixels.|Unsigned Short|  
  
<a name="query_obj"></a>   
### Query  
Defines a search query string.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|displayText|The display version of the query string.<br /><br /> For expanded queries (see [queryExpansions](#queryexpansions)) and pivot suggestions (see [pivotSuggestions](#pivotsuggestions)), this field identifies the term that expanded the original query. For example, if the query was Microsoft Surface and the expanded query is Microsoft Surface RT, `displayText` would contain RT.|String|  
|searchLink|The URL that you use to get the results of the related search. Before using the URL, you must append query parameters as appropriate and include the [Ocp-Apim-Subscription-Key](#subscriptionkey) header.<br /><br /> Use this URL if you're displaying the results in your own user interface; otherwise, use the `webSearchUrl` URL.|String|  
|text|The query string.|String|  
|thumbnail|The URL to a thumbnail of a related image.<br /><br /> The object includes this field only for pivot suggestions and related searches.|[Thumbnail](#thumbnail)|  
|webSearchUrl|The URL that takes the user to the Bing search results page for the query.<br /><br /> Use this URL if you're not displaying the results in your own user interface; otherwise, use the `searchUrl` URL.<br /><br /> Included only for related searches.|String|  
  
<a name="recipe"></a>   
### Recipe  
Defines a cooking recipe.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|aggregateRating|Aggregated ratings that indicate how well the recipe has been rated by others.|[AggregateRating](#aggregaterating)|  
|cookTime|The amount of time the food takes to cook. For example, PT25M. For information about the time format, see [Durations](http://en.wikipedia.org/wiki/ISO_8601#Durations) on Wikipedia.com.|String|  
|creator|The recipe's author.|[Person](#person)|  
|name|The name of the recipe.|String|  
|prepTime|The amount of time required to prepare the ingredients. For example, PT15M. For information about the time format, see [Durations](http://en.wikipedia.org/wiki/ISO_8601#Durations) on Wikipedia.com.|String|  
|thumbnailUrl|The URL to a thumbnail image of the prepared food.|String|  
|totalTime|The total amount of time it takes to prepare and cook the recipe. For example, PT45M. For information about the time format, see [Durations](http://en.wikipedia.org/wiki/ISO_8601#Durations) on Wikipedia.com.|String|  
|url|The URL that takes the user to the webpage that contains the recipe.|String|  
  
<a name="recognizedentity"></a>   
### RecognizedEntity  
Defines a recognized entity.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|entity|The entity that was recognized.<br /><br /> The following are the possible entity objects.<br /><br />&nbsp;&nbsp;* [Person](#person)|Object|  
|matchConfidence|The confidence that Bing has that the entity in the image matches this entity. The confidence ranges from 0.0 through 1.0 with 0.0 being not confident and 1.0 being confident.|Float|  
  
<a name="recognizedentitygroup"></a>   
### RecognizedEntityGroup  
Defines a group of previously recognized entities.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|name|The name of the group where images of the entity were also found.<br /><br /> The following are possible groups.<br /><br />&nbsp;&nbsp;* CelebRecognitionAnnotations&mdash;Similar to CelebrityAnnotations but provides a higher probability of an accurate match.<br /><br/>&nbsp;&nbsp;* CelebrityAnnotations&mdash;Contains celebrities such as actors, politicians, athletes, and historical figures.|String|  
|recognizedEntityRegions|The regions of the image that contain entities.|[RecognizedEntityRegion](#recognizedentityregion)[]|  
  
<a name="recognizedentityregion"></a>   
### RecognizedEntityRegion  
Defines a region of the image where an entity was found and a list of entities that might match it.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|matchingEntities|A list of entities that Bing believes match the entity found in the region. The entities are in descending order of confidence (see the `matchConfidence` field of RecognizedEntity).|[RecognizedEntity](#recognizedentity)[]|  
|region|A region of the image that contains an entity.<br /><br /> The values of the rectangle are relative to the width and height of the original image and are in the range 0.0 through 1.0.<br /><br /> For example, if the image is 300x200 and the region's top, left corner is at point (10, 20) and the bottom, right corner is at point (290, 150), then the normalized rectangle is:<br /><br /> Left = 0.0333333333333333<br /><br /> Top = 0.1<br /><br /> Right = 0.9666666666666667<br /><br /> Bottom = 0.75<br /><br /> For people, the region represents the person's face.|[NormalizedRectangle](#normalizedrectangle)|  
  
<a name="thumbnail"></a>   
### Thumbnail  
Defines a thumbnail of an image.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|url|The URL to a thumbnail of an image.|String|  
  
<a name="tile"></a>   
### Tile  
Defines an image tile.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|image|The URL to the image's thumbnail.|[Image](#image)|  
|query|A query that returns a Bing search results page with more images of the subject. For example, if the category is Popular People Searches, then the thumbnail in the `image` field would be of a popular person. To return more images of the person, use the links in the `Query` object.|[Query](#query_obj)|  
  
<a name="trendingimages"></a>   
### TrendingImages  
The top-level object that the response includes when a trending images request succeeds.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|categories|A list that identifies categories of images and a list of trending images in that category.|[Category](#category)[]|  
  

## Error Codes 

[!INCLUDE [bing-error-codes](../includes/bing-error-codes.md)]

## Market Codes 

[!INCLUDE [bing-market-codes](../includes/bing-market-codes.md)]
