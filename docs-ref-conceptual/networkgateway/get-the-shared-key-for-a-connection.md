---
title: Get the shared key for a connection
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: yushwang
ms.author: yushwang
manager: rossort
---
# Get the shared key for a connection&#160;
Gets the shared key for the connection.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resource-group-name}/providers/microsoft.network/connections/{connection-name}/sharedkey?api-version={api-version}`|  
  
## Response  
 Status code: 200 (OK) if the connection exists; otherwise, 404 (Not Found).  
  
```json 
{  
  "value": {shared-key-value}  
}  
```  
  
 The value element contains the shared key of the connection.
