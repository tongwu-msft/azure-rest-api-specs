---
title: "Check private IP address availability in a virtual network"
ms.custom: ""
ms.date: "2017-02-15"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 3a8cae97-3bed-430d-91b3-274696d91e34
caps.latest.revision: 11
author: "anavinahar"
ms.author: "annahar"
manager: "narayan"
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
# Check private IP address availability in a virtual network
## Request  
 See [Common parameters and headers](virtual-networks.md#bk_common) for headers and parameters that are used by all requests related to Virtual Networks.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/virtualnetworks/{virtual-network-name}/CheckIPAddressAvailability?address={private-IP-address-to-check}&api-version={api-version}`|  
  
Replace {resource-group-name} and {virtual-network-name} with the name of the Resource Group within which the Virtual Network you want to check exists. 

Repalce {private-IP-address-to-check} with the private IP address you want to check.


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