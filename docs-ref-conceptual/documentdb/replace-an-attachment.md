---
title: "Replace an Attachment"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmosdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 068a193d-181a-4e79-a8ef-61bd12e4d4ec
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
# Replace an Attachment
  There are two ways to replace an attachment resource – put the media content to Azure Cosmos DB like in the [AtomPub Protocol](https://tools.ietf.org/html/rfc5023), or put just the attachment metadata to media stored externally.  
  
 The first is to PUT the raw media in the body payload to store it in the provided attachment storage under your Cosmos DB account. For the attachment storage quota, see [Cosmos DB limits](http://azure.microsoft.com/documentation/articles/documentdb-limits/). To replace this type of attachment, developers include the raw attachment (video, audio, file, blob, etc.) as the body of the PUT. Two headers must be set: Content-Type and Slug. The Content-Type header is set to the MIME type of the attachment while the Slug header is set to the name of the attachment.  
  
 The second way to replace an attachment resource is to PUT the attachment resource properties noting the type and media link of the attachment. Unlike the first type of attachment resource, the Content-Type and Slug headers are not to be set as the raw media is not part of the request payload.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|PUT|https:// {databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/docs/{doc-name}/attachments/{att-name}|Note that the {databaseaccount} is the name of the Cosmos DB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {coll-id} value is the name of the collection the document is contained in. The {doc-name} value is the name of the document associated with the attachment. The {att-name} value is the name of the attachment to be replaced.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests.  
  
|Header|Required|Type|Description|  
|------------|--------------|----------|-----------------|  
|**Slug**|Optional|String|The name of the attachment. This is only required when raw media is submitted to the Cosmos DB attachment storage. For more details, refer to [AtomPub Protocol](https://tools.ietf.org/html/rfc5023).|  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**id**|Optional|String|Not Required to be set when attaching raw media. This is a user settable property. It is the unique name that identifies the attachment, i.e. no two attachments will share the same **id**. The **id** must not exceed 255 characters.|  
|**contentType**|Optional|String|Not Required to be set when attaching raw media. This is a user settable property. It notes the content type of the attachment. When submitting the attachment bits as body, Cosmos DB sets the **contentType** to the type set in the **Content-Type** header.|  
|**Media**|Optional|String|Not Required to be set when attaching raw media. This is the URL link or file path where the attachment resides.|  
  
```  
{  
    "id": "image_id_2",  
    "contentType": "image/jpg",  
    "media": "www.microsoft.com"  
}  
  
```  
  
## Response  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes.|  
|404 Not Found|The attachment to be replaced is no longer a resource, i.e. the attachment has been deleted.|  
|409 Conflict|The id provided for the attachment has been taken by an existing attachment.|  
|413 Entity Too Large|The document size in the request exceeded the allowable document size in a request. For more information on document size limits, see [Azure Cosmos DB limits](http://azure.microsoft.com/documentation/articles/documentdb-limits/).|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the attachment resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource **etag** required for optimistic concurrency control.|  
  
```  
{  
    "id": "image_id_2",  
    "contentType": "image/jpg",  
    "media": "www.microsoft.com",  
    "_rid": "Sl8fALN4sw4CAAAAAAAAAOnTcEc=",  
    "_ts": 1449606442,  
    "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/docs\/Sl8fALN4sw4CAAAAAAAAAA==\/attachments\/Sl8fALN4sw4CAAAAAAAAAOnTcEc=",  
    "_etag": "\"0600abc2-0000-0000-0000-56673d2a0000\""  
}  
  
```  
  
## Example  
  
```  
PUT https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/docs/c3bb1fef-fcb1-56e3-0389-f88583c3ce0d/attachments/image_id HTTP/1.1  
x-ms-session-token: 19  
x-ms-date: Tue, 08 Dec 2015 20:27:23 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dKQWBkCCXyJ66fwBe9%2b%2b7oN7CSlIkMMyFEgimGDPawCs%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=19  
Content-Length: 281  
Expect: 100-continue  
  
{  
    "id": "image_id_2",  
    "contentType": "image/jpg",  
    "media": "www.microsoft.com"  
}  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/docs/c3bb1fef-fcb1-56e3-0389-f88583c3ce0d/attachments/image_id  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 19:20:18.154 GMT  
etag: "0600abc2-0000-0000-0000-56673d2a0000"  
x-ms-resource-quota: documentSize=10240;documentsSize=10485760;collectionSize=10485760;  
x-ms-resource-usage: documentSize=0;documentsSize=289;collectionSize=367;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1/docs/c3bb1fef-fcb1-56e3-0389-f88583c3ce0d  
x-ms-content-path: Sl8fALN4sw4CAAAAAAAAAA==  
x-ms-quorum-acked-lsn: 19  
x-ms-session-token: 20  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 9.9  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: 8b8be54a-3c7e-4484-9f65-3a3d778347cc  
Set-Cookie: x-ms-session-token=20; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/colls/volcano1  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 20:27:24 GMT  
Content-Length: 299  
  
{  
    "id": "image_id_2",  
    "contentType": "image/jpg",  
    "media": "www.microsoft.com",  
    "_rid": "Sl8fALN4sw4CAAAAAAAAAOnTcEc=",  
    "_ts": 1449606442,  
    "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/docs\/Sl8fALN4sw4CAAAAAAAAAA==\/attachments\/Sl8fALN4sw4CAAAAAAAAAOnTcEc=",  
    "_etag": "\"0600abc2-0000-0000-0000-56673d2a0000\""  
}  
  
```  
  
## See Also  
 [Azure Cosmos DB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  
