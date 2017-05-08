---
title: "Querying DocumentDB resources using the REST API"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 62b49c14-9355-4469-b67a-2c1fbcdb18b4
caps.latest.revision: 22
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
# Querying DocumentDB resources using the REST API
Azure Cosmos DB is a globally distributed multi-model database with support for multiple APIs. This article describes how to use REST to query resources using the DocumentDB API. 
  
## What resources can be queried by using REST?  
All DocumentDB resources except account resources can be queried using DocumentDB SQL language.  For more information on DocumentDB SQL Language, see [Query with DocumentDB SQL](http://azure.microsoft.com/documentation/articles/documentdb-sql-query).  
  
## How do I query a resource by using REST?  
To perform a SQL query on a resource, do the following:  
  
* Execute a POST method against a resource path using JSON with the "query" property set to the SQL query string, and the "parameters" property set to the array of optional parameter values.  
* Set the x-ms-documentdb-isquery header to true.  
* Set the Content-Type header to application/query+json.  
  
For a sample showing how to perform a SQL query on a resource using .NET, see [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net).  
  
## Example  
Below is an example REST query operation on document resources. In this example, we would like to find all documents that have "Don" as an author.  
  
```  
POST https://contosomarketing.documents.azure.com/dbs/XP0mAA==/colls/XP0mAJ3H-AA=/docs HTTP/1.1  
x-ms-documentdb-isquery: True  
x-ms-date: Mon, 18 Apr 2015 13:05:49 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dkOU%2bBn2vkvIlHypfE8AA5fulpn8zKjLwdrxBqyg0YGQ%3d  
x-ms-version: 2015-12-16  
x-ms-query-enable-crosspartition: true  
Accept: application/json  
Content-Type: application/query+json  
Host: contosomarketing.documents.azure.com  
Content-Length: 50  
  
{  
    query: "SELECT * FROM root WHERE (root.Author.id = 'Don')",  
    parameters: []  
}  
  
```  
  
## Request Details  
  
|**Method**|**Request URI**|  
|-|-|  
|**POST**|**Required**. The authentication type and signature token. Only the master key token is allowed for this operation. For more information, see [Access Control on DocumentDB Resources](access-control-on-documentdb-resources.md).|  
  
## Request Headers  
 The following table contains the common headers used to perform query operations.  
  
|**Standard Header**|**Description**|  
|-|-|  
|**Authorization**|**Required**. The authentication type and signature token. Only the master key token is allowed for this operation. For more information, see [Access Control on DocumentDB Resources](access-control-on-documentdb-resources.md).|  
|**Content-Type**|**Required**. Must be set to application/query+json.|  
|**Accept**|**Optional**. At the moment, DocumentDB always returns the response payload in standard JSON format. The client must be able to accept the response body in standard JSON format.|  
|**User-Agent**|**Optional**. The user agent performing the request. The recommended format is {user agent name}/{version}. For example, the DocumentDB .NET SDK sets the User-Agent string to Microsoft.Document.Client/1.0.0.0.|  
  
|**Custom Header**|**Description**|  
|-|-|  
|**x-ms-date**|**Required**. The date of the request, as specified in RFC 1123. The date format is expressed in Coordinated Universal Time (UTC), for example. Fri, 08 Apr 2015 03:52:31 GMT.|  
|**x-ms-documentdb-isquery**|**Required**. This property must be set to true.|  
|**x-ms-max-item-count**|**Optional**. To page through a result set, set this header to the maximum number for items to be returned back in a single page.|  
|**x-ms-continuation**|**Optional**. To navigate to the next page of items, set this header to the continuation token for the next page.|  
|**x-ms-version**|**Optional**. The version of DocumentDB REST service. The latest version is used when the header is not provided. For more information, see [Azure DocumentDB REST API Reference](index.md).|  
|**x-ms-documentdb-query-enable-scan**|**Optional**. Use an index scan to process the query if the right index path of type is not available.|  
|**x-ms-session-token**|**Optional**. The session token for the request. Used for session consistency.|  
|**x-ms-partition-key**|**Optional**. If specified, the query is executed only on documents that match the partition key value in the header.|  
|**x-ms-documentdb-query-enablecrosspartition**|**Optional**. Must be set to true for any queries that do not filter against a single partition key. Queries that filter against a single partition key value will be executed against only a single partition even if this is set to true.|  
  
## Request Body  
The request body should be a valid JSON document containing the SQL query and parameters. If the input is malformed or invalid SQL syntax, the operation with fails with a 400 Bad Request error.  
  
|Property|Description|  
|--------------|-----------------|  
|query|**Required**. The SQL query string for the query. For more information see [DocumentDB SQL Query Language](https://go.microsoft.com/fwlink/?linkid=834808).|  
|parameters|**Required**. A JSON array of parameters specified as name value pairs. The parameter array can contain from zero to many parameters.Each parameter must have the following values:**name**: the name of the parameter. Parameter names must be valid string literals and begin with ‘@’.**value**: the value of the parameter. Can be any valid JSON value (string, number, object, array, Boolean or null).|  
  
## Request Example  
 The following example makes a parameterized SQL request with a string parameter for @author.  
  
```  
POST https://contosomarketing.documents.azure.com/dbs/XP0mAA==/colls/XP0mAJ3H-AA=/docs HTTP/1.1  
x-ms-documentdb-isquery: True  
x-ms-date: Mon, 18 Apr 2015 13:05:49 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dkOU%2bBn2vkvIlHypfE8AA5fulpn8zKjLwdrxBqyg0YGQ%3d  
x-ms-version: 2015-04-08  
Accept: application/json  
Content-Type: application/query+json  
Host: contosomarketing.documents.azure.com  
Content-Length: 50  
  
{  
    query: "SELECT * FROM root WHERE (root.Author.id = @author)",  
    parameters:   
    [  
        { name: "@author", value: "Leo Tolstoy"}  
    ]  
}  
```  
  
For more information on the DocumentDB SQL Language, see [Query with DocumentDB SQL](http://azure.microsoft.com/documentation/articles/documentdb-sql-query).  
  
## Response Details  
The following are common status codes returned by this operation. For information about error status codes, please see [HTTP Status Codes for DocumentDB](http-status-codes-for-documentdb.md).  
  
|**Code**|**Description**|  
|-|-|  
|**200 Ok**|The operation is successful.|  
|**400 Bad Request**|The syntax of the SQL statement is incorrect.|  
|**401 Unauthorized**|Either the **Authorization** or **x-ms-date** header is not set. 401 is also returned when the **Authorization** header is set to an invalid authorization token.|  
|**403 Forbidden**|The authorization token has expired.|  
|**404 Not Found**|The collection is no longer a resource. For example, the resource may have been deleted.|  
  
## Response Headers  
This operation returns the following common headers. There may be additional standard and common headers returned.  
  
|**Standard Header**|**Description**|  
|-|-|  
|**Content-Type**|The Content-Type is application/json. DocumentDB always return the response body in standard JSON format.|  
|**Date**|The date-time of the response operation. This date time format conforms to the [RFC1123] date time format expressed in UTC.|  
  
|**Custom Header**|**Description**|  
|-|-|  
|**x-ms-item-count**|The number of item returned by the operation.|  
|**x-ms-continuation**|This is an opaque string returned when the query has potentially more items to be retrieved.<br /><br /> The x-ms-continuation can be included in subsequent requests as a request header to resume execution of the query.|  
|**x-ms-request-charge**|This is the number of request units (RU) consumed by the operation. For more information about request units, see [Managing DocumentDB Capacity and Performance](http://azure.microsoft.com/documentation/articles/documentdb-manage).|  
|**x-ms-activity-id**|This is a unique identifier for the operation. It can be used for tracing execution of DocumentDB requests.|  
|**x-ms-session-token**|The session token to be used for subsequent requests. Used for session consistency.|  
  
## Response Body  
The response body for the query operation consists of the _rid of the parent resource of the resource being queried, and the resource array containing the resource properties for the projection and selection. As per the example, if a query was performed on the **docs** path of the collection with an _rid of XP0mAJ3H-AA=, the response would be as follows:  
  
```  
{"_rid":" XP0mAJ3H-AA=","Documents":   [  ….  ….   ],"_count":10}  
```  
  
|**Property**|**Description**|  
|-|-|  
|**_rid**|The resource id for the collection used within the query.|  
|**_count**|The number of items returned.|  
|**Resource array**|The array containing the query results.|  
  
## Building the query request body  
The query request must be a valid JSON document containing a **query** property that contains a valid SQL query string and a **parameters** property that contains an array of optional parameters. Each parameter should have a **name** and **value** property of parameters that are specified within the query. Parameter names must begin with the “@” character. Values can be any valid JSON values – strings, integers, Booleans and nulls.  
  
It is valid to specifiy only a subset of parameters specified in the **query** text. Expressions that reference these unspecified parameters will evaluate to **undefined**. It is also valid to specify additional parameters that are not used within the **query** text.  
  
Some examples of valid query requests are shown below. For example, the following query has a single parameter @id.  
  
```c#  
{  
    "query": "select * from docs d where d.id = @id",   
    "parameters": [   
        {"@id": "newdoc"}   
     ]  
}  
  
```  
  
The following example has two parameters, one with a string value and another with an integer value.  
  
```c#  
{  
    "query": "select * from docs d where d.id = @id and d.prop = @prop",   
    "parameters": [   
        {"@id": "newdoc"},  
        {"@prop": 5}   
     ]  
}  
```  
  
The following example uses parameters within the SELECT clause, as well as a property accessed through the parameter name as a parameter.  
  
```  
{  
    "query": "select @id, d[@propName] from docs d",   
    "parameters": [   
        {"@id": "newdoc"},  
        {"@propName": "prop"}  
     ]  
}  
```  
  
## Pagination of query results  
Query requests support pagination through the **x-ms-max-item-count** and **x-ms-continuation request** headers. The **x-ms-max-item-count** header specifies the maximum number of values that can be returned by the query execution. This can be between 1 and 1000, and is configured with a default of 100.  
  
Queries will return from zero up to the maximum specified **x-ms-max-item-count** values from the results of the execution. The query result includes an **x-ms-item-count** header that specifies the actual number of documents returned by the query. If there are additional results that could be retrieved from the query, then the response includes a non-empty value for the **x-ms-continuation** header.  
  
Clients can fetch subsequent pages of results by echoing the **x-ms-continuation** header as another request. In order to read all results, clients must repeat this process until an empty **x-ms-continuation** is returned.  
  
DocumentDB query executions are stateless at the server side, and can be resumed at any time using the **x-ms-continuation** header. The **x-ms-continuation** value uses the last processed document resource ID (_rid) to track progress of execution. Therefore if documents are deleted and re-inserted between fetching of pages, then it could potentially be excluded from any of the query batches. However, the behavior and format of the **x-ms-continuation** header might change in a future service update.  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB: DocumentDB API](https://docs.microsoft.com/azure/documentdb/documentdb-introduction)   
* [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
* [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net) 

  
  