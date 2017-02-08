---
title: "Get the instance view of a set"
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
ms.assetid: 91fea84a-bd68-4d96-9021-829863b93668
caps.latest.revision: 11
ms.author: "davidmu"
manager: "timlt"
---
# Get the instance view of a set
Retrieves information about the instance view of a virtual machine scale set.    
    
## Request    
 See [Common parameters and headers](../Topic/Virtual%20Machine%20Scale%20Sets_deleted.md#bk_common) for headers and parameters that are used by virtual machine scale sets.    
    
|Method|Request URI|    
|------------|-----------------|    
|GET|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vm-scaleset-name}/instanceView?api-version={api-version}`|    
    
## Response    
 Status code: 200 (OK).    
    
```    
{     
    
  "virtualMachine": {    
    "statusesSummary": [ {    
      "code": "ProvisioningState/creating",    
      "count": "50"    
    } ]    
  },    
   "statuses": [ {    
    "code": "ProvisioningState/failed",    
    "message": "Failed to get secret XXX",    
    "level": "Error",    
    "displayStatus": "failed"    
  } ],    
  "extensions": [ {          
    "name" : "extensionName",         
    "statusesSummary": [ {            
      "code" : "provisioningState/succeeded",             
      "count" : "7"          
    }]    
  }]    
}    
```    
    
|Element name|Description|    
|------------------|-----------------|    
|[virtualMachines](#virtualMachines)|Specifies the allocation statuses for the virtual machines in the scale set.|    
|[statuses](#statuses)|Specifies the allocation statuses for the whole virtual machine scale set.|    
|[extensions](#extensions)|Specifies the allocation statuses for the extensions in the scale set.|    
    
##  <a name="virtualMachines"></a> virtualMachines    
    
|||    
|-|-|    
|[statusSummary](#statusSummary)|Specifies a summary of virtual machine status values.|    
    
##  <a name="statuses"></a> statuses    
    
|||    
|-|-|    
|code|Specifies the status of the scale set.<br /><br /> Possible values are:<br /><br /> **provisioningState/succeeded**<br /><br /> **provisioningState/failed**<br /><br /> **provisioningState/updating**|    
|message|If available, specifies a detailed message about the status.|    
|level|Specifies the status level.<br /><br /> Possible values are:<br /><br /> **Info**<br /><br /> **Warning**<br /><br /> **Error**|    
|displayStatus|Specifies a localized label for the status.|    
    
##  <a name="extensions"></a> extensions    
    
|||    
|-|-|    
|name|Specifies the name of the extension.|    
|[statusSummary](#statusSummary)|Specifies a summary of extension status values.|    
    
##  <a name="statusSummary"></a> statusSummary    
    
|Element name|Description|    
|------------------|-----------------|    
|code|Specifies the latest status of the resource.<br /><br /> Possible values are:<br /><br /> **provisioningState/succeeded**<br /><br /> **provisioningState/failed**<br /><br /> **provisioningState/updating**|    
|count|Specifies the number of resources that have this status.|