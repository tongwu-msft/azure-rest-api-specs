---
title: List ExpressRoute Circuit BGP Peering
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
ms.assetid: 9d78b825-8187-4103-8ac0-3ea9eac5faf2
author: georgewallace
ms.author: gwallace
manager: timlt
---
# List ExpressRoute Circuit BGP Peering
The List peering operation retrieves all the BGP Peerings for the circuit specified.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/expressRouteCircuits/{circuitName}/peerings?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the ExpressRoute Circuit exists. |
| resourceGroup | The name of the resource group that contains the ExpressRoute Circuit. |
| circuitName | The name of an ExpressRoute circuit already created.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 
  
## Response  
 **Status Code: 200**  
  
```json  
[  
        {  
      "name": "AzurePrivatePeering",  
      "id": "/subscriptions/a932c0e6-b5cb-4e68-b23d-5064372c8a3c/resourceGroups/AmitCrkt7/providers/Microsoft.Network/expressRouteCircuits/amittest/peerings/Private",  
      "etag": "W/\"cb87537e-fd92-48c7-905f-2efc95a47c8f\"",  
      "properties": {  
        "provisioningState": "Succeeded",  
        "peeringType": "AzurePrivatePeering",  
        "azureASN": 12076,  
        "peerASN": 100,  
        "primaryPeerAddressPrefix": "192.168.1.0/30",  
        "secondaryPeerAddressPrefix": "192.168.2.0/30",  
        "primaryAzurePort": "BRKAZUREIXP01-BN1-04GMR-CIS-1-PRIMARY",  
        "secondaryAzurePort": "BRKAZUREIXP01-DM2-04GMR-CIS-1-SECONDARY",  
        "state": "Enabled",  
        "vlanId": 200  
      }  
    }  
]  
  
```  
  
 Following additional elements are seen when compared to the request sent in creation of BGP Peering.  
  
|Element Name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|azureASN|Yes|Integer|Specifies the numeric identifier of the public autonomous system (AS) in which the device is configured.|  
|primaryAzurePort|Yes|String|Specifies the name of the primary port. Only available when the circuit provisioning state is Provisioning or Provisioned.|  
|secondaryAzurePort|Yes|String|Specifies the name of the secondary port. Only available when the provisioning state is Provisioning or Provisioned.|  
|state|Yes|String|State of the BGP Peering in ExpressRoute. Possible values are ‘Enabled’ or ‘Disabled’|