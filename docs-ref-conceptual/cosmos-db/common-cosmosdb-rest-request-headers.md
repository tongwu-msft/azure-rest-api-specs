---
title: "Common request headers - Azure Cosmos DB REST API"
ms.date: "10/09/2017"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: 12ef11a8-5543-49bb-8d67-2add48ca183b
caps.latest.revision: 16
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
# Common Azure Cosmos DB REST request headers
The following request headers are common to all tasks that you might do with the SQL API:  
  
|Header|Required|Type|Description|  
|------------|--------------|----------|-----------------|  
|**Authorization**|Required|String|The authorization token for the request. For more information on generating a valid authorization token, see [Access Control on Cosmos DB Resources](https://msdn.microsoft.com/library/azure/dn783368.aspx)|  
|**Content-Type**|Required (on PUT and POST)|String|For POST on query operations, it must be application/query+json.<br /><br /> For attachments, must be set to the Mime type of the attachment. For more information on Mime types, see [Create an Attachment](create-an-attachment.md)<br /><br /> For all other tasks, must be application/json.|  
|**If-Match**|Optional (applicable only on PUT and DELETE)|String|Used to make operation conditional for optimistic concurrency. The value should be the etag value of the resource.|  
|**If-None-Match**|Optional (applicable only on GET)|String|Makes operation conditional to only execute if the resource has changed. The value should be the etag of the resource.|  
|**If-Modified-Since**|Optional (applicable only on GET)|Date|Returns etag of resource modified after specified date in RFC 1123 format. Ignored when **If-None-Match** is specified | 
|**User-Agent**|Optional|String|A string that specifies the client user agent performing the request. The recommended format is {user agent name}/{version}. For example, the official SQL API .NET SDK sets the User-Agent string to Microsoft.Document.Client/1.0.0.0. A custom user-agent could be something like ContosoMarketingApp/1.0.0.|  
|**x-ms-activity-id**|Optional|String|A client supplied identifier for the operation, which is echoed in the server response. The recommended value is a unique identifier.|  
|**x-ms-consistency-level**|Optional|String|The consistency level override for read options against documents and attachments. The valid values are: Strong, Bounded, Session, or Eventual (in order of strongest to weakest). The override must be the same or weaker than the account’s configured consistency level.|  
|**x-ms-continuation**|Optional|String|A string token returned for queries and read-feed operations if there are more results to be read. Clients can retrieve the next page of results by resubmitting the request with the x-ms-continuation request header set to this value.|  
|**x-ms-date**|Required|Date|The date of the request per RFC 1123 date format expressed in Coordinated Universal Time, for example, Fri, 08 Apr 2015 03:52:31 GMT.|  
|**x-ms-max-item-count**|Optional|Number|An integer indicating the maximum number of items to be returned per page. An x-ms-max-item-count of -1 can be specified to let the service determine the optimal item count. This is the recommended configuration value for x-ms-max-item-count|  
|**x-ms-documentdb-partitionkey**|Optional|Array|The partition key value for the requested document or attachment operation. Required for operations against documents and attachments when the collection definition includes a partition key definition. This value is used to scope your query to documents that match the partition key criteria. By design it's a single partition query. Supported in API versions 2015-12-16 and newer. Currently, the SQL API supports a single partition key, so this is an array containing just one value.| 
| **x-ms-documentdb-query-enablecrosspartition**| Optional| Boolean | When this header is set to true and if your query doesn't have a partition key, Azure Cosmos DB fans out the query across partitions. The fan out is done by issuing individual queries to all the partitions. To read the query results, the client applications should consume the results from the FeedResponse and check for the ContinuationToken property. To read all the results, keep iterating on the data until the ContinuationToken is null.  |  
|**x-ms-session-token**|Required (for session consistency only)|String|A string token used with session level consistency. For more information, see <br />                [Using consistency levels in Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/consistency-levels)|  
|**x-ms-version**|Required|String|The version of the Cosmos DB REST service. <br />                For a list of supported API versions, see [Azure Cosmos DB REST API Reference](index.md)|
|**A-IM**|Optional|String|Indicates a [change feed](https://docs.microsoft.com/azure/cosmos-db/change-feed) request. Must be set to "Incremental feed", or omitted otherwise.|
|**x-ms-documentdb-partitionkeyrangeid**|Optional|Number|Used in [change feed](https://docs.microsoft.com/azure/cosmos-db/change-feed) requests. The partition key range ID for reading data.|
|x-ms-cosmos-allow-tentative-writes| Optional | Boolean |When this header is set to true for the Azure Cosmos accounts configured with multiple write locations, Azure Cosmos DB will allow writes to all locations. Write requests with the value of this header set to false (or if the header is absent) will divert the requests to the first region configured on the account, similar to accounts with a single write location.  |
  
**See also**  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-sdk-dotnet)   
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  
