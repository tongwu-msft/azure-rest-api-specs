---
title: "Common Parameters and Headers | Microsoft Docs"
ms.custom: ""
ms.date: "2017-09-05"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 0e07b9cb-8fdf-4ff7-b707-e964200df0f8
caps.latest.revision: 10
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Common Parameters and Headers
  The following information is common to all operations that you might do related to Batch resources:  
  
  
-   Specify the optional *$select* value as a list of properties to return for a resource.  
  
-   Specify the optional *$skiptoken* value in the URI if a partial result is returned in a previous operation call. If the response contains an *odata.nextLink* element, the value of the *odata.nextLink* element includes a *$skiptoken* parameter with a value that specifies the starting point in the collection of entities for the next GET operation. The *$skiptoken* parameter must only be used on the URI contained in the value of the *odata.nextLink* element.  
  
-   Specify the optional *maxresults* value in the URI to define the number of items to return in a response. The maximum number of items varies based on the resource:  
  
    -   A maximum of 100 certificates can be returned.  
  
    -   A maximum of 1000 pools can be returned.  
  
    -   A maximum of 1000 nodes can be returned.  
  
    -   A maximum of 1000 job schedules can be returned.  
  
    -   A maximum of 1000 jobs can be returned.  
  
    -   A maximum of 1000 tasks can be returned.  
  
-   Set the *Authorization* header to a string that contains the authentication scheme, the account name, and the authentication signature. For more information, see [Authenticate Requests to the Azure Batch Service](../batchservice/authenticate-requests-to-the-azure-batch-service.md).  
  

##  <a name="BKMK_DateTime"></a> Representation of Date/Time Values  
  
### Specifying Date/Time values in HTTP headers  
 The Batch service follows RFC 1123 for representation of date/time values in headers. This is the preferred format for HTTP/1.1 operations, as described in section 3.3 of the [HTTP/1.1 Protocol Parameters](http://go.microsoft.com/fwlink/?linkid=133333) specification. An example of this format is:  
  
```  
Sun, 06 Nov 1994 08:49:37 GMT  
```  
  
 The following format is also supported, as described in the HTTP/1.1 protocol specification:  
  
```  
Sunday, 06-Nov-94 08:49:37 GMT  
```  
  
 Both are represented in the Coordinated Universal Time (UTC), also known as Greenwich Mean Time.  
  
### Specifying Date/Time values in URI Parameters and Request/Response Body  
 Date/time values in query parameters and request/response body are expressed as UTC times and must adhere to a valid ISO 8601 format. Supported ISO 8601 formats include the following:  
  
-   `YYYY-MM-DD`  
  
-   `YYYY-MM-DDThh:mmTZD`  
  
-   `YYYY-MM-DDThh:mm:ssTZD`  
  
 For the date portion of these formats, `YYYY` is a four-digit year representation, `MM` is a two-digit month representation, and `DD` is a two-digit day representation. For the time portion, `hh` is the hour representation in 24-hour notation, `mm` is the two-digit minute representation, and `ss` is the two-digit second representation. A time designator `T` separates the date and time portions of the string, while a time zone designator `TZD` specifies a time zone.  

  
  