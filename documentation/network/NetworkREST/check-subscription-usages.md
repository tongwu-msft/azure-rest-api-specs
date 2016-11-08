---
title: "Check subscription usages"
ms.custom: ""
ms.date: "2015-11-04"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 0e7beab4-2fcb-47f4-9437-e83ae9c1b3ae
caps.latest.revision: 9
author: "georgewallace"
ms.author: "gwallace"
manager: "carmonm"
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
# Check subscription usages
## Request  
 See [Common parameters and headers](../NetworkREST/supporting-tasks.md#bk_common) for headers and parameters that are used by all requests related to supporting tasks.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Network/locations/{location}/usages?api-version={api-version}`|  
  
 Replace {location} with the name of the region for which you wish to view your usage of network resources.  
  
## Response  
 **Status code:** Returns status code 200 (OK), if the operation was successful.  
  
```  
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