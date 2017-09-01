---
title: "Get the instance view of a NIC"
ms.custom: ""
ms.date: "2017-02-07"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "virtual-machines"
ms.suite: ""
ms.technology: 
  - "cloud-infrastructure-solution"
ms.tgt_pltfrm: ""
ms.topic: "language-reference"
ms.assetid: dcefff6a-4fc1-4088-9d17-58e7efa42cfd
caps.latest.revision: 9
ms.author: "davidmu"
manager: "timlt"
---
# Get the instance view of a NIC
Retrieves information about the instance view of a network interface associated with a virtual machine in a virtual machine scale set.    
    
## Request    

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).  

|Method|Request URI|    
|------------|-----------------|    
|GET|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vmScaleSet}/virtualMachines/{vmInstanceId}/networkInterfaces/{nic}?api-version={apiVersion}`|    

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that will contain the scale set. |
| vmScaleSet | The name of the scale set. |
| vmInstanceId | The identifier of the virtual machine. |
| nic | The name of the network interface. |
| apiVersion | The version of the API to use. The current version is 2016-04-30-preview. |   
    
## Response    
Status code: 200 (OK).    
    
```    
{    
  "name": "nicconfig1",    
  "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Compute/virtualMachineScaleSets/myscaleset1/virtualMachines/vm1/networkInterfaces/nicconfig1",    
  "etag": "W/\"00000000-0000-0000-0000-000000000000\"",    
  "type": Microsoft.Network/networkInterfaces",    
  "tags": {     
    "key": "value"     
  },    
  "properties": {     
    "provisioningState": "Succeeded",    
    "resourceGuid": "XXXXXXXX-XXXX-XXXX-XXXXXXXXXXXX",    
    "ipConfigurations": [ {    
      "name":  "ipconfig1",    
      "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Compute/virtualMachineScaleSets/myscaleset1/virtualMachines/vm1/networkInterfaces/nicconfig1/ipConfigurations/ipconfig1",    
      "etag": "W/\"00000000-0000-0000-0000-000000000000\"",    
      "properties": {     
        "provisioningState": "Succeeded",    
        "privateIPAddress": "10.0.0.8",    
        "privateIPAllocationMethod": "Static",    
        "subnet": {    
          "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysub1"    
        },    
    
        "publicIPAddress": {    
          "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/publicIPAddresses/myip1"    
        },    
        "loadBalancerBackendAddressPools": [ {    
          "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/loadBalancers/mylb1/backendAddressPools/pool1"    
        } ],    
        "loadBalancerInboundNatRules": [ {    
          "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/loadBalancers/mylb1/inboundNatRules/rdp-for-myvm1"    
        },    
        {    
          "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/loadBalancers/mylb1/inboundNatRules/powershell-for-myvm1"    
        } ],    
        "applicationGatewayBackendAddressPools": [ {    
          "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/applicationGateways/appgate1/backendAddressPools/pool1"    
        } ]    
      }    
    } ],    
    "macAddress": "00-0D-3A-A0-AE-61",    
    "enableIPForwarding": false,    
    "primary": true,    
    "virtualMachine": {    
      "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Compute/virtualMachines/myvmss1_0"    
    }    
  }    
}    
    
```    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies the name of the network interface configuration.|    
|id|Specifies the identifier of the network interface configuration.|    
|location|Specifies the location of the network interface configuration.|    
|tags|Specifies the tags that are assigned to the network interface configuration. For more information about using tags, see [Using tags to organize your Azure resources](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-using-tags.md).|    
|provisioningState|Specifies the provisioning state of the network interface configuration.<br /><br /> Possible values are:<br /><br /> **Deleting**<br /><br /> **Failed**<br /><br /> **Succeeded**<br /><br /> **Updating**|    
|[ipConfigurations](#ipConfigurations)|Specifies the IP configurations for the network interface configuration.|    
|virtualMachine|Specifies the identifier of the virtual machine that is associated with the network interface configuration.|    
|macAddress|Specifies the media access control (MAC) address of the network interface configuration.|    
    
###  <a name="ipConfigurations"></a> ipConfigurations    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies name of the IP configuration.|    
|id|Specifies the identifier of the IP configuration.|    
|provisioningState|Specifies the provisioning state of the IP configuration.<br /><br /> Possible values are:<br /><br /> **Deleting**<br /><br /> **Failed**<br /><br /> **Succeeded**<br /><br /> **Updating**|    
|privateIPAddress|Specifies a specific private IP address. If a subnet was specified, the IP must be from the subnet. If a virtual network was specified, the IP must be from the virtual network. This value is ignored unless privateIPAllocationMethod element is set to “Static”|    
|privateIPAllocationMethod|Specifies the private IP allocation method.<br /><br /> Possible values are:<br /><br /> **Dynamic**<br /><br /> **Static**|    
|subnet|Specifies the identifier of the subnet. All subnets referenced by a NIC have to belong to the same virtual network. The subnet a NIC belongs to can be changed when updating the NIC.|    
|publicIPAddress|Specifies the identifier of the public IP address.|    
|loadBalancerBackendAddressPools|Specifies an array of references to backend address pools of load balancers. A network interface can reference backend address pools of one public and one internal load balancer.|    
|loadBalancerInboundNatRules|Specifies an array of references to inbound Nat pools of the load balancers. A network interface can reference inbound nat rules of one public and one internal load balancer.|    
|applicationGatwayBackendAddressPools|Specifies an array of references to backend address pools of application gateways. A network interface can reference backend address pools of multiple application gateways.|