---
title: "HTTP Status Codes for Azure Cosmos DB"
ms.custom: ""
ms.date: "11/18/2016"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 7104e4ef-fa51-4194-93f0-bb5f53fe9d61
caps.latest.revision: 21
author: "SnehaGunda"
ms.author: "sngun"
manager: "kfile"
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

# HTTP Status Codes for Azure Cosmos DB
This article provides the HTTP status codes returned by the REST operations.  
  
|**Code**|**Description**|  
|-|-|  
|**200 OK**|One of the following REST operations were successful:<br /><br /> -   `GET` on a resource.<br />-   `PUT` on a resource.<br />-   `POST` on a resource.<br />-   `POST` on a stored procedure resource to execute the stored procedure.|  
|**201 Created**|A POST operation to create a resource is successful.|  
|**204 No Content**|The DELETE operation is successful.|  
|**400 Bad Request**|The JSON, SQL, or JavaScript in the request body is invalid.<br /><br /> In addition, a 400 can also be returned when the required properties of a resource are not present or set in the body of the POST or PUT on the resource.<br /><br /> 400 is also returned when the consistent level for a GET operation is overridden by a stronger consistency from the one set for the account.<br /><br /> 400 is also returned when a request that requires an x-ms-documentdb-partitionkey does not include it.|  
|**401 Unauthorized**| 401 is returned when the `Authorization` header is invalid for the requested resource.|  
|**403 Forbidden**|The authorization token expired.<br /><br /> 403 is also returned during a `POST` to create a resource when the resource quota has been reached. An example of this is when trying to add documents to a collection that has reached its provisioned storage.<br /><br /> 403 can also be returned when a stored procedure, trigger, or UDF has been flagged for high resource usage and blocked from execution.|  
|**404 Not Found**|The operation is attempting to act on a resource that no longer exists. For example, the resource may have already been deleted.|  
|**408 Request Timeout**|The operation did not complete within the allotted amount of time. This code is returned when a stored procedure, trigger, or UDF (within a query) does not complete execution within the maximum execution time.|  
|**409 Conflict**|The ID provided for a resource on a `PUT` or `POST` operation has been taken by an existing resource. Use another ID for the resource to resolve this issue. For partitioned collections, ID must be unique within all documents with the same partition key value.|  
|**412 Precondition Failure**|The operation specified an eTag that is different from the version available at the server, that is, an optimistic concurrency error. Retry the request after reading the latest version of the resource and updating the eTag on the request.|  
|**413 Entity Too Large**|The document size in the request exceeded the allowable document size for a request. The max allowable document size is 2 MB.|  
|**429 Too Many Request**|The collection has exceeded the provisioned throughput limit. Retry the request after the server specified retry after duration. For more information, see [request units](https://docs.microsoft.com/azure/cosmos-db/request-units).|  
|**449 Retry With**|The operation encountered a transient error. This code only occurs on write operations. It is safe to retry the operation.|  
|**500 Internal Server Error**|The operation failed due to an unexpected service error. Contact support. See [Filing an Azure support issue](https://portal.azure.com/?#blade/Microsoft_Azure_Support/HelpAndSupportBlade).|  
|**503 Service Unavailable**|The operation could not be completed because the service was unavailable. This situation could happen due to network connectivity or service availability issues. It is safe to retry the operation. If the issue persists, contact support.|  
  
**See also**  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  

  
  

