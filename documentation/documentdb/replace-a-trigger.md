---
title: "Replace a Trigger"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 8010633f-8b2b-4482-ac92-6e578491d192
caps.latest.revision: 7
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
# Replace a Trigger
  Performing a PUT operation on a specific trigger resource replaces the entire trigger resource. All user settable properties, including the id, the body, the triggerOperation, and the triggerType, must be submitted in the body to perform the replacement.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|PUT|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/triggers/{trigger-name}`|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database where the trigger will be replaced, not the system generated id (rid) of the database. The {coll-id} value is the name of the collection where the trigger will be replaced. The {trigger-name} value is the name of the trigger to be replaced.|  
  
### Headers  
 See [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**id**|Required|String|This the unique name used to identify the trigger. The **id** must not exceed 255 characters.|  
|**body**|Required|String|This is the body of the trigger.|  
|**triggerOperation**|Required|String|This is the type of operation that will invoke the trigger. The acceptable values are: **All**, **Insert**, **Replace** and **Delete**.|  
|**triggerType**|Required|String|This specifies when the trigger will be fired. The acceptable values are: **Pre** and **Post**. **Pre** triggers fire before an operation while **Post** triggers after an operation.|  
  
```  
{  
    "body": "function updateMetadata() {\r\n    var context = getContext();\r\n    var collection = context.getCollection();\r\n    var response = context.getResponse();\r\n    var createdDocument = response.getBody();\r\n\r\n    // query for metadata document\r\n    var filterQuery = 'SELECT * FROM root r WHERE r.id = \"_metadata\"';\r\n    var accept = collection.queryDocuments(collection.getSelfLink(), filterQuery,\r\n      updateMetadataCallback);\r\n    if(!accept) throw \"Unable to update metadata, abort\";\r\n\r\n    function updateMetadataCallback(err, documents, responseOptions) {\r\n      if(err) throw new Error(\"Error\" + err.message);\r\n           if(documents.length != 1) throw 'Unable to find metadata document';\r\n           var metadataDocument = documents[0];\r\n\r\n           // update metadata\r\n           metadataDocument.createdDocuments += 1;\r\n           metadataDocument.createdNames += \" \" + createdDocument.id;\r\n           var accept = collection.replaceDocument(metadataDocument._self,\r\n               metadataDocument, function(err, docReplaced) {\r\n                  if(err) throw \"Unable to update metadata, abort\";\r\n               });\r\n           if(!accept) throw \"Unable to update metadata, abort\";\r\n           return;          \r\n    }",  
    "id": "PostTrigger-UpdateMetaAll",  
    "triggerOperation": "All",  
    "triggerType": "Post"  
}  
  
```  
  
## Response  
  
### Headers  
 See [Common DocumentDB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The replace operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes.|  
|404 Not Found|The trigger to be replaced is no longer a resource, i.e. the trigger was deleted.|  
|409 Conflict|The id provided for the trigger has been taken by an existing trigger.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the trigger resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the uniquely addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
  
```  
{  
    "body": "function updateMetadata() {\r\n    var context = getContext();\r\n    var collection = context.getCollection();\r\n    var response = context.getResponse();\r\n    var createdDocument = response.getBody();\r\n\r\n    // query for metadata document\r\n    var filterQuery = 'SELECT * FROM root r WHERE r.id = \"_metadata\"';\r\n    var accept = collection.queryDocuments(collection.getSelfLink(), filterQuery,\r\n      updateMetadataCallback);\r\n    if(!accept) throw \"Unable to update metadata, abort\";\r\n\r\n    function updateMetadataCallback(err, documents, responseOptions) {\r\n      if(err) throw new Error(\"Error\" + err.message);\r\n           if(documents.length != 1) throw 'Unable to find metadata document';\r\n           var metadataDocument = documents[0];\r\n\r\n           // update metadata\r\n           metadataDocument.createdDocuments += 1;\r\n           metadataDocument.createdNames += \" \" + createdDocument.id;\r\n           var accept = collection.replaceDocument(metadataDocument._self,\r\n               metadataDocument, function(err, docReplaced) {\r\n                  if(err) throw \"Unable to update metadata, abort\";\r\n               });\r\n           if(!accept) throw \"Unable to update metadata, abort\";\r\n           return;          \r\n    }",  
    "id": "PostTrigger-UpdateMetaAll",  
    "triggerOperation": "All",  
    "triggerType": "Post",  
    "_rid": "Sl8fALN4sw4BAAAAAAAAcA==",  
    "_ts": 1449689654,  
    "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/triggers\/Sl8fALN4sw4BAAAAAAAAcA==\/",  
    "_etag": "\"060022e5-0000-0000-0000-566882360000\""  
}  
  
```  
  
## Example  
  
```  
PUT https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/triggers/PostTrigger-UpdateMetaAll HTTP/1.1  
x-ms-session-token: 42  
x-ms-date: Wed, 09 Dec 2015 19:34:14 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dZyzGdsA62guUndVJ4UOhLYaGcoszBFqlYOyXYFpuBwI%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=42  
Content-Length: 1556  
Expect: 100-continue  
  
{  
    "body": "function updateMetadata() {\r\n    var context = getContext();\r\n    var collection = context.getCollection();\r\n    var response = context.getResponse();\r\n    var createdDocument = response.getBody();\r\n\r\n    // query for metadata document\r\n    var filterQuery = 'SELECT * FROM root r WHERE r.id = \"_metadata\"';\r\n    var accept = collection.queryDocuments(collection.getSelfLink(), filterQuery,\r\n      updateMetadataCallback);\r\n    if(!accept) throw \"Unable to update metadata, abort\";\r\n\r\n    function updateMetadataCallback(err, documents, responseOptions) {\r\n      if(err) throw new Error(\"Error\" + err.message);\r\n           if(documents.length != 1) throw 'Unable to find metadata document';\r\n           var metadataDocument = documents[0];\r\n\r\n           // update metadata\r\n           metadataDocument.createdDocuments += 1;\r\n           metadataDocument.createdNames += \" \" + createdDocument.id;\r\n           var accept = collection.replaceDocument(metadataDocument._self,\r\n               metadataDocument, function(err, docReplaced) {\r\n                  if(err) throw \"Unable to update metadata, abort\";\r\n               });\r\n           if(!accept) throw \"Unable to update metadata, abort\";\r\n           return;          \r\n    }",  
    "id": "PostTrigger-UpdateMetaAll",  
    "triggerOperation": "All",  
    "triggerType": "Post"  
}  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/triggers/PostTrigger-UpdateMetaAll  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 19:20:18.154 GMT  
etag: "060022e5-0000-0000-0000-566882360000"  
x-ms-resource-quota: triggers=25;  
x-ms-resource-usage: triggers=1;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1  
x-ms-content-path: Sl8fALN4sw4=  
x-ms-quorum-acked-lsn: 42  
x-ms-session-token: 43  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 12.57  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: 614411ac-2abb-4770-a1f9-3533d7339ec6  
Set-Cookie: x-ms-session-token=43; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/colls/volcano1  
x-ms-gatewayversion: version=1.5.57.3  
Date: Wed, 09 Dec 2015 19:34:15 GMT  
Content-Length: 1565  
  
{  
    "body": "function updateMetadata() {\r\n    var context = getContext();\r\n    var collection = context.getCollection();\r\n    var response = context.getResponse();\r\n    var createdDocument = response.getBody();\r\n\r\n    // query for metadata document\r\n    var filterQuery = 'SELECT * FROM root r WHERE r.id = \"_metadata\"';\r\n    var accept = collection.queryDocuments(collection.getSelfLink(), filterQuery,\r\n      updateMetadataCallback);\r\n    if(!accept) throw \"Unable to update metadata, abort\";\r\n\r\n    function updateMetadataCallback(err, documents, responseOptions) {\r\n      if(err) throw new Error(\"Error\" + err.message);\r\n           if(documents.length != 1) throw 'Unable to find metadata document';\r\n           var metadataDocument = documents[0];\r\n\r\n           // update metadata\r\n           metadataDocument.createdDocuments += 1;\r\n           metadataDocument.createdNames += \" \" + createdDocument.id;\r\n           var accept = collection.replaceDocument(metadataDocument._self,\r\n               metadataDocument, function(err, docReplaced) {\r\n                  if(err) throw \"Unable to update metadata, abort\";\r\n               });\r\n           if(!accept) throw \"Unable to update metadata, abort\";\r\n           return;          \r\n    }",  
    "id": "PostTrigger-UpdateMetaAll",  
    "triggerOperation": "All",  
    "triggerType": "Post",  
    "_rid": "Sl8fALN4sw4BAAAAAAAAcA==",  
    "_ts": 1449689654,  
    "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/triggers\/Sl8fALN4sw4BAAAAAAAAcA==\/",  
    "_etag": "\"060022e5-0000-0000-0000-566882360000\""  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](../Topic/Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  