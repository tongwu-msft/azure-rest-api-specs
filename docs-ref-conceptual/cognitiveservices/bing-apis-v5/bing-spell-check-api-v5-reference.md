---
title: Bing Spell Check API v5 reference | Microsoft Docs
description: Describes the programming elements of the Bing Video Search API.
services: cognitive-services
author: swhite-msft
manager: ehansen

ms.assetid: 2CB12DAB-1659-4AC1-8018-6A1D481E625F
ms.service: cognitive-services
ms.technology: bing-spell-check
ms.topic: article
ms.date: 06/21/2016
ms.author: scottwhi
---

# Spell Check API v5 Reference

The Spell Check API lets you check a text string for spelling and grammar errors. This section provides technical details about the query parameters and headers that you use to request spell checking, and the JSON response objects that contain the results. For examples that show how to make requests, see [Proofing a Text String](https://docs.microsoft.com/azure/cognitive-services/bing-spell-check/proofing-text).  
  
For details about the headers that requests should include, see [Request Headers](#headers).  
  
For details about the query parameters that requests should include, see [Query Parameters](#query-parameters).  
  
For details about the JSON objects that the response may include, see [Response Objects](#response-objects). 
 
## Endpoints
  
To check the spelling and grammar of a block of text, send a GET or POST request to:  
  
```
https://api.cognitive.microsoft.com/bing/v5.0/SpellCheck
```  
  
The request must use the HTTPS protocol.  
  
Because of the query string length limit, you typically use a POST request unless you're checking only short strings.  
  
> [!NOTE]
> The maximum URL length is 2,048 characters. To ensure that your URL length does not exceed the limit, the maximum length of your query parameters should be less than 1,500 characters. If the URL exceeds 2,048 characters, the server returns 404 Not found.  
  
  
## Request Headers  

The following are the headers that a request and response may include.  
  
|Header|Description|  
|------------|-----------------|  
|Accept|Optional request header.<br /><br /> The default media type is application/json. To specify that the response use [JSON-LD](http://json-ld.org/), set the Accept header to application/ld+json.|  
|<a name="acceptlanguage" />Accept-Language|Optional request header.<br /><br /> A comma-delimited list of languages to use for user interface strings. The list is in decreasing order of preference. For more information, including expected format, see [RFC2616](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html).<br /><br /> This header and the [setLang](#setlang) query parameter are mutually exclusive&mdash;do not specify both.<br /><br /> If you set this header, you must also specify the [cc](#cc) query parameter. To to determine the market to return results for, Bing uses the first supported language it finds from the list and combines it with the `cc` parameter value. If the list does not include a supported language, Bing finds the closest language and market that supports the request or it uses an aggregated or default market for the results. To determine the market that Bing used, see the BingAPIs-Market header.<br /><br /> Use this header and the `cc` query parameter only if you specify multiple languages. Otherwise, use the [mkt](#mkt) and [setLang](#setlang) query parameters.<br /><br /> A user interface string is a string that's used as a label in a user interface. There are few user interface strings in the JSON response objects. Any links to Bing.com properties in the response objects apply the specified language.|  
|<a name="market" />BingAPIs-Market|Response header.<br /><br /> The market used by the request. The form is \<languageCode\>-\<countryCode\>. For example, en-US.<br /><br /> If you specify a market that is not listed in [Market Codes](#market-codes), this value may differ from the market you specified in the [mkt](#mkt) query parameter. The same is true if you specify values for [cc](#cc) and [Accept-Language](#acceptlanguage) that can't be reconciled.|  
|<a name="traceid" />BingAPIs-TraceId|Response header.<br /><br /> The ID of the log entry that contains the details of the request. When an error occurs, capture this ID. If you are not able to determine and resolve the issue, include this ID along with the other information that you provide the Support team.|  
|<a name="subscriptionkey" />Ocp-Apim-Subscription-Key|Required request header.<br /><br /> The subscription key that you received when you signed up for this service in [Cognitive Services](https://www.microsoft.com/cognitive-services/).|  
|<a name="retryafter" />Retry-After|Response header.<br /><br /> The response includes this header if you exceed the number of queries allowed per second (QPS) or per month (QPM). The header contains the number of seconds that you must wait before sending another request.|  
|<a name="useragent" />User-Agent|Optional request header.<br /><br /> The user agent originating the request. Bing uses the user agent to provide mobile users with an optimized experience. Although optional, you are encouraged to always specify this header.<br /><br /> The user-agent should be the same string that any commonly used browser sends. For information about user agents, see [RFC 2616](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html).<br /><br /> The following are examples of user-agent strings.<br /><br /><ul><li>Windows Phone&mdash;Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 822)</li><li>Android&mdash;Mozilla/5.0 (Linux; U; Android 2.3.5; en-us; SCH-I500 Build/GINGERBREAD) AppleWebKit/533.1 (KHTML; like Gecko) Version/4.0 Mobile Safari/533.1</li><li>iPhone&mdash;Mozilla/5.0 (iPhone; CPU iPhone OS 6_1 like Mac OS X) AppleWebKit/536.26 (KHTML; like Gecko) Mobile/10B142 iPhone4;1 BingWeb/3.03.1428.20120423</li><li>PC&mdash;Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; Touch; rv:11.0) like Gecko</li><li>iPad&mdash;Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53</li></ul>|
|<a name="clientid" />X-MSEdge-ClientID|Optional request and response header.<br /><br /> Bing uses this header to provide users with consistent behavior across Bing API calls. Bing often flights new features and improvements, and it uses the client ID as a key for assigning traffic on different flights. If you do not use the same client ID for a user across multiple requests, then Bing may assign the user to multiple conflicting flights. Being assigned to multiple conflicting flights can lead to an inconsistent user experience. For example, if the second request has a different flight assignment than the first, the experience may be unexpected. Also, Bing can use the client ID to tailor web results to that client ID’s search history, providing a richer experience for the user.<br /><br /> Bing also uses this header to help improve result rankings by analyzing the activity generated by a client ID. The relevance improvements help with better quality of results delivered by Bing APIs and in turn enables higher click-through rates for the API consumer.<br /><br /> **IMPORTANT:** Although optional, you should consider this header required. Persisting the client ID across multiple requests for the same end user and device combination enables 1) the API consumer to receive a consistent user experience, and 2) higher click-through rates via better quality of results from the Bing APIs.<br /><br /> The following are the basic usage rules that apply to this header.<br /><br /><ul><li>Each user that uses your application on the device must have a unique, Bing generated client ID.<br /><br/>If you do not include this header in the request, Bing generates an ID and returns it in the X-MSEdge-ClientID response header. The only time that you should NOT include this header in a request is the first time the user uses your app on that device.<br /><br/></li><li>Use the client ID for each Bing API request that your app makes for this user on the device.<br /><br/></li><li>Persist the client ID. To persist the ID in a browser app, use a persistent HTTP cookie to ensure the ID is used across all sessions. Do not use a session cookie. For other apps such as mobile apps, use the device's persistent storage to persist the ID.<br /><br/>The next time the user uses your app on that device, get the client ID that you persisted.</li></ul><br /><br /> **NOTE:** Bing responses may or may not include this header. If the response includes this header, capture the client ID and use it for all subsequent Bing requests for the user on that device.<br /><br /> **NOTE** If you include the X-MSEdge-ClientID, you must not include cookies in the request.|  
|<a name="clientip" />X-Search-ClientIP|Optional request header.<br /><br /> The IPv4 or IPv6 address of the client device. The IP address is used to discover the user's location. Bing uses the location information to determine safe search behavior.<br /><br /> **NOTE:** Although optional, you are encouraged to always specify this header and the X-Search-Location header.<br /><br /> Do not obfuscate the address (for example, by changing the last octet to 0). Obfuscating the address results in the location not being anywhere near the device's actual location, which may result in Bing serving erroneous results.|  
|<a name="location" />X-Search-Location|Optional request header.<br /><br /> A semicolon-delimited list of key/value pairs that describe the client's geographical location. Bing uses the location information to determine safe search behavior and to return relevant local content. Specify the key/value pair as <key\>:<value\>. The following are the keys that you use to specify the user's location.<br /><br /><ul><li>lat&mdash;Required. The latitude of the client's location, in degrees. The latitude must be greater than or equal to -90.0 and less than or equal to +90.0. Negative values indicate southern latitudes and positive values indicate northern latitudes.<br /><br /></li><li>long&mdash;Required. The longitude of the client's location, in degrees. The longitude must be greater than or equal to -180.0 and less than or equal to +180.0. Negative values indicate western longitudes and positive values indicate eastern longitudes.<br /><br /></li><li>re&mdash;Required. The radius, in meters, which specifies the horizontal accuracy of the coordinates. Pass the value returned by the device's location service. Typical values might be 22m for GPS/Wi-Fi, 380m for cell tower triangulation, and 18,000m for reverse IP lookup.<br /><br /></li><li>ts&mdash;Optional. The UTC UNIX timestamp of when the client was at the location. (The UNIX timestamp is the number of seconds since January 1, 1970.)<br /><br /></li><li>head&mdash;Optional. The client's relative heading or direction of travel. Specify the direction of travel as degrees from 0 through 360, counting clockwise relative to true north. Specify this key only if the `sp` key is nonzero.<br /><br /></li><li>sp&mdash;Optional. The horizontal velocity (speed), in meters per second, that the client device is traveling.<br /><br /></li><li>alt&mdash;Optional. The altitude of the client device, in meters.<br /><br /></li><li>are&mdash;Optional. The radius, in meters, that specifies the vertical accuracy of the coordinates. Specify this key only if you specify the `alt` key.</li></ul><br /><br /> **NOTE:** Although many of the keys are optional, the more information that you provide, the more accurate the location results are.<br /><br /> **NOTE:** Although optional, you are encouraged to always specify the user's geographical location. Providing the location is especially important if the client's IP address does not accurately reflect the user's physical location (for example, if the client uses VPN). For optimal results, you should include this header and the X-Search-ClientIP header, but at a minimum, you should include this header.|

> [!NOTE] 
> Remember that the Terms of Use require compliance with all applicable laws, including regarding use of these headers. For example, in certain jurisdictions, such as Europe, there are requirements to obtain user consent before placing certain tracking devices on user devices.
  
## Query Parameters  

The following is the list of query parameters that the request may include. The Required column indicates whether you must specify the parameter. The query parameter values must be URL encoded.  
  
|Name|Value|Type|Required|  
|----------|-----------|----------|--------------|  
|<a name="actiontype" />actionType|A string that's used by logging to determine whether the request is coming from an interactive session or a page load. The following are the possible values.<br /><br /><ul><li>Edit&mdash;The request is from an interactive session<br /></li><li>Load&mdash;The request is from a page load</li></ul>|String|No|  
|<a name="appname" />appName|The unique name of your app.<br /><br /> The name must be known by Bing. Do not include this parameter unless you have previously contacted Bing to get a unique app name. To get a unique name, contact your Bing Business Development manager.|String|No|  
|<a name="cc" />cc|A 2-character country code of the country where the results come from. For a list of possible values, see [Market Codes](#market-codes).<br /><br /> If you set this parameter, you must also specify the [Accept-Language](#acceptlanguage) header. Bing uses the first supported language it finds in the specified languages and combines it with the country code to determine the market to return results for. If the languages list does not include a supported language, Bing finds the closest language and market that supports the request. Or, Bing may use an aggregated or default market for the results.<br /><br /> Use this query parameter and the `Accept-Language` header only if you specify multiple languages. Otherwise, you should use the `mkt` and `setLang` query parameters.<br /><br /> This parameter and the [mkt](#mkt) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="clientmachinename" />clientMachineName|A unique name of the device that the request is being made from. Generate a unique value for each device; the value is unimportant.<br /><br /> The service uses the ID to help debug issues and improve the quality of corrections.|String|No|  
|<a name="docid" />docId|A unique ID that identifies the document that the text belongs to. Generate a unique value for each document (the value is unimportant).<br /><br /> The service uses the ID to help debug issues and improve the quality of corrections.|String|No|  
|<a name="mkt" />mkt|The market where the results come from. Typically, `mkt` is the country where the user is making the request from. However, it could be a different country if the user is not located in a country where Bing delivers results. The market must be in the form \<language code\>-\<country code\>. For example, en-US. The string is case insensitive. For a list of possible market values, see [Market Codes](#market-codes).<br /><br /> **NOTE:** If known, you are encouraged to always specify the market. Specifying the market helps Bing route the request and return an appropriate and optimal response. If you specify a market that is not listed in [Market Codes](#market-codes), Bing uses a best fit market code based on an internal mapping that is subject to change.<br /><br /> This parameter and the [cc](#cc) query parameter are mutually exclusive&mdash;do not specify both.|String|No|  
|<a name="mode" />mode|The type of spelling and grammar checks to perform. The following are the possible values (the values are case insensitive). The default is Proof.<br /><br /><ul><li>Proof&mdash;Finds most spelling and grammar mistakes<br /><br/></li><li>Spell&mdash;Finds most spelling mistakes but does not find some of the grammar errors that Proof catches (for example, capitalization and repeated words)</li></ul><br /><br /> **NOTE:** Proof is supported only in the en-US market. If you specify a market other than en-US, the call succeeds but the `flaggedTokens` array is empty.|String|No|  
|<a name="precontexttext" />preContextText|A string that gives context to the [text](#text) string. For example, the `text` string *petal* is valid, but if you set `preContextText` to *bike*, the context changes and the text string becomes not valid. In this case, the API suggests that you change *petal* to *pedal* (as in *bike pedal*).<br /><br /> This text is not checked for grammar or spelling errors.<br /><br /> The combined length of the `text` string, `preContextText`, and `postContextText` may not exceed 10,000 characters.<br /><br /> You may specify this parameter in the query string of a GET request or in the body of a POST request.|String|No|  
|<a name="postcontexttext" />postContextText|A string that gives context to the [text](#text) string. For example, the `text` string *read* is valid, but if you set `postContextText` to *carpet*, the context changes and the text string becomes not valid. In this case, the API suggests that you change *read* to *red* (as in *red carpet*).<br /><br /> This text is not checked for grammar or spelling errors.<br /><br /> The combined length of the `text` string, `preContextText`, and `postContextText` may not exceed 10,000 characters.<br /><br /> You may specify this parameter in the query string of a GET request or in the body of a POST request.|String|No|  
|<a name="sessionid" />sessionId|A unique ID that identifies this user session. Generate a unique value for each user session (the value is unimportant).<br /><br /> The service uses the ID to help debug issues and improve the quality of corrections.|String|No|  
|<a name="setlang" />setLang|The language to use for user interface strings. Specify the language using the ISO 639-1 2-letter language code. For example, the language code for English is EN. The default is EN (English).<br /><br /> Although optional, you should always specify the language. Typically, you set `setLang` to the same language specified by `mkt` unless the user wants the user interface strings displayed in a different language.<br /><br /> This parameter and the [Accept-Language](#acceptlanguage) header are mutually exclusive&mdash;do not specify both.<br /><br /> A user interface string is a string that's used as a label in a user interface. There are few user interface strings in the JSON response objects. Also, any links to Bing.com properties in the response objects apply the specified language.|String|No|  
|<a name="text" />text|The text string to check for spelling and grammar errors.<br /><br /> The combined length of the `text` string, `preContextText`, and `postContextText` may not exceed 10,000 characters.<br /><br /> You may specify this parameter in the query string of a GET request or in the body of a POST request. Because of the query string length limit, you typically use a POST request unless you're checking only short strings.|String|Yes|  
|<a name="userid" />userId|A unique ID that identifies the user. Generate a unique value for each user; the value is unimportant.<br /><br /> The service uses the ID to help debug issues and improve the quality of corrections.|String|No|  
  
## Response Objects  

The following are the JSON response objects that the response may include. If the request is successful, the top-level object in the response is the [SpellCheck](#spellcheck) object. If the request fails, the top-level object is [ErrorResponse](#errorresponse).  
  
|Object|Description|  
|------------|-----------------|  
|[Error](#error)|The error that occurred.|  
|[ErrorResponse](#errorresponse)|The top-level object that the response includes when the request fails.|  
|[FlaggedToken](#flaggedtoken)|The word that may be grammatically incorrect or not spelled correctly.|  
|[SpellCheck](#spellcheck)|The top-level object that the response includes when the request succeeds.|  
|[TokenSuggestion](#tokensuggestion)|The suggested spelling or grammar correction.|  
  
<a name="error"></a>   
### Error  
The reason why the request failed.  
  
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
|<a name="errors" />errors|An array of [Error](#error) objects that describe the reasons why the request failed.|[Error](#error)[]|  
  
<a name="flaggedtoken"></a>   
### FlaggedToken  
The word that is not spelled correctly or is grammatically incorrect.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="flaggedtoken-offset" />offset|The zero-based offset from the beginning of the [text](#text) query string to the word that was flagged.|Integer|  
|<a name="flaggedtoken-suggestions" />suggestions|A list of words that correct the spelling or grammar error. The list is in decreasing order of preference.|[TokenSuggestion](#tokensuggestion)[]|  
|<a name="flaggedtoken-token" />token|The word in the `text` query string that is not spelled correctly or is grammatically incorrect.|String|  
|<a name="flaggedtoken-type" />type|The type of error that caused the word to be flagged. The following are the possible values.<br /><br /><ul><li>RepeatedToken&mdash;The word was repeated in succession (for example, the warm **warm** weather)<br /><br/></li><li>UnknownToken&mdash;All other spelling or grammar errors</li></ul>|String|  
  
<a name="spellcheck"></a>   
### SpellCheck  
The top-level object that the response includes when the request succeeds.  
  
If the service suspects a denial of service attack, the request succeeds (HTTP status code is 200 OK), but the body of the response is empty.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|_type|Type hint.|String|  
|<a name="flaggedtokens" />flaggedTokens|An array of words in [text](#text) that were flagged as not being spelled correctly or are grammatically incorrect.<br /><br /> If no spelling or grammar errors were found, or the specified market is not supported, the array is empty.|[FlaggedToken](#flaggedtoken)[]|  
  
<a name="tokensuggestion"></a>   
### TokenSuggestion  
The suggested spelling or grammar correction.  
  
|Name|Value|Type|  
|----------|-----------|----------|  
|<a name="score" />score|A value that indicates the level of confidence that the suggested correction is correct. If the `mode`query parameter is set to Spell, this field is set to 1.0.|Double|  
|<a name="suggestion" />suggestion|The suggested word to replace the flagged word.<br /><br /> If the flagged word is a repeated word (see [type](#flaggedtoken-type)), this string is empty.|String|  
  
## Error Codes 

[!INCLUDE [bing-error-codes](../includes/bing-error-codes.md)]

## Market Codes 

[!INCLUDE [bing-market-codes](../includes/bing-market-codes.md)]
