---
title: "RESTful interactions with DocumentDB resources"
ms.custom: ""
ms.date: "2016-08-30"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ecf0afe1-ff09-43f7-be77-53e1a3b83ca8
caps.latest.revision: 19
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
# RESTful interactions with DocumentDB resources
DocumentDB supports the use of HTTP methods to create, read, replace, get, and delete DocumentDB resources using the REST API.  
  
 By reading this article, you'll be able to answer the following questions: 
  
-   How do the standard HTTP methods work with DocumentDB resources?  
  
-   How do I create a new resource using POST?  
  
-   How do I register a stored procedure using POST?  
  
-   How does DocumentDB support concurrency control?  
  
-   What are the connectivity options for HTTPS and TCP?  
  
 If you are looking for information on how to perform CRUD operations on specific resources using REST, see [Common tasks using the DocumentDB REST API](common-tasks-using-the-documentdb-rest-api.md). If you are looking for samples on how to perform CRUD operations using C# and REST, see the [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net) on GitHub.  
  
> [!NOTE]  
>  You can also perform CRUD operations on DocumentDB resources using the DocumentDB SDKs. For samples,  see [DocumentDB examples](https://azure.microsoft.com/documentation/articles/documentdb-dotnet-samples/). For links to the SDK downloads and documentation, see [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/).  
  
## Overview of HTTP verbs  
 IDocumentDB resources support the following HTTP verbs with their standard interpretation:  
  
1.  POST means create a new item resource.  
  
2.  GET means read an existing item or a feed resource  
  
3.  PUT means replace an existing item resource  
  
4.  DELETE means delete an existing  item resource  
  
5.  HEAD means GET sans the response payload (i.e. just the headers)  
  
> [!NOTE]  
>  In the future, we intend to add support for selective updates via PATCH.  
  
 As illustrated in the following HTTP verbs diagram, POST can only be issued against a feed resource; PUT and DELETE can only be issued against an item resource; GET and HEAD can be issued against either feed or item resources.  
  
 ![interactions-with-resources2](media/interactions-with-resources2.png "interactions-with-resources2")  
  
 **Interaction model using the standard HTTP methods**  
  
## Create a new resource using POST HTTP method  
 To get a better feel for the interaction model, let’s consider the case of creating a new resource (aka INSERT). In order to create a new resource you are required to issue an HTTP POST request with the request body containing the representation of the resource against the URI of the container feed the resource belongs to. The only required property for the request is the id of the resource.  
  
 As an example, in order to create a new database, you POST a database resource (by setting the id property with a unique name) against /dbs. Similarly, in order to create a new collection, you POST a collection resource against */dbs/_rid/colls/* and so on. The response contains the fully committed resource with the system generated properties including the *_self* link of the resource using which you can navigate to other resources. As an example of the simple HTTP based interaction model, a client can issue an HTTP request to create a new database within an account.  
  
```  
POST https://fabrikam.documents.azure.com/dbs  
    {  
          "id":"MyDb"As an example, in order to create a new database, you POST a database resource (by setting the id property with a unique name) against /dbs. Similarly, in order to create a new collection, you POST a collection resource against /dbs/_rid/colls/ and so on. The response contains the fully committed resource with the system generated properties including the _self link of the resource using which you can navigate to other resources. As an example of the simple HTTP based interaction model, a client can issue an HTTP request to create a new database within an account.  
    }  
```  
  
 The DocumentDB service responds with a successful response and a status code indicating successful creation of the database.  
  
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
  
 The stored procedure can be registered to a collection under MyDb by issuing a POST against */dbs/_rid-db/colls/_rid-coll/sprocs*.  
  
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
  
 The DocumentDB service responds with a successful response and a status code indicating successful registration of the stored procedure.  
  
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
 Finally, to execute the stored procedure in the above example, one needs to issue a POST against the URI of the stored procedure resource (/dbs/UoEi5w==/colls/UoEi5w+upwA=/sprocs/UoEi5w+upwABAAAAAAAAgA==/) as illustrated below.  
  
```  
POST https://fabrikam.documents.azure.com/dbs/UoEi5w==/colls/UoEi5w+upwA=/sprocs/UoEi5w+upwABAAAAAAAAgA== HTTP/1.1  
```  
  
 The DocumentDB service responds with the following response.  
  
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
    ...  
    {"_rid":"UoEi5w+upwA=","Documents":[{"Name":"Andersen","City":"Seattle"},{"Name":"Wakefield","City":"NY"}],"_count":2}  
```  
  
## Using PUT, GET, and DELETE HTTP verbs  
 Replacing or reading a resource amounts to issuing PUT (with a valid request body) and GET verbs against the *_self* link of the resource respectively. Likewise, deleting a resource amounts to issuing a DELETE verb against the *_self* link of the resource. It is worth pointing out that the hierarchical organization of resources in the DocumentDB’s resource model necessitates the support for cascaded deletes wherein deleting the owner resource causes deletion of the dependent resources. The dependent resources may be distributed across other nodes than the owner resources and so the deletion could happen lazily. Regardless of mechanics of the garbage collection, upon deletion of a resource, the quota is instantly freed up and is available for you to use. Note that the referential integrity is preserved by the system. For instance, you cannot insert a collection to a database which is deleted or replace or query a document of a collection which no longer exists.  
  
 Issuing a GET against a feed of resources or querying a collection may result into potentially millions of items, thus making it impractical for both server to materialize them and clients to consume them as part of a single roundtrip/ request and response exchange. To address this, DocumentDB allows the clients to paginate over the large feed page-at-a-time. The clients can use the [x-ms-continuation] response header as a cursor to navigate to the next page.  
  
## Optimistic concurrency control  
 Most web applications rely on entity tag based optimistic concurrency control to avoid the infamous “Lost Update” and “Lost Delete” problems. The entity tag is a HTTP friendly, logical timestamp associated with a resource. DocumentDB natively support the optimistic concurrency control by ensuring that every HTTP response contains the version (durably) associated with the specific resource. The concurrency control conflicts are correctly detected for the following cases:  
  
1.  If two clients simultaneously issue mutating requests (via PUT/ DELETE verbs) on a resource with the latest version of the resource (specified via the [if-match] request header), the DocumentDB database engine subjects them to the transactional concurrency control.  
  
2.  If a client presents with an older version of the resource (specified via the [if-match] request header), its request is rejected.  
  
## Connectivity options  
 DocumentDB exposes a logical addressing model wherein each resource has a logical and stable URI identified by its *_self* link. As a distributed storage system spread across regions, the resources under various database accounts in DocumentDB are partitioned across numerous machines and each partition is replicated for high availability. The replicas managing the resources of a given partition register physical addresses. While the physical addresses change over the course of time due to failures, their logical addresses remain stable and constant. The logical to physical address translation is kept in a routing table which is also internally available as a resource. DocumentDB exposes two connectivity modes:  
  
-   **Gateway Mode:** The clients are shielded from the translation between logical to physical addresses or the details of the routing; they simply deal with logical URIs and RESTfully navigate the resource model. The clients issue the requests using logical URI and the edge machines translate the logical URI to the physical address of the replica which manages the resource and forwards the request. With the edge machines caching (and periodically refreshing) the routing table, routing is extremely efficient.  
  
-   **Direct Connectivity Mode:** The clients directly manage the routing table in their process space and periodically refresh it. Client can directly connect with the replicas and bypass the edge machines.  
  
|||||  
|-|-|-|-|  
|Connectivity Mode|Protocol|Details|DocumentDB SDKs|  
|Gateway|HTTPS|Applications directly connect with the edge nodes using logical URIs. This incurs an extra network hop.|REST API, .NET, Node.js, Java, Python, JavaScript|  
|Direct Connectivity|HTTPS and TCP|The applications can directly access the routing table and perform the client side routing to directly connect with replicas.|.NET|  
  
## See also  
 [Azure DocumentDB REST API Reference](azure-documentdb-rest-api-reference.md)  
  
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)  
  
 [Query DocumentDB](https://azure.microsoft.com/documentation/articles/documentdb-sql-query/)  
  
 [DocumentDB SQL Query Language](../Topic/DocumentDB%20SQL%20Syntax.md)  
  
 [DocumentDB Programming: Stored procedures, triggers, and UDFs](https://azure.microsoft.com/documentation/articles/documentdb-programming/)  
  
 [REST](http://en.wikipedia.org/wiki/Representational_state_transfer)  
  
 [JSON specification](http://www.ietf.org/rfc/rfc4627.txt)  
  
 [HTTP specification](http://www.w3.org/Protocols/rfc2616/rfc2616.html)  
  
 [Entity Tags](http://en.wikipedia.org/wiki/HTTP_ETag)  
  
  