---
title: "List Collections"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 6a05af95-f3e7-4729-94a3-179e5eaa188d
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
# List Collections
  Performing a GET on the collections resource of a particular database, i.e. the colls URI path, returns a list of the collections in the database.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid).|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests.  
  
### Body  
 None.  
  
## Response  
 List Collections returns an array of collections within the specified database.  
  
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
|**_rid**|This is the resource ID for the database where the collections reside.|  
|**_count**|This property shows the number of connections returned as part of list operation.|  
|**DocumentCollections**|This the array containing the collections returned as part of the list operation. For details about the properties contained within a collection, please see [Collections](collections.md).|  
  
```  
{  
  "_rid": "PaYSAA==",  
  "DocumentCollections": [  
    {  
      "id": "SampleCollection",  
      "indexingPolicy": {  
        "indexingMode": "consistent",  
        "automatic": true,  
        "includedPaths": [  
          {  
            "path": "/*",  
            "indexes": [  
              {  
                "kind": "Range",  
                "dataType": "Number",  
                "precision": -1  
              },  
              {  
                "kind": "Hash",  
                "dataType": "String",  
                "precision": 3  
              }  
            ]  
          }  
        ],  
        "excludedPaths": []  
      },  
      "_rid": "PaYSAPH7qAo=",  
      "_ts": 1459194239,  
      "_self": "dbs/PaYSAA==/colls/PaYSAPH7qAo=/",  
      "_etag": "\"00001300-0000-0000-0000-56f9897f0000\"",  
      "_docs": "docs/",  
      "_sprocs": "sprocs/",  
      "_triggers": "triggers/",  
      "_udfs": "udfs/",  
      "_conflicts": "conflicts/"  
    },  
    {  
      "id": "SampleCollectionWithCustomIndexPolicy",  
      "indexingPolicy": {  
        "indexingMode": "lazy",  
        "automatic": true,  
        "includedPaths": [  
          {  
            "path": "/*",  
            "indexes": [  
              {  
                "kind": "Range",  
                "dataType": "Number",  
                "precision": -1  
              },  
              {  
                "kind": "Hash",  
                "dataType": "String",  
                "precision": 3  
              }  
            ]  
          }  
        ],  
        "excludedPaths": []  
      },  
      "_rid": "PaYSAIxUPws=",  
      "_ts": 1459194241,  
      "_self": "dbs/PaYSAA==/colls/PaYSAIxUPws=/",  
      "_etag": "\"00001500-0000-0000-0000-56f989810000\"",  
      "_docs": "docs/",  
      "_sprocs": "sprocs/",  
      "_triggers": "triggers/",  
      "_udfs": "udfs/",  
      "_conflicts": "conflicts/"  
    }  
  ],  
  "_count": 2  
}  
  
```  
  
## Example  
  
```  
GET https://querydemo.documents.azure.com/dbs/SampleDatabase/colls HTTP/1.1  
x-ms-date: Mon, 28 Mar 2016 21:26:00 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dQdp6TjZxdeJAKSiUfG%2fd7dS46USXy1IF%2bt5ToLdvOaA%3d  
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.Documents.Client/1.6.0.0Internal Azure DocumentDB Studio/0.61  
x-ms-version: 2015-12-16  
Accept: application/json  
Host: querydemo.documents.azure.com  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Transfer-Encoding: chunked  
Content-Type: application/json  
Content-Location: https://querydemo.documents.azure.com/dbs/SampleDatabase/colls  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Fri, 25 Mar 2016 22:55:02.762 GMT  
x-ms-resource-quota: collections=5000;  
x-ms-resource-usage: collections=27;  
x-ms-item-count: 2  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/SampleDatabase  
x-ms-content-path: PaYSAA==  
x-ms-request-charge: 2  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: 9c102725-4c2b-48ba-8f51-7ac1dc6dbce7  
x-ms-session-token: M:7860  
x-ms-gatewayversion: version=1.6.52.5  
Date: Mon, 28 Mar 2016 21:25:59 GMT  
  
{  
  "_rid": "PaYSAA==",  
  "DocumentCollections": [  
    {  
      "id": "SampleCollection",  
      "indexingPolicy": {  
        "indexingMode": "consistent",  
        "automatic": true,  
        "includedPaths": [  
          {  
            "path": "/*",  
            "indexes": [  
              {  
                "kind": "Range",  
                "dataType": "Number",  
                "precision": -1  
              },  
              {  
                "kind": "Hash",  
                "dataType": "String",  
                "precision": 3  
              }  
            ]  
          }  
        ],  
        "excludedPaths": []  
      },  
      "_rid": "PaYSAPH7qAo=",  
      "_ts": 1459194239,  
      "_self": "dbs/PaYSAA==/colls/PaYSAPH7qAo=/",  
      "_etag": "\"00001300-0000-0000-0000-56f9897f0000\"",  
      "_docs": "docs/",  
      "_sprocs": "sprocs/",  
      "_triggers": "triggers/",  
      "_udfs": "udfs/",  
      "_conflicts": "conflicts/"  
    },  
    {  
      "id": "SampleCollectionWithCustomIndexPolicy",  
      "indexingPolicy": {  
        "indexingMode": "lazy",  
        "automatic": true,  
        "includedPaths": [  
          {  
            "path": "/*",  
            "indexes": [  
              {  
                "kind": "Range",  
                "dataType": "Number",  
                "precision": -1  
              },  
              {  
                "kind": "Hash",  
                "dataType": "String",  
                "precision": 3  
              }  
            ]  
          }  
        ],  
        "excludedPaths": []  
      },  
      "_rid": "PaYSAIxUPws=",  
      "_ts": 1459194241,  
      "_self": "dbs/PaYSAA==/colls/PaYSAIxUPws=/",  
      "_etag": "\"00001500-0000-0000-0000-56f989810000\"",  
      "_docs": "docs/",  
      "_sprocs": "sprocs/",  
      "_triggers": "triggers/",  
      "_udfs": "udfs/",  
      "_conflicts": "conflicts/"  
    }  
  ],  
  "_count": 2  
}  
  
```  
  
## See Also  
 [Azure Cosmos DB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

