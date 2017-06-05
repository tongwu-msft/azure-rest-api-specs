---
title: "List Documents"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 80f46d1d-be9b-452f-a6ac-eb891a3f66a6
caps.latest.revision: 10
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
# List (ReadFeed) Documents
 Performing a GET on the documents resource of a particular collection, i.e. the docs URI path, returns a list of documents under the collection. ReadFeed can be used to retrieve all documents, or just the [incremental changes](https://docs.microsoft.com/azure/documentdb/documentdb-change-feed) to documents within the collection.
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/docs`|Note that the `{databaseaccount}` is the name of the Azure Cosmos DB account created under your subscription. The `{db-id}` value is id of the database and {coll-id} value is the name of the collection.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests. The important response headers for ReadFeed Document are the following:  
  
|Header|Required|Type|Description|  
|------------|--------------|----------|-----------------|  
|`x-ms-max-item-count`|Optional|Number|An integer indicating the maximum number of items to be returned per page.|  
|`x-ms-continuation`|Optional|String|A string token returned for queries and read-feed operations if there are more results to be read. Clients can retrieve the next page of results by resubmitting the request with the x-ms-continuation request header set to this value.|  
|`x-ms-consistency-level`|Optional|String|This is the consistency level override. The valid values are: **Strong**, **Bounded**, **Session**, or **Eventual** (in order of strongest to weakest). The override must be the same or weaker than the account’s configured consistency level.|  
|`x-ms-session-token`|Optional|String|A string token used with session level consistency. Clients must echo the latest read value of this header during read requests for session consistency.|  
|`A-IM`|Optional|String|Must be set to `Incremental feed`, or omitted otherwise. Available from REST API version `2016-07-11` onwards.|  
|`If-None-Match`|Optional|String|<p>No header: returns all changes from the beginning (collection creation)</p><p>"*": returns all new changes to data within the collection</p><p>&lt;etag&gt;: If set to a collection ETag, returns all changes made since that logical timestamp.</p><p>Available from REST API version `2016-07-11` onwards.</p>|  
|`x-ms-documentdb-partitionkeyrangeid`|Optional|String|The partition key range ID for reading data. Available from REST API version `2016-07-11` onwards.|  

  
### Body  
 None.  
  
## Response  
 Returns an array of documents stored within the collection.  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  The important response headers are:  
  
|Header|Type|Description|  
|------------|----------|-----------------|  
|`x-ms-continuation`|String|Returns a token to fetch additional results from the operation. The client can resubmit the request with the `x-ms-continuation request` header containing this value to resume execution.|  
|`x-ms-request-charge`|Number|The number of request units consumed by the operation.|  
|`etag`|String|<p>The logical sequence number (LSN) of last document returned in the response.</p><p>incremental ReadDocumentFeed can be resumed by resubmitting this value in If-None-Match.</p>|  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 OK|The operation was successful.|  
|400 Bad Request|The override set in x-ms-consistency-level is stronger than the one set during account creation. For example, if the consistency level is Session, the override cannot be Strong or Bounded.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|`_rid`|This is the system generated resource ID for the collection where the documents reside.|  
|`_count`|This is the number of documents returned by the list operation.|  
|`Documents`|The array of documents returned by the operation.|  
  
 **Properties of Document**  
  
|Property|Description|  
|--------------|-----------------|  
|`id`|This is the unique name that identifies the document, i.e. no two documents can share the same `id`. The `id` must not exceed 255 characters.|  
|\<custom>|Any user-defined JSON.|  
|`_rid`|This is a [system generated property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). The resource ID (`_rid`) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the document resource.|  
|`_ts`|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|`_self`|This is a system generated property. It is the unique addressable URI for the resource.|  
|`_etag`|This is a system generated property that specifies the resource `etag` required for optimistic concurrency control.|  
|`_attachments`|This is a system generated property that specifies the addressable path for the attachments resource.|  
  
```  
{  
  "_rid": "d9RzAJRFKgw=",  
  "Documents": [  
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
    },  
    {  
      "id": "SalesOrder2",  
      "ponumber": "PO15428132599",  
      "OrderDate": "2005-07-01T00:00:00",  
      "DueDate": "2005-07-13T00:00:00",  
      "ShippedDate": "2005-07-08T00:00:00",  
      "AccountNumber": "Account2",  
      "SubTotal": 6107.0820,  
      "TaxAmt": 586.1203,  
      "Freight": 183.1626,  
      "TotalDue": 4893.3929,  
      "DiscountAmt": 1982.872,  
      "Items": [  
        {  
          "OrderQty": 3,  
          "ProductCode": "A-123",  
          "ProductName": "Product 1",  
          "CurrencySymbol": "$",  
          "CurrencyCode": "USD",  
          "UnitPrice": 17.1,  
          "LineTotal": 5.7  
        }  
      ],  
      "_rid": "d9RzAJRFKgwCAAAAAAAAAA==",  
      "_self": "dbs/d9RzAA==/colls/d9RzAJRFKgw=/docs/d9RzAJRFKgwCAAAAAAAAAA==/",  
      "_etag": "\"0000da86-0000-0000-0000-56f9e25b0000\"",  
      "_ts": 1459216987,  
      "_attachments": "attachments/"  
    }  
  ],  
  "_count": 2  
}  
  
```  
  
## Example  
  
```  
GET https://querydemo.documents.azure.com/dbs/testdb/colls/testcoll/docs HTTP/1.1  
x-ms-max-item-count: 10  
x-ms-documentdb-query-enablecrosspartition: False  
x-ms-date: Tue, 29 Mar 2016 02:03:06 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dlmte5%2bJR8gIvDubFWZ0W2cgec22LcFAkZgDZxqOBsOI%3d  
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
Content-Location: https://querydemo.documents.azure.com/dbs/testdb/colls/testcoll/docs  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 27 Mar 2016 22:39:13.369 GMT  
x-ms-resource-quota: documentSize=10240;documentsSize=10485760;collectionSize=10485760;  
x-ms-resource-usage: documentSize=0;documentsSize=2;collectionSize=2;  
x-ms-item-count: 2  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/testdb/colls/testcoll  
x-ms-content-path: d9RzAJRFKgw=  
x-ms-request-charge: 1  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: 46e2e9a5-4917-4ff6-9be5-6f206c38bb6b  
x-ms-session-token: 0:772  
Set-Cookie: x-ms-session-token#0=772; Domain=querydemo.documents.azure.com; Path=/dbs/testdb/colls/testcoll  
Set-Cookie: x-ms-session-token=772; Domain=querydemo.documents.azure.com; Path=/dbs/testdb/colls/testcoll  
x-ms-gatewayversion: version=1.6.52.5  
Date: Tue, 29 Mar 2016 02:03:07 GMT  
  
{  
  "_rid": "d9RzAJRFKgw=",  
  "Documents": [  
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
    },  
    {  
      "id": "SalesOrder2",  
      "ponumber": "PO15428132599",  
      "OrderDate": "2005-07-01T00:00:00",  
      "DueDate": "2005-07-13T00:00:00",  
      "ShippedDate": "2005-07-08T00:00:00",  
      "AccountNumber": "Account2",  
      "SubTotal": 6107.0820,  
      "TaxAmt": 586.1203,  
      "Freight": 183.1626,  
      "TotalDue": 4893.3929,  
      "DiscountAmt": 1982.872,  
      "Items": [  
        {  
          "OrderQty": 3,  
          "ProductCode": "A-123",  
          "ProductName": "Product 1",  
          "CurrencySymbol": "$",  
          "CurrencyCode": "USD",  
          "UnitPrice": 17.1,  
          "LineTotal": 5.7  
        }  
      ],  
      "_rid": "d9RzAJRFKgwCAAAAAAAAAA==",  
      "_self": "dbs/d9RzAA==/colls/d9RzAJRFKgw=/docs/d9RzAJRFKgwCAAAAAAAAAA==/",  
      "_etag": "\"0000da86-0000-0000-0000-56f9e25b0000\"",  
      "_ts": 1459216987,  
      "_attachments": "attachments/"  
    }  
  ],  
  "_count": 2  
}  
  
```  
  
## See Also  
 [Azure Cosmos DB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

