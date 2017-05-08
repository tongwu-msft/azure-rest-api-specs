---
title: "Common DocumentDB REST response headers"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 09b09c8b-71b5-4023-ad47-e6240a7f1c64
caps.latest.revision: 11
author: "mimig1"
ms.author: "mimig"
manager: "jhubbard"
robots: noindex,nofollow
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
# Common DocumentDB REST response headers
The following response headers are common to all responses from the DocumentDB API:  
  
|Header|Description|  
|------------|-----------------|  
|**Content-Type**|The **Content-Type** is **application/json**. The DocumentDB API always returns the response body in standard JSON format.|  
|**Date**|The date time of the response operation. This date time format conforms to the RFC 1123 date time format expressed in Coordinated Universal Time.|  
|**etag**|The **etag** header shows the resource **etag** for the resource retrieved. The **etag** has the same value as the **_etag** property in the response body.|  
|**x-ms-activity-id**|Represents a unique identifier for the operation. This echoes the value of the x-ms-activity-id request header, and commonly used for troubleshooting purposes.|  
|**x-ms-alt-content-path**|The alternate path to the resource. Resources can be addressed in REST via system generated IDs or user supplied IDs. x-ms-alt-content-path represents the path constructed using user supplied IDs.|  
|**x-ms-continuation**|This header represents the intermediate state of query (or read-feed) execution, and is returned when there are additional results aside from what was returned in the response. Clients can resubmitted the request with a request header containing<br />                the value of x-ms-continuation.|  
|**x-ms-item-count**|The number of items returned for a query or read-feed request.|  
|**x-ms-request-charge**|This is the number of normalized requests a.k.a. request units (RU) for the operation. For more information about request units, see [Manage DocumentDB capacity and performance](http://azure.microsoft.com/documentation/articles/documentdb-manage/).|  
|**x-ms-resource-quota**|Shows the allotted quota for a resource in an account. For more information on limits and quotas, please see [DocumentDB limits](http://azure.microsoft.com/documentation/articles/documentdb-limits/).|  
|**x-ms-resource-usage**|Shows the current usage cout of a resource in an account. When deleting a resource, this shows the number of resources after the deletion. For more information on limits and quotas, please see [DocumentDB limits](http://azure.microsoft.com/documentation/articles/documentdb-limits/).|  
|**x-ms-retry-after-ms**|The number of milliseconds to wait to retry the operation after an initial operation received HTTP status code 429 and was throttled.|  
|**x-ms-schemaversion**|Shows the resource schema version number.|  
|**x-ms-serviceversion**|Shows the service version number.|  
|**x-ms-session-token**|The session token of the request. For session consistency, clients must echo this request via the x-ms-session-token request header for subsequent operations made to the corresponding collection.|  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB: DocumentDB API](https://docs.microsoft.com/azure/documentdb/documentdb-introduction)   
* [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
* [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)   
  