---
title: Summary of Table Storage functionality (REST API) - Azure Storage
description: The Table Storage REST API is compliant with the OData protocol specification, with some differences.
author: pemari-msft
ms.date: 08/15/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Summary of Table Storage functionality

The Azure Table Storage REST API is compliant with the [OData protocol specification](https://www.odata.org/), with some differences, as described in the following sections.  
  
##  <a name="TableServiceExtensions"></a> Table Storage extensions  

Table Storage extends the functionality of `OData` in the following ways.  
  
### Shared Key, Shared Key Lite, and Azure Active Directory authorization  

Table Storage requires that each request be authorized. Shared Key, Shared Key Lite, and Azure Active Directory (Azure AD) authorization are supported. Azure AD authorization is more secure, and it's recommended for requests made against Table Storage by using the REST API.  
  
For more information about authorizing requests, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).  
  
### Continuation tokens for query pagination  

A query against Table Storage can return a maximum of 1,000 items at one time, and can run for a maximum of five seconds. If the result set contains more than 1,000 items, or if the query didn't finish within five seconds, the response includes headers. These headers provide the developer with continuation tokens to use, in order to resume the query at the next item in the result set. Continuation token headers can be returned for a [Query Tables](Query-Tables.md) operation or a [Query Entities](Query-Entities.md) operation.  
  
Note that the total time allotted to the request for scheduling and processing the query is 30 seconds, including the five seconds for query execution.  
  
For more information about continuation tokens, see [Query timeout and pagination](Query-Timeout-and-Pagination.md).  
  
### Primary key system properties  

Every entity in Table Storage has two key properties: the `PartitionKey` property and the `RowKey` property. These properties form the table's primary key, and uniquely identify each entity in the table.  
  
Both properties require string values. It's the developer's responsibility to provide values for these properties when a new entity is inserted, and to include them in any update or delete operation on an entity.  
  
For more information about these required key properties, see [Understanding the Table Storage data model](Understanding-the-Table-Service-Data-Model.md).  
  
### Timestamp system property  

Every entity in Table Storage has a `Timestamp` system property. The `Timestamp` property is a `DateTime` value, maintained on the server side, to record the time an entity was last modified. Table Storage uses the `Timestamp` property internally to provide optimistic concurrency. The value of `Timestamp` is a monotonically increasing value, meaning that each time the entity is modified, the value of `Timestamp` increases for that entity. This property should not be set on insert or update operations (the value will be ignored).  
  
For more information about the `Timestamp` property, see [Understanding the Table Storage data model](Understanding-the-Table-Service-Data-Model.md).  
  
### Batch operations  

Table Storage supports batch transactions on entities that are in the same table and belong to the same partition group, which means they have the same `PartitionKey` value. This allows multiple insert, update, merge, and delete operations to be supported within a single atomic transaction. Table Storage supports a subset of the functionality provided by the [OData protocol](https://www.odata.org/).  
  
For more information about batch operations, see [Performing entity group transactions](Performing-Entity-Group-Transactions.md).  
  
##  <a name="TableServiceRestrictions"></a> Table Storage restrictions  

Table Storage has the following restrictions on functionality provided by `OData`.  
  
### Credentials property  

Table Storage doesn't support using the [Credentials](https://go.microsoft.com/fwlink/?LinkId=154550) property of the [DataServiceContext](https://go.microsoft.com/fwlink/?linkid=151839) class to authorize a request. Instead, you must authorize a request against Table Storage by adding an `Authorization` header to the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).  
  
### Property types  

Not all property types supported by `OData` are supported. For a list of supported property types, see [Understanding the Table Storage data model](Understanding-the-Table-Service-Data-Model.md).  
  
### Operations on links  

Table Storage doesn't currently support links between tables. Links are associative relationships between data.  
  
### Operations on select properties  

*Projection* refers to querying a subset of the properties for an entity or entities. It's analogous to selecting a subset of the columns or properties of a table when you're querying in language-integrated queries (LINQ).

Projection reduces the amount of data that must be returned by a query by specifying that only certain properties are returned in the response. Projection is supported as part of the 2011-08-18 version of Azure Storage. For more information, see [Query Entities](Query-Entities.md), [Writing LINQ queries against Table Storage](Writing-LINQ-Queries-Against-the-Table-Service.md), and [OData: Select System Query Option ($select)](https://www.odata.org/).  
  
### LINQ query operators  
 
Table Storage supports the following LINQ query operators:  
  
- `From`  
  
- `Where`  
  
- `Take`  
  
 For more information, see [Query operators supported for Table Storage](Query-Operators-Supported-for-the-Table-Service.md).  
  
### LINQ comparison operators  

You can use a subset of the comparison operators provided by LINQ. For more information, see [Querying tables and entities](Querying-Tables-and-Entities.md) and [Writing LINQ queries against Table Storage](Writing-LINQ-Queries-Against-the-Table-Service.md).  
  
### GetMetadataURI method  

You can use the [GetMetadataURI](https://msdn.microsoft.com/library/system.data.services.client.dataservicecontext.getmetadatauri.aspx) method of the [DataServiceContext](https://msdn.microsoft.com/library/system.data.services.client.dataservicecontext.aspx) class, but it doesn't return any schema information beyond the three fixed schema properties. These properties are `PartitionKey`, `RowKey`, and `Timestamp`.  
  
### Payload formats  

`OData` supports sending payloads in JSON format. Table Storage supports the `OData` JSON format as of API version 2013-08-15, with the `OData` data service version set to 3.0. Prior versions don't support the JSON format.  
  
Atom payloads are supported in all versions prior to 2015-12-11. Version 2015-12-11 and later support only JSON payloads.  
  
> [!NOTE]
> JSON is the recommended payload format, and it's the only format supported for version 2015-12-11 and later.  
  
For more information, see [Payload format for Table Storage operations](Payload-Format-for-Table-Service-Operations.md) and [Setting the OData data service version headers](Setting-the-OData-Data-Service-Version-Headers.md).  
  
## See also  

[Table Storage REST API](Table-Service-REST-API.md)
