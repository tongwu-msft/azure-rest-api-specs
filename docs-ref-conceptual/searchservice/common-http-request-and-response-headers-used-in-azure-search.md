---
title: Common HTTP request and response headers - Azure Cognitive Search
description: HTTP codes returned by Azure Cognitive Search when making REST API calls.
ms.date: 07/19/2021

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

author: bevloh
ms.author: beloh
---
# Common HTTP request and response headers used in Azure Cognitive Search

The Azure Cognitive Search REST APIs support a set of common HTTP request/response headers, summarized here for reference:  

|Request Header|Type|Description|  
|--------------------|----------|-----------------|  
|Accept|Content type|The requested content type for the response. Default is application/json;odata.metadata=minimal. Other allowable values are application/json, application/json;odata.metata=full, application/json;odata.metadata=none, and text/plain (for $count only).|  
|api-key|String|Set to your query or admin key, depending on the API.|  
|authorization (preview) |String|The OAuth 2.0 access token for the request. Requires configuration to your search service for [role-based access](/azure/search/search-security-rbac). This request header is for client apps that use Azure Active Directory authentication and Azure role assignments. Your client code must provide the token. You can use this request header with any supported REST API version as long as the search service is configured for [data plane authentication](/rest/api/searchmanagement/2021-04-01-preview/services/create-or-update#dataplaneaadorapikeyauthoption). |  
|Content-Type|Content-Type|Content type of request body (PUT/POST). Default is `application/json`.|  
|client-request-id|GUID|Optional caller-specified request ID, in the form of a GUID with no decoration such as curly braces (for example, client-request-id: 9C4D50EE-2D56-4CD3-8152-34347DC9F2B0). A caller-defined value that identifies the given request. If specified, this will be included in response information as a way to map the request.|  
|OData-MaxVersion|"4.0"|Specifies the maximum version of the OData protocol supported by the client. Default is "4.0"|  
|Prefer|"return=representation" or "return=minimal"|Used to control the response payload from PUT and POST /indexes requests. Default is "return=representation" when creating a new index via POST or PUT, and "return=minimal" for updating an existing index via PUT..|  
|return-client-request-id|True or False|If specified when client-request-id is specified, instructs the server to include the client-request-id header in the response. Default is False.|  
|If-Match|ETag or *|Used to change a resource only if the current version matches the specified ETag. Use this header with POST, PUT, or DELETE methods on resources (such as indexers, indexes, and data sources, but not documents) to enable [optimistic concurrency control](https://www.ietf.org/rfc/rfc7232.txt).|  
|If-None-Match|ETag or *|Used to change a resource only if the current version does not match the specified ETag. Use this header with POST, PUT, or DELETE methods on resources (such as indexers, indexes, and data sources, but not documents) to enable [optimistic concurrency control](https://www.ietf.org/rfc/rfc7232.txt).|  

|Response Header|Type|Description|  
|---------------------|----------|-----------------|  
|client-request-id|GUID|An identifier specified by the caller in the original request, if present.|  
|Content-Type|Content-Type|The content type of the response body.|  
|Location|URL|The URL of the newly created index definition for POST and PUT /indexes requests.|  
|OData-Version|"4.0"|OData protocol version of the response.|  
|request-id|GUID|A unique identifier for the current operation. Equal to client-request-id if specified; otherwise the value is generated on the server.|  
|elapsed-time|Number|Time, in milliseconds, that the service spent processing the request. This only includes the time spent on processing the request, and does not include network transfer time.|  
|ETag|String|An opaque string representing the current version of a resource (returned for indexers, indexes, and data sources, but not documents). Use this string in the If-Match or If-None-Match header for [optimistic concurrency control](https://www.ietf.org/rfc/rfc7232.txt).|  

## See also  
 [Azure Cognitive Search REST APIs](index.md)   
