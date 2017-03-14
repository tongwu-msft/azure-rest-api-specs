---
title: Get ExpressRoute Circuit
ms.date: 03/09/2017
ms.service: expressroute
ms.devlang: rest-api
ms.topic: reference
ms.assetid: ba245cae-c36f-4a71-ae7e-55406f44a607
author: georgewallace
ms.author: gwallace
manager: timlt
---
# Get ExpressRoute Circuit
This operation fetches details of a particular circuit in a Resource Group.  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/expressRouteCircuits/{circuitName}?api-version={api-version}`|  

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the ExpressRoute Circuit exists. |
| resourceGroup | The name of the resource group that contains the ExpressRoute Circuit. |
| circuitName | The name of an ExpressRoute circuit already created.|
| api-version | The version of the API to use. The current version is 2016-09-01. | 

> [!NOTE]
>  If BGP Peerings are defined for the ExpressRoute Circuit, they are also returned as Child objects of the ExpressRoute Circuit. Refer to BGP Peerings section for details on these objects.  
  
## Response  
 Status Code: 200  
  
```  
{  
        "name": "<circuit name>",  
        "id": "/subscriptions/{subscriptionId}/resourceGroup/{resourceGroupName}/providers/Microsoft.Network/expressRouteCircuits/{circuitName}",  
        "etag": " W/\"00000000-0000-0000-0000-000000000000\"",  
        "location": "<location>",  
        "tags": {  
            "key1": "value1",  
            "key2": "value2"  
        },  
        "sku": {  
            "name": "Standard_MeteredData",  
            "tier": "Standard|Premium",  
            "family": "UnlimitedData|MeteredData"  
        },  
        "properties": {  
            "provisioningState": "Succeeded|Failed|Cancelled",  
            "circuitProvisioningState": "Enabled|Disabled|Enabling|Disabling",  
            "serviceProviderProvisioningState": "NotProvisioned|Provisioning|Provisioned|Deprovisioning",  
            "serviceProviderProperties": {  
                "serviceProviderName": "serviceProviderName",  
                "peeringLocation": "<peering location",  
                "bandwidthInMbps": 100  
            }  
        },  
        "serviceKey": "<unique service key for circuit>",  
        "serviceProviderNotes": "<notes set only by ServiceProvider>"  
    }  
  
```  
  
 Following additional elements are seen when compared to the request sent in creation of Circuit.  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|provisioningState|No|String|Specifies the provisioning state of the circuit resource in ARM. This is different from circuit state in ExpressRoute system or circuit state in service provider’s system.Valid values can be ‘Succeeded’, ‘Failed’ or ‘Cancelled’|  
|circuitProvisioningState|No|String|Specifies the provisioning state of the circuit in ExpressRoute. Valid values are ‘Enabling’, ‘Enabled’, ‘Disabling’, ‘Disabled’|  
|serviceProviderProvisioningState|No|String|Specifies the provisioning state of the Circuit in Service Provider’s system. Valid values are ‘NotProvisioned’ , ‘Provisioning’, ‘Provisioned’, ‘Deprovisioning’.|  
|serviceKey|No|String|Specifies the unique key assigned to the ExpressRoute circuit once successfully provisioned.|  
|serviceProviderNote|No|String|Additional read only notes set on this circuit by the service provider.|