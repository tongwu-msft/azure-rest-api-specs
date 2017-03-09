---
title: List Express Route Service Providers
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
ms.assetid: cbdb9707-9718-4904-9680-42d6fddd5a4c
author: georgewallace
ms.author: gwallace
manager: timlt
---
# List Express Route Service Providers
This operation lists the currently supported connectivity providers, their peering locations and bandwidths offered.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request
  
|Method|Url|  
|------------|---------|  
|GET|`/subscriptions/{subscriptionId}/providers/Microsoft.Network/expressRouteServiceProviders?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

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