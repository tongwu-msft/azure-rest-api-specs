---
title: "Check Dns name availability"
ms.custom: ""
ms.date: "2015-11-04"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-network"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 40e247bc-80dc-4957-b53e-03c4342aae7e
caps.latest.revision: 11
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
# Check Dns name availability
## Request  
 See [Common parameters and headers](supporting-tasks.md#bk_common) for headers and parameters that are used by all requests related to supporting tasks.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/{subscriptionId}/providers/Microsoft.Network/locations/{location}/CheckDnsNameAvailability?domainNameLabel={DomainNameLabel}&api-version={api-version}`|  
  
 Replace {location} with the name of the region in which you wish to check the Dns name availability, and {DomainNameLabel} with the relative Dns name you wish to check within that region.  
  
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
