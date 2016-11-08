---
title: "Documents"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 8694035a-2423-4d5e-b046-752f431b93e9
caps.latest.revision: 11
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
# Documents
  The DocumentDB REST API supports basic CRUD operations on the resources under a database account. This topic outlines the REST operations used to manage DocumentDB documents.  
  
 The document resource is represented by docs in the DocumentDB resource model. A document consists of user-defined content in JSON format. Aside from the required id property, users can define any arbitrary elements, structures, and hierarchies for the content. The id element is a unique string that is user-settable and must not exceed 255 characters. You can insert, replace, delete, read, enumerate and query arbitrary JSON documents in a collection.  
  
 DocumentDB does not mandate any schema and does not require secondary indexes in order to support querying over documents in a collection. By default, documents are automatically and indexed in a consistent manner, thus making a document queryable as soon as it is created  
  
-   Documents are stored within collections. For more information on collections, see [Collections](collections.md).  
  
-   A document can contain one or more attachments. For more information on attachments, see [Attachments](attachments.md).  
  
-   User access to documents can be managed via permissions. For more information on permissions, see [Permissions](permissions.md).  
  
 This sample JSON document shows the entry for a volcano in a DocumentDB collection. The entry includes the volcano name, location information including geospatial data, and system defined elements such as _rid, _ts, _self, _etag, and _attachments.  
  
```  
{  
  "Volcano Name": "Agua de Pau",  
  "Country": "Portugal",  
  "Region": "Azores",  
  "Location": {  
    "type": "Point",  
    "coordinates": [  
      -25.47,  
      37.77  
    ]  
  },  
  "Elevation": 947,  
  "Type": "Stratovolcano",  
  "Status": "Historical",  
  "Last Known Eruption": "Last known eruption from 1500-1699, inclusive",  
  "id": "d44c94b6-81f8-4b27-4970-f79b149529d3",  
  "_rid": "Sl8fALN4sw4BAAAAAAAAAA==",  
  "_ts": 1448049512,  
  "_self": "dbs/Sl8fAA==/colls/Sl8fALN4sw4=/docs/Sl8fALN4sw4BAAAAAAAAAA==/",  
  "_etag": "\"0000443f-0000-0000-0000-564f7b680000\"",  
  "_attachments": "attachments/"  
}  
  
```  
  
 If the collection is **partitioned**, i.e. includes a partitionKey configuration, then the primary key for documents within the collection is the compound value of partition key value and “id”. If the collection is not partitioned, then “id” alone acts as the primary and will be unique for all values within the collection. For example, if the partition key of the collection is the path “/department”, then the value of “id” must be unique for documents which have the same value of “department”, for e.g. “Marketing”.  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|Required. This is a user settable property. It is the unique name that identifies the document, i.e. no two documents will share the same id within a database. The **id** must not exceed 255 characters.|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the document resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
|**_attachments**|This is a system generated property that specifies the addressable path for the attachments resource.|  
  
## Tasks  
 You can do the following with documents:  
  
-   [Create a Document](create-a-document.md)  
  
-   [List Documents](list-documents.md)  
  
-   [Get a Document](get-a-document.md)  
  
-   [Replace a Document](replace-a-document.md)  
  
-   [Delete a Document](delete-a-document.md)  
  
-   [Query Documents](query-documents.md)  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  