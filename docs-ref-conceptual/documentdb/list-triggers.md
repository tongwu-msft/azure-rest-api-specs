---
title: "List Triggers"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmosdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 4e40b345-4f46-4be1-8cf4-8076743e1c55
caps.latest.revision: 8
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
# List Triggers
  Performing a GET on the triggers resource of a particular database returns a list of the triggers in the collection.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/triggers`|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription. The {db-id} value is the user generated name/id of the database where the triggers reside, not the system generated id (rid) of the database. The {coll-id} value is the name of the collection where the triggers reside.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests.  
  
### Body  
 None.  
  
## Response  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 OK|The operation was successful.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the trigger resource.|  
|**_count**|The number of triggers returned.|  
|**Triggers**||  
|**id**|This the unique name used to identify the trigger.|  
|**body**|This is the body of the trigger.|  
|**triggerOperation**|This is the type of operation that will invoke the trigger. The acceptable values are: **All**, **Insert**, **Replace** and **Delete**.|  
|**triggerType**|This specifies when the trigger will be fired. The acceptable values are: **Pre** and **Post**. **Pre** triggers fire before an operation while **Post** triggers after an operation.|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the trigger resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the uniquely addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
  
```  
{  
    "_rid": "Sl8fALN4sw4=",  
    "Triggers": [{  
        "body": "function updateMetadata() {\r\n    var context = getContext();\r\n    var collection = context.getCollection();\r\n    var response = context.getResponse();\r\n    var createdDocument = response.getBody();\r\n\r\n    // query for metadata document\r\n    var filterQuery = 'SELECT * FROM root r WHERE r.id = \"_metadata\"';\r\n    var accept = collection.queryDocuments(collection.getSelfLink(), filterQuery,\r\n      updateMetadataCallback);\r\n    if(!accept) throw \"Unable to update metadata, abort\";\r\n\r\n    function updateMetadataCallback(err, documents, responseOptions) {\r\n      if(err) throw new Error(\"Error\" + err.message);\r\n           if(documents.length != 1) throw 'Unable to find metadata document';\r\n           var metadataDocument = documents[0];\r\n\r\n           // update metadata\r\n           metadataDocument.createdDocuments += 1;\r\n           metadataDocument.createdNames += \" \" + createdDocument.id;\r\n           var accept = collection.replaceDocument(metadataDocument._self,\r\n               metadataDocument, function(err, docReplaced) {\r\n                  if(err) throw \"Unable to update metadata, abort\";\r\n               });\r\n           if(!accept) throw \"Unable to update metadata, abort\";\r\n           return;          \r\n    }",  
        "id": "PostTrigger-UpdateMetaAll",  
        "triggerOperation": "All",  
        "triggerType": "Post",  
        "_rid": "Sl8fALN4sw4BAAAAAAAAcA==",  
        "_ts": 1449689654,  
        "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/triggers\/Sl8fALN4sw4BAAAAAAAAcA==\/",  
        "_etag": "\"060022e5-0000-0000-0000-566882360000\""  
    }],  
    "_count": 1  
}  
  
```  
  
## Example  
  
```  
GET https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/triggers HTTP/1.1  
x-ms-session-token: 43  
x-ms-date: Wed, 09 Dec 2015 19:40:27 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3ddQsYc7kfkHMsxNN7K55hEImj9Pf1Ng2EV7b4aHbr%2fE8%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=43  
Connection: Keep-Alive  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/triggers  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Thu, 26 Nov 2015 05:55:14.602 GMT  
x-ms-resource-quota: triggers=25;  
x-ms-resource-usage: triggers=1;  
x-ms-item-count: 1  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1  
x-ms-content-path: Sl8fALN4sw4=  
x-ms-session-token: 43  
x-ms-request-charge: 1.05  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: b3502e9f-1afc-4168-860a-b0249a0698de  
Set-Cookie: x-ms-session-token=43; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/colls/volcano1  
x-ms-gatewayversion: version=1.5.57.3  
Date: Wed, 09 Dec 2015 19:40:26 GMT  
Content-Length: 1613  
  
{  
    "_rid": "Sl8fALN4sw4=",  
    "Triggers": [{  
        "body": "function updateMetadata() {\r\n    var context = getContext();\r\n    var collection = context.getCollection();\r\n    var response = context.getResponse();\r\n    var createdDocument = response.getBody();\r\n\r\n    // query for metadata document\r\n    var filterQuery = 'SELECT * FROM root r WHERE r.id = \"_metadata\"';\r\n    var accept = collection.queryDocuments(collection.getSelfLink(), filterQuery,\r\n      updateMetadataCallback);\r\n    if(!accept) throw \"Unable to update metadata, abort\";\r\n\r\n    function updateMetadataCallback(err, documents, responseOptions) {\r\n      if(err) throw new Error(\"Error\" + err.message);\r\n           if(documents.length != 1) throw 'Unable to find metadata document';\r\n           var metadataDocument = documents[0];\r\n\r\n           // update metadata\r\n           metadataDocument.createdDocuments += 1;\r\n           metadataDocument.createdNames += \" \" + createdDocument.id;\r\n           var accept = collection.replaceDocument(metadataDocument._self,\r\n               metadataDocument, function(err, docReplaced) {\r\n                  if(err) throw \"Unable to update metadata, abort\";\r\n               });\r\n           if(!accept) throw \"Unable to update metadata, abort\";\r\n           return;          \r\n    }",  
        "id": "PostTrigger-UpdateMetaAll",  
        "triggerOperation": "All",  
        "triggerType": "Post",  
        "_rid": "Sl8fALN4sw4BAAAAAAAAcA==",  
        "_ts": 1449689654,  
        "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/triggers\/Sl8fALN4sw4BAAAAAAAAcA==\/",  
        "_etag": "\"060022e5-0000-0000-0000-566882360000\""  
    }],  
    "_count": 1  
}  
  
```  
  
## See Also  
 [Azure Cosmos DB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  
