---
title: Setting timeouts for FileREST operations (FileREST API) - Azure Files
description: A call to a FileREST API can include a server timeout interval, specified in the `timeout` parameter of the request URI. If the server timeout interval elapses before the service has finished processing the request, the service returns an error. 
author: wmgries

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: wgries
---

# Setting timeouts for FileREST operations
A call to a File service API can include a server timeout interval, specified in the `timeout` parameter of the request URI. If the server timeout interval elapses before the service has finished processing the request, the service returns an error.  
  
For operations other than upload and download operations, the maximum timeout interval for File service operations is 30 seconds, and timeouts larger than 30 seconds are reduced to 30 seconds.

For upload and download operations, a transfer rate of 2 min/MiB and the size of the file are used to pre-calculate the timeout value before starting the upload or download operation.  

## Examples
The following example REST URI sets the timeout interval for the [List Shares](List-Shares.md) operation to 20 seconds:  
  
```
GET https://myaccount.file.core.windows.net?comp=list&timeout=20  
```  
  
## See also
[File Service Concepts](File-Service-Concepts.md)