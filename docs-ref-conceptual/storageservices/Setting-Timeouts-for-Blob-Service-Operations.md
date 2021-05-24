---
title: Setting timeouts for Blob service operations (REST API) - Azure Storage
description: A call to a Blob service API can include a server timeout interval, specified in the `timeout` parameter of the request URI. If the server timeout interval elapses before the service has finished processing the request, the service returns an error.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Setting timeouts for Blob service operations

A call to a Blob service API can include a server timeout interval, specified in the `timeout` parameter of the request URI. If the server timeout interval elapses before the service has finished processing the request, the service returns an error.  
  
 The maximum timeout interval for Blob service operations is 30 seconds, with some exceptions noted below. Apart from these exceptions, the Blob service automatically reduces any timeouts larger than 30 seconds to the 30-second maximum.  
  
## Example  
 The following example REST URI sets the timeout interval for the [List Containers](List-Containers2.md) operation to 20 seconds:  
  
```  
GET https://myaccount.blob.core.windows.net?comp=list&timeout=20  
```  
  
## Exceptions to Default Timeout Interval  
 The following operations implement exceptions to the standard 30 second timeout interval:  
  
-   Calls to get a blob, get page ranges, or get a block list are permitted 2 minutes per megabyte to complete. If an operation is taking longer than 2 minutes per megabyte on average, it will time out.  
  
-   Calls to write a blob, write a block, or write a page are permitted 10 minutes per megabyte to complete. If an operation is taking longer than 10 minutes per megabyte on average, it will time out.  
  
-   The maximum timeout to write a block list is 60 seconds.  
  
-   A container that was recently deleted cannot be recreated until all of its blobs are deleted. Depending on how much data was stored within the container, complete deletion can take seconds or minutes. If you try to create a container of the same name during this cleanup period, your call returns an error immediately.  

-   A Blob Batch request supports a maximum timeout value of 120 seconds. If the operation takes more than the timeout value, any remaining subrequests will fail with a timeout error.
  
## See Also  
 [Blob Service Concepts](Blob-Service-Concepts.md)
