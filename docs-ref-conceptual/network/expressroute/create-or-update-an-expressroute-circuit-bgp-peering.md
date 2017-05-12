---
title: Create or update an ExpressRoute Circuit BGP Peering
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
ms.assetid: fc9e52c5-3c70-496d-9ec7-8bc07e29ea41
author: georgewallace
ms.author: gwallace
manager: timlt
---
# Create or update an ExpressRoute Circuit BGP Peering
The create BGP Peering operation creates a new peering for the circuit specified or updates an existing peering. The PUT operation for peering can be performed both at circuit create/update operation and independently on the BGP Peering object. Similarly update to a peering can also be performed by update on parent circuit or on peering object independently  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

In the section below a PUT on the peering child object is shown.  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/expressRouteCircuits/{circuitName}/peerings/{peeringName}?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the ExpressRoute Circuit exists. |
| resourceGroup | The name of the resource group that contains the ExpressRoute Circuit. |
| circuitName | The name of an ExpressRoute circuit already created.|
| peeringName | The name of the BGP Peering to be created. |
| api-version | The version of the API to use. The current version is 2016-09-01. | 

 It must be one of AzurePublicPeering, AzurePrivatePeering, and MicrosoftPeering. There can be only one peering of each type in a circuit.  
  
 **AzurePublicPeering:**  
  
```json 
  
{  
    "name": "AzurePublicPeering",  
    "properties": {  
        "peeringType": "AzurePublicPeering",  
        "peerASN": 100,   
        "PrimaryPeerAddressPrefix": "192.168.1.0/30",  
        "SecondaryPeerAddressPrefix": "192.168.2.0/30",  
        "vlanId": 200,  
    }  
}  
  
```  
  
 **AzurePrivatePeering:**  
  
```json
  
{  
    "name": "AzurePrivatePeering",   
    "properties": {   
        "peeringType": "AzurePrivatePeering",   
        "peerASN": 100,   
        "PrimaryPeerAddressPrefix": "192.168.1.0/30",   
        "SecondaryPeerAddressPrefix": "192.168.2.0/30",  
        "vlanId": 200,  
    }  
}  
  
```  
  
 **MicrosoftPeering:**  
  
```json  
  
{  
    "name": "MicrosoftPeering",  
    "properties": {  
        "peeringType": "MicrosoftPeering",  
        "peerASN": 100,  
        "primaryPeerAddressPrefix": "192.168.1.0/30",  
        "secondaryPeerAddressPrefix": "192.168.2.0/30",  
        "vlanId": 200,  
        "microsoftPeeringConfig": {  
            "advertisedpublicprefixes": [  
                "11.2.3.4/30",  
                "12.2.3.4/30"  
            ],  
            "advertisedPublicPrefixState": "NotConfigured ",  
            "customerAsn": 200,  
            "routingRegistryName": "<name>"  
        }  
    }  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|name|Yes|String|Name of the peering. Must be one of AzurePublicPeering, AzurePrivatePeering, MicrosoftPeering|  
|peeringType|Yes|String|Must be one of AzurePublicPeering, AzurePrivatePeering, MicrosoftPeering|  
|peerAsn|Yes|Integer|The autonomous system number of the customer/connectivity provider.|  
|primaryPeerAddressPrefix|Yes||/30 subnet used to configure IP addresses for interfaces on primary link|  
|secondaryPeerAddressPrefix|Yes||/30 subnet used to configure IP addresses for interfaces on secondary link|  
|vlanId|Yes||Specifies the identifier that is used to identify the customer|  
|microsoftPeeringConfig|Yes|Complex Type|Properties applicable only when peering type is chosen as MicrosftPeering. The following properties should not be specified for AzurePublicPeering or AzurePrivatePeering|  
|microsoftPeeringConfig: advertisedPublicPrefixes|Yes|String array|Comma separated list of prefixes that will be advertised through the BGP peering. Only routes for these prefixes will be allowed into the VPN.|  
|microsoftPeeringConfig: customerAsn|||ASN of the customer (if different from peering ASN). This is used to validate the ownership of advertisedpublicprefixes in RIR/IRRs|  
|microsoftPeeringConfig: routingRegistryName|||Internet Routing Registry / Regional Internet Registry to perform a look up for routing object to validate prefixes. Supported list of RIRs / IRRs are:<br /><br /> -   ARIN<br />-   APNIC<br />-   AFRINIC<br />-   LACNIC<br />-   RIPE NCC<br />-   RADB<br />-   ALTDB<br />-   LEVEL3|  
  
## Response  
 **Status Code: 202**  
  
 The response returns 202 Accepted with a ‘Enabling’ provisioningState till the operation completes. The header also contains ‘Azure-AsyncOperation’ header pointing to an operations resource. The URI for Azure-AsyncOperation header is of the form - /subscriptions/{subscriptionId}/providers/Microsoft.Network/locations/{location}/operations/{operationId}&api-version={api-version}. The operation URI can be queried to find the current state of the operation.
