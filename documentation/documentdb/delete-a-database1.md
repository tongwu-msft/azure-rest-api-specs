---
title: "Delete a Database1"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: f45e012d-eacd-44e5-9cdf-53c75fd3fc53
caps.latest.revision: 7
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
# Delete a Database
  Performing a DELETE on a specific database resource deletes the database resource and its child resources, i.e. users, permissions, collections, documents, attachments, stored procedures, triggers, and user-defined functions.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|DELETE|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}`|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid).|  
  
### Headers  
 See [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
### Body  
 None.  
  
## Response  
  
### Headers  
 See [Common DocumentDB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|204 No Content|The delete operation was successful.|  
|404 Not Found|The database to be deleted is no longer a resource, i.e. the resource was already deleted.|  
  
### Body  
 None.  
  
## Example  
  
```  
DELETE https://contosomarketing.documents.azure.com/dbs/volcanodb2 HTTP/1.1  
x-ms-date: Tue, 08 Dec 2015 19:43:19 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dA7Gg2gVKimd4r4WcuYh518tQsbTlgSZKSLx65e%2f%2f4Cw%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Content-Length: 0  
Connection: Keep-Alive  
  
```  
  
```  
HTTP/1.1 204 No Content  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Length: 0  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb2  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 02:25:35.212 GMT  
x-ms-resource-quota: databases=100;  
x-ms-resource-usage: databases=14;  
x-ms-schemaversion: 1.1  
x-ms-quorum-acked-lsn: 860  
x-ms-session-token: 861  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 4.95  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: b3c53c99-0d3c-433c-b77f-1e05217a1d81  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 19:43:20 GMT  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](../Topic/Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  