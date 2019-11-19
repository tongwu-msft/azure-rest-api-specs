---
title: Setting the Prefer header to manage response echo on insert operations (REST API) - Azure Storage
description: Setting the Prefer header to manage response echo on insert operations.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Setting the Prefer header to manage response echo on insert operations

By default, the [Create Table](Create-Table.md) and [Insert Entity](Insert-Entity.md) operations return a response payload that echoes the data contained in the request body. For version 2013-08-15 and higher of the storage services and OData data service version 3.0, it is possible to omit the response body echo by setting the `Prefer` header to `return-no-content`. If the `Prefer` header is set to `return-no-content`, the service will respond with status code 204 (`No Content`) and response header `Preference-Applied:``return-no-content`.  
  
 You can also set the `Prefer` header to `return-content`, which provides the default behavior of returning the response payload. In this case, the service will respond with status code 201 (`Created`) and response header `Preference-Applied:``return-content`.  
  
 If no `Prefer` header is specified, the service responds with status code 201 (`Created`) without the `Preference-Applied` header in the response.  
  
 For more details, see the documentation for the [OData Prefer header](https://msdn.microsoft.com/library/hh537533.aspx).  
  
## See Also  
 [Setting the OData Data Service Version Headers](Setting-the-OData-Data-Service-Version-Headers.md)   
 [Table Service Concepts](Table-Service-Concepts.md)
