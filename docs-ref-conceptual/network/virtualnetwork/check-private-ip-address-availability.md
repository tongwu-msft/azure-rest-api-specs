---
title: Check private IP address availability in a virtual network
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: anavinahar 
ms.author: annahar 
ms.manager: narayan
---
# Check private IP address availability in a virtual network

This operation checks if a private IP is available in a virtual network.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|GET|`subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Network/virtualnetworks/{virtualNetworkName}/CheckIPAddressAvailability?address={address}&api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the virtual network exists. |
| resourceGroup | The name of the resource group that contains the virtual network. |
| virtualNetworkName | The name of the virtual network to check the IP address availability. |
| address | The private IP address to check. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 **Status code:** 200.  
  
```json 
{ 
   "isAvailable": "False",
   "availableAddresses": [“10.0.0.4”, “10.0.0.5”, “10.0.0.6”, “10.0.0.7”, “10.0.0.8”]
}
```  
  
|Element name|Description|  
|------------------|-----------------|  
|isAvailable|Indicates whether or not the private IP address is available within the specified virtual network.|
|availableAddresses|Shows the list of available private IP addresses within the specified virtual network.|
