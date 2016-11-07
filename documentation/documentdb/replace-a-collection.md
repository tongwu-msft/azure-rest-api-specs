---
title: "Replace a Collection"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "article"
ms.assetid: 22f0a0f2-df1e-40d4-b5ff-12aeecaa1419
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
# Replace a Collection
  Replace Collection supports changing the indexing policy of a collection after creation. Changing other properties of a collection like the ID or the partition key are not supported.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|PUT|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {coll-id} value is the name of the collection to be deleted.|  
  
### Headers  
 See [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**id**|Required|String|The user generated unique name for the collection. No two collections can have the same ids. This is a string that must not be more than 255 characters.|  
|**indexingPolicy**|Optional|Object|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the permission resource.|  
  
```  
{  
  "id": "testcoll",  
  "indexingPolicy": {  
    "indexingMode": "Lazy",  
    "automatic": true,  
    "includedPaths": [  
      {  
        "path": "/*",  
        "indexes": [  
          {  
            "dataType": "Number",  
            "precision": -1,  
            "kind": "Range"  
          },  
          {  
            "dataType": "String",  
            "precision": 3,  
            "kind": "Hash"  
          }  
        ]  
      }  
    ],  
    "excludedPaths": []  
  },  
  "_rid": "XrdaAKx3Hgw=",  
  "_ts": 1459203135,  
  "_self": "dbs/XrdaAA==/colls/XrdaAKx3Hgw=/",  
  "_etag": "\"00006c00-0000-0000-0000-56f9ac3f0000\"",  
  "_docs": "docs/",  
  "_sprocs": "sprocs/",  
  "_triggers": "triggers/",  
  "_udfs": "udfs/",  
  "_conflicts": "conflicts/"  
}  
  
```  
  
## Response  
 Replace Collection returns the updated collection as a response body.  
  
### Headers  
 See [Common DocumentDB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|Code|Description|  
|----------|-----------------|  
|201 Created|The operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes.|  
|409 Conflict|The id provided for the new collection has been taken by an existing collection.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|id|This is the unique name that identifies the new collection.|  
|_rid|This is a system generated property. The resource ID (_rid) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the permission resource.|  
|_ts|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|_self|This is a system generated property. It is the unique addressable URI for the resource.|  
|_etag|This is a system generated property representing the resource etag required for optimistic concurrency control.|  
|_doc|This is a system generated property that specifies the addressable path of the documents resource.|  
|_sprocs|This is a system generated property that specifies the addressable path of the stored procedures (sprocs) resource.|  
|_triggers|This is a system generated property that specifies the addressable path of the triggers resource.|  
|_udfs|This is a system generated property that specifies the addressable path of the user-defined functions (udfs) resource.|  
|_conflicts|This is a system generated property that specifies the addressable path of the conflicts resource. During an operation on a resource within a collection, if a conflict occurs, users can inspect the conflicting resources by performing a GET on the conflicts URI path.|  
|indexingPolicy|This is the indexing policy settings for collection.|  
|partitionKey|This is the partitioning configuration settings for collection.|  
  
 **Properties under Included Paths**  
  
|Property|Description|  
|--------------|-----------------|  
|path|Path for which the indexing behavior applies to. Index paths start with the root (/) and typically end with the ? wildcard operator, denoting that there are multiple possible values for the prefix. For example, to serve SELECT * FROM Families F WHERE F.familyName = "Andersen", you must include an index path for /familyName/? in the collection’s index policy.<br /><br /> Index paths can also use the \* wildcard operator to specify the behavior for paths recursively under the prefix. For example, /payload/\* can be used to exclude everything under the payload property from indexing.|  
|dataType|This is the datatype for which the indexing behavior is applied to. Can be **String**, **Number**, *Point**, **Polygon**, or **LineString**. Note that Booleans and nulls are automatically indexed|  
|kind|The type of index. **Hash** indexes are useful for equality comparisons while **Range** indexes are useful for equality, range comparisons and sorting. **Spatial** indexes are useful for spatial queries.|  
|precision|The precision of the index. Can be either set to -1 for maximum precision or between 1-8 for **Number**, and 1-100 for **String**. Not applicable for **Point**, **Polygon**, and **LineString** data types.| 
  
 **Properties under Excluded Paths**  
  
|Property|Description|  
|--------------|-----------------|  
|path|Path that is excluded from indexing. Index paths start with the root (/) and typically end with the * wildcard operator. For example, /payload/\* can be used to exclude everything under the payload property from indexing.|  
  
```  
{  
  "id": "testcoll",  
  "indexingPolicy": {  
    "indexingMode": "lazy",  
    "automatic": true,  
    "includedPaths": [  
      {  
        "path": "/*",  
        "indexes": [  
          {  
            "kind": "Range",  
            "dataType": "Number",  
            "precision": -1  
          },  
          {  
            "kind": "Hash",  
            "dataType": "String",  
            "precision": 3  
          }  
        ]  
      }  
    ],  
    "excludedPaths": []  
  },  
  "_rid": "XrdaAKx3Hgw=",  
  "_ts": 1459203136,  
  "_self": "dbs/XrdaAA==/colls/XrdaAKx3Hgw=/",  
  "_etag": "\"00006e00-0000-0000-0000-56f9ac400000\"",  
  "_docs": "docs/",  
  "_sprocs": "sprocs/",  
  "_triggers": "triggers/",  
  "_udfs": "udfs/",  
  "_conflicts": "conflicts/"  
}  
  
```  
  
## Example  
  
```  
PUT https://querydemo.documents.azure.com/dbs/XrdaAA==/colls/XrdaAKx3Hgw= HTTP/1.1  
x-ms-date: Mon, 28 Mar 2016 22:12:16 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dZY2s2H1TuPFKk1H2od5qVLbn57vjI9rKz0CMXKOk3GA%3d  
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.Documents.Client/1.6.0.0  
x-ms-version: 2015-12-16  
Accept: application/json  
Host: querydemo.documents.azure.com  
Content-Length: 475  
Expect: 100-continue  
  
{  
  "id": "testcoll",  
  "indexingPolicy": {  
    "indexingMode": "Lazy",  
    "automatic": true,  
    "includedPaths": [  
      {  
        "path": "/*",  
        "indexes": [  
          {  
            "dataType": "Number",  
            "precision": -1,  
            "kind": "Range"  
          },  
          {  
            "dataType": "String",  
            "precision": 3,  
            "kind": "Hash"  
          }  
        ]  
      }  
    ],  
    "excludedPaths": []  
  },  
  "_rid": "XrdaAKx3Hgw=",  
  "_ts": 1459203135,  
  "_self": "dbs/XrdaAA==/colls/XrdaAKx3Hgw=/",  
  "_etag": "\"00006c00-0000-0000-0000-56f9ac3f0000\"",  
  "_docs": "docs/",  
  "_sprocs": "sprocs/",  
  "_triggers": "triggers/",  
  "_udfs": "udfs/",  
  "_conflicts": "conflicts/"  
}  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Transfer-Encoding: chunked  
Content-Type: application/json  
Content-Location: https://querydemo.documents.azure.com/dbs/XrdaAA==/colls/XrdaAKx3Hgw=  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Fri, 25 Mar 2016 22:54:09.213 GMT  
etag: "00006e00-0000-0000-0000-56f9ac400000"  
x-ms-resource-quota: collections=5000;  
x-ms-resource-usage: collections=28;  
collection-partition-index: 0  
collection-service-index: 0  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/testdb  
x-ms-quorum-acked-lsn: 7902  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 9.9  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: 6050a48c-828d-4016-b73b-5e0ce2ad6271  
x-ms-session-token: M:7903  
Set-Cookie: x-ms-session-token#M=7903; Domain=querydemo.documents.azure.com; Path=/dbs/XrdaAA==/colls/XrdaAKx3Hgw=  
Set-Cookie: x-ms-session-token=7903; Domain=querydemo.documents.azure.com; Path=/dbs/XrdaAA==/colls/XrdaAKx3Hgw=  
x-ms-gatewayversion: version=1.6.52.5  
Date: Mon, 28 Mar 2016 22:12:15 GMT  
  
{  
  "id": "testcoll",  
  "indexingPolicy": {  
    "indexingMode": "lazy",  
    "automatic": true,  
    "includedPaths": [  
      {  
        "path": "/*",  
        "indexes": [  
          {  
            "kind": "Range",  
            "dataType": "Number",  
            "precision": -1  
          },  
          {  
            "kind": "Hash",  
            "dataType": "String",  
            "precision": 3  
          }  
        ]  
      }  
    ],  
    "excludedPaths": []  
  },  
  "_rid": "XrdaAKx3Hgw=",  
  "_ts": 1459203136,  
  "_self": "dbs/XrdaAA==/colls/XrdaAKx3Hgw=/",  
  "_etag": "\"00006e00-0000-0000-0000-56f9ac400000\"",  
  "_docs": "docs/",  
  "_sprocs": "sprocs/",  
  "_triggers": "triggers/",  
  "_udfs": "udfs/",  
  "_conflicts": "conflicts/"  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](../Topic/Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  