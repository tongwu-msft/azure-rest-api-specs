---
title: Create or update an ExpressRoute Circuit
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
ms.assetid: 3e48a4be-94ee-45ac-95e3-a0aeec964bbb
author: georgewallace
ms.author: gwallace
manager: timlt
---
# Create or update an ExpressRoute Circuit

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/expressRouteCircuits/{circuitName}?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the ExpressRoute Circuit exists. |
| resourceGroup | The name of the resource group that contains the ExpressRoute Circuit. |
| circuitName | The name of an ExpressRoute circuit to be created or updated.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 

 Replace {circuitName} with the name of the ExpressRoute circuit to be created.  The circuitName must be unique within the resource group.  
  
 ***Circuit without BGP Peerings specified at creation time.***  
  
```json  
{
	"name": "<circuit name>",
	"location": "<location>",
	"tags": {
		"key1": "value1",
		"key2": "value2"
	},
	"sku": {
		"name": "Standard_MeteredData",
		"tier": "Standard",
		"family": "MeteredData"
	},
	"properties": {
		"serviceProviderProperties": {
			"serviceProviderName": "serviceProviderName",
			"peeringLocation": "<peering location>",
			"bandwidthInMbps": 100
		}
	}
}
```  
  
 **Circuit with BGP Peering specified at creation time:**  
  
```json 
{
	"name": "<circuit name>",
	"location": "<location>",
	"tags": {
		"key1": "value1",
		"key2": "value2"
	},
	"sku": {
		"name": "Standard_MeteredData",
		"tier": "Standard",
		"family": "MeteredData"
	},
	"properties": {
		"serviceProviderProperties": {
			"serviceProviderName": "serviceProviderName",
			"peeringLocation": "<peering location>",
			"bandwidthInMbps": 100
		},
		"peerings": [{
			"name": "AzurePublicPeering",
			"properties": {
				"peeringType": "AzurePublicPeering",
				"peerASN": 100,
				"PrimaryPeerAddressPrefix": "192.168.1.0/30",
				"SecondaryPeerAddressPrefix": "192.168.2.0/30",
				"vlanId": 200
			}
		}]
	}
}
  
```  
  
> [!NOTE]
>  Refer to the [Operations on ExpressRoute BGP Peering](operations-on-expressroute-bgp-peering.md) section for more details on the BGP Peering parameters.  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|location|Yes|String|Specifies the geo-location of the resource. This is different from peering location.|  
|tags|Yes|Complex Type|The tags and their values to associate with the ExpressRoute Circuit, see [Using tags to organize your Azure resources](https://azure.microsoft.com/documentation/articles/resource-group-using-tags/)|  
|sku|No|Complex Type|Specifies the SKU of ExpressRoute Circuit|  
|sku:name|No|String|Sku name is concatenation of {tier}_{family}|  
|sku:tier|No|String|ExpressRoute is offered in two tiers – ‘Standard’ or ‘Premium’.|  
|sku:family|No|String|Choose from either ‘UnlimitedData’ or ‘MeteredData’|  
|serviceProviderProperties|Yes|Complex Type|Specifies the service provider details from whom the circuit is to be established.|  
|serviceProviderProperties: serviceProviderName|Yes|String|The name of the service provider. This must match the provider name from List ExpressRoute service providers call.|  
|serviceProviderProperties: peeringLocation|Yes|String|Peering location for the ExpressRoute Circuit. This must match one of the peering location for chosen service provider from List ExpressRoute service provider operation.|  
|serviceProviderProperties: bandwidthInMbps|Yes|Integer|Value of ExpressRoute circuit bandwidth in Mbps. This must match one of the bandwidths offered for the chosen service provider from List ExpressRoute service provider operation.|  
  
## Response  
 **Status code: 202**  
  
 The response returns 202 Accepted with a ‘Enabling’ circuitProvisioningState till the operation completes. The header also contains ‘Azure-AsyncOperation’ header pointing to an operations resource. The URI for Azure-AsyncOperation header is of the form -  `/subscriptions/{subscriptionId}/providers/Microsoft.Network/locations/{location}/operations/{operationId}&api-version={api-version}`.  
  
 The operation URI can be queried to find the current state of the operation.