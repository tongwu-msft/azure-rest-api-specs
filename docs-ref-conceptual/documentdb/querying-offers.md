---
title: "Querying Offers"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 72f8cca5-1ddb-49e4-8b6e-0dccbf812b7c
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
# Querying Offers
  You can perform queries on offers resources by issuing a POST on the offers resource, i.e. the offers URI path. This section will show a simple example of retrieving the offers for a particular collection by its self-link.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|POST|`https://{databaseaccount}.documents.azure.com/offers`|Note that {databaseaccount} is the name of the Azure Cosmos DB account you created under your subscription.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests.  
  
|Header|Required|Description|  
|------------|--------------|-----------------|  
|**Content-Type**|Required|Must be set to **application/query+json**.|  
|**x-ms-documentdb-isquery**|Required|Must be set to **True**.|  
  
### Body  
  
|Property|Required|Description|  
|--------------|--------------|-----------------|  
|**query**|Required|The value of this property the SQL statement to be executed.|  
  
```  
{"query":"SELECT * FROM root WHERE (root[\"_self\"] = \"dbs/EVQzAA==/colls/EVQzALIIEQw=/\") "}  
```  
  
## Response  
 Returns an array of object resources that match the query.  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  
  
|Header|Description|  
|------------|-----------------|  
|**x-ms-item-count**|This is number of items returned from the query.|  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The operation was successful.|  
|400 Bad Request|The JSON body is invalid.|  
|401 Unauthorized|The Authorization or x-ms-date header is not set. 401 is also returned when the Authorization header is set to an invalid authorization token.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a system generated property. The **_rid** value is empty for this operation.|  
|**_count**|This property shows the number of offers returned as part of the operation.|  
|**Offers**|This the array containing the offers returned as part of the  operation.<br />See [Offers](offers.md) to find the properties of the offer resource.|  
  
```  
{"_rid":"","Offers":[],"_count":0}  
```  
  
## Example  
  
```  
POST https://querydemo.documents.azure.com/offers HTTP/1.1  
x-ms-continuation:   
x-ms-documentdb-isquery: True  
x-ms-documentdb-query-enablecrosspartition: False  
x-ms-date: Tue, 29 Mar 2016 18:07:41 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3d0si%2fhno2pKTQhgvdkojNqlQlYdoguwQEBt79XvpobMc%3d  
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.Documents.Client/1.6.0.0 samples-net/3  
x-ms-version: 2015-12-16  
Accept: application/json  
Content-Type: application/query+json  
Host: querydemo.documents.azure.com  
Content-Length: 94  
Expect: 100-continue  
  
{"query":"SELECT * FROM root WHERE (root[\"_self\"] = \"dbs/EVQzAA==/colls/EVQzALIIEQw=/\") "}  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Transfer-Encoding: chunked  
Content-Type: application/json  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Fri, 25 Mar 2016 21:27:20.035 GMT  
x-ms-item-count: 0  
x-ms-schemaversion: 1.1  
x-ms-request-charge: 3.94  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: b151cbe4-aae0-4949-959f-189b9884478d  
x-ms-session-token: M:8166  
x-ms-gatewayversion: version=1.6.52.5  
Date: Tue, 29 Mar 2016 18:07:41 GMT  
  
{"_rid":"","Offers":[],"_count":0}  
  
```  
  
## See Also  
 [Azure Cosmos DB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

