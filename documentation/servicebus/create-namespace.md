---
title: "Create Namespace"
ms.custom: ""
ms.date: "05/14/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 9e142123-98c6-4ca5-b8ad-363b113b39fa
caps.latest.revision: 13
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
# Create Namespace
Creates a new service namespace. Once created, this namespace’s resource manifest is immutable. This operation is idempotent.  
  
 The namespace identifier should adhere to the following naming conventions:  
  
1.  The name length is at least 6 and at most 50 characters.  
  
2.  The name matches regex ^[a-zA-Z][a-zA-Z0-9-]*$ (the namespace name can contain only Letters, numbers, hyphens “-“).  
  
3.  The name does not end with “-“, “-sb“, “-mgmt“, “-cache“, or “-appfabric“.  
  
4.  The name is available via a call to provisioning; that is, no duplicate namespace names.  
  
5.  The name must start with a letter.  
  
6.  A GUID is now allowed as the namespace name.  
  
## Request  
  
|Method|Request URI|HTTP version|  
|------------|-----------------|------------------|  
|PUT|https://management.core.windows.net/{subscription ID}/services/ServiceBus/Namespaces/{namespace name}|HTTP/1.1|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|Content-Type|Set to **application/atom+xml**.|  
|x-ms-version|**2012-03-01**|  
  
 Note that the request also requires a client certificate. This certificate must match the certificate you uploaded for that particular subscription.  
  
### Request Body  
 The namespace description. See [Namespace Description](namespace-description.md). Only **Region** is required; the other fields are optional.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Response Codes  
  
> [!NOTE]
>  If you create a namespace with a name containing special or encoded characters (for example, "test?Name=value&", which gets encoded to "test%3FName%3Dvalue%26"), a “(400) invalid request body” exception is generated.  
  
|Code|Description|  
|----------|-----------------|  
|200|Namespace created.|  
|401|Authorization failure.|  
|500|Internal error.|  
  
 For information about status codes, see [Status and Error Codes](http://msdn.microsoft.com/library/dd179357.aspx).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response Header|Description|  
|---------------------|-----------------|  
|Content-Type|application/atom+xml; type=entry; charset=utf-8|  
  
### Response Body  
 The [Namespace Description](namespace-description.md) is returned. If some description properties were missing from the PUT request, these properties might contain default values.