---
title: Check Dns name availability
ms.date: 03/15/2017
ms.service: virtual-network
ms.topic: reference
ms.devlang: rest
author: georgewallace
ms.author: gwallace
ms.manager: timlt
---
# Check Dns name availability

This operation checks the availability of a DNS name in a region.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).
## Request  

|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/providers/Microsoft.Network/locations/{location}/CheckDnsNameAvailability?domainNameLabel={domainNameLabel}&api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the DNS name will exist. |
| location | Region to check the DNS name availability |
| domainNameLabel | The relative DNS name to check in the region. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

## Response  
 **Status code:** Returns status code 200 (OK), if the operation was successful.  
  
```json
{  
   "Available": "true|false"  
}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|Available|Indicates whether or not the Dns name is available within the specified region.|
