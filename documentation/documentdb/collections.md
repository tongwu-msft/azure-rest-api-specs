---
title: "Collections"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c5fc31e0-7914-4a64-a5ad-4472e9953c7d
caps.latest.revision: 13
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
# Collections
  The DocumentDB REST API supports basic CRUD operations on the resources under a database account.   
A collection is a container of JSON documents and associated JavaScript application logic, i.e. stored procedures, triggers and user-defined functions. This topic outlines the REST operations used to manage DocumentDB document collections.  
  
 A collection is a billable entity, where the cost is determined by the provisioned throughput of the collection. Collections can span one or more partitions/servers and scaled up and down in terms of throughput. Collections are automatically partitioned into one or more physical servers by DocumentDB.  
  
 Collections are not the same as tables in relational databases. Collections do not enforce schema, in fact DocumentDB does not enforce any schemas, it's a schema-free database. Therefore, you can store different types of documents with diverse schemas in the same collection. You can choose to use collections to store objects of a single type like you would with tables. The best model depends only on how the data appears together in queries and transactions.  
  
 DocumentDB supports the creation of both single-partition and partitioned collections.  
  
-   **Partitioned collections** can span multiple partitions and support very large amounts of storage and throughput. You must specify a partition key for the collection.  
  
-   **Single-partition collections** have lower price options and the ability to query and perform transactions across all collection data. They have the scalability and storage limits of a single partition. You do not have to specify a partition key for these collections.  
  
 Since a collection is a system resource, it has a fixed schema. A collection's URI path is represented by colls in the [DocumentDB resource model](http://azure.microsoft.com/documentation/articles/documentdb-resources/).  
  
 The following example illustrates the JSON definition of a collection:  
  
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
  
|Property|Description|  
|--------------|-----------------|  
|**id**|This is the unique name that identifies the new collection.|  
|**indexingPolicy**|This is the indexing policy settings for collection.|  
|**partitionKey**|This is the partitioning configuration settings for collection.|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the permission resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property representing the resource **etag** required for optimistic concurrency control.|  
|**_doc**|This is a system generated property that specifies the addressable path of the documents resource.|  
|**_sprocs**|This is a system generated property that specifies the addressable path of the stored procedures (sprocs) resource.|  
|**_triggers**|This is a system generated property that specifies the addressable path of the triggers resource.|  
|**_udfs**|This is a system generated property that specifies the addressable path of the user-defined functions (udfs) resource.|  
|**_conflicts**|This is a system generated property that specifies the addressable path of the conflicts resource. During an operation on a resource within a collection, if a conflict occurs, users can inspect the conflicting resources by performing a GET on the conflicts URI path.|  
  
 **Properties under Indexing Policy**  
  
|Property|Description|  
|--------------|-----------------|  
|**automatic**|Indicates whether automatic indexing is on or off. The default value is **True**, thus all documents are indexed. Setting the value to **False** would allow manual configuration of indexing paths.|  
|**indexingMode**|By default, the indexing mode is **Consistent**. This means that indexing occurs synchronously during insertion, replacment or deletion of documents. To have indexing occur asynchronously, set the indexing mode to lazy.|  
|**includePaths**|The array containing document paths to be indexed. By default, two paths are included: the / path which specifies that all document paths be indexed, and the _ts path, which indexes for a timestamp range comparison.|  
|**excludePaths**|The array containing document paths to be excluded from indexing.|  
  
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
|**path**|Path that is excluded from indexing. Index paths start with the root (/) and typically end with the * wildcard operator.. For example, /payload/\* can be used to exclude everything under the payload property from indexing.|  
  
 **Properties under Partition Key**  
  
|Property|Description|  
|--------------|-----------------|  
|**path**|An array of paths using which data within the collection can be partitioned. Paths must not contain a wildcard or a trailing slash. For example, the JSON property “AccountNumber” is specified as “/AccountNumber”. The array must contain only a single value.|  
|**kind**|The algorithm used for partitioning. Only **Hash** is supported.|  
  
## Indexing Policy  
 As documents are added to a collection, DocumentDB by default automatically indexes the documents, thus allowing documents to be queried. It is at the collection level that you configure the indexing policy. Since indexing policy is set at the collection level, each collection within a database can have different indexing policies.  
  
 The indexing policy for a collection can specify the following options:  
  
-   Automatic: You can choose if you want the collection to automatically index all documents or not. By default, all documents are automatically indexed, but you can choose to turn it off. When indexing is turned off, documents can be accessed only through their self-links or by queries using ID.  
  
-   Indexing Mode: You can choose between synchronous (Consistent), asynchronous (Lazy) index updates, and no indexing (None). By default, the index is updated synchronously on each insertion, replacement, or deletion action taken on a document in the collection. This enables the queries to honor the same consistency level as that of the document reads without any delay for the index to catch up.  
  
-   Index types and precision: The type or scheme used for index entries has a direct impact on index storage and performance. For a scheme using higher precision, queries are typically faster. However, there is also a higher storage overhead for the index. Choosing a lower precision means that more documents might have to be processed during query execution, but the storage overhead will be lower.  
  
-   Index paths: Within documents, you can choose which paths must be included or excluded from indexing. This can offer improved write performance and lower index storage for scenarios when the query patterns are known beforehand.  
  
 The following tables shows some sample indexing paths and how they are used within queries.  
  
|Property|Description|  
|--------------|-----------------|  
|/*|Default path for collection. Recursive and applies to whole document tree.|  
|/prop/?|Index path required to serve queries like the following (with Hash or Range types respectively):<br /><br /> SELECT * FROM collection c WHERE c.prop = "value"<br /><br /> SELECT \* FROM collection c WHERE c.prop > 5<br /><br /> SELECT \* FROM collection c ORDER BY c.prop|  
|/prop/*|Index path for all paths under the specified label. Works with the following queries:<br /><br /> SELECT * FROM collection c WHERE c.prop = "value"<br /><br /> SELECT \* FROM collection c WHERE c.prop.subprop > 5<br /><br /> SELECT \* FROM collection c WHERE c.prop.subprop.nextprop = "value"<br /><br /> SELECT \* FROM collection c ORDER BY c.prop|  
|/props/[]/?|Index path required to serve iteration and JOIN queries against arrays of scalars like<br /><br /> ["a", "b", "c"]:<br /><br /> SELECT tag FROM tag IN collection.props WHERE tag = "value"<br /><br /> SELECT tag FROM collection c JOIN tag IN c.props WHERE tag > 5|  
|/props/[]/subprop/?|Index path required to serve iteration and JOIN queries against arrays of objects like<br /><br /> [{subprop: "a"}, {subprop: "b"}]:<br /><br /> SELECT tag FROM tag IN collection.props WHERE tag.subprop = "value"<br /><br /> SELECT tag FROM collection c JOIN tag IN c.props WHERE tag.subprop = "value"|  
|/prop/subprop/?|Index path required to serve queries (with Hash or Range types respectively):<br /><br /> SELECT * FROM collection c WHERE c.prop.subprop = "value"<br /><br /> SELECT \* FROM collection c WHERE c.prop.subprop > 5<br /><br /> SELECT \* FROM collection c ORDER BY c.prop.subprop|  
  
 For more information about DocumentDB indexing policies, see DocumentDB indexing policies. For the purpose of the REST API documentation, all examples use automatic indexing.  
  
## Offers and Performance Levels  
 When a collection is created, an Offer resource is also created that references the created collection. The Offer resource contains configuration information about the performance level of the collection. Offers can be specified as pre-defined performance levels (S1, S2, S3) or user-defined performance levels expressed as throughput in request units per second.  
  
 The performance level of a collection can be changed using Replace Offer.  
  
## Tasks  
 You can do the following with document collections:  
  
-   [Create a Collection](create-a-collection.md)  
  
-   [List Collections](list-collections.md)  
  
-   [Get a Collection](get-a-collection.md)  
  
-   [Delete a Collection](delete-a-collection.md)  
  
-   [Replace a Collection](replace-a-collection.md)  
  
  