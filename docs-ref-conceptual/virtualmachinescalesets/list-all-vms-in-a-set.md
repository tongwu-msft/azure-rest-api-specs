---
title: "List all VMs in a set"
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
ms.assetid: 187bd42a-5abe-4ad1-80b5-67d49364bd51
caps.latest.revision: 10
ms.author: "davidmu"
manager: "timlt"
---
# List all VMs in a set
Retrieves information about the instance view of all virtual machines in the specified virtual machine scale set.    
    
## Request    

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).  
    
|Method|Request URI|    
|------------|-----------------|    
|GET|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vmScaleSet}/virtualMachines?$expand=instanceView&$select=instanceView&api-version={apiVersion}`| 

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that contains the scale set. |
| vmScaleSet | The name of the scale set. |
| apiVersion | The version of the API to use. The current version is 2016-04-30-preview. |   
    
## Response    
Status code: 200 (OK).    
    
```    
{    
  "value": [ {    
    "instanceId": "1",    
    "properties": {    
      "instanceView": {    
        "platformUpgradeDomain": "5",    
        "platformFaultDomain": "2",     
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
        "windowsConfiguration": {     
          "rdpThumbPrint": "{rdp-thumbprint}"     
        },     
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
    }    
  } ]    
}    
    
```    
    
|Element name|Description|    
|------------------|-----------------|    
|platformUpgradeDomain|Specifies the number of upgrade domains for the virtual machine instance.|    
|platformFaultDomain|Specifies the number of fault domains for the virtual machine instance.|    
|[statuses](#statuses)|Specifies the status of the virtual machine instance.|    
|windowsConfiguration|Specifies the RDP thumbprint used to access the virtual machine instance.|    
|[vmAgent](#vmAgent)|Specifies the status of the VM Agent installed on the virtual machine instance.|    
|[disks](#disks)|Specifies the disks that are associated with the virtual machine instance.|    
|[extensions](#extensions)|Specifies the status of the extensions installed on the virtual machine instance.|    
    
###  <a name="vmAgent"></a> vmAgent    
    
|Element name|Description|    
|------------------|-----------------|    
|vmAgentVersion|Specifies the version of the VM Agent installed on the virtual machine instance.|    
|[statuses](#statuses)|Specifies the status of the VM Agent on the virtual machine instance.|    
|extensionHandlers|Specifies the extension handler used by the VM Agent on the virtual machine instance.|    
    
###  <a name="disks"></a> disks    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies the name of the disk associated with the virtual machine instance.|    
|[statuses](#statuses)|Specifies the status of the disk.|    
    
###  <a name="extensions"></a> extensions    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies the name of the extension installed on the virtual machine instance.|    
|type|Specifies the type of the extension installed on the virtual machine instance.|    
|typeHandlerVersion|Specifies the version of the handler.|    
|[statuses](#statuses)|Specifies the status of the extension.|    
|[substatuses](#substatuses)|Specifies the sub-status of the extension.|    
    
###  <a name="statuses"></a> statuses    
    
|Element name|Description|    
|------------------|-----------------|    
|code|Specifies the status code.|    
|message|Specifies the status message.|    
|level|Specifies the status level.|    
|displayStatus|Specifies the status value to display.|    
|time|Specifies the time the status was recorded.|    
    
###  <a name="substatuses"></a> substatuses    
    
|Element name|Description|    
|------------------|-----------------|    
|code|Specifies the sub-status code.|    
|level|Specifies the sub-status level.|    
|displayStatus|Specifies the sub-status value to display.|    
|message|Specifies the sub-status message.|