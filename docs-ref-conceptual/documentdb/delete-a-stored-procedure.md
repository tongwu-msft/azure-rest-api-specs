---
title: "Delete a Stored Procedure - Azure Cosmos DB REST API"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 92e2c940-b2f1-4d63-a2a8-1a2409c98811
caps.latest.revision: 7
author: "mimig1"
ms.author: "mimig"
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
# Delete Stored Procedure
The `Delete Stored Procedure` operation deletes an existing stored procedure in a collection.
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|DELETE|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/sprocs/{sproc-id}`|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription.|  
  
### Headers  
See [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests.  
  
### Body  
None.  
  
## Response  
  
### Headers  
See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  
  
### Status codes  
The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|204 No Content|The delete operation was successful.|  
|404 Not Found|The stored procedure to be deleted is no longer a resource, i.e. the resource was already deleted.|  
  
### Body  
 None.  
  
## Example  
  
```  
DELETE https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/sprocs/sproc_hello_world HTTP/1.1  
x-ms-session-token: 30  
x-ms-date: Wed, 09 Dec 2015 17:29:07 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3ddo9F4P8aStQ9gzkwX7oxIP%2bYfaaAcWbGTpUJLbsKKTs%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=30  
Content-Length: 0  
Connection: Keep-Alive  
  
```  
  
```  
HTTP/1.1 204 No Content  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Length: 0  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/sprocs/sproc_hello_world  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 19:20:18.154 GMT  
x-ms-resource-quota: storedProcedures=25;  
x-ms-resource-usage: storedProcedures=0;  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1  
x-ms-content-path: Sl8fALN4sw4=  
x-ms-session-token: 31  
x-ms-request-charge: 4.95  
x-ms-activity-id: 0817ae40-4d11-4e13-8fa8-4bdce474dfcc  
Set-Cookie: x-ms-session-token=31; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/colls/volcano1  
Date: Wed, 09 Dec 2015 17:29:06 GMT  
  
```  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB: DocumentDB API](https://docs.microsoft.com/azure/cosmos-db/documentdb-introduction)   
* [Azure Cosmos DB SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/documentdb-sdk-dotnet)   
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

