---
title: "Delete a Collection"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 96485f72-facb-402d-b360-4d2c580cbdd4
caps.latest.revision: 8
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
# Delete a Collection
The `Delete Collection` operation deletes an existing collection in a database.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|DELETE|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {coll-id} value is the name of the collection to be deleted.|  
  
### Headers  
 Delete Collection requires the headers listed under [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md).  
  
### Body  
 None.  
  
## Response  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Azure Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|Code|Description|  
|----------|-----------------|  
|204 No Content|The delete operation was successful.|  
|404 Not Found|The collection to be deleted is no longer a resource, i.e. the collection was deleted.|  
  
### Body  
 None.  
  
## Example  
  
```  
DELETE https://querydemo.documents.azure.com/dbs/testdb/colls/testcoll HTTP/1.1  
x-ms-date: Mon, 28 Mar 2016 20:56:34 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dWmlMB62iSXF%2f0CUMyBD00AzOFH4LlcjzibmFC6zocxc%3d  
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.Documents.Client/1.6.0.0 samples-net/3  
x-ms-version: 2015-12-16  
Accept: application/json  
Host: querydemo.documents.azure.com  
Cookie: x-ms-session-token#0=365; x-ms-session-token=365  
Content-Length: 0  
  
```  
  
```  
HTTP/1.1 204 No Content  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Length: 0  
Content-Type: application/json  
Content-Location: https://querydemo.documents.azure.com/dbs/testdb/colls/testcoll  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Fri, 25 Mar 2016 22:54:09.213 GMT  
x-ms-resource-quota: collections=5000;  
x-ms-resource-usage: collections=28;  
collection-partition-index: 0  
collection-service-index: 0  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/testdb  
x-ms-quorum-acked-lsn: 7850  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 4.95  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: c341354d-7040-4d01-8531-ab66caf7a01c  
x-ms-session-token: M:7851  
Set-Cookie: x-ms-session-token#M=7851; Domain=querydemo.documents.azure.com; Path=/dbs/-6MXAA==/colls/-6MXAPvmWww=  
Set-Cookie: x-ms-session-token=7851; Domain=querydemo.documents.azure.com; Path=/dbs/-6MXAA==/colls/-6MXAPvmWww=  
x-ms-gatewayversion: version=1.6.52.5  
Date: Mon, 28 Mar 2016 20:56:35 GMT  
  
```  
  
## See Also  
 [Azure Cosmos DB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure Cosmos DB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

