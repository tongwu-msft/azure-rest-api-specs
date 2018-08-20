---
title: "Asynchronous REST operations (Azure HDInsight)"
ms.date: 2016-11-16
ms.service: hdinsight
ms.topic: reference
ms.assetid: bdde467e-e09d-4ba4-813f-b5c274e50223
author: jasonwhowell
ms.author: jasonh
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
# Asynchronous Operations (Azure HDInsight)
Operations that complete asynchronously return HTTP 202 (Accepted) with a Location header and an optional Retry-After header. The time mentioned in the Retry-After header is in seconds with a minimum of 10 seconds and maximum of 10 minutes.  
  
 URI for the location header will be as follows:  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|URL from the Location header|  
  
 If the operation is not complete, the response will be a HTTP 202 (Accepted) with the same location header.  
  
 If the operation completed successfully, the response will be the 200 (for anything that is not a DELETE) or 204 (for DELETE)  
  
 If the operation failed, the response will be formatted as per the [Error Response Content](#ErrorResponseContent).  
  
##  <a name="ErrorResponseContent"></a> Error Response Content  
 **Response Body**  
  
```  
{  
    "error": {  
        "code": "BadArgument",  
        "message": "User name has invalid characters"  
    }  
}  
  
```