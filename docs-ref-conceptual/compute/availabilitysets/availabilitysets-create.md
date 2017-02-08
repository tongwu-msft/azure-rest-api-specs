---
title: "Create an availability set"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# Create an availability set   
    
## Request    

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).    
    
| Method | Request URI |    
|--------|-------------|    
| PUT | `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/availabilitySets/{availabilitySet}?api-version={apiVersion}` |    
    
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the availability set is being created. |
| resourceGroup | The name of the resource group that will contain the availability set. |
| availabilitySet | The name of the availability set to create. |
| apiVersion | The version of the API to use. The current version is 2017-03-30. | 

```    
{     
   "name": "myAVSet",     
   "type": "Microsoft.Compute/availabilitySets",     
   "location": "westus",     
   "tags": {},     
   "properties": {     
      "platformUpdateDomainCount": 5,     
      "platformFaultDomainCount": 3     
   }     
}    
```    
    
| Element name | Required | Type | Description |    
|------------- |----------|------|-------------|    
| name | Yes | String | Specifies the name of the availability set. |    
| type | Yes | String | Specifies the type of compute resource. For availability sets, the compute resource is Microsoft.Compute/availabilitySets. |    
| location | Yes | String | Specifies the supported Azure location where the resource exists. For more information, see [List all the available geo-locations](../../../docs-ref-autogen/resources/subscriptions.json#Subscriptions_ListLocations). |    
| tags | No | String | Specifies the tags that will be assigned to the availability set. A tag is a key value pair used to identify a resource. For more information, see [Using tags to organize your resources](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-using-tags/). |    
| platformUpdateDomainCount | No | String | Specifies the number of update domains that are used. For more information, see [Manage the availability of virtual machines](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-manage-availability?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json). If this element is not specified, the default value of 5 is used. A maximum of 20 fault domains can be used. |    
| platformFaultDomainCount | No | String |Specifies the number of fault domains that are used. For more information, see [Manage the availability of virtual machines](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-manage-availability?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json). If this element is not specified, the default value of 3 is used. A maximum of 3 fault domains can be used. |    
    
## Response    
 
Status code: 200 (OK); otherwise 404 (Not Found).    
    
```json    
{    
  "properties": {    
    "platformUpdateDomainCount": 5,    
    "platformFaultDomainCount": 3    
  },    
  "id": "/subscriptions/{subscription-id}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/availabilitySets/myAVSet",    
  "name": "myAVSet",    
  "type": "Microsoft.Compute/availabilitySets",    
  "location": "westus"    
}    
```    
    
| Element name | Description |    
|--------------|-------------|    
| platformUpdateDomainCount | Specifies the number of update domains that are used. |    
| platformFaultDomainCount |Specifies the number of fault domains that are used. |    
| id | Specifies the identifying URI of the availability set. |    
| name | Specifies the name of the availability set. |    
| type | Specifies the type of compute resource. |    
| location | Specifies the supported Azure location where the resource exists. |