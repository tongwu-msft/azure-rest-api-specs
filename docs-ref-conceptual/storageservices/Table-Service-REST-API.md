---
title: Table Storage REST API - Azure Storage
description: Table Storage offers structured storage in the form of tables. The Table Storage API is a REST API for working with tables and the data that they contain.
author: pemari-msft
ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Table Storage REST API

Azure Table Storage offers structured storage in the form of tables. The Table Storage API is a REST API for working with tables and the data that they contain.  

> [!NOTE]
> This REST API documentation applies to both Azure Table Storage and the Table API of Azure Cosmos DB.
  
## REST API operations  

The REST API includes the operations listed in the following table.  
  
|Operation|Description|  
|---------------|-----------------|  
|[Set Table Storage Properties](Set-Table-Service-Properties.md)|Sets the properties.|  
|[Get Table Storage Properties](Get-Table-Service-Properties.md)|Gets the properties.|  
|[Preflight Table Request](Preflight-Table-Request.md)|Queries the cross-origin resource sharing (CORS) rules for Table Storage, prior to sending the actual request.|  
|[Get Table Storage Stats](Get-Table-Service-Stats.md)|Retrieves statistics related to replication for Table Storage. This operation is only available on the secondary location endpoint when read-access geo-redundant replication is enabled for the storage account.|  
|[Query Tables](Query-Tables.md)|Enumerates the tables in a storage account.|  
|[Create Table](Create-Table.md)|Creates a new table within a storage account.|  
|[Delete Table](Delete-Table.md)|Deletes a table from a storage account.|  
|[Get Table ACL](Get-Table-ACL.md)|Returns details about any stored access policies specified on the table that can be used with shared access signatures.|  
|[Set Table ACL](Set-Table-ACL.md)|Sets details about any stored access policies specified on the table that can be used with shared access signatures.|  
|[Query Entities](Query-Entities.md)|Queries data in a table.|  
|[Insert Entity](Insert-Entity.md)|Inserts a new entity into a table.|  
|[Insert Or Merge Entity](Insert-Or-Merge-Entity.md)|Inserts or merges an entity in a table.|  
|[Insert Or Replace Entity](Insert-Or-Replace-Entity.md)|Inserts or replaces an entity in a table.|  
|[Update Entity](Update-Entity2.md)|Updates an existing entity within a table by replacing it.|  
|[Merge Entity](Merge-Entity.md)|Updates an existing entity within a table by merging new property values into the entity.|  
|[Delete Entity](Delete-Entity1.md)|Deletes an entity within a table.|  
  
## Entity group transactions  

Table Storage supports batch operations for [Insert Entity](Insert-Entity.md), [Update Entity](Update-Entity2.md), [Merge Entity](Merge-Entity.md), and [Delete Entity](Delete-Entity1.md) operations. For more information about batch operations, see [Performing entity group transactions](Performing-Entity-Group-Transactions.md).  
  
## In this section  

[Summary of Table Storage functionality](Summary-of-Table-Service-Functionality.md)  
  
[Table Storage concepts](Table-Service-Concepts.md)  
  
[Operations on the account (Table Storage)](Operations-on-the-Account--Table-Service-.md)  
  
[Operations on tables](Operations-on-Tables.md)  
  
[Operations on entities](Operations-on-Entities.md)  
  
## See also  

[Storage services REST](Azure-Storage-Services-REST-API-Reference.md)