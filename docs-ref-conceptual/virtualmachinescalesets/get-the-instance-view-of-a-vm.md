---
title: "Get the instance view of a VM"
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
ms.assetid: 624ca0b9-77b1-433c-aac0-af7eac88a309
caps.latest.revision: 8
ms.author: "davidmu"
manager: "timlt"
---
# Get the instance view of a VM
Retrieves information about the instance view of a virtual machine in the specified virtual machine scale set.    
    
## Request    
 See [Common parameters and headers](../Topic/Virtual%20Machine%20Scale%20Sets_deleted.md#bk_common) for headers and parameters that are used by virtual machine scale sets.    
    
|Method|Request URI|    
|------------|-----------------|    
|GET|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vm-scaleset-name}/VirtualMachines/{vm-instance-id}/instanceView?api-version={api-version}`|    
    
 Replace {vm-instance-id} with the identifier of the virtual machine instance.    
    
## Response    
 Status code: 200 (OK).    
    
```    
    
{    
  "platformUpgradeDomain": "5",    
  "platformFaultDomain": "2",     
    
  "vmAgent": {     
    "vmAgentVersion": "version-of-agent",     
    "statuses": [ {     
      "code": "ProvisioningState/succeeded",     
      "message": "VM-agent-message",     
      "level": "Info",     
      "displayStatus": "Succeeded",     
      "time": "status-report-time"     
    } ],     
    "extensionHandlers": [ {     
      "type": "Microsoft.Compute.CustomScriptExtension",     
      "typeHandlerVersion": "1.1",     
      "status": {     
        "code": "ProvisioningState/<handlerStatus>/<code>",     
        "level": "Info",     
        "displayStatus": "Ready",     
        "message": "Handler enabled (name: Microsoft.Compute.CustomScriptExtension: 1.1) "     
      }     
    } ]     
  },      
  "disks": [ {     
    "name": "osdisk",     
    "statuses": [ {     
      "code": "ProvisioningState/succeeded",     
      "level": "Info",     
      "displayStatus": "Provisioning succeeded",     
      "time": "<time disk created>"     
    } ]     
  } ],     
        "statuses": [ {     
    "code": "ProvisioningState/failed/VMAgentProvisioningFailure",     
    "level": "Error",     
    "displayStatus": "VM Agent provisioning failed"     
  },     
  {     
    "code": "PowerState/Running",     
    "level": "Info",     
    "displayStatus": "VM Running"     
  },    
  {     
    "code" : "OSState/Generalized",     
    "message" : "Virtual Machine XYZ is Generalized",     
    "level" : "Info",     
    "displayStatus" : "VM Generalized"     
  } ],    
  "extensions": [ {     
    "name": "mydomainjoinscript",     
    "type": "Microsoft.Compute.CustomScriptExtension",    
    "typeHandlerVersion": "1.1",     
    "statuses": [ {     
      "code": "ProvisioningState/failed/-1",     
      "level": "Error",     
      "displayStatus": "<operation> - <status>",     
      "message": "Script exited with code -1",     
      "time": "<configurationAppliedTime>"     
    } ],     
    "substatuses": [ {     
      "code": "componentStatus/StdOut/succeeded",     
      "level": "Info",     
      "displayStatus": "Succeeded",     
      "message": "Creating log file..."     
    } ]     
  } ]     
}    
    
```    
    
|Element name|Description|    
|------------------|-----------------|    
|platformUpgradeDomain|Specifies the number of upgrade domains for the virtual machine instance.|    
|platformFaultDomain|Specifies the number of fault domains for the virtual machine instance.|    
|[statuses](../VirtualMachineScaleSetsREST/get-the-instance-view-of-a-vm.md#bk_statuses)|Specifies the status of the virtual machine instance.|    
|windowsConfiguration|Specifies the RDP thumbprint used to access the virtual machine instance.|    
|[vmAgent](../VirtualMachineScaleSetsREST/get-the-instance-view-of-a-vm.md#bk_vmAgent)|Specifies the status of the VM Agent installed on the virtual machine instance.|    
|[disks](../VirtualMachineScaleSetsREST/get-the-instance-view-of-a-vm.md#bk_disks)|Specifies the disks that are associated with the virtual machine instance.|    
|[extensions](../VirtualMachineScaleSetsREST/get-the-instance-view-of-a-vm.md#bk_extensions)|Specifies the status of the extensions installed on the virtual machine instance.|    
    
###  <a name="bk_vmAgent"></a> vmAgent    
    
|Element name|Description|    
|------------------|-----------------|    
|vmAgentVersion|Specifies the version of the VM Agent installed on the virtual machine instance.|    
|[statuses](../VirtualMachineScaleSetsREST/get-the-instance-view-of-a-vm.md#bk_statuses)|Specifies the status of the VM Agent on the virtual machine instance.|    
|extensionHandlers|Specifies the extension handler used by the VM Agent on the virtual machine instance.|    
    
###  <a name="bk_disks"></a> disks    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies the name of the disk associated with the virtual machine instance.|    
|[statuses](../VirtualMachineScaleSetsREST/get-the-instance-view-of-a-vm.md#bk_statuses)|Specifies the status of the disk.|    
    
###  <a name="bk_extensions"></a> extensions    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies the name of the extension installed on the virtual machine instance.|    
|type|Specifies the type of the extension installed on the virtual machine instance.|    
|typeHandlerVersion|Specifies the version of the handler.|    
|[statuses](../VirtualMachineScaleSetsREST/get-the-instance-view-of-a-vm.md#bk_statuses)|Specifies the status of the extension.|    
|[substatuses](../VirtualMachineScaleSetsREST/get-the-instance-view-of-a-vm.md#bk_substatuses)|Specifies the sub-status of the extension.|    
    
###  <a name="bk_statuses"></a> statuses    
    
|Element name|Description|    
|------------------|-----------------|    
|code|Specifies the status code.|    
|message|Specifies the status message.|    
|level|Specifies the status level.|    
|displayStatus|Specifies the status value to display.|    
|time|Specifies the time the status was recorded.|    
    
###  <a name="bk_substatuses"></a> substatuses    
    
|Element name|Description|    
|------------------|-----------------|    
|code|Specifies the sub-status code.|    
|level|Specifies the sub-status level.|    
|displayStatus|Specifies the sub-status value to display.|    
|message|Specifies the sub-status message.|