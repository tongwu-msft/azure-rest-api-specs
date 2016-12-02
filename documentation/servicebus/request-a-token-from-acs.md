---
title: "Request a Token from ACS"
ms.custom: ""
ms.date: "05/12/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 22751f14-1f80-4a8a-81b3-b77a63c7cdfb
caps.latest.revision: 5
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
# Request a Token from ACS
Requests a new token from Microsoft Azure Active Directory Access Control (also known as Access Control Service or ACS).  
  
## Request  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|POST|https://{serviceNamespace}-sb.accesscontrol.windows.net/WRAPv0.9|HTTP/1.1|  
  
### Request Headers  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Content-Type|Set to **application/atom+xml;type=entry;charset=utf-8**.|  
  
### Request Body  
 The body of the request contains a string that contains the issuer name, the issuer key, and the scope the token should cover.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
|Code|Description|  
|----------|-----------------|  
|201|OK.|  
|400|Bad request.|  
|401|Authorization failure.|  
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/windowsazure/dd179382.aspx).  
  
### Response Headers  
  
|Response Header|Description|  
|---------------------|-----------------|  
|Content-Type|Set to **application/x-www-form-urlencoded; charset=us-ascii**.|  
|request-id|ID of the token request.|  
|X-Content-Type-Options|Set to **nosniff**.|  
|Strict-Transport-Security|Set to **max-age=31536000; includeSubDomains**.|  
  
### Response Body  
 A **WRAPv0.9** token.  
  
## Example  
 The following HTTP request requests a token for the Service Bus namespace `http://your-namespace.service bus.net`. The issuer name is “owner”:  
  
```  
POST https://your-namespace-sb.accesscontrol.windows.net/WRAPv0.9/ HTTP/1.1  
Content-Type: application/x-www-form-urlencoded  
Host: your-namespace-sb.accesscontrol.windows.net  
Content-Length: 136  
Expect: 100-continue  
Connection: Keep-Alive  
  
wrap_name=owner&wrap_password=r8LuxCKD6DWY8auQcFql4M7euH2UuhcLcV1TaJTqNNE%3d&wrap_scope=http%3a%2f%2fyour-namespace.servicebus.windows.net%2f  
```  
  
 ACS returns the following response:  
  
```  
HTTP/1.1 200 OK  
Cache-Control: no-cache, no-store  
Pragma: no-cache  
Content-Type: application/x-www-form-urlencoded; charset=us-ascii  
Expires: -1  
request-id: f11be382-884b-4792-9c9b-33b79cd51779  
X-Content-Type-Options: nosniff  
Strict-Transport-Security: max-age=31536000; includeSubDomains  
Date: Thu, 03 Jul 2014 21:52:07 GMT  
Content-Length: 535  
  
wrap_access_token=net.windows.servicebus.action%3d  
Listen%252cManage%252cSend%26  
http%253a%252f%252fschemas.microsoft.com%252faccesscontrolservice%252f2010%252f07%252fclaims%252fidentityprovider%3d  
https%253a%252f%252fyour-namespace-sb.accesscontrol.windows.net%252f%26  
Audience%3dhttp%253a%252f%252fyour-namespace.servicebus.windows.net%252f%26  
ExpiresOn%3d1404435127%26  
Issuer%3dhttps%253a%252f%252fyour-namespace-sb.accesscontrol.windows.net%252f%26  
HMACSHA256%3dF%252bBoXUoifWdT%252fly8Oic9V1oPBbc3KmXKbSJbVhGSopU%253d&  
wrap_access_token_expires_in=10799  
```  
  
## See Also  
 [Service Bus HTTP Client sample](http://code.msdn.microsoft.com/windowsazure/Service-Bus-HTTP-client-fe7da74a)