---
title: "Attachments - Azure Cosmos DB REST API"
ms.custom: ""
ms.date: "2016-12-20"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: fa4b851f-d841-4326-8611-37313fce4e80
caps.latest.revision: 7
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
# Attachments
[Azure Cosmos DB](/azure/cosmos-db/introduction) is a a globally distributed multi-model databases that supports the document, graph, and key-value data models. The content in this section is for managing attachment [resources](/azure/cosmos-db/documentdb-resources) using the [DocumentDB API](/azure/cosmos-db/documentdb-introduction) via REST.  

 Attachments are special documents that contain references and associated metadata with an external blob or media file.  
  
Developers can choose to have:  
  
* The attachment media/blob managed by Azure Cosmos DB or  
* Store it with an external blob service provider such as OneDrive, Dropbox, etc. and store the reference metadata for attachment in Azure Cosmos DB.  
    
The attachment resource is represented by attachments in the [Azure Cosmos DB REST resource model](https://docs.microsoft.com/azure/cosmos-db/documentdb-resources). The attachment resource has a fixed schema. Regardless of where the raw media is stored, the following properties are required.  
  
The following example illustrates the JSON construct of a document attachment.  
  
```  
{    
   "id":"image13d65101-90c4-4c2a-a423-fbf221c73233",  
   "contentType":"image/jpg",  
   "media":"www.bing.com",  
   "_rid":"rnYYAMVFUAUBAAAAAAAAAEC+LNM=",  
   "_ts":1408056025,  
   "_self":"dbs\/rnYYAA==\/colls\/rnYYAMVFUAU=\/docs\/rnYYAMVFUAUBAAAAAAAAAA==\/attachments\/rnYYAMVFUAUBAAAAAAAAAEC+LNM=",  
   "_etag":"00002a00-0000-0000-0000-53ed3ad90000"  
}  
  
```  
  
|Property|Description|  
|--------------|-----------------|  
|`id`|Required. This is a user settable property. It is the unique name that identifies the attachment, i.e. no two attachments share the same id for the same document. The id must not exceed 255 characters.|  
|`contentType`|Required. This is a user settable property. It specifies the content type of the attachment. When submitting the attachment bits as the body, Cosmos DB sets the `contentType` to the type set in the `Content-Type` header.|  
|`Media`|Required. This is the URL link or file path where the attachment resides.|  
|`_rid`|This is a system generated property. The resource ID (`_rid`) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the attachment resource.|  
|`_ts`|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|`_self`|This is a system generated property. It is the unique addressable URI for the resource.|  
|`_etag`|This is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
  
## Common response headers  
 The following information is common to all responses related to attachments:  
  
|Header|Description|  
|------------|-----------------|  
|`x-ms-max-media-storage-usage-mb`|When using Cosmos DB attachment storage to store raw media, this header shows the total allotted attachment storage quota for the account.|  
|`x-ms-media-storage-usage-mb`|When using Cosmos DB attachment storage to store raw media, this header shows the current attachment storage consumed.|  
  
## Tasks  
 You can do the following with attachments:  
  
-   [Create an Attachment](create-an-attachment.md)  
  
-   [Replace an Attachment](replace-an-attachment.md)  
  
-   [List Attachments](list-attachments.md)  
  
-   [Delete Attachments](delete-attachments.md)  
  
 Note that the attachment content is not indexed or searchable; the attachment resource properties are indexed and searchable.  
  
 These operations are similar to the ones for [Documents](documents.md). Instead of performing the operations against the docs, they are preformed against the attachments resource path under a particular document. Hence, we will skip elaborating each of the operations. Instead, in the next section, we will discuss how to create an attachment with raw media posting and with metadata-only posting.  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB: DocumentDB API](https://docs.microsoft.com/azure/cosmos-db/documentdb-introduction)   
* [Azure Cosmos DB SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/documentdb-sdk-dotnet)   
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

