---
title: "Stored Procedures"
ms.custom: ""
ms.date: "2016-02-12"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmosdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 19dcbe34-9bbd-424e-8a80-4da3ddbc2245
caps.latest.revision: 6
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
# Stored Procedures
Azure Cosmos DB is a globally distributed multi-model database with support for multiple APIs. This article covers the Azure Cosmos DB API for Azure Cosmos DB. 

A stored procedure is a piece of application logic written in JavaScript that is registered and executed against a collection as a single transaction. In Azure Cosmos DB, JavaScript is hosted in the same memory space as the database. Hence, requests made within stored procedures execute in the same scope of a database session. This enables Azure Cosmos DB to guarantee ACID for all operations that are part of a single stored procedure.  
  
The stored procedure resource is represented by sprocs in the [Azure Cosmos DB resource model](http://azure.microsoft.com/documentation/articles/documentdb-resources/).  
  
The stored procedure resource has a fixed schema. The body property contains the application logic. The following example illustrates the JSON construct of a stored procedure.  
  
```  
{    
   "id":"SimpleStoredProc",  
   "body":"function (docToCreate, addedPropertyName, addedPropertyValue {getContext().getResponse().setBody('Hello World');}",  
   "_rid":"hLEEAI1YjgcBAAAAAAAAgA==",  
   "_ts":1408058682,  
   "_self":"dbs\/hLEEAA==\/colls\/hLEEAI1Yjgc=\/sprocs\/hLEEAI1YjgcBAAAAAAAAgA==\/",  
   "_etag":"00004100-0000-0000-0000-53ed453a0000"  
}  
  
```  
  
 Merely having **All access mode** for a particular stored procedure does not allow the user to execute the stored procedure. Instead, the user has to have **All access mode** at the collection level in order to execute a stored procedure.  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|Required. This is a user settable property. It is the unique name used to identify the stored procedure. The **id** must not exceed 255 characters.|  
|**body**|Required. This is a user settable property. This is the body of the stored procedure.|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the stored procedure resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
  
Stored procedures can use the Cosmos DB JavaScript Server-side SDK to make database operations like create, read, update, delete and query documents, as well as read from the request body and write to the response body of the stored procedure. For more details, refer to the [Cosmos DB server-side SDK documentation](http://dl.windowsazure.com/documentDB/jsserverdocs/) and the server [Cosmos DB side programming tutorial](http://azure.microsoft.com/documentation/articles/documentdb-programming/).  
For example, here’s a stored procedure for “Hello World”:  
  
```  
var helloWorldStoredProc = {  
    id: "helloWorld",  
    body: function () {  
        var context = getContext();  
        var response = context.getResponse();  
  
        response.setBody("Hello, World");  
    }  
}  
  
```  
  
 The following example creates a document inside the stored procedure:  
  
```  
{  
    id: "createMyDocument",  
    body: function createMyDocument(documentToCreate) {  
        var context = getContext();  
        var collection = context.getCollection();  
  
        var accepted = collection.createDocument(collection.getSelfLink(),  
              documentToCreate,  
            function (err, documentCreated) {  
                if (err) throw new Error('Error' + err.message);  
                context.getResponse().setBody(documentCreated.id)  
            });  
        if (!accepted) return;  
    }  
}  
  
```  
  
The following example swaps two items inside a stored procedure:  
  
```  
// JavaScript source code  
var exchangeItemsSproc = {  
    name: "exchangeItems",  
    body: function (playerId1, playerId2) {  
        var context = getContext();  
        var collection = context.getCollection();  
        var response = context.getResponse();  
  
        var player1Document, player2Document;  
  
        // query for players  
        var filterQuery = 'SELECT * FROM Players p where p.id  = "' + playerId1 + '"';  
        var accept = collection.queryDocuments(collection.getSelfLink(), filterQuery, {},  
            function (err, documents, responseOptions) {  
                if (err) throw new Error("Error" + err.message);  
  
                if (documents.length != 1) throw "Unable to find both names";  
                player1Document = documents[0];  
  
                var filterQuery2 = 'SELECT * FROM Players p where p.id = "' + playerId2 + '"';  
                var accept2 = collection.queryDocuments(collection.getSelfLink(), filterQuery2, {},  
                    function (err2, documents2, responseOptions2) {  
                        if (err2) throw new Error("Error" + err2.message);  
                        if (documents2.length != 1) throw "Unable to find both names";  
                        player2Document = documents2[0];  
                        swapItems(player1Document, player2Document);  
                        return;  
                    });  
                if (!accept2) throw "Unable to read player details, abort ";  
            });  
  
        if (!accept) throw "Unable to read player details, abort ";  
  
        // swap the two players’ items  
        function swapItems(player1, player2) {  
            var player1ItemSave = player1.item;  
            player1.item = player2.item;  
            player2.item = player1ItemSave;  
  
            var accept = collection.replaceDocument(player1._self, player1,  
                function (err, docReplaced) {  
                    if (err) throw "Unable to update player 1, abort ";  
  
                    var accept2 = collection.replaceDocument(player2._self, player2,  
                        function (err2, docReplaced2) {  
                            if (err) throw "Unable to update player 2, abort"  
                        });  
  
                    if (!accept2) throw "Unable to update player 2, abort";  
                });  
  
            if (!accept) throw "Unable to update player 1, abort";  
        }  
    }  
}  
  
```  
  
## Tasks  
You can do the following with stored procedures:  
  
-   [Create a Stored Procedure](create-a-stored-procedure.md)  
  
-   [Replace a Stored Procedure](replace-a-stored-procedure.md)  
  
-   [List Stored Procedures](list-stored-procedures.md)  
  
-   [Delete a Stored Procedure](delete-a-stored-procedure.md)  
  
-   [Execute a Stored Procedure](execute-a-stored-procedure.md)  
  
 For information on how stored procedures work, including execution of a stored procedure, see [Azure Cosmos DB programming: Stored procedures, triggers, and UDFs](http://azure.microsoft.com/en-us/documentation/articles/documentdb-programming/).  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB: Azure Cosmos DB API](https://docs.microsoft.com/azure/documentdb/documentdb-introduction)   
* [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
* [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net) 
  
  
