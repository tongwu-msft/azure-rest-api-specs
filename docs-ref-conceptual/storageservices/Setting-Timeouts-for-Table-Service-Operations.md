---
title: Setting timeouts for Table service operations (REST API) - Azure Storage
description: Setting timeouts for Table service operations.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Setting timeouts for Table service operations

A call to a Table service API can include a server timeout interval, specified in the `timeout` parameter of the request URI. If the server timeout interval elapses before the service has finished processing the request, the service returns an error.  
  
 The maximum timeout interval for Table service operations is 30 seconds. The Table service automatically reduces any timeouts larger than 30 seconds to the 30-second maximum.  
  
 The Table service enforces server timeouts as follows:  
  
-   **Query operations:** During the timeout interval, a query may execute for up to a maximum of five seconds. If the query does not complete within the five-second interval, the response includes continuation tokens for retrieving remaining items on a subsequent request. See [Query Timeout and Pagination](Query-Timeout-and-Pagination.md) for more information.  
  
-   **Insert, update, and delete operations:** The maximum timeout interval is 30 seconds. Thirty seconds is also the default interval for all insert, update, and delete operations.  
  
 If you specify a timeout interval that is greater than 30 seconds, the Table service uses 30 seconds. If you specify a timeout that is less than the service's default timeout, your timeout interval will be used.  
  
## See Also  
 [Table Service Concepts](Table-Service-Concepts.md)
