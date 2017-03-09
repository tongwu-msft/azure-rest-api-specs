---
title: Get ExpressRoute Circuit BGP Peering
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
ms.assetid: df997501-fe0e-4dd0-9ea9-c7364021b686
author: georgewallace
ms.author: gwallace
manager: timlt
---
# Get ExpressRoute Circuit BGP Peering
The Get peering operation retrieves details of a peering for the circuit and peering specified.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/expressRouteCircuits/{circuitName}/peerings/{peeringName}?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the ExpressRoute Circuit exists. |
| resourceGroup | The name of the resource group that contains the ExpressRoute Circuit. |
| circuitName | The name of an ExpressRoute circuit already created.|
| peeringName | The name of the BGP Peering of the existing ExpressRoute circuit|
| api-version | The version of the API to use. The current version is 2016-09-01. | 

 Replace {circuitName} with the name of the ExpressRoute circuit already created and {peeringName} with the name of BGP Peering whose details are to be retrieved.  
  
## Response  
 **Status Code: 200**  
  
```json  
{  
    "name": "<peering name>",  
    "id": "https://<endpoint>/subscriptions/{subscriptionId}/resourceGroups/{ResourceGroupName}providers/Microsoft.Network/expressRouteCircuits/{circuitName}/peerings/{peering name}",  
    "etag": "",  
    "properties": {  
        "provisioningState": "{Succeeded | Failed | Cancelled}",  
        "peeringType": "AzurePublicPeering | AzurePrivatePeering | MicrosoftPeering",  
        "peerASN": "",  
        "primaryPeerAddressPrefix": "",  
        "secondaryPeerAddressPrefix": "",  
        "primaryAzurePort": "",  
        "secondaryAzurePort": "",  
        "state": "Disabled | Enabled",  
        "sharedKey": "",  
        "vlanId": "",  
        "microsoftPeeringConfig": {  
            "advertisedpublicprefixes": [  
                "prefix1",  
                "prefix2"  
            ],  
            "advertisedPublicPrefixState": "NotConfigured | Configuring | Configured | ValidationNeeded",  
            "customerAsn": "",  
            "routingRegistryName": ""  
        }  
    }  
}  
  
```  
  
 Following additional elements are seen when compared to the request sent in creation of BGP Peering.  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|azureASN|No|Integer|Specifies the numeric identifier of the public autonomous system (AS) in which the device is configured.|  
|primaryAzurePort|No|String|Specifies the name of the primary port. Only available when the circuit provisioning state is Provisioning or Provisioned.|  
|secondaryAzurePort|No|String|Specifies the name of the secondary port. Only available when the provisioning state is Provisioning or Provisioned.|  
|state|No|String|State of the BGP Peering in ExpressRoute. Possible values are ‘Enabled’ or ‘Disabled’|