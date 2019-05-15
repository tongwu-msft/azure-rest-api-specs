---
title: "List Offers - Azure Cosmos DB REST API"
ms.date: "03/29/2016"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: 2d8f1a15-00a5-4509-a57c-9c2ccd1e062a
caps.latest.revision: 9
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
# List Offers
  To list the offers under the database account, perform a GET on the offers resource, that is, the offers URI path.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|`https://{databaseaccount}.documents.azure.com/offers`|Note that {databaseaccount} is the name of the Azure Cosmos DB account you created under your subscription.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-cosmosdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests.  
 
When [constructing the hashed signature for the master key token](access-control-on-cosmosdb-resources.md#constructkeytoken), the **ResourceType** should be "offers".  The **ResourceLink** should be blank.
  
### Body  
 None.  
  
## Response  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-cosmosdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The operation was successful.|  
|401 Unauthorized|The **Authorization** or **x-ms-date** header is not set. 401 is also returned when the **Authorization** header is set to an invalid authorization token.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|It is a system generated property. The **_rid** value is empty for this operation.|  
|**_count**|This property shows the number of offers returned as part of list operation.|  
|**offers**|This array contains the offers returned as part of the list operation.<br />See [Offers](offers.md) to find the properties of the offer resource.|  
  
```  
{  
  "_rid": "",  
  "Offers": [  
    {  
      "offerVersion": "V2",  
      "offerType": "Invalid",  
      "content": {  
        "offerThroughput": 400  
      },  
      "resource": "dbs/PaYSAA==/colls/PaYSAPH7qAo=/",  
      "offerResourceId": "PaYSAPH7qAo=",  
      "id": "QH8O",  
      "_rid": "QH8O",  
      "_self": "offers/QH8O/",  
      "_etag": "\"00001400-0000-0000-0000-56f9897f0000\"",  
      "_ts": 1459194239  
    },  
    {  
      "offerType": "S3",  
      "resource": "dbs/hPJRAA==/colls/hPJRAJQcIQg=/",  
      "offerResourceId": "hPJRAJQcIQg=",  
      "id": "Z2sl",  
      "_rid": "Z2sl",  
      "_self": "offers/Z2sl/",  
      "_etag": "\"00000200-0000-0000-0000-56b281730000\"",  
      "_ts": 1454539123  
    }  
  ],  
  "_count": 2  
}  
  
```  
  
## Example  
  
```  
GET https://querydemo.documents.azure.com/offers HTTP/1.1  
x-ms-date: Tue, 29 Mar 2016 17:50:18 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3d13hxyOkKYq9ahWqSret83vS72Z0v3%2fo2HKodfDQQpoQ%3d  
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.Documents.Client/1.6.0.0 samples-net/3  
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
Content-Location: https://querydemo.documents.azure.com/offers  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Fri, 25 Mar 2016 21:27:20.035 GMT  
x-ms-item-count: 2  
x-ms-schemaversion: 1.1  
x-ms-request-charge: 11.04  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: ed5cb8aa-0324-4ad8-9bdb-da513c76d9eb  
x-ms-session-token: M:8110  
x-ms-gatewayversion: version=1.6.52.5  
Date: Tue, 29 Mar 2016 17:50:18 GMT  
  
{  
  "_rid": "",  
  "Offers": [  
    {  
      "offerVersion": "V2",  
      "offerType": "Invalid",  
      "content": {  
        "offerThroughput": 400  
      },  
      "resource": "dbs/PaYSAA==/colls/PaYSAPH7qAo=/",  
      "offerResourceId": "PaYSAPH7qAo=",  
      "id": "QH8O",  
      "_rid": "QH8O",  
      "_self": "offers/QH8O/",  
      "_etag": "\"00001400-0000-0000-0000-56f9897f0000\"",  
      "_ts": 1459194239  
    },  
    {  
      "offerType": "S3",  
      "resource": "dbs/hPJRAA==/colls/hPJRAJQcIQg=/",  
      "offerResourceId": "hPJRAJQcIQg=",  
      "id": "Z2sl",  
      "_rid": "Z2sl",  
      "_self": "offers/Z2sl/",  
      "_etag": "\"00000200-0000-0000-0000-56b281730000\"",  
      "_ts": 1454539123  
    }  
  ],  
  "_count": 2  
}  
  
```  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

