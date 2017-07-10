---
title: "Setting Timeouts for File Service Operations"
ms.custom: na
ms.date: 2017-04-27
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: 2ea86972-4df0-4b87-97fd-3c88910c15e0
caps.latest.revision: 5
author: robinsh
manager: timlt
translation.priority.mt: 
  - de-de
  - es-es
  - fr-fr
  - it-it
  - ja-jp
  - ko-kr
  - pt-br
  - ru-ru
  - zh-cn
  - zh-tw
---
# Setting Timeouts for File Service Operations
A call to a File service API can include a server timeout interval, specified in the `timeout` parameter of the request URI. If the server timeout interval elapses before the service has finished processing the request, the service returns an error.  
  
For operations other than upload and download operations, the maximum timeout interval for File service operations is 30 seconds, and timeouts larger than 30 seconds are reduced to 30 seconds. 

For upload and download operations, a transfer rate of 2min/MB and the size of the file are used to pre-calculate the timeout value before starting the upload or download operation.  

## Examples  
The following example REST URI sets the timeout interval for the [List Shares](List-Shares.md) operation to 20 seconds:  
  
```  
GET https://myaccount.file.core.windows.net?comp=list&timeout=20  
```  
  
## See Also  
[File Service Concepts](File-Service-Concepts.md)