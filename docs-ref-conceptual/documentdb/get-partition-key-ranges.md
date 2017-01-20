---
title: "Get Partition Key Ranges"
ms.custom: ""
ms.date: "2016-12-11"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
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
# Get Partition key ranges
Performing a `GET` on a specific collection's `pkranges` child resource retrieves the list of partition key ranges for the collection.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/pkranges`|Note that the `{databaseaccount}` is the name of the DocumentDB account created under your subscription. The `{db-id}` id of the database and {coll-id} value is the id of the collection.|  
  
### Headers  
 See [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
### Body  
 None.  
  
## Response  
Returns the list of partition key ranges for the collection.  
  
### Headers  
 See [Common DocumentDB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](http-status-codes-for-documentdb.md).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The operation was successful.|  
|404 Not Found|The collection is not found.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|`id`|This is the unique name that identifies the collection.|  
|`_rid`|This is a system generated property. The resource ID (`_rid`) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the permission resource.|  
|`_ts`|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|`_self`|This is a system generated property. It is the unique addressable URI for the resource.|  
|`_etag`|This is a system generated property representing the resource `etag` required for optimistic concurrency control.|  
|`PartitionKeyRanges`|This is the list of partition key ranges for the collection. This can be used for incremental readfeed with the `x-ms-documentdb-partitionkeyrangeid` header.|  
  
**Properties of PartitionKeyRanges**  

|Property|Description|  
|--------------|-----------------|  
|`id`|<p>The ID for the partition key range. This is a stable and unique ID within each collection.</p><p>Can be used to read documents by partition key range.</p>|  
|`maxExclusive`|The maximum partition key hash value for the partition key range. For internal use.|  
|`minInclusive`|The minimum partition key hash value for the partition key range. For internal use.|  

## Example  
  
You can retrieve the Partition Key Ranges by requesting the `pkranges` resource within a collection. For example the following request retrieves the list of partition key ranges for the `serverlogs` collection:

    GET https://querydemo.documents.azure.com/dbs/bigdb/colls/serverlogs/pkranges HTTP/1.1
    x-ms-date: Tue, 15 Nov 2016 07:26:51 GMT
    authorization: type%3dmaster%26ver%3d1.0%26sig%3dEConYmRgDExu6q%2bZ8GjfUGOH0AcOx%2behkancw3LsGQ8%3d
    x-ms-consistency-level: Session
    x-ms-version: 2016-07-11
    Accept: application/json
    Host: querydemo.documents.azure.com

This request returns the following response containing metadata about the partition key ranges:

    HTTP/1.1 200 Ok
    Content-Type: application/json
    x-ms-item-count: 25
    x-ms-schemaversion: 1.1
    Date: Tue, 15 Nov 2016 07:26:51 GMT

    {
       "_rid":"qYcAAPEvJBQ=",
       "PartitionKeyRanges":[
          {
             "_rid":"qYcAAPEvJBQCAAAAAAAAUA==",
             "id":"0",
             "_etag":"\"00002800-0000-0000-0000-580ac4ea0000\"",
             "minInclusive":"",
             "maxExclusive":"05C1CFFFFFFFF8",
             "_self":"dbs\/qYcAAA==\/colls\/qYcAAPEvJBQ=\/pkranges\/qYcAAPEvJBQCAAAAAAAAUA==\/",
             "_ts":1477100776
          },
          ...
       ],
       "_count": 25
    }

  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  