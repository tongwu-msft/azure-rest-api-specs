---
title: "Delete a Document"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b9c02a18-bc78-4457-8730-903b772a577b
caps.latest.revision: 9
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
# Delete a Document
  Performing a DELETE operation on a specific document resource deletes the document resource from the collection.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|DELETE|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/docs/{doc-name}|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {coll-id} value is the name of the collection. The {doc-name} value is the name of the document to be deleted.|  
  
### Headers  
 See [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
|Header|Required|Type|Description|  
|------------|--------------|----------|-----------------|  
|**x-ms-documentdb-partitionkey**|Optional|Array|The partition key value for the document to be deleted. Must be included if and only if the collection is created with a **partitionKey** definition.|  
  
### Body  
 None.  
  
## Response  
 The service returns an empty response body.  
  
### Headers  
 See [Common DocumentDB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses. The important response headers for Delete Document are the following:  
  
|Property|Type|Description|  
|--------------|----------|-----------------|  
|**x-ms-request-charge**|Number|The number of request units consumed by the operation.|  
|**x-ms-session-token**|String|A string token used with session level consistency. Clients must save this value and set it for subsequent read requests for session consistency.|  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|204 No Content|The delete operation was successful.|  
|404 Not Found|The document no longer exists, i.e. the document was already deleted.|  
  
### Body  
 None.  
  
## Example  
  
```  
DELETE https://querydemo.documents.azure.com/dbs/testdb/colls/testcoll/docs/SalesOrder3 HTTP/1.1  
x-ms-documentdb-partitionkey: ["Account1"]  
x-ms-date: Tue, 29 Mar 2016 02:03:07 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dvR4ZglipsSQvOX176KTSLz7G21rfxS784sxfUEae4N0%3d  
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.Documents.Client/1.6.0.0  
x-ms-version: 2015-12-16  
Accept: application/json  
Host: querydemo.documents.azure.com  
Cookie: x-ms-session-token#0=775; x-ms-session-token=775  
Content-Length: 0  
  
```  
  
```  
HTTP/1.1 204 No Content  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Length: 0  
Content-Type: application/json  
Content-Location: https://querydemo.documents.azure.com/dbs/testdb/colls/testcoll/docs/SalesOrder3  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Fri, 25 Mar 2016 21:55:47.482 GMT  
x-ms-resource-quota: documentSize=10240;documentsSize=10485760;collectionSize=10485760;  
x-ms-resource-usage: documentSize=0;documentsSize=2;collectionSize=2;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/testdb/colls/testcoll  
x-ms-content-path: d9RzAJRFKgw=  
x-ms-quorum-acked-lsn: 775  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 9.33  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: 01b5b7fc-824d-4945-b6ce-4eb3532584a1  
x-ms-session-token: 0:776  
Set-Cookie: x-ms-session-token#0=776; Domain=querydemo.documents.azure.com; Path=/dbs/testdb/colls/testcoll  
Set-Cookie: x-ms-session-token=776; Domain=querydemo.documents.azure.com; Path=/dbs/testdb/colls/testcoll  
x-ms-gatewayversion: version=1.6.52.5  
Date: Tue, 29 Mar 2016 02:03:07 GMT  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  