---
title: "Common HTTP request and response headers used in Azure Search"
ms.custom: ""
ms.date: "2016-08-10"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "search"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
applies_to:
  - "Azure"
ms.assetid: 59c1f5bf-9e8d-4b40-9377-19a5479a46c8
caps.latest.revision: 8
author: "Brjohnstmsft"
ms.author: "brjohnst"
manager: "jhubbard"
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
# Common HTTP request and response headers used in Azure Search
  The Azure Search Service APIs support a set of common HTTP request/response headers, summarized here for reference:  

|Request Header|Type|Description|  
|--------------------|----------|-----------------|  
|Accept|Content type|The requested content type for the response. Default is application/json;odata.metadata=minimal. Other allowable values are application/json, application/json;odata.metata=full, application/json;odata.metadata=none, and text/plain (for $count only).|  
|api-key|String|Set to your query or admin key, depending on the API.|  
|Content-Type|Content-Type|Content type of request body (PUT/POST). Default is `application/json`.|  
|client-request-id|GUID|Optional caller-specified request ID, in the form of a GUID with no decoration such as curly braces (e.g. client-request-id: 9C4D50EE-2D56-4CD3-8152-34347DC9F2B0). A caller-defined value that identifies the given request. If specified, this will be included in response information as a way to map the request.|  
|OData-MaxVersion|"4.0"|Specifies the maximum version of the OData protocol supported by the client. Default is "4.0"|  
|Prefer|"return=representation" or "return=minimal"|Used to control the response payload from PUT and POST /indexes requests. Default is "return=representation" when creating a new index via POST or PUT, and "return=minimal" for updating an existing index via PUT..|  
|return-client-request-id|True or False|If specified when client-request-id is specified, instructs the server to include the client-request-id header in the response. Default is False.|  
|If-Match|ETag or *|Used to change a resource only if the current version matches the specified ETag. Use this header with POST, PUT, or DELETE methods on resources (such as indexers, indexes, and data sources, but not documents) to enable [optimistic concurrency control](http://www.ietf.org/rfc/rfc7232.txt).|  
|If-None-Match|ETag or *|Used to change a resource only if the current version does not match the specified ETag. Use this header with POST, PUT, or DELETE methods on resources (such as indexers, indexes, and data sources, but not documents) to enable [optimistic concurrency control](http://www.ietf.org/rfc/rfc7232.txt).|  

|Response Header|Type|Description|  
|---------------------|----------|-----------------|  
|client-request-id|GUID|An identifier specified by the caller in the original request, if present.|  
|Content-Type|Content-Type|The content type of the response body.|  
|Location|URL|The URL of the newly-created index definition for POST and PUT /indexes requests.|  
|OData-Version|"4.0"|OData protocol version of the response.|  
|request-id|GUID|A unique identifier for the current operation. Equal to client-request-id if specified; otherwise the value is generated on the server.|  
|elapsed-time|Number|Time, in milliseconds, that the service spent processing the request. This only includes the time spent on processing the request, and does not include network transfer time.|  
|ETag|String|An opaque string representing the current version of a resource (returned for indexers, indexes, and data sources, but not documents). Use this string in the If-Match or If-None-Match header for [optimistic concurrency control](http://www.ietf.org/rfc/rfc7232.txt).|  

## See Also  
 [Azure Search Service REST](index.md)   
