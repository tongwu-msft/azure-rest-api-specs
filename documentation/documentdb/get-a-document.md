---
title: "Get a Document"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 808c19fa-6a6d-4ce7-953f-7c9316a23b47
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
# Get a Document
  Performing a GET operation on a specific document resource retrieves the user defined JSON elements and system properties of the document.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/docs/{doc-id}|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {coll-id} value is the name of the collection. The {doc-id} value is the id of the document to be retrieved.|  
  
### Headers  
 See [Common DocumentDB REST request headers](../DocumentDBREST/common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests. The important response headers for Read Document are the following:  
  
|Header|Required|Type|Description|  
|------------|--------------|----------|-----------------|  
|**If-None-Match**|Optional|String|The value should be the etag of the resource. Makes operation conditional, i.e. the response includes a body only the value in the database is different from the specified value in the header.|  
|**x-ms-documentdb-partitionkey**|Optional|Array|The partition key value for the document to be read. Must be included if and only if the collection is created with a **partitionKey** definition.|  
|**x-ms-consistency-level**|Optional|String|This is the consistency level override. The valid values are: **Strong**, **Bounded**, **Session**, or **Eventual** (in order of strongest to weakest). The override must be the same or weaker than the account’s configured consistency level.|  
|**x-ms-session-token**|Optional|String|A string token used with session level consistency. Clients must echo the latest read value of this header during read requests for session consistency.|  
  
### Body  
 None.  
  
## Response  
 Returns the content of the requested document.  
  
### Headers  
 See [Common DocumentDB REST response headers](../DocumentDBREST/common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses. The important response headers for Get Document are the following:  
  
|Header|Type|Description|  
|------------|----------|-----------------|  
|**x-ms-request-charge**|Number|The number of request units consumed by the operation.|  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes.](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The operation was successful.|  
|304 Not Modified|The document requested was not modified since the specified eTag value in the If-Match header. The service returns an empty response body.|  
|400 Bad Request|The override set in the **x-ms-consistency-level** header is stronger than the one set during account creation. For example, if the consistency level is **Session**, the override cannot be **Strong** or **Bounded**.|  
|404 Not Found|The document is no longer a resource, i.e. the document was deleted.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|This is the unique name used to identify a document, i.e. no two documents can share the same **id**. The **id** must not exceed 255 characters.|  
|custom|Any user-defined JSON.|  
|**_rid**|This is a [system generated property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the document resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
|**attachments**|This is a system generated property that specifies the addressable path for the attachments resource.|  
  
```  
{  
  "id": "SalesOrder1",  
  "ponumber": "PO18009186470",  
  "OrderDate": "2005-07-01T00:00:00",  
  "ShippedDate": "0001-01-01T00:00:00",  
  "AccountNumber": "Account1",  
  "SubTotal": 419.4589,  
  "TaxAmount": 12.5838,  
  "Freight": 472.3108,  
  "TotalDue": 985.018,  
  "Items": [  
    {  
      "OrderQty": 1,  
      "ProductId": 760,  
      "UnitPrice": 419.4589,  
      "LineTotal": 419.4589  
    }  
  ],  
  "_rid": "d9RzAJRFKgwBAAAAAAAAAA==",  
  "_self": "dbs/d9RzAA==/colls/d9RzAJRFKgw=/docs/d9RzAJRFKgwBAAAAAAAAAA==/",  
  "_etag": "\"0000d986-0000-0000-0000-56f9e25b0000\"",  
  "_ts": 1459216987,  
  "_attachments": "attachments/"  
}  
  
```  
  
## Example  
  
```  
GET https://querydemo.documents.azure.com/dbs/testdb/colls/testcoll/docs/SalesOrder1 HTTP/1.1  
x-ms-documentdb-partitionkey: ["Account1"]  
x-ms-date: Tue, 29 Mar 2016 02:03:06 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dyhmbeaUDy6NCOyWr0t7Cxx4aMT4Yx%2bJnRAs%2br8Theyw%3d  
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.Documents.Client/1.6.0.0  
x-ms-version: 2015-12-16  
Accept: application/json  
Host: querydemo.documents.azure.com  
Cookie: x-ms-session-token#0=772; x-ms-session-token=772  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Transfer-Encoding: chunked  
Content-Type: application/json  
Content-Location: https://querydemo.documents.azure.com/dbs/testdb/colls/testcoll/docs/SalesOrder1  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Mon, 28 Mar 2016 14:47:03.949 GMT  
etag: "0000d986-0000-0000-0000-56f9e25b0000"  
x-ms-resource-quota: documentSize=10240;documentsSize=10485760;collectionSize=10485760;  
x-ms-resource-usage: documentSize=0;documentsSize=2;collectionSize=2;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/testdb/colls/testcoll  
x-ms-content-path: d9RzAJRFKgw=  
x-ms-request-charge: 1  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: c22bc349-2c02-4b80-81b9-a2d758c92902  
x-ms-session-token: 0:772  
Set-Cookie: x-ms-session-token#0=772; Domain=querydemo.documents.azure.com; Path=/dbs/testdb/colls/testcoll  
Set-Cookie: x-ms-session-token=772; Domain=querydemo.documents.azure.com; Path=/dbs/testdb/colls/testcoll  
x-ms-gatewayversion: version=1.6.52.5  
Date: Tue, 29 Mar 2016 02:03:06 GMT  
  
{  
  "id": "SalesOrder1",  
  "ponumber": "PO18009186470",  
  "OrderDate": "2005-07-01T00:00:00",  
  "ShippedDate": "0001-01-01T00:00:00",  
  "AccountNumber": "Account1",  
  "SubTotal": 419.4589,  
  "TaxAmount": 12.5838,  
  "Freight": 472.3108,  
  "TotalDue": 985.018,  
  "Items": [  
    {  
      "OrderQty": 1,  
      "ProductId": 760,  
      "UnitPrice": 419.4589,  
      "LineTotal": 419.4589  
    }  
  ],  
  "_rid": "d9RzAJRFKgwBAAAAAAAAAA==",  
  "_self": "dbs/d9RzAA==/colls/d9RzAJRFKgw=/docs/d9RzAJRFKgwBAAAAAAAAAA==/",  
  "_etag": "\"0000d986-0000-0000-0000-56f9e25b0000\"",  
  "_ts": 1459216987,  
  "_attachments": "attachments/"  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](../Topic/Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  