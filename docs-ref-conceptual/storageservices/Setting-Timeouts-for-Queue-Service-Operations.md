---
title: Setting timeouts for Queue service operations (REST API) - Azure Storage
description: Setting timeouts for Queue service operations.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Setting timeouts for Queue service operations

A call to a Queue service API can include a server timeout interval, specified in the `timeout` parameter of the request URI. If the server timeout interval elapses before the service has finished processing the request, the service returns an error.  
  
 The maximum timeout interval for Queue service operations is 30 seconds. The Queue service automatically reduces any timeouts larger than 30 seconds to the 30-second maximum.  
  
 The following example REST URI sets the timeout interval for the [List Queues](List-Queues1.md) operation to 20 seconds:  
  
```  
GET https://myaccount.queue.core.windows.net?comp=list&timeout=20  
```  
  
## See Also  
 [Queue Service Concepts](Queue-Service-Concepts.md)
