---
title: "Query Documents"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
ms.assetid: 6fd30626-2d87-4090-8a29-b0c83da9aa2c
caps.latest.revision: 6
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
# Query Documents
  You can query arbitrary JSON documents in a collection by performing a POST against the “colls” resource in DocumentDB. The SQL syntax of DocumentDB provides hierarchical, relational, and spatial query operators to query and project documents. For additional details on querying resources in DocumentDB, see Querying Resources.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|POST|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/docs|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {coll-id} value is the name of the collection.|  
  
### Headers  
 See [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
|Header|Required|Type|Description|  
|------------|--------------|----------|-----------------|  
|**x-ms-documentdb-isquery**|Required|Boolean|Must be set to True indicating that the POST is a query.|  
|**Content-Type**|Required|String|A string that must be set to **application/query+json**.|  
|**x-ms-max-item-count**|Optional|Number|An integer indicating the maximum number of items to be returned per page. Queries will return no more than the specified number of items per page, but could be fewer depending on the collection performance tier and their sizes. An x-ms-max-item-count of -1 can be specified to let the service determine the optimal item count. This is the recommended configuration value for x-ms-max-item-count.|  
|**x-ms-continuation**|Optional|String|A string token returned for queries and read-feed operations if there are more results to be read. Clients can retrieve the next page of results by resubmitting the request with the x-ms-continuation request header set to this value.|  
|**x-ms-documentdb-query-enablecrosspartition**|Optional|Boolean|If the collection is partitioned, this must be set to True to allow execution across multiple partitions. Queries that filter against a single partition key, or against single-partitioned collections do not need to set the header.|  
|**x-ms-consistency-level**|Optional|String|This is the consistency level override. The valid values are: Strong, Bounded, Session, or Eventual (in order of strongest to weakest). The override must be the same or weaker than the account’s configured consistency level.|  
|**x-ms-session-token**|Optional|String|A string token used with session level consistency. Clients must echo the latest read value of this header during read requests for session consistency.|  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**query**|Required|String|Contains the SQL query text. For grammar, see [SQL Grammar](https://azure.microsoft.com/documentation/articles/documentdb-sql-query/).|  
|**parameters**|Required|Array|An array of parameter values for the query.|  
  
```  
{  
  "query": "SELECT * FROM Families f WHERE f.id = @id AND f.Address.City = @city",  
  "parameters": [  
    {  
      "name": "@id",  
      "value": "AndersenFamily"  
    },  
    {  
      "name": "@city",  
      "value": "Seattle"  
    }  
  ]  
}  
  
```  
  
## Response  
 Returns an array of documents that match the requested query.  
  
### Headers  
 See [Common DocumentDB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses. The important response headers are:  
  
|Property|Type|Description|  
|--------------|----------|-----------------|  
|**x-ms-continuation**|String|Returns a token to fetch additional results from the operation. The client can resubmit the request with the x-ms-continuation request header containing this value to resume execution.|  
|**x-ms-request-charge**|Number|The number of request units consumed by the operation.|  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 OK|The operation was successful.|  
|400 Bad Request|The specified request was specified with an incorrect SQL syntax, or missing required headers.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is the system generated resource ID for the collection where the documents reside.|  
|**_count**|This is the number of documents returned by the list operation.|  
|**Documents**|The array of documents returned by the operation.|  
  
 **Properties of Document**  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|This is the unique name that identifies the document, i.e. no two documents can share the same **id**. The **id** must not exceed 255 characters.|  
|\<custom>|Any user-defined JSON.|  
|**_rid**|This is a [system generated property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the document resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource **etag** required for optimistic concurrency control.|  
|**_attachments**|This is a system generated property that specifies the addressable path for the attachments resource.|  
  
```  
{  
  "_rid": "1KtjAImkcgw=",  
  "Documents": [  
    {  
      "id": "AndersenFamily",  
      "LastName": "Andersen",  
      "Parents": [  
        {  
          "FamilyName": null,  
          "FirstName": "Thomas"  
        },  
        {  
          "FamilyName": null,  
          "FirstName": "Mary Kay"  
        }  
      ],  
      "Children": [  
        {  
          "FamilyName": null,  
          "FirstName": "Henriette Thaulow",  
          "Gender": "female",  
          "Grade": 5,  
          "Pets": [  
            {  
              "GivenName": "Fluffy"  
            }  
          ]  
        }  
      ],  
      "Address": {  
        "State": "WA",  
        "County": "King",  
        "City": "Seattle"  
      },  
      "IsRegistered": true,  
      "_rid": "1KtjAImkcgwBAAAAAAAAAA==",  
      "_self": "dbs/1KtjAA==/colls/1KtjAImkcgw=/docs/1KtjAImkcgwBAAAAAAAAAA==/",  
      "_etag": "\"00003200-0000-0000-0000-56f9e84d0000\"",  
      "_ts": 1459218509,  
      "_attachments": "attachments/"  
    }  
  ],  
  "_count": 1  
}  
  
```  
  
## Example  
  
```  
POST https://querydemo.documents.azure.com/dbs/1KtjAA==/colls/1KtjAImkcgw=/docs HTTP/1.1  
x-ms-continuation:   
x-ms-documentdb-isquery: True  
x-ms-documentdb-query-enablecrosspartition: True  
x-ms-date: Tue, 29 Mar 2016 02:28:32 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3drOlOhFh9plfC0ggZfmHtS3XepVitiIRsd6i1d9PnuW8%3d  
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.Documents.Client/1.6.0.0  
x-ms-version: 2015-12-16  
Accept: application/json  
Content-Type: application/query+json  
Host: querydemo.documents.azure.com  
Cookie: x-ms-session-token#0=604; x-ms-session-token=604  
Content-Length: 170  
Expect: 100-continue  
  
{  
  "query": "SELECT * FROM Families f WHERE f.id = @id AND f.Address.City = @city",  
  "parameters": [  
    {  
      "name": "@id",  
      "value": "AndersenFamily"  
    },  
    {  
      "name": "@city",  
      "value": "Seattle"  
    }  
  ]  
}  
  
```  
  
```  
HTTP/1.1 201 Created  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Transfer-Encoding: chunked  
Content-Type: application/json  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Fri, 25 Mar 2016 22:39:02.501 GMT  
etag: "00003200-0000-0000-0000-56f9e84d0000"  
x-ms-resource-quota: documentSize=10240;documentsSize=10485760;collectionSize=10485760;  
x-ms-resource-usage: documentSize=0;documentsSize=1;collectionSize=1;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/testdb/colls/testcoll  
x-ms-quorum-acked-lsn: 602  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 12.38  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: 856acd38-320d-47df-ab6f-9761bb987668  
x-ms-session-token: 0:603  
Set-Cookie: x-ms-session-token#0=603; Domain=querydemo.documents.azure.com; Path=/dbs/1KtjAA==/colls/1KtjAImkcgw=  
Set-Cookie: x-ms-session-token=603; Domain=querydemo.documents.azure.com; Path=/dbs/1KtjAA==/colls/1KtjAImkcgw=  
x-ms-gatewayversion: version=1.6.52.5  
Date: Tue, 29 Mar 2016 02:28:30 GMT  
  
{  
  "id": "AndersenFamily",  
  "LastName": "Andersen",  
  "Parents": [  
    {  
      "FamilyName": null,  
      "FirstName": "Thomas"  
    },  
    {  
      "FamilyName": null,  
      "FirstName": "Mary Kay"  
    }  
  ],  
  "Children": [  
    {  
      "FamilyName": null,  
      "FirstName": "Henriette Thaulow",  
      "Gender": "female",  
      "Grade": 5,  
      "Pets": [  
        {  
          "GivenName": "Fluffy"  
        }  
      ]  
    }  
  ],  
  "Address": {  
    "State": "WA",  
    "County": "King",  
    "City": "Seattle"  
  },  
  "IsRegistered": true,  
  "_rid": "1KtjAImkcgwBAAAAAAAAAA==",  
  "_self": "dbs/1KtjAA==/colls/1KtjAImkcgw=/docs/1KtjAImkcgwBAAAAAAAAAA==/",  
  "_etag": "\"00003200-0000-0000-0000-56f9e84d0000\"",  
  "_ts": 1459218509,  
  "_attachments": "attachments/"  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  