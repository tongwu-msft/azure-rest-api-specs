---
title: Query operators supported for the Table service (REST API) - Azure Storage
description: Query operators supported for the Table service.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Query operators supported for the Table service

The Microsoft® .NET Client Library supports data service queries by using [language-integrated queries (LINQ)](https://go.microsoft.com/fwlink/?LinkId=137420). The client library handles the details of mapping the LINQ statement to the appropriate URI for the Table service and of retrieving the specified resources as .NET objects.  
  
## LINQ Query Operators  
 The following tables note which LINQ query operators are supported for use with the Table service. For more information about LINQ query operators, see [LINQ: .NET Language-Integrated Query](https://go.microsoft.com/fwlink/?LinkId=137420).  
  
### Supported Query Operators  
  
|LINQ operator|Table service support|Additional information|  
|-------------------|---------------------------|----------------------------|  
|`From`|Supported as defined.||  
|`Where`|Supported as defined.||  
|`Take`|Supported, with some restrictions.|The value specified for the `Take` operator must be less than or equal to 1,000. If it is greater than 1,000, the service returns status code 400 (Bad Request).<br /><br /> If the `Take` operator is not specified, a maximum of 1,000 entries will be returned.|  
|`First, FirstOrDefault`|Supported.||  
|`Select`|Supported for version 2011-08-18 and newer.|Projection is supported. For more information, see [Writing LINQ Queries Against the Table Service](Writing-LINQ-Queries-Against-the-Table-Service.md).|  
  
### Unsupported Query Operators  
  
|LINQ operator|Table service support|Additional information|  
|-------------------|---------------------------|----------------------------|  
|`GroupBy`|Not Supported.||  
|`OrderBy, OrderByDescending`|Not Supported.||  
|`ThenBy, ThenByDescending`|Not Supported.||  
|`Average`|Not Supported.||  
|`Min`|Not Supported.||  
|`Max`|Not Supported.||  
|`Last, LastOrDefault`|Not Supported.||  
|`Skip`<br /><br /> `Count, LongCount`|Not Supported.||  
|`Sum`|Not Supported.||  
|`TakeWhile`|Not Supported.||  
|`SkipWhile`|Not Supported.||  
|`Join, GroupJoin`|Not Supported.||  
|`Single`|Not Supported.||  
|`OfType`|Not Supported.||  
|`SelectMany`|Not Supported.||  
|`Concat`|Not Supported.||  
|`ElementAt, ElemenatAtOrDefault`|Not Supported.||  
|`Distinct`|Not Supported.||  
|`Except`|Not Supported.||  
|`Intersect`|Not Supported.||  
|`Union`|Not Supported.||  
|`All`|Not Supported.||  
|`Any`|Not Supported.||  
|`Contains`|Not Supported.||  
|`SequenceEqual`|Not Supported.||  
|`Empty, Range, Repeat`|Not Supported.||  
|`SingleOrDefault`|Not Supported.||  
|`Reverse`|Not Supported.||  
  
## See Also  
 [Table Service Concepts](Table-Service-Concepts.md)
