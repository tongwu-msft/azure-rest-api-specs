---
title: "Create a Trigger - Azure Cosmos DB REST API"
ms.date: "02/25/2016"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: d91d7398-6323-4add-a721-2e7659510f34
caps.latest.revision: 7
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
# Create Trigger
The `Create Trigger` operation creates a new trigger in a collection.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|POST|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/triggers`|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription. The {db-id} value is the user generated name/ID of the database where the trigger is created, not the system generated ID (rid) of the database. The {coll-id} value is the name of the collection where the trigger is created.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-cosmosdb-rest-request-headers.md) for headers that are used by all Azure Cosmos DB requests.  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**id**|Required|String|It is the unique name used to identify the trigger. The **id** must not exceed 255 characters.|  
|**body**|Required|String|It is the body of the trigger.|  
|**triggerOperation**|Required|String|It is the type of operation that invokes the trigger. The acceptable values are: **All**, **Create**, **Replace**, and **Delete.**|  
|**triggerType**|Required|String|This value specifies when the trigger is fired. The acceptable values are: **Pre** and **Post**. **Pre** triggers fire before an operation while **Post** triggers after an operation.|  
  
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
 See [Common Azure Cosmos DB REST response headers](common-cosmosdb-rest-response-headers.md) for headers that are returned by all Azure Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|201 Created|The operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes.|  
|409 Conflict|The ID provided for the new trigger has been taken by an existing trigger.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|It is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the trigger resource.|  
|**_ts**|It is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|It is a system generated property. It is the uniquely addressable URI for the resource.|  
|**_etag**|It is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
  
```  
{  
    "body": "function updateMetadata() {\r\n    var context = getContext();\r\n    var collection = context.getCollection();\r\n    var response = context.getResponse();\r\n    var createdDocument = response.getBody();\r\n\r\n    // query for metadata document\r\n    var filterQuery = 'SELECT * FROM root r WHERE r.id = \"_metadata\"';\r\n    var accept = collection.queryDocuments(collection.getSelfLink(), filterQuery,\r\n      updateMetadataCallback);\r\n    if(!accept) throw \"Unable to update metadata, abort\";\r\n\r\n    function updateMetadataCallback(err, documents, responseOptions) {\r\n      if(err) throw new Error(\"Error\" + err.message);\r\n           if(documents.length != 1) throw 'Unable to find metadata document';\r\n           var metadataDocument = documents[0];\r\n\r\n           // update metadata\r\n           metadataDocument.createdDocuments += 1;\r\n           metadataDocument.createdNames += \" \" + createdDocument.id;\r\n           var accept = collection.replaceDocument(metadataDocument._self,\r\n               metadataDocument, function(err, docReplaced) {\r\n                  if(err) throw \"Unable to update metadata, abort\";\r\n               });\r\n           if(!accept) throw \"Unable to update metadata, abort\";\r\n           return;          \r\n    }",  
    "id": "PostTrigger-UpdateMetaAll",  
    "triggerOperation": "All",  
    "triggerType": "Post",  
    "_rid": "Sl8fALN4sw4BAAAAAAAAcA==",  
    "_ts": 1449689248,  
    "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/triggers\/Sl8fALN4sw4BAAAAAAAAcA==\/",  
    "_etag": "\"0600fbe4-0000-0000-0000-566880a00000\""  
}  
  
```  
  
## Example  
  
```  
POST https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/triggers HTTP/1.1  
x-ms-session-token: 41  
x-ms-date: Wed, 09 Dec 2015 19:27:28 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dHmx5WSnyLdbJnDB1Ixme8uGbUSl%2f96HkCgSsSnsSq%2fI%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=41  
Content-Length: 1380  
Expect: 100-continue  
Connection: Keep-Alive  
  
{  
    "body": "function updateMetadata() {\r\n    var context = getContext();\r\n    var collection = context.getCollection();\r\n    var response = context.getResponse();\r\n    var createdDocument = response.getBody();\r\n\r\n    // query for metadata document\r\n    var filterQuery = 'SELECT * FROM root r WHERE r.id = \"_metadata\"';\r\n    var accept = collection.queryDocuments(collection.getSelfLink(), filterQuery,\r\n      updateMetadataCallback);\r\n    if(!accept) throw \"Unable to update metadata, abort\";\r\n\r\n    function updateMetadataCallback(err, documents, responseOptions) {\r\n      if(err) throw new Error(\"Error\" + err.message);\r\n           if(documents.length != 1) throw 'Unable to find metadata document';\r\n           var metadataDocument = documents[0];\r\n\r\n           // update metadata\r\n           metadataDocument.createdDocuments += 1;\r\n           metadataDocument.createdNames += \" \" + createdDocument.id;\r\n           var accept = collection.replaceDocument(metadataDocument._self,\r\n               metadataDocument, function(err, docReplaced) {\r\n                  if(err) throw \"Unable to update metadata, abort\";\r\n               });\r\n           if(!accept) throw \"Unable to update metadata, abort\";\r\n           return;          \r\n    }",  
    "id": "PostTrigger-UpdateMetaAll",  
    "triggerOperation": "All",  
    "triggerType": "Post"  
}  
  
```  
  
```  
HTTP/1.1 201 Created  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 19:20:18.154 GMT  
etag: "0600fbe4-0000-0000-0000-566880a00000"  
x-ms-resource-quota: triggers=25;  
x-ms-resource-usage: triggers=1;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1  
x-ms-content-path: Sl8fALN4sw4=  
x-ms-quorum-acked-lsn: 41  
x-ms-session-token: 42  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 6.29  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: b407dfec-b6ec-4aa5-9833-eadad231fcd4  
x-ms-gatewayversion: version=1.5.57.3  
Date: Wed, 09 Dec 2015 19:27:29 GMT  
Content-Length: 1565  
  
{  
    "body": "function updateMetadata() {\r\n    var context = getContext();\r\n    var collection = context.getCollection();\r\n    var response = context.getResponse();\r\n    var createdDocument = response.getBody();\r\n\r\n    // query for metadata document\r\n    var filterQuery = 'SELECT * FROM root r WHERE r.id = \"_metadata\"';\r\n    var accept = collection.queryDocuments(collection.getSelfLink(), filterQuery,\r\n      updateMetadataCallback);\r\n    if(!accept) throw \"Unable to update metadata, abort\";\r\n\r\n    function updateMetadataCallback(err, documents, responseOptions) {\r\n      if(err) throw new Error(\"Error\" + err.message);\r\n           if(documents.length != 1) throw 'Unable to find metadata document';\r\n           var metadataDocument = documents[0];\r\n\r\n           // update metadata\r\n           metadataDocument.createdDocuments += 1;\r\n           metadataDocument.createdNames += \" \" + createdDocument.id;\r\n           var accept = collection.replaceDocument(metadataDocument._self,\r\n               metadataDocument, function(err, docReplaced) {\r\n                  if(err) throw \"Unable to update metadata, abort\";\r\n               });\r\n           if(!accept) throw \"Unable to update metadata, abort\";\r\n           return;          \r\n    }",  
    "id": "PostTrigger-UpdateMetaAll",  
    "triggerOperation": "All",  
    "triggerType": "Post",  
    "_rid": "Sl8fALN4sw4BAAAAAAAAcA==",  
    "_ts": 1449689248,  
    "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/triggers\/Sl8fALN4sw4BAAAAAAAAcA==\/",  
    "_etag": "\"0600fbe4-0000-0000-0000-566880a00000\""  
}  
  
```  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

