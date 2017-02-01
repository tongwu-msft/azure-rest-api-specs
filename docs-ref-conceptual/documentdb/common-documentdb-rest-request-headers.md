---p
title: "Common DocumentDB REST request headers"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 12ef11a8-5543-49bb-8d67-2add48ca183b
caps.latest.revision: 16
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
# Common DocumentDB REST request headers
  The following request headers are common to all tasks that you might do with DocumentDB:  
  
|Header|Required|Type|Description|  
|------------|--------------|----------|-----------------|  
|**Authorization**|Required|String|The authorization token for the request. For more information on generating a valid authorization token please see [Access Control on DocumentDB Resources](https://msdn.microsoft.com/library/azure/dn783368.aspx)|  
|**Content-Type**|Required (on PUT and POST)|String|For POST on query operations, it must be application/query+json.<br /><br /> For attachments, must be set to the Mime type of the attachment. For more information on Mime types please see [Create an Attachment](create-an-attachment.md)<br /><br /> For all other tasks, must be application/json.|  
|**If-Match**|Optional (applicable only on PUT and DELETE)|String|Used to make operation conditional for optimistic concurrency. The value should be the etag value of the resource.|  
|**If-None-Match**|Optional (applicable only on GET)|String|Makes operation conditional to only execute if the resource has changed. The value should be the etag of the resource.|  
|**User-Agent**|Optional|String|A string that specifies the client user agent performing the request. The recommended format is {user agent name}/{version}. For example, the official DocumentDB .NET SDK sets the User-Agent string to Microsoft.Document.Client/1.0.0.0. A custom user-agent could be something like ContosoMarketingApp/1.0.0.|  
|**x-ms-activity-id**|Optional|String|A client supplied identifier for the operation, which will be echoed in the server response. The recommended value is a unique identifier.|  
|**x-ms-consistency-level**|Optional|String|This is the consistency level override for read options against documents and attachments. The valid values are: Strong, Bounded, Session, or Eventual (in order of strongest to weakest). The override must be the same or weaker than the account’s configured consistency level.|  
|**x-ms-continuation**|Optional|String|A string token returned for queries and read-feed operations if there are more results to be read. Clients can retrieve the next page of results by resubmitting the request with the x-ms-continuation request header set to this value.|  
|**x-ms-date**|Required|Date|The date of the request per RFC 1123 date format expressed in Coordinated Universal Time, e.g. Fri, 08 Apr 2015 03:52:31 GMT.|  
|**x-ms-max-item-count**|Optional|Number|An integer indicating the maximum number of items to be returned per page. An x-ms-max-item-count of -1 can be specified to let the service determine the optimal item count. This is the recommended configuration value for x-ms-max-item-count|  
|**x-ms-documentdb-partitionkey**|Optional|Array|The partition key value for the requested document or attachment operation. Required for operations against documents and attachments when the collection definition includes a partition key definition. Supported in API versions 2015-12-16 and newer. Currently, DocumentDB supports a single partition key, so this is an array containing just one value.|  
|**x-ms-session-token**|Required (for session consistency only)|String|A string token used with session level consistency. For more information please refer to<br />                [Using consistency levels in DocumentDB](https://azure.microsoft.com/en-us/documentation/articles/documentdb-consistency-levels/)|  
|**x-ms-version**|Required|String|The version of the DocumentDB REST service. <br />                For a list of supported API versions please refer to [Azure DocumentDB REST API Reference](index.md)|  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [DocumentDB Resource URI Syntax for REST](documentdb-resource-uri-syntax-for-rest.md)   
 [Access Control on DocumentDB Resources](access-control-on-documentdb-resources.md)   
 [Querying DocumentDB resources using the REST API](querying-documentdb-resources-using-the-rest-api.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  
