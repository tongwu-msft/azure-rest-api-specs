---
title: "Create a Collection - Azure Cosmos DB REST API"
description: Create collection REST API syntax. Request and response headers, body, status codes and examples.
ms.date: "04/20/2021"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: daea28f8-c1c3-42d4-8269-24fa6e972d38
caps.latest.revision: 14
author: "SnehaGunda"
ms.author: "sngun"
manager: "kfile"
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
# Create Collection

The `Create Collection` operation creates a new collection in a database.

> [!NOTE]
> These API reference articles shows how to create resources using the Azure Cosmos DB data plane API. With the data plane API you can configure basic options such as indexing policy, partition keys much like you can with Cosmos DB SDKs. If you require complete feature support for all Azure Cosmos DB resources, we recommend using the [Cosmos DB Resource Provider](../cosmos-db-resource-provider/index.md).
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|POST|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls|The {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription. {db-id} can be either the ID or the _rid value for the database.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-cosmosdb-rest-request-headers.md) for headers that are used by all Azure Cosmos DB requests. 

 When [constructing the hashed signature for the master key token](access-control-on-cosmosdb-resources.md#constructkeytoken), the ResourceType should be "colls". The ResourceId should be `dbs/{db-id}`, where {db-id} can be either the ID or the _rid value of the database.



|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**x-ms-offer-throughput**|Optional|Number|The user specified manual throughput (RU/s) for the collection expressed in units of 100 request units per second. The minimum is 400 up to 1,000,000 (or higher by requesting a limit increase).<br /><br /> Only one of `x-ms-offer-throughput` or `x-ms-cosmos-offer-autopilot-settings` must be specified. These headers cannot be specified together.|
|**x-ms-cosmos-offer-autopilot-settings**|Optional|JSON|The user specified autoscale max RU/s. The value is a JSON with the property `maxThroughput`. For example: `{"maxThroughput": 4000}`.<br /><br /> Only one of `x-ms-offer-throughput` or `x-ms-cosmos-offer-autopilot-settings` must be specified. These headers cannot be specified together. <br /><br />When autoscale is used, a **partitionKey** definition is required.|    
|**x-ms-offer-type**|Optional|String|This is a [legacy header](/azure/cosmos-db/performance-levels) for pre-defined performance levels S1, S2, and S3 that have been retired. It is recommended that you use either manual or autoscale throughput, as described above.  


  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**id**|Required|String|The user-generated unique name for the collection. No two collections can have the same IDs. It is a string that must not be more than 255 characters.|  
|**indexingPolicy**|Optional|Object|This value is used to configure indexing policy. By default, the indexing is automatic for all document paths within the collection.|  
|**partitionKey**|Required|Object|This value is used to configure the partition key to be used for partitioning data into multiple partitions.<br /><br /> To use large partition key, specify the version as 2 within the partitionKey property. <br /><br /> If the REST API version is 2018-12-31 or higher, the collection must include a **partitionKey**  definition. In versions older than 2018-12-31, a legacy non-partitioned collection with manual throughput can be created by omitting the **partitionKey** definition and ensuring the throughput is between 400 - 10,000 RU/s. For best performance and scalability, it is recommended to always set a partition key.  <br /><br />Learn about how to [choose a good partition key](/azure/cosmos-db/partitioning-overview#choose-partitionkey).|

### Example body payload  
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
    "kind": "Hash",
     "Version": 2

  }  
}  
  
```  
  
## Response  
 Create Collection returns the created collection as a response body.  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-cosmosdb-rest-response-headers.md) for headers that are returned by all Azure Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|201 Created|The operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes.|  
|409 Conflict|The ID provided for the new collection has been taken by an existing collection.|  
|404 with a sub status code of 1013| The collection create operation is still in progress. |

If you encounter timeout exception when creating a collection, run a read operation to validate if the collection was created successfully. The read operation throws an exception until the collection create operation is successful. If the read operation throws an exception with status code of 404, and sub status code of 1013, it means that the collection create operation is still in progress. Retry the read operation until you get 200 or 201 status codes, these codes let you know that the collection has been successfully created.  

### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|It is the unique name that identifies the new collection.|  
|**_rid**|It is a system-generated property. The resource ID (_rid) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the permission resource.|  
|**_ts**|It is a system-generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|It is a system-generated property. It is the unique addressable URI for the resource.|  
|**_etag**|It is a system-generated property representing the resource **etag** required for optimistic concurrency control.|  
|**_doc**|It is a system-generated property that specifies the addressable path of the documents resource.|  
|**_sprocs**|It is a system-generated property that specifies the addressable path of the stored procedures (sprocs) resource.|  
|**_triggers**|It is a system-generated property that specifies the addressable path of the triggers resource.|  
|**_udfs**|It is a system-generated property that specifies the addressable path of the user-defined functions (udfs) resource.|  
|**_conflicts**|It is a system-generated property that specifies the addressable path of the conflicts resource. During an operation on a resource within a collection, if a conflict occurs, users can inspect the conflicting resources by performing a GET on the conflicts URI path.|  
|**indexingPolicy**|It is the indexing policy settings for collection.|  
|**partitionKey**|It is the partitioning configuration settings for collection.|  
  
 **Properties under Included Paths**  
  
|Property|Description|  
|--------------|-----------------|  
|**path**|Path for which the indexing behavior applies to. Index paths start with the root (/) and typically end with the question mark (?) wildcard operator, denoting that there are multiple possible values for the prefix. For example, to serve SELECT * FROM Families F WHERE F.familyName = "Andersen", you must include an index path for /familyName/? in the collection's index policy.<br /><br /> Index paths can also use the \* wildcard operator to specify the behavior for paths recursively under the prefix. For example, /payload/\* can be used to exclude everything under the payload property from indexing.|  
|**dataType**|It is the datatype for which the indexing behavior is applied to. Can be **String**, **Number**, **Point**, **Polygon**, or **LineString**. Booleans and nulls are automatically indexed|  
|**kind**|The type of index. **Hash** indexes are useful for equality comparisons while **Range** indexes are useful for equality, range comparisons and sorting. **Spatial** indexes are useful for spatial queries.|  
|**precision**|The precision of the index. Can be either set to -1 for maximum precision or between 1-8 for **Number**, and 1-100 for **String**. Not applicable for **Point**, **Polygon**, and **LineString** data types.|  
  
 **Properties under Excluded Paths**  
  
|Property|Description|  
|--------------|-----------------|  
|**path**|Path that is excluded from indexing. Index paths start with the root (/) and typically end with the * wildcard operator. For example, /payload/\* can be used to exclude everything under the payload property from indexing.|  
  
 **Properties under Partition Key**  
  
|Property|Description|  
|--------------|-----------------|  
|**paths**|An array of paths using which data within the collection can be partitioned. Paths must not contain a wildcard or a trailing slash. For example, the JSON property "AccountNumber" is specified as "/AccountNumber". The array must contain only a single value.|  
|**kind**|The algorithm used for partitioning. Only Hash is supported.|  
|**version** | An optional field, if not specified the default value is 1. To use the large partition key, set the version to 2. To learn about large partition keys, see [how to create collections with large partition key](/azure/cosmos-db/large-partition-keys) article. |

### Example response body  

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
    "kind": "Hash",
    "Version": 2
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
  
## Example 1
The following example creates a collection with manual throughput of 400 RU/s. `x-ms-offer-throughput` header is used to set the throughput (RU/s) value. It accepts a number with minimum value of 400 that increments by units of 100.

  
```  
POST https://querydemo.documents.azure.com/dbs/testdb/colls HTTP/1.1  
x-ms-offer-throughput: 400  
x-ms.date: 04/20/2021
authorization: type%3dmaster%26ver%3d1.0%26sig%3dpDOKhfllik0BJijp5apzqHL%2bjtoFhsvdhAGE5F8%2bOiE%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
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
    "kind": "Hash",
    "Version": 2
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
  
## Example 2
The following example creates a collection with an autoscale max throughput of 4000 RU/s (it scales between 400 - 4000 RU/s). `x-ms-cosmos-offer-autopilot-settings` header is used to set the `maxThroughput` value, which is the autoscale max RU/s value. It accepts a number with a minimum of 4000 that increments by units of 1000. When autoscale is used, a partition key definition is required, as shown in the following example:
> [!NOTE]
> To enable autoscale on an existing database or collection, or switch from autoscale to manual throughput, see the article [Replace an Offer](replace-an-offer.md).
```  
POST https://querydemo.documents.azure.com/dbs/testdb/colls HTTP/1.1
x-ms-cosmos-offer-autopilot-settings: {"maxThroughput": 4000}
x-ms-date: Wed, 22 Jul 2020 22:17:39 GMT
authorization: type%3dmaster%26ver%3d1.0%26sig%3dpDOKhfllik0BJijp5apzqHL%2bjtoFhsvdhAGE5F8%2bOiE%3d
Cache-Control: no-cache  
User-Agent: contoso/1.0
x-ms-version: 2018-12-31
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
    "kind": "Hash",
    "Version": 2
  }  
}  
  
```  

## See Also  
* [Azure Cosmos DB](/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

