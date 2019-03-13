---
title: HTTP status codes for REST API call - Azure Search
description: A list of the HTTP status codes returned by the Azure Search REST APIs.
ms.date: 02/16/2019
services: search
ms.service: search
ms.topic: "language-reference"
author: "Brjohnstmsft"
ms.author: "brjohnst"
ms.manager: cgronlun
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
# HTTP status codes (Azure Search)
  This page describes the HTTP status codes that are frequently returned when using the Azure Search API.  

## Common HTTP status codes  

|Code|Description|  
|----------|-----------------|  
|200 OK|Success on GET, PUT, or POST. Returned for a successful response. During indexing, this code indicates all items have been stored durably and will start to be indexed. Indexing runs in the background and makes new documents queryable and searchable a few seconds after the indexing operation completed.|  
|204 Accepted|Success on PUT or POST. Index or documents uploaded successfully.|  
|207 Multi-Status|Partial success for PUT or POST. Some documents succeeded, but at least one failed.|  
|400 Bad Request|Returned when there is an error in the request URI, headers, or body. The response body will contain an error message explaining what the specific problem is.|  
|403 Forbidden|Returned when you pass an invalid api-key.|  
|404 Not Found|Returned when a resource does not exist on the server. If you are managing or querying an index, check the syntax and verify the index name is specified correctly.|  
|409 Conflict | Returned when write operations conflict. This error is returned for resource updates, or during indexing when two processes try to update the same document simultaneously. Azure Search provides concurrency management for resource updates. For more information, see [How to manage concurrency in Azure Search](https://docs.microsoft.com/azure/search/search-howto-concurrency).
|412 Precondition Failed|Returned when an If-Match or If-None-Match header's condition evaluates to false. Associated with using [optimistic concurrency control](https://www.ietf.org/rfc/rfc7232.txt) when sending HTTP requests for index definitions, indexers, or data sources.|  
|429 Too Many Requests|If this error occurs while you are trying to create an index, it means you already have the maximum number of indexes allowed for your pricing tier. A count of the indexes stored in Azure Search is visible in the search service dashboard on the [Azure portal](https://portal.azure.com). To view the indexes by name, click the **Index** tile. Alternatively, you can also get a list of the indexes by name using the **List Indexes** operation. See [List Indexes &#40;Azure Search Service REST API&#41;](list-indexes.md) for details.<br /><br /> If this error occurs during document upload, it indicates that you've exceeded your quota on the number of documents per index. You must either create a new index or upgrade for higher capacity limits.|  
|499 Client Closed Request| This error is never returned in a response, but you might see it in log entries recorded by [search traffic analytics](https://docs.microsoft.com/azure/search/search-traffic-analytics) and Azure Monitor. It indicates that a client closed the connection before a response was returned by the service. When Azure Search detects a cancellation that was not requested by service-side code, or that the client no longer exists, a 499 error is logged. |
|502 Bad Gateway|This error occurs when you enter HTTP instead of HTTPS in the connection.|  
|503 Service Unavailable|This error means that the system is under heavy load and your request can't be processed at this time. **Important:**  In this case, we highly recommend that your client code back off and wait before retrying. This will give the system some time to recover, increasing the chances that future requests will succeed. Rapidly retrying your requests will only prolong the situation.|  
|504: Gateway Timeout|Azure Search listens on HTTPS port 443. If your search service URL contains HTTP instead of HTTPS, a 504 status code will be returned.|  

## See also  
 [Azure Search .NET SDK](https://docs.microsoft.com/azure/search/search-api-versions)  
 [Azure Search Service REST](index.md)   
