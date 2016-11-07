---
title: "Create a Collection"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: daea28f8-c1c3-42d4-8269-24fa6e972d38
caps.latest.revision: 14
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
# Create a Collection
  A new collection can be created under the database by executing an HTTPS POST request against the URI resource path colls.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|POST|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription The {db-id} value is the user generated name/id of the database where the collection will be created (not the system generated id (rid) of the database).|  
  
### Headers  
 See [Common DocumentDB REST request headers](../DocumentDBREST/common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**x-ms-offer-throughput**|Optional|Number|The user specified throughput for the collection expressed in units of 100 request units per second. This can be between 400 and 250,000 (or higher by requesting a limit increase).<br /><br /> If the **x-ms-offer-throughput** is over 10,000, then the collection must include a **partitionKey** definition. If the **x-ms-offer-throughput** is equal to or under 10,000, then the collection must not include a **partitionKey** definition.<br /><br /> One of **x-ms-offer-throughput** or **x-ms-offer-type** must be specified. Both headers cannot be specified together.|  
|**x-ms-offer-type**|Optional|String|The user specified performance level for pre-defined performance levels S1, S2 and S3. One of x-ms-offer-throughput or x-ms-offer-type must be specified. Both headers cannot be specified together.|  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**id**|Required|String|The user generated unique name for the collection. No two collections can have the same ids. This is a string that must not be more than 255 characters.|  
|**indexingPolicy**|Optional|Object|This value is used to configure indexing policy. By default, the indexing is automatic for all document paths within the collection.|  
|**partitionKey**|Optional|Object|This value is used to configure the partition key to be used for partitioning data into multiple partitions.<br /><br /> If the **x-ms-offer-throughput** is over 10,000, then the collection must include a **partitionKey** definition. If the **x-ms-offer-throughput** is equal to or under 10,000, then the collection must not include a **partitionKey** definition.|  
  
```  
{  
  "id": "testcoll",  
  "indexingPolicy": {  
    "automatic": true,  
    "indexingMode": "Consistent",  
    "includedPaths": [  
      {  
        "path": "/*",  
        "indexes": [  
          {  
            "dataType": "String",  
            "precision": -1,  
            "kind": "Range"  
          }  
        ]  
      }  
    ]  
  },  
  "partitionKey": {  
    "paths": [  
      "/AccountNumber"  
    ],  
    "kind": "Hash"  
  }  
}  
  
```  
  
## Response  
 Create Collection returns the created collection as a response body.  
  
### Headers  
 See [Common DocumentDB REST response headers](../DocumentDBREST/common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|201 Created|The operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes.|  
|409 Conflict|The id provided for the new collection has been taken by an existing collection.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|This is the unique name that identifies the new collection.|  
|**_rid**|This is a system generated property. The resource ID (_rid) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the permission resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|TThis is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property representing the resource **etag** required for optimistic concurrency control.|  
|**_doc**|This is a system generated property that specifies the addressable path of the documents resource.|  
|**_sprocs**|This is a system generated property that specifies the addressable path of the stored procedures (sprocs) resource.|  
|**_triggers**|This is a system generated property that specifies the addressable path of the triggers resource.|  
|**_udfs**|This is a system generated property that specifies the addressable path of the user-defined functions (udfs) resource.|  
|**_conflicts**|This is a system generated property that specifies the addressable path of the conflicts resource. During an operation on a resource within a collection, if a conflict occurs, users can inspect the conflicting resources by performing a GET on the conflicts URI path.|  
|**indexingPolicy**|This is the indexing policy settings for collection.|  
|**partitionKey**|This is the partitioning configuration settings for collection.|  
  
 **Properties under Included Paths**  
  
|Property|Description|  
|--------------|-----------------|  
|**path**|Path for which the indexing behavior applies to. Index paths start with the root (/) and typically end with the ? wildcard operator, denoting that there are multiple possible values for the prefix. For example, to serve SELECT * FROM Families F WHERE F.familyName = "Andersen", you must include an index path for /familyName/? in the collection’s index policy.<br /><br /> Index paths can also use the \* wildcard operator to specify the behavior for paths recursively under the prefix. For example, /payload/\* can be used to exclude everything under the payload property from indexing.|  
|**dataType**|This is the datatype for which the indexing behavior is applied to. Can be **String**, **Number**, **Point**, **Polygon**, or **LineString**. Note that Booleans and nulls are automatically indexed|  
|**kind**|The type of index. **Hash** indexes are useful for equality comparisons while **Range** indexes are useful for equality, range comparisons and sorting. **Spatial** indexes are useful for spatial queries.|  
|**precision**|The precision of the index. Can be either set to -1 for maximum precision or between 1-8 for **Number**, and 1-100 for **String**. Not applicable for **Point**, **Polygon**, and **LineString** data types.|  
  
 **Properties under Excluded Paths**  
  
|Property|Description|  
|--------------|-----------------|  
|**path**|Path that is excluded from indexing. Index paths start with the root (/) and typically end with the * wildcard operator. For example, /payload/\* can be used to exclude everything under the payload property from indexing.|  
  
 **Properties under Partition Key**  
  
|Property|Description|  
|--------------|-----------------|  
|**path**|An array of paths using which data within the collection can be partitioned. Paths must not contain a wildcard or a trailing slash. For example, the JSON property “AccountNumber” is specified as “/AccountNumber”. The array must contain only a single value.|  
|**kind**|The algorithm used for partitioning. Only Hash is supported.|  
  
```  
{  
  "id": "testcoll",  
  "indexingPolicy": {  
    "indexingMode": "consistent",  
    "automatic": true,  
    "includedPaths": [  
      {  
        "path": "/*",  
        "indexes": [  
          {  
            "kind": "Range",  
            "dataType": "String",  
            "precision": -1  
          },  
          {  
            "kind": "Range",  
            "dataType": "Number",  
            "precision": -1  
          }  
        ]  
      }  
    ],  
    "excludedPaths": []  
  },  
  "partitionKey": {  
    "paths": [  
      "/AccountNumber"  
    ],  
    "kind": "Hash"  
  },  
  "_rid": "PD5DALigDgw=",  
  "_ts": 1459200611,  
  "_self": "dbs/PD5DAA==/colls/PD5DALigDgw=/",  
  "_etag": "\"00005900-0000-0000-0000-56f9a2630000\"",  
  "_docs": "docs/",  
  "_sprocs": "sprocs/",  
  "_triggers": "triggers/",  
  "_udfs": "udfs/",  
  "_conflicts": "conflicts/"  
}  
  
```  
  
## Example  
  
```  
POST https://querydemo.documents.azure.com/dbs/testdb/colls HTTP/1.1  
x-ms-offer-throughput: 1000  
x-ms-date: Mon, 28 Mar 2016 21:30:09 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dpDOKhfllik0BJijp5apzqHL%2bjtoFhsvdhAGE5F8%2bOiE%3d  
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.Documents.Client/1.6.0.0  
x-ms-version: 2015-12-16  
Accept: application/json  
Host: querydemo.documents.azure.com  
Content-Length: 235  
Expect: 100-continue  
  
{  
  "id": "testcoll",  
  "indexingPolicy": {  
    "automatic": true,  
    "indexingMode": "Consistent",  
    "includedPaths": [  
      {  
        "path": "/*",  
        "indexes": [  
          {  
            "dataType": "String",  
            "precision": -1,  
            "kind": "Range"  
          }  
        ]  
      }  
    ]  
  },  
  "partitionKey": {  
    "paths": [  
      "/AccountNumber"  
    ],  
    "kind": "Hash"  
  }  
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
x-ms-last-state-change-utc: Mon, 28 Mar 2016 20:00:12.142 GMT  
etag: "00005900-0000-0000-0000-56f9a2630000"  
collection-partition-index: 0  
collection-service-index: 24  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/testdb  
x-ms-quorum-acked-lsn: 9  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 4.95  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: 05d0a3b5-4504-446a-96f4-bef3a3408595  
x-ms-session-token: 0:10  
Set-Cookie: x-ms-session-token#0=10; Domain=querydemo.documents.azure.com; Path=/dbs/PD5DAA==/colls/PD5DALigDgw=  
Set-Cookie: x-ms-session-token=10; Domain=querydemo.documents.azure.com; Path=/dbs/PD5DAA==/colls/PD5DALigDgw=  
x-ms-gatewayversion: version=1.6.52.5  
Date: Mon, 28 Mar 2016 21:30:12 GMT  
  
{  
  "id": "testcoll",  
  "indexingPolicy": {  
    "indexingMode": "consistent",  
    "automatic": true,  
    "includedPaths": [  
      {  
        "path": "/*",  
        "indexes": [  
          {  
            "kind": "Range",  
            "dataType": "String",  
            "precision": -1  
          },  
          {  
            "kind": "Range",  
            "dataType": "Number",  
            "precision": -1  
          }  
        ]  
      }  
    ],  
    "excludedPaths": []  
  },  
  "partitionKey": {  
    "paths": [  
      "/AccountNumber"  
    ],  
    "kind": "Hash"  
  },  
  "_rid": "PD5DALigDgw=",  
  "_ts": 1459200611,  
  "_self": "dbs/PD5DAA==/colls/PD5DALigDgw=/",  
  "_etag": "\"00005900-0000-0000-0000-56f9a2630000\"",  
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
  
  