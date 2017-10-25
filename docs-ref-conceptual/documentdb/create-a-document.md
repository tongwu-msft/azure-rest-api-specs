---
title: "Create a Document - Azure Cosmos DB REST API"
ms.custom: ""
ms.date: "2017-07-07"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c341c439-b854-4a5d-8982-448ff5e22f22
caps.latest.revision: 9
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
# Create Document
Azure Cosmos DB is a globally distributed multi-model database with support for multiple APIs. This article covers the DocumentDB API for Azure Cosmos DB. 

The `Create Document` operation creates a new document in a collection.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|POST|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/docs|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {coll-id} value is the name of the collection that contains the document.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all Azure Cosmos DB requests.  
  
|Header|Required|Type|Description|  
|------------|--------------|----------|-----------------|  
|**x-ms-documentdb-is-upsert**|Optional|Boolean|If set to true, Cosmos DB will create the document with the id (and partition key value if applicable) if it doesn’t exist, or update the document if it exists.|  
|**x-ms-indexing-directive**|Optional|String|The acceptable value is **Include** or **Exclude**.<br /><br /> -   **Include** adds the document to the index.<br />-   **Exclude** omits the document from indexing.<br /><br /> The default for indexing behavior is determined by the automatic property’s value in the indexing policy for the collection.|  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**id**|Required|String|This is a user created property, it is not auto generated. It is the unique id that identifies the document, i.e. no two documents should share the same **id**. The **id** must not exceed 255 characters.|  
|\<custom>|Required|JSON|Any user defined JSON.|  
  
```  
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
  "IsRegistered": true  
}  
  
```  
  
## Response  
 Returns the body of the created document.  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Azure Cosmos DB responses.  
  
|Property|Type|Description|  
|--------------|----------|-----------------|  
|**x-ms-request-charge**|Number|The number of request units consumed by the operation.|  
|**x-ms-session-token**|String|A string token used with session level consistency. Clients must save this value and set it for subsequent read requests for session consistency.|  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|201 Created|The operation was successful.|  
|400 Bad Request|The JSON body is invalid.|  
|403 Forbidden|The operation could not be completed because the storage limit of the partition has been reached.|  
|409 Conflict|The id provided for the new document has been taken by an existing document.|  
|413 Entity Too Large|The document size in the request exceeded the allowable document size.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the document resource.|  
|**_ts**|This is a [system generated property](http://docs.microsoft.com/azure/cosmos-db/documentdb-resources#system-vs-user-defined-resources). It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource **etag** required for optimistic concurrency control.|  
|**_attachments**|This is a system generated property that specifies the addressable path for the attachments resource.|  
  
```  
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
  
## Example  
  
```  
POST https://querydemo.documents.azure.com/dbs/1KtjAA==/colls/1KtjAImkcgw=/docs HTTP/1.1  
x-ms-documentdb-partitionkey: ["Andersen"]  
x-ms-date: Tue, 29 Mar 2016 02:28:29 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3d92WMAkQv0Zu35zpKZD%2bcGSH%2b2SXd8HGxHIvJgxhO6%2fs%3d  
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.Documents.Client/1.6.0.0  
x-ms-version: 2015-12-16  
Accept: application/json  
Host: querydemo.documents.azure.com  
Cookie: x-ms-session-token#0=602; x-ms-session-token=602  
Content-Length: 344  
Expect: 100-continue  
  
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
  "IsRegistered": true  
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
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB: DocumentDB API](https://docs.microsoft.com/azure/cosmos-db/documentdb-introduction)   
* [Azure Cosmos DB SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/documentdb-sdk-dotnet)   
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

