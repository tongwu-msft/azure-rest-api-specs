---
title: Check subscription usages
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# Check subscription usages

This operation returns the usage of network resources in a region.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/providers/Microsoft.Network/locations/{location}/usages?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the network resources exist. |
| location | Region to get network resource usage for. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 **Status code:** Returns status code 200 (OK), if the operation was successful.  
  
```json  
{  
   "value": [  
      {  
         "unit": "Count",  
         "currentValue": 3,  
         "limit": 50,  
         "name": {  
            "value": "PublicIPAddresses",  
            "localizedValue": "PublicIPAddresses"  
         }  
      },  
      {  
         "unit": "Count",  
         "currentValue": 3,  
         "limit": 50,  
         "name": {  
            "value": "VirtualNetworks",  
            "localizedValue": "VirtualNetworks"  
         }  
      },  
      …  
   ]  
}  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|value|A collection of objects showing the limits and current usage of  network resources.|  
|unit|The type of usage.|  
|currentValue|The current number of resources of this type.|  
|limit|The current limit for resources of this type.|  
|name.value|The name of the network resource.|  
|name.localizedValue|The localized name of the network resource.|
