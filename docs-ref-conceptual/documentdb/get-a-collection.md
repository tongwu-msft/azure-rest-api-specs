---
title: "Get a Collection"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c2f93095-bd4c-4b11-a396-8f6a2574a3b3
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
# Get a Collection
  Performing a GET on a specific collection resource retrieves the properties for the collection.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {coll-id} value is the name of the collection.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests.  
  
### Body  
 None.  
  
## Response  
 Get Collection returns the body of the collection as persisted in Cosmos DB along with response headers that report the quota and usage of the collection..  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The operation was successful.|  
|404 Not Found|The collection is no longer a resource, i.e. the collection was deleted.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|This is the unique name that identifies the new collection.|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the permission resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property representing the resource **etag** required for optimistic concurrency control.|  
|**_doc**|This is a system generated property that specifies the addressable path of the documents resource.|  
|**_sprocs**|This is a system generated property that specifies the addressable path of the stored procedures (sprocs) resource.|  
|**_triggers**|This is a system generated property that specifies the addressable path of the triggers resource.|  
|**_udfs**|This is a system generated property that specifies the addressable path of the user-defined functions (udfs) resource.|  
|**_conflicts**|This is a system generated property that specifies the addressable path of the conflicts resource. During an operation on a resource within a collection, if a conflict occurs, users can inspect the conflicting resources by performing a GET on the conflicts URI path.|  
|**indexingPolicy**|This is the indexing policy settings for collection.|  
  
 **Properties under Indexing Policy**  
  
|Property|Description|  
|--------------|-----------------|  
|**automatic**|Indicates whether automatic indexing is on or off. The default value is True, thus all documents are indexed. Setting the value to False would allow manual configuration of indexing paths.|  
|**indexingMode**|By default, the indexing mode is Consistent. This means that indexing occurs synchronously during insertion, replacment or deletion of documents. To have indexing occur asynchronously, set the indexing mode to lazy.|  
|**includedPaths**|The array containing document paths to be indexed. By default, two paths are included: the / path which specifies that all document paths be indexed, and the _ts path, which indexes for a timestamp range comparison.<br /><br /> Within element in the array.|  
  
 **Properties under Included Path**  
  
|Property|Description|  
|--------------|-----------------|  
|**path**|Path for which the indexing behavior applies to. Index paths start with the root (/) and typically end with the ? wildcard operator, denoting that there are multiple possible values for the prefix. For example, to serve SELECT * FROM Families F WHERE F.familyName = "Andersen", you must include an index path for /familyName/? in the collection’s index policy.<br /><br /> Index paths can also use the \* wildcard operator to specify the behavior for paths recursively under the prefix. For example, /payload/\* can be used to exclude everything under the payload property from indexing.|  
|**dataType**|This is the datatype for which the indexing behavior is applied to. Can be **String**, **Number**, **Point**, **Polygon**, or **LineString**. Note that Booleans and nulls are automatically indexed|  
|**kind**|The type of index. **Hash** indexes are useful for equality comparisons while **Range** indexes are useful for equality, range comparisons and sorting. **Spatial** indexes are useful for spatial queries.|  
|**precision**|The precision of the index. Can be either set to -1 for maximum precision or between 1-8 for **Number**, and 1-100 for **String**. Not applicable for **Point**, **Polygon**, and **LineString** data types.|  
  
 **Properties under Partition Key**  
  
|Property|Description|  
|--------------|-----------------|  
|**paths**|An array of paths using which data within the collection can be partitioned. Paths must not contain a wildcard or a trailing slash. For example, the JSON property “AccountNumber” is specified as “/AccountNumber”. The array must contain only a single value.|  
|**kind**|The algorithm used for partitioning. Only **Hash** is supported.|  
  
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
  "_rid": "1tAvAP4XWww=",  
  "_ts": 1459198933,  
  "_self": "dbs/1tAvAA==/colls/1tAvAP4XWww=/",  
  "_etag": "\"00005600-0000-0000-0000-56f99bd50000\"",  
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
x-ms-date: Mon, 28 Mar 2016 21:02:12 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dP8r7%2fEZnOxv2wQr2smp4G1tCH9PkOkIZscHqsqdn6y4%3d  
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.Documents.Client/1.6.0.0  
x-ms-version: 2015-12-16  
Accept: application/json  
Host: querydemo.documents.azure.com  
Content-Length: 235  
Expect: 100-continue  
  
```  
  
```  
HTTP/1.1 201 Created  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Transfer-Encoding: chunked  
Content-Type: application/json  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Mon, 28 Mar 2016 20:10:13.601 GMT  
etag: "00005600-0000-0000-0000-56f99bd50000"  
collection-partition-index: 0  
collection-service-index: 24  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/testdb  
x-ms-quorum-acked-lsn: 6  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 4.95  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: fbc3f36d-15d5-45fa-8f19-8579945451f8  
x-ms-session-token: 0:7  
Set-Cookie: x-ms-session-token#0=7; Domain=querydemo.documents.azure.com; Path=/dbs/1tAvAA==/colls/1tAvAP4XWww=  
Set-Cookie: x-ms-session-token=7; Domain=querydemo.documents.azure.com; Path=/dbs/1tAvAA==/colls/1tAvAP4XWww=  
x-ms-gatewayversion: version=1.6.52.5  
Date: Mon, 28 Mar 2016 21:02:13 GMT  
  
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
  "_rid": "1tAvAP4XWww=",  
  "_ts": 1459198933,  
  "_self": "dbs/1tAvAA==/colls/1tAvAP4XWww=/",  
  "_etag": "\"00005600-0000-0000-0000-56f99bd50000\"",  
  "_docs": "docs/",  
  "_sprocs": "sprocs/",  
  "_triggers": "triggers/",  
  "_udfs": "udfs/",  
  "_conflicts": "conflicts/"  
}  
  
```  
  
## See Also  
 [Azure Cosmos DB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

