---
title: "Replace a Document"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 8c811a34-a7fc-48c3-8896-6f24099ddf45
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
# Replace a Document
Azure Cosmos DB is a globally distributed multi-model database with support for multiple APIs. This article covers the DocumentDB API for Azure Cosmos DB. 

The `Replace Document` operation replaces the entire content of a document.
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|PUT|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/docs/{doc-name}|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {coll-id} value is the name of the collection. The {doc-name} value is the name of the document to be replaced.|  
  
### Headers  
 See [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests. The important headers for this request are:  
  
|Header|Required|Type|Description|  
|------------|--------------|----------|-----------------|  
|**x-ms-indexing-directive**|Optional|String|The acceptable values are **Include** or **Exclude**. **Include** includes the document in the indexing path while **Exclude** omits the document from indexing.|  
|**x-ms-documentdb-partitionkey**|Optional|Array|The partition key value for the document to be deleted. Required if and must be specified only if the collection is created with a **partitionKey** definition.|  
|**If-Match**|Optional|String|Used to make operation conditional for optimistic concurrency. i.e. the document is updated only if the specified etag matches the current version in the database. The value should be set to the etag value of the resource.|  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**id**|Required|String|This is a user settable property. It is a unique name to identify a document, i.e. no two documents should share the same **id**. The **id** must not exceed 255 characters.|  
|\<custom>|Required|JSON|Any user defined JSON. For information about document size limits, see [DocumentDB limits](http://azure.microsoft.com/documentation/articles/documentdb-limits/).|  
  
```  
{  
  "id": "_SalesOrder5",  
  "AccountNumber": "NewUser01",  
  "PurchaseOrderNumber": "PO18009186470",  
  "OrderDate": "2016-03-29T02:03:07.3526153Z",  
  "Total": 5.95,  
  "_rid": "d9RzAJRFKgwEAAAAAAAAAA==",  
  "_self": "dbs/d9RzAA==/colls/d9RzAJRFKgw=/docs/d9RzAJRFKgwEAAAAAAAAAA==/",  
  "_etag": "\"0000de86-0000-0000-0000-56f9e25c0000\"",  
  "_ts": 1459216988,  
  "_attachments": "attachments/",  
  "shippedDate": "2016-03-29T02:03:07.4680723Z",  
  "foo": "bar"  
}  
  
```  
  
## Response  
 Replace Document returns the updated document body.  
  
### Headers  
 See [Common DocumentDB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses. The important response headers for Replace Document are the following:  
  
|Header|Type|Description|  
|------------|----------|-----------------|  
|**x-ms-request-charge**|Number|The number of request units consumed by the operation.|  
|**x-ms-session-token**|String|A string token used with session level consistency. Clients must save this value and set it for subsequent read requests for session consistency.|  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes.|  
|404 Not Found|The document no longer exists, i.e. the document was deleted.|  
|409 Conflict|The id provided for the new document has been taken by an existing document.|  
|413 Entity Too Large|The document size in the request exceeded the allowable document size in a request. For more information on document size limits, see [DocumentDB limits](http://azure.microsoft.com/documentation/articles/documentdb-limits/).|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a [system generated property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the document resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource **etag** required for optimistic concurrency control.|  
|**_attachments**|This is a system generated property that specifies the addressable path for the attachments resource.|  
  
```  
{  
  "id": "_SalesOrder5",  
  "AccountNumber": "NewUser01",  
  "PurchaseOrderNumber": "PO18009186470",  
  "OrderDate": "2016-03-29T02:03:07.3526153Z",  
  "Total": 5.95,  
  "_rid": "d9RzAJRFKgwEAAAAAAAAAA==",  
  "_self": "dbs/d9RzAA==/colls/d9RzAJRFKgw=/docs/d9RzAJRFKgwEAAAAAAAAAA==/",  
  "_etag": "\"0000df86-0000-0000-0000-56f9e25c0000\"",  
  "_ts": 1459216988,  
  "_attachments": "attachments/",  
  "shippedDate": "2016-03-29T02:03:07.4680723Z",  
  "foo": "bar"  
}  
  
```  
  
## Example  
  
```  
PUT https://querydemo.documents.azure.com/dbs/d9RzAA==/colls/d9RzAJRFKgw=/docs/d9RzAJRFKgwEAAAAAAAAAA== HTTP/1.1  
x-ms-documentdb-partitionkey: []  
x-ms-date: Tue, 29 Mar 2016 02:03:07 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dP7DBdb6lXOnL55kXRL2L%2frt3PE8kybJCIT%2ffViY7UhU%3d  
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.Documents.Client/1.6.0.0  
x-ms-version: 2015-12-16  
Accept: application/json  
Host: querydemo.documents.azure.com  
Cookie: x-ms-session-token#0=777; x-ms-session-token=777  
Content-Length: 405  
Expect: 100-continue  
  
{  
  "id": "_SalesOrder5",  
  "AccountNumber": "NewUser01",  
  "PurchaseOrderNumber": "PO18009186470",  
  "OrderDate": "2016-03-29T02:03:07.3526153Z",  
  "Total": 5.95,  
  "_rid": "d9RzAJRFKgwEAAAAAAAAAA==",  
  "_self": "dbs/d9RzAA==/colls/d9RzAJRFKgw=/docs/d9RzAJRFKgwEAAAAAAAAAA==/",  
  "_etag": "\"0000de86-0000-0000-0000-56f9e25c0000\"",  
  "_ts": 1459216988,  
  "_attachments": "attachments/",  
  "shippedDate": "2016-03-29T02:03:07.4680723Z",  
  "foo": "bar"  
}  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Transfer-Encoding: chunked  
Content-Type: application/json  
Content-Location: https://querydemo.documents.azure.com/dbs/d9RzAA==/colls/d9RzAJRFKgw=/docs/d9RzAJRFKgwEAAAAAAAAAA==  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Fri, 25 Mar 2016 21:55:47.482 GMT  
etag: "0000df86-0000-0000-0000-56f9e25c0000"  
x-ms-resource-quota: documentSize=10240;documentsSize=10485760;collectionSize=10485760;  
x-ms-resource-usage: documentSize=0;documentsSize=3;collectionSize=3;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/testdb/colls/testcoll  
x-ms-quorum-acked-lsn: 777  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 10.67  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: a86cddb9-75f6-423e-8d42-f6b5ac817209  
x-ms-session-token: 0:778  
Set-Cookie: x-ms-session-token#0=778; Domain=querydemo.documents.azure.com; Path=/dbs/d9RzAA==/colls/d9RzAJRFKgw=  
Set-Cookie: x-ms-session-token=778; Domain=querydemo.documents.azure.com; Path=/dbs/d9RzAA==/colls/d9RzAJRFKgw=  
x-ms-gatewayversion: version=1.6.52.5  
Date: Tue, 29 Mar 2016 02:03:07 GMT  
  
{  
  "id": "_SalesOrder5",  
  "AccountNumber": "NewUser01",  
  "PurchaseOrderNumber": "PO18009186470",  
  "OrderDate": "2016-03-29T02:03:07.3526153Z",  
  "Total": 5.95,  
  "_rid": "d9RzAJRFKgwEAAAAAAAAAA==",  
  "_self": "dbs/d9RzAA==/colls/d9RzAJRFKgw=/docs/d9RzAJRFKgwEAAAAAAAAAA==/",  
  "_etag": "\"0000df86-0000-0000-0000-56f9e25c0000\"",  
  "_ts": 1459216988,  
  "_attachments": "attachments/",  
  "shippedDate": "2016-03-29T02:03:07.4680723Z",  
  "foo": "bar"  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  