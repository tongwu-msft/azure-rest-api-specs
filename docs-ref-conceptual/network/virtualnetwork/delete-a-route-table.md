---
title: Delete a route table
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# Delete a route table

This operations deletes a route table.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|DELETE|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/routeTables/{routeTableName}?api-version={api-version}`|  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the route table exists. |
| resourceGroup | The name of the resource group that contains the route table. |
| routeTableName | The name of the route table. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 **Status code:**  
  
 Returns status code 200 (OK), if the operation to delete was accepted.  
  
 Returns status code 202 synchronously, if the route table was not found  
  
 Returns status code 202 asynchronously, if the route table was deleted.  
  
 Returns 404 if resource not found
