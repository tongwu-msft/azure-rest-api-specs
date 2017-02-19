---
title: "List Express Route Service Providers"
ms.custom: ""
ms.date: "2016-11-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "expressroute"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: cbdb9707-9718-4904-9680-42d6fddd5a4c
caps.latest.revision: 6
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
# List Express Route Service Providers
This operation lists the currently supported connectivity providers, their peering locations and bandwidths offered.  
  
## Request
See [Common parameters and headers](index.md#bk_common) for headers and parameters that are used by all requests related to *ExpressRoute*.  
  
|Method|Url|  
|------------|---------|  
|GET|`/subscriptions/{subscriptionId}/providers/Microsoft.Network/expressRouteServiceProviders?api-version={api-version}`|  
  
## Response  
 Status code: 200  
  
## Example Output:  
  
```json  
[  
    {  
        "name": "<providername>",  
        "peeringLocations": [  
            "location1",  
            "location2"  
        ],  
        "bandwidthsOffered": [  
            {  
                "offerName": "100Mbps",  
                "valueInMbps": 100  
            }  
        ]  
    }  
]  
  
```