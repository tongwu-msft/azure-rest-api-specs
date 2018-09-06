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

The Custom Image Search API lets you send a search query to Bing and get back a list of relevant images from the slice of Web that your Custom Search instance defines. For information about configuring a Custom Search instance, see [Configure your custom search experience](https://docs.microsoft.com/azure/cognitive-services/bing-custom-search/define-your-custom-view).

For information about the headers that requests should include, see [Request Headers](#headers).  
  
For information about the query parameters that requests should include, see [Query Parameters](#query-parameters).  
  
For information about the JSON response objects that responses may include, see [Response Objects](#response-objects).  

For information about permitted use and display of results, see [Bing Search API Use and Display requirements](https://docs.microsoft.com/azure/cognitive-services/bing-custom-search/use-and-display-requirements).

  
## Endpoints  

To request images from your Custom Search instance, send a GET request to the following URL:
  
`https://api.cognitive.microsoft.com/bingcustomsearch/v7.0/images/search`

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
|<a name="cc" />cc|A two-character country code of the country where the results come from. For a list of possible values, see [Market Codes](#market-codes).<br /><br /> If you set this parameter, you must also specify the [Accept-Language](#acceptlanguage) header. Bing uses the first supported language it finds in the specified languages and combines it with the country code to determine the market to return results for. If the languages list does not include a supported language, Bing finds the closest language and market that supports the request. Or, Bing may use an aggregated or default market for the results.<br /><br /> Use this query parameter and the `Accept-Language` header only if you specify multiple languages. Otherwise, you should use the `mkt` and `setLang` query parameters.<br /><br /> This parameter and the [mkt](#mkt) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="count" />count|The number of images to return in the response. The actual number delivered may be less than requested. The default is 35. The maximum value is 150.<br /><br /> You use this parameter along with the `offset` parameter to page results. For example, if your user interface displays 20 images per page, set `count` to 20 and `offset` to 0 to get the first page of results. For each subsequent page, increment `offset` by 20 (for example, 0, 20, 40).|UnsignedShort|No|  
|<a name="customconfig" />customConfig|Unique identifier that identifies your custom search instance.<br /><br />|String|Yes
|<a name="mkt" />mkt|The market where the results come from. Typically, `mkt` is the country where the user is making the request from. However, it could be a different country if the user is not located in a country where Bing delivers results. The market must be in the form \<language code\>-\<country code\>. For example, en-US. The string is case insensitive. For a list of possible market values, see [Market Codes](#market-codes).<br /><br /> **NOTE:** If known, you are encouraged to always specify the market. Specifying the market helps Bing route the request and return an appropriate and optimal response. If you specify a market that is not listed in [Market Codes](#market-codes), Bing uses a best fit market code based on an internal mapping that is subject to change.<br /><br /> This parameter and the [cc](#cc) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="offset" />offset|The zero-based offset that indicates the number of images to skip before returning images. The default is 0. The offset should be less than ([totalEstimatedMatches](#totalestimatedmatches) - `count`).<br /><br /> To page results, use this parameter along with the `count` parameter. For example, if your user interface displays 20 images per page, set `count` to 20 and `offset` to 0 to get the first page of results. For each subsequent page, increment `offset` by 20 (for example, 0, 20, 40).<br /><br /> It is possible for multiple pages to include some overlap in results. To prevent duplicates, see [nextOffset](#nextoffset).|Unsigned Short|No|  
|<a name="query" />q|The user's search query term. The term cannot be empty.<br /><br />**NOTE:** The query string must not contain [Bing Advanced Operators](http://msdn.microsoft.com/library/ff795620.aspx). Including them may adversely affect the custom search experience.|String|Yes|  
|<a name="safesearch" />safeSearch|Filter images for adult content. The following are the possible filter values.<br /><ul><li>Off&mdash;May return images with adult content. If the request is through the Image Search API, the response includes thumbnail images that are clear (non-fuzzy). However, if the request is through the Web Search API, the response includes thumbnail images that are pixelated (fuzzy).<br /><br /></li><li>Moderate&mdash;If the request is through the Image Search API, the response doesn't include images with adult content. If the request is through the Web Search API, the response may include images with adult content (the thumbnail images are pixelated (fuzzy)).<br /><br /></li><li>Strict&mdash;Do not return images with adult content.</li></ul><br /> The default is Moderate.<br /><br /> **NOTE:** If the request comes from a market that Bing's adult policy requires that `safeSearch` is set to Strict, Bing ignores the `safeSearch` value and uses Strict.<br/><br/>**NOTE:** If you use the `site:` query operator, there is the chance that the response may contain adult content regardless of what the `safeSearch` query parameter is set to. Use `site:` only if you are aware of the content on the site and your scenario supports the possibility of adult content.|String|No|  
|<a name="setlang" />setLang|The language to use for user interface strings. Specify the language using the ISO 639-1 2-letter language code. For example, the language code for English is EN. The default is EN (English).<br /><br /> Although optional, you should always specify the language. Typically, you set `setLang` to the same language specified by `mkt` unless the user wants the user interface strings displayed in a different language.<br /><br /> This parameter and the [Accept-Language](#acceptlanguage) header are mutually exclusive&mdash;do not specify both.<br /><br /> A user interface string is a string that's used as a label in a user interface. There are few user interface strings in the JSON response objects. Also, any links to Bing.com properties in the response objects apply the specified language.|String|No|  


## Filter query parameters 
 
The following are the optional filter query parameters that you can use to filter the images that Bing returns. You must URL encode the query parameters.  
  
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

The following are the JSON objects that the response may include. If the request succeeds, the top-level object in the response is the [Images](#images) object. If the request fails, the top-level object is the [ErrorResponse](#errorresponse) object. 
  
|Object|Description|  
|------------|-----------------|  
|[Error](#error)|Defines an error that occurred.|  
|[ErrorResponse](#errorresponse)|The top-level object that the response includes when the request fails.|  
|[Image](#image)|Defines an image that is relevant to the query.|  
|[Images](#images)|The top-level object that the response includes when an image request succeeds.|  
|[MediaSize](#mediasize)|Defines the size of the media content.|  
|[Instrumentation](#instrumentation)|Defines the Bing instrumentation URLs.|  
|[Pivot](#pivot)|Defines the pivot segment.|  
|[Query](#query_obj)|Defines a search query string.|  
|[Thumbnail](#thumbnail)|Defines a thumbnail image.|  


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

  
<a name="image"></a>   
### Image  
Defines an image that is relevant to the query.  
  
> [!NOTE]
> Because the URL format and parameters are subject to change without notice, use all URLs as-is. You should not take dependencies on the URL format or parameters. The exception is those parameters and values discussed by [Resizing and Cropping Thumbnails](https://docs.microsoft.com/azure/cognitive-services/bing-image-search/resize-and-crop-thumbnails).  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="image-accentcolor" />accentColor|A three-byte hexadecimal number that represents the color that dominates the image. Use the color as the temporary background in your client until the image is loaded.|String|  
|<a name="image-contentsize" />contentSize|The image's file size. The format of the string is {size} {units}. For example, 12345 B indicates that the size of the image is 12,345 bytes.|String|  
|<a name="image-contenturl" />contentUrl|The URL to the image on the source website.|String|  
|<a name="image-datepublished" />datePublished|The date and time, in UTC, that Bing discovered the image. The date is in the format, YYYY-MM-DDTHH:MM:SS.|String|  
|<a name="image-encodingformat" />encodingFormat|The image's mime type (for example, jpeg).|String|  
|<a name="image-height" />height|The height of the source image, in pixels.|Unsigned Short|  
|<a name="image-hostpagedisplayurl" />hostPageDisplayUrl|The display URL of the webpage that hosts the image.<br /><br /> Use this URL in your user interface to identify the host webpage that contains the image. The URL is not a well-formed and should not be used to access the host webpage. To access the host webpage, use the `hostPageUrl` URL.|String|  
|<a name="image-hostpageurl" />hostPageUrl|The URL of the webpage that includes the image.<br /><br /> This URL and `contentUrl` may be the same URL.|String|  
|<a name="image-id" />id|An ID that uniquely identifies this image in the list of images.<br /><br /> Only Web Search API responses include this field. For information about how to use this field, see [Using Ranking to Display Results](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/rank-results) in the Web Search API guide.|String|  
|<a name="image-imageid" />imageId|An ID that uniquely identifies this image. If you want the image to be the first image in the response, set the [id](#id) query parameter to this ID in your request.|String|  
|<a name="image-name" />name|A title of the image.|String|  
|<a name="image-thumbnail" />thumbnail|The width and height of the thumbnail image (see `thumbnailUrl`).|[MediaSize](#mediasize)|  
|<a name="image-thumbnailurl" />thumbnailUrl|The URL to a thumbnail of the image. For information about resizing the image, see [Resizing Thumbnails](https://docs.microsoft.com/azure/cognitive-services/bing-video-search/resize-and-crop-thumbnails).|String|  
|webSearchUrl|The URL to the Bing search results for this image.|String|  
|<a name="image-width" />width|The width of the source image, in pixels.|Unsigned Short|  


<a name="images"></a>   
### Images  
The top-level object that the response includes when an image request succeeds.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|A type hint, which is set to Images.|String|  
|id|An ID that uniquely identifies the image answer.<br /><br /> The object includes this field only in a Web Search API response. For information about how to use this field, see [Using Ranking to Display Results](https://docs.microsoft.com/azure/cognitive-services/bing-web-search/rank-results) in the Web Search API guide.|String|  
|<a name="isfamilyfriendly" />isFamilyFriendly|A Boolean value that determines whether one or more of the images contain adult content. If none of the images contain adult content, `isFamilyFriendly` is set to **true**. Otherwise, if one or more of the images contain adult content, `isFamilyFriendly` is set to **false**.<br /><br /> If **false**, the thumbnail images are pixelated (fuzzy).<br /><br /> **NOTE:** This field is included only in Web Search API responses, not in Image Search API responses.|Boolean|  
|<a name="nextoffset" />nextOffset|The offset value that you set the [offset](#offset) query parameter to.<br /><br /> If you set `offset` to 0 and `count` to 30 in your first request, and then set `offset` to 30 in your second request, some of the results in the second response may be duplicates of the first response.<br /><br /> To prevent duplicates, set `offset` to the value of `nextOffset`.|Integer|  
|<a name="pivotsuggestions" />pivotSuggestions|A list of segments in the original query. For example, if the query was *Red Flowers*, Bing might segment the query into *Red* and *Flowers*.<br /><br /> The Flowers pivot may contain query suggestions such as Red Peonies and Red Daisies, and the Red pivot may contain query suggestions such as Green Flowers and Yellow Flowers.|[Pivot](#pivot)|  
|<a name="queryexpansions" />queryExpansions|A list of expanded queries that narrows the original query. For example, if the query was *Microsoft Surface*, the expanded queries might be: Microsoft Surface **Pro 3**, Microsoft Surface **RT**, Microsoft Surface **Phone**, and Microsoft Surface **Hub**.|[Query](#query_obj)|  
|readLink|The URL that returns this answer. To use the URL, append query parameters as appropriate and include the [Ocp-Apim-Subscription-Key](#subscriptionkey) header.<br /><br /> The Web Search API response includes this field. Typically, you'd use the URL if you want to query the Image Search API directly.|String|  
|<a name="similarterms" />similarTerms|A list of terms that are similar in meaning to the user's query term.|[Query](#query_obj)|  
|<a name="totalestimatedmatches" />totalEstimatedMatches|The estimated number of images that are relevant to the query. Use this number along with the [count](#count) and [offset](#offset) query parameters to page the results.<br /><br /> Only the Image Search API includes this field.|Long|  
|<a name="images-value" />value|A list of images that are relevant to the query.<br /><br /> If there are no results, the array is empty.|[Image](#image)[]|  
|webSearchUrl|The URL to the Bing search results for the requested images.|String|  

  
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
|<a name="pivot-suggestions" />suggestions|A list of suggested queries for the pivot.|[Query](#query_obj)|  

  
<a name="query_obj"></a>   
### Query  
Defines a search query string.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|displayText|The display version of the query term.<br /><br /> For expanded queries (see [queryExpansions](#queryexpansions)) and pivot suggestions (see [pivotSuggestions](#pivotsuggestions)), this field identifies the term that expanded the original query. For example, if the query was *Microsoft Surface* and the expanded query is *Microsoft Surface RT*, `displayText` would contain *RT*.|String|  
|searchLink|The URL that you use to get the results of the related search. Before using the URL, you must append query parameters as appropriate and include the [Ocp-Apim-Subscription-Key](#subscriptionkey) header.<br /><br /> Use this URL if you're displaying the results in your own user interface. Otherwise, use the `webSearchUrl` URL.|String|  
|text|The query term.|String|  
|thumbnail|The URL to a thumbnail of a related image.<br /><br /> The object includes this field only for pivot suggestions and related searches.|[Thumbnail](#thumbnail)|  
|webSearchUrl|The URL that takes the user to the Bing search results page for the query.<br /><br /> Use this URL if you're not displaying the results in your own user interface. Otherwise, use the `searchUrl` URL.<br /><br /> Included only for related searches.|String|  
  
  
<a name="thumbnail"></a>   
### Thumbnail  
Defines a thumbnail of an image.  
  
|Element|Description|Type|  
|-------------|-----------------|----------|  
|url|The URL to a thumbnail of an image.|String|  




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
