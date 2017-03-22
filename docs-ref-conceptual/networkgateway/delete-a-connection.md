---
title: Delete a connection
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
author: yushwang
ms.author: yushwang
manager: rossort
---
# Delete a connection&#160;
Delete the specified gateway connection.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroup/{resource-group-name}/providers/microsoft.network/connections/{connection-name}?api-version={api-version}`|  
  
## Response  
 Status code: 200 (OK) if the connection can be deleted. 404 (Not Found) if the connection doesn’t exist.
