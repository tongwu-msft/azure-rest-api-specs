---
title: "RESTful interactions with Azure Cosmos DB resources"
ms.date: "01/08/2018"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: ecf0afe1-ff09-43f7-be77-53e1a3b83ca8
caps.latest.revision: 19
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
# RESTful interactions with Azure Cosmos DB

[Azure Cosmos DB](/azure/cosmos-db/introduction) is a globally distributed multi-model database that supports the document, graph, and key-value data models. The content in this section is for creating, querying, and managing document resources using the [SQL API](/azure/cosmos-db/sql-api-introduction) via REST.  

  
 By reading this article, you are able to answer the following questions: 
  
- How do the standard HTTP methods work with Azure Cosmos DB resources?    
- How do I create a new resource using POST?  
- How do I register a stored procedure using POST?  
- How does Azure Cosmos DB support concurrency control?  
- What are the connectivity options for HTTPS and TCP?  
  
 If you are looking for information on how to perform CRUD operations on specific resources using REST, see [Common tasks using the Azure Cosmos DB REST API](common-tasks-using-the-cosmosdb-rest-api.md). If you are looking for samples on how to perform CRUD operations using C# and REST, see the [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net) on GitHub.  
  
> [!NOTE]  
>  You can also perform CRUD operations on Cosmos DB resources using the Cosmos DB SDKs. For samples, see [Azure Cosmos DB examples](/azure/cosmos-db/sql-api-dotnet-samples). For links to the SDK downloads and documentation, see [Cosmos DB SDKs](/azure/cosmos-db/sql-api-sdk-dotnet).  
  
## Overview of HTTP verbs  
Azure Cosmos DB resources support the following HTTP verbs with their standard interpretation:  
  
1.  POST means create a new item resource.   
2.  GET means read an existing item or a feed resource  
3.  PUT means replace an existing item resource  
4.  DELETE means delete an existing  item resource  
5.  HEAD means GET sans the response payload (that is, just the headers)  
  
As illustrated in the following HTTP verbs diagram, POST can only be issued against a feed resource; PUT and DELETE can only be issued against an item resource; GET and HEAD can be issued against either feed or item resources.  
  
![interactions-with-resources2](./media/interactions-with-resources2.png "interactions-with-resources2")  
  
**Interaction model using the standard HTTP methods**  
  
## Create a new resource using POST HTTP method  
To get a better feel for the interaction model, let’s consider the case of creating a new resource (aka INSERT). In order to create a new resource, you are required to issue an HTTP POST request with the request body containing the representation of the resource against the URI of the container feed the resource belongs to. The only required property for the request is the ID of the resource.  
  
As an example, in order to create a new database, you POST a database resource (by setting the ID property with a unique name) against /dbs. Similarly, in order to create a new collection, you POST a collection resource against */dbs/_rid/colls/* and so on. The response contains the fully committed resource with the system generated properties including the *_self* link of the resource using which you can navigate to other resources. As an example of the simple HTTP-based interaction model, a client can issue an HTTP request to create a new database within an account.  
  
```  
POST https://fabrikam.documents.azure.com/dbs  
{  
    "id":"MyDb"
}  
```  
As an example, in order to create a new database, you `POST` a database resource (by setting the ID property with a unique name) against `/dbs`. Similarly, in order to create a new collection, you `POST` a collection resource against `/dbs/_rid/colls/` and so on. The response contains the fully committed resource with the system generated properties including the `_self` link of the resource using which you can navigate to other resources. As an example of the simple HTTP-based interaction model, a client can issue an HTTP request to create a new database within an account.  

The Azure Cosmos DB service responds with a successful response and a status code indicating successful creation of the database.  
  
```  
HTTP/1.1 201 Created  
Content-Type: application/json  
x-ms-request-charge: 4.95  
...  
  
{  
    "id": "MyDb",  
    "_rid": "UoEi5w==",  
    "_self": "dbs/UoEi5w==/",  
    "_ts": 1407370063,  
    "_etag": "00000100-0000-0000-0000-54b636600000",  
    "_colls": "colls/",  
    "_users": "users/"  
}  
```  
  
## Register a stored procedure using POST HTTP method  
 As another example of creating and executing a resource, consider a simple "HelloWorld" stored procedure written entirely in JavaScript.  
  
```  
function HelloWorld() {  
    var context = getContext();  
    var response = context.getResponse();  

    response.setBody("Hello, World");  
}  
```  
  
The stored procedure can be registered to a collection under MyDb by issuing a POST against `/dbs/_rid-db/colls/_rid-coll/sprocs`.  
  
```  
POST https://fabrikam.documents.azure.com/dbs/UoEi5w==/colls/UoEi5w+upwA=/sprocs HTTP/1.1  
  
{  
    "id": "HelloWorld",  
    "body": "function HelloWorld() {  
                var context = getContext();  
                var response = context.getResponse();  

                response.setBody("Hello, World");  
            }"  
}  
```  
  
 The Azure Cosmos DB service responds with a successful response and a status code indicating successful registration of the stored procedure.  
  
```  
HTTP/1.1 201 Created  
Content-Type: application/json  
x-ms-request-charge: 4.95  
...  
  
{  
    "body": "function HelloWorld() {  
        var context = getContext();  
        var response = context.getResponse();  

        response.setBody("Hello, World");  
        }",  
    "id": "HelloWorld"  
    "_rid": "UoEi5w+upwABAAAAAAAAgA==",  
    "_ts" :  1421227641  
    "_self": "dbs/UoEi5w==/colls/UoEi5w+upwA=/sprocs/UoEi5w+upwABAAAAAAAAgA==/",  
    "_etag": "00002100-0000-0000-0000-50f71fda0000"  
}  
```  
  
## Execute a stored procedure using POST HTTP method  
Finally, to execute the stored procedure in the preceding example, one needs to issue a `POST` against the URI of the stored procedure resource (`/dbs/UoEi5w==/colls/UoEi5w+upwA=/sprocs/UoEi5w+upwABAAAAAAAAgA==/`) as illustrated below.  
  
```  
POST https://fabrikam.documents.azure.com/dbs/UoEi5w==/colls/UoEi5w+upwA=/sprocs/UoEi5w+upwABAAAAAAAAgA== HTTP/1.1  
```  
  
The Azure Cosmos DB service responds with the following response.  
  
```  
HTTP/1.1 200 OK  
  
"Hello World"  
```  
  
Note that the POST HTTP verb is used for creation of a new resource, for executing a stored procedure, and for issuing a SQL query. To illustrate the SQL query execution, consider the following.  
  
```  
POST https://fabrikam.documents.azure.com/dbs/UoEi5w==/colls/UoEi5w+upwA=/docs HTTP/1.1  
...  
x-ms-documentdb-isquery: True  
x-ms-documentdb-query-enable-scan: True  
Content-Type: application/query+json  
...  

{"query":"SELECT f.LastName AS Name, f.Address.City AS City FROM Families f WHERE f.id='AndersenFamily' OR f.Address.City='NY'"}  
```  
  
The service responds with the results of the SQL query.  
  
```  
HTTP/1.1 200 Ok  
...  
x-ms-activity-id: 83f9992c-abae-4eb1-b8f0-9f2420c520d2  
x-ms-item-count: 2  
x-ms-session-token: 4  
x-ms-request-charge: 3.1  
Content-Type: application/json1  

{"_rid":"UoEi5w+upwA=","Documents":[{"Name":"Andersen","City":"Seattle"},{"Name":"Wakefield","City":"NY"}],"_count":2} 
```  

## Using PUT, GET, and DELETE HTTP verbs  
 Replacing or reading a resource amounts to issuing `PUT` (with a valid request body) and GET verbs against the *_self* link of the resource respectively. Likewise, deleting a resource amounts to issuing a `DELETE` verb against the *_self* link of the resource. It is worth pointing out that the hierarchical organization of resources in the Azure Cosmos DB’s resource model necessitates the support for cascaded deletes wherein deleting the owner resource causes deletion of the dependent resources. The dependent resources may be distributed across other nodes than the owner resources and so the deletion could happen lazily. Regardless of mechanics of the garbage collection, upon deletion of a resource, the quota is instantly freed up and is available for you to use. Note that the referential integrity is preserved by the system. For instance, you cannot insert a collection to a database which is deleted or replace or query a document of a collection which no longer exists.  
  
 Issuing a `GET` against a feed of resources or querying a collection may result into potentially millions of items, thus making it impractical for both server to materialize them and clients to consume them as part of a single roundtrip/ request and response exchange. To address this, Azure Cosmos DB allows the clients to paginate over the large feed page-at-a-time. The clients can use the [x-ms-continuation] response header as a cursor to navigate to the next page.  
  
## Optimistic concurrency control  
 Most web applications rely on entity tag based optimistic concurrency control to avoid the infamous “Lost Update” and “Lost Delete” problems. The entity tag is a HTTP friendly, logical timestamp associated with a resource. Cosmos DB natively support the optimistic concurrency control by ensuring that every HTTP response contains the version (durably) associated with the specific resource. The concurrency control conflicts are correctly detected for the following cases:  
  
1.  If two clients simultaneously issue mutating requests (via PUT/ DELETE verbs) on a resource with the latest version of the resource (specified via the [if-match] request header), the Cosmos DB database engine subjects them to the transactional concurrency control.  
  
2.  If a client presents with an older version of the resource (specified via the [if-match] request header), its request is rejected.  
  
## Connectivity options  
 Cosmos DB exposes a logical addressing model wherein each resource has a logical and stable URI identified by its *_self* link. As a distributed storage system spread across regions, the resources under various database accounts in Cosmos DB are partitioned across numerous machines and each partition is replicated for high availability. The replicas managing the resources of a given partition register physical addresses. While the physical addresses change over the course of time due to failures, their logical addresses remain stable and constant. The logical to physical address translation is kept in a routing table which is also internally available as a resource. Cosmos DB exposes two connectivity modes:  
  
-   **Gateway Mode:** The clients are shielded from the translation between logical to physical addresses or the details of the routing; they simply deal with logical URIs and RESTfully navigate the resource model. The clients issue the requests using logical URI and the edge machines translate the logical URI to the physical address of the replica which manages the resource and forwards the request. With the edge machines caching (and periodically refreshing) the routing table, routing is extremely efficient.  
  
-   **Direct Connectivity Mode:** The clients directly manage the routing table in their process space and periodically refresh it. Client can directly connect with the replicas and bypass the edge machines.  
  
|||||  
|-|-|-|-|  
|Connectivity Mode|Protocol|Details|Azure Cosmos DB SDKs|  
|Gateway|HTTPS|Applications directly connect with the edge nodes using logical URIs. This incurs an extra network hop.|REST API, .NET, Node.js, Java, Python, JavaScript|  
|Direct Connectivity|HTTPS and TCP|The applications can directly access the routing table and perform the client side routing to directly connect with replicas.|.NET, Java|  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

