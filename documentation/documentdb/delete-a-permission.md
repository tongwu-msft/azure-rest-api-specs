---
title: "Delete a Permission"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 37cafc37-8a84-40de-94f9-028af57b14b8
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
# Delete a Permission
  To delete a permission resource, perform a DELETE operation on that permission resource.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|DELETE|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/users/{user-name}/permissions/{permission-name}|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {user-name} value is the name of the user. The {permission-name} value is the name of the permission to be deleted.|  
  
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
|404 Not Found|The permission to be deleted is no longer a resource, i.e. the permission was deleted.|  
  
### Body  
 None.  
  
## Example  
  
```  
DELETE https://contosomarketing.documents.azure.com/dbs/volcanodb/users/a_user/permissions/another_permission HTTP/1.1  
x-ms-date: Tue, 08 Dec 2015 20:08:18 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dbUIHV8x1cdqi0A1Ll1ObUa8qLNt3Pol7ugEd6QmMzAM%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=867  
Content-Length: 0  
Connection: Keep-Alive  
  
```  
  
```  
HTTP/1.1 204 No Content  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Length: 0  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/users/a_user/permissions/another_permission  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 02:25:35.212 GMT  
x-ms-resource-quota: permissions=2000000;  
x-ms-resource-usage: permissions=1;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/users/a_user  
x-ms-content-path: Sl8fAG8cXgA=  
x-ms-quorum-acked-lsn: 867  
x-ms-session-token: 868  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 4.95  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: f404ce51-a0e7-4232-9a93-b5f18ea61693  
Set-Cookie: x-ms-session-token=868; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/users/a_user  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 20:08:17 GMT  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](../Topic/Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  