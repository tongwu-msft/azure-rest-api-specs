---
title: "Query Strings"
ms.custom: ""
ms.date: "05/15/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: f71795dc-7480-4d49-ad3d-150c925f9f7a
caps.latest.revision: 6
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Query Strings
Query string operations for passing data to web applications.  
  
## $skip and $top  
 This operation is used for paging when performing any enumeration operation. You can retrieve a range of entities under your service namespace. For example, if you want to retrieve the first five entities under your service namespace, you can issue the following command:  
  
```  
GET /$Resources/Topics/$skip=0&$top=5.  
```  
  
 `{skip}` is the number of entries to skip, and `{top}` is the number of entries to retrieve.  
  
## Authorization  
 The Access Control scope corresponding to the resource path is used to issue the token and the resource access is evaluated against the token with the path. Upon requesting a token, the following string is returned from the Access Control service:  
  
```  
wrap_access_token=net.windows.servicebus.action%3dListen%252cManage%252cSend%26http%253a%252f%252fschemas.microsoft.com%252faccesscontrolservice%252f2010%252f07%252fclaims%252fidentityprovider%3dhttps%253a%252f%252fBVTsn1002-sbususer-0-9-sb.accesscontrol.aadint.windows-int.net%252f%26Audience%3dhttp%253a%252f%252fBVTsn1002-sbususer-0-9.Windows-bvt.net%26ExpiresOn%3d1304710330%26Issuer%3dhttps%253a%252f%252fbvtsn1002-sbususer-0-9-sb.accesscontrol.aadint.windows-int.net%252f%26HMACSHA256%3d3mytM7yEZ4ZDHyO5rDBeReJien%252f%252bIrsmJJVezsUPqbU%253d&wrap_access_token_expires_in=1199  
```  
  
 The token should be extracted. Because the token is URL-encoded, you must URL-decode it. The decoded token must be put into a string similar to this:  
  
```  
WRAP_access_token="net.windows.servicebus.action=Listen%2cManage%2cSend&http%3a%2f%2fschemas.microsoft.com%2faccesscontrolservice%2f2010%2f07%2fclaims%2fidentityprovider=https%3a%2f%2fBVTsn1002-sbususer-0-9-sb.accesscontrol.aadint.windows-int.net%2f&Audience=http%3a%2f%2fBVTsn1002-sbususer-0-9.Windows-bvt.net&ExpiresOn=1304710330&Issuer=https%3a%2f%2fbvtsn1002-sbususer-0-9-sb.accesscontrol.aadint.windows-int.net%2f&HMACSHA256=3mytM7yEZ4ZDHyO5rDBeReJien%2f%2bIrsmJJVezsUPqbU%3d"  
```  
  
 Please note the following:  
  
-   The received string is URI-decoded (%26 => &) and is in double quotes. Put this into the `HttpAuthorizationHeader`.  
  
-   The `ExpiresOn` time in the middle of the string is specified as a Unix File Time (that is, the number of seconds since 01/01/1970 at 12:00am). You should scrub the `identityprovider`, `audience`, `issuer`, and `hmacsha` fields.  
  
-   The domain used when requesting a token uses the HTTP scheme, even though calls to the service are always issued over HTTPS.  
  
-   Make sure that the content type in the HTTP header is of type: `application/x-www-form-urlencoded`.