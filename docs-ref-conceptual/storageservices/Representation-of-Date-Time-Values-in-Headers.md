---
title: Representation of date/time values in headers (REST API) - Azure Storage
description: Representation of date/time values in headers.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Representation of date/time values in headers

Azure storage services follow RFC 1123 for representation of date/time values. This is the preferred format for HTTP/1.1 operations, as described in section 3.3 of the [HTTP/1.1 Protocol Parameters](http://go.microsoft.com/fwlink/?linkid=133333) specification. An example of this format is:  
  
```  
Sun, 06 Nov 1994 08:49:37 GMT  
```  
  
 The following format is also supported, as described in the HTTP/1.1 protocol specification:  
  
```  
Sunday, 06-Nov-94 08:49:37 GMT  
```  
  
 Both are represented in the Coordinated Universal Time (UTC), also known as Greenwich Mean Time.  
  
## See Also  
 [Storage Services REST](Azure-Storage-Services-REST-API-Reference.md)
