---
title: "Virtual machine state information | Microsoft Azure"
author: stephbaron
ms.date: 2017-03-09
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: stbaro
manager: drewm
---

# Virtual machine state information

Virtual machines and virtual machine-related components (e.g. resource extensions, disks) in Azure expose various states.  Statuses are returned via the [Get information about a virtual machine API](./virtualmachines/virtualmachines-get.md) model and instance view responses. This article covers the VM Power State and the VM Provisioning State categories. 
    
## Virtual machine power state
 
The PowerState status is returned as part of the [Get information about a virtual machine API](./virtualmachines/virtualmachines-get.md) instance view response and represents the power state of the virtual machine from the hypervisor’s standpoint. It is returned in the format PowerState/***value***, where ***value*** can be one of the following:
    
| Power State | Description |
| --------- | ----------- |
| Starting | Indicates the virtual machine is being started from the Hypervisor standpoint.  |
| Running | Indicates that the virtual machine is being started from the Hypervisor standpoint.  |
| Stopping | Indicates that the virtual machine is being stopped from the Hypervisor standpoint.  |
| Stopped | Indicates that the virtual machine is stopped from the Hypervisor standpoint.  Note that virtual machines in the stopped state still incur compute charges. |
| Deallocating | Indicates that the virtual machine is being deallocated from the Hypervisor standpoint.  |
| Deallocated | Indicates that the virtual machine is completely removed from the Hypervisor standpoint but still available in the control plane.  Virtual machines in the Deallocated state do not incur compute charges. |
| -- | Indicates that the power state of the virtual machine is unknown. |

 The following diagram represents that various transition states a virtual machine may be in during state changes.

 ![VM state transition diagram](../media/VMState.png)

 Here are two example response snippets of the PowerState status being returned for virtual machines in the running and deallocated states, respectively.   

 // VM in running state
```    
"statuses": [
    {
      "code": "PowerState/running",
      "level": "Info",
      "displayStatus": "VM running"
    }
]
```  

 // VM in deallocated state
```    
"statuses": [
    {
      "code": "PowerState/deallocated",
      "level": "Info",
      "displayStatus": "VM deallocated"
    }
]
```  
  
## Virtual machine provisioning state
 
The ProvisioningState status is returned as part of the [Get information about a virtual machine API](./virtualmachines/virtualmachines-get.md) model and instance view responses and represents the state of the virtual machine from the Azure Resource Manager’s standpoint (the management layer of the virtual machine). 

In the virtual machine model view response, the ProvisioningState is returned in the format ProvisioningState: ***value***, where ***value*** can be one of the following:
    
| Provisioning State | Description |
| --------- | ----------- |
| Creating | Indicates the virtual Machine is being created.   |
| Updating | Indicates that there is an update operation in progress on the Virtual Machine.   |
| Succeeded | Indicates that the operation executed on the virtual machine succeeded.   |
| Deleting | Indicates that the virtual machine is being deleted.  |
| Failed | Indicates that the update operation on the Virtual Machine failed.   |

In the virtual machine instance view response, the ProvisioningState is returned in the format ProvisioningState/***value***/***optional_substatus_or_errorcode***, where ***value*** can be one of the following:
    
| Provisioning State | Description |
| --------- | ----------- |
| Creating | Indicates the virtual Machine is being created.   |
| Creating/osProvisioningInProgress | Indicates the virtual machine is powered on and the Guest OS or In-VM OS provisioning is in progress. Note that the osProvisioningInProgress transition substatus will only be shown for virtual machines that are provisioned from a platform image.   |
| Creating/osProvisioningComplete | Indicates the virtual machine is powered on and the Guest OS or In-VM OS provisioning is in progress. Note that the osProvisioningComplete transition substatus will only be shown for virtual machines that are provisioned from a platform image.   |
| Updating | Indicates that there is an update operation in progress on the Virtual Machine.   |
| Succeeded | Indicates that the operation executed on the virtual machine succeeded.   |
| Deleting | Indicates that the virtual machine is being deleted.  |
| Failed/***error_code*** | Indicates that the update operation on the Virtual Machine failed. The ***error_code*** can be used to help troubleshoot the cause of the failed state.   |

 Here is an example response snippet of the ProvisioningState status being returned in the model view of a virtual machine. 

```    
    "provisioningState": "Succeeded"
```  
 Here are two example response snippets of the ProvisioningState status being returned in the instance view for virtual machines in the succeeded and failed states (with error code), respectively.     

// VM in ProvisioningState succeeded
```  
"statuses": [
    {
      "code": "ProvisioningState/succeeded",
      "level": "Info",
      "displayStatus": "Provisioning succeeded",
      "time": "2016-09-23T23:03:18.9595376+00:00"
    },
    {
      "code": "PowerState/deallocated",
      "level": "Info",
      "displayStatus": "VM deallocated"
    }
]
```  

// VM in ProvisioningState failed
```  
"statuses": [
    {
      "code": "ProvisioningState/failed/StorageAccountSubscriptionMismatch",
      "level": "Error",
      "displayStatus": "Provisioning failed",
      "message": "Storage account contoso doesn't belong to subscription <id>",
      "time": "2017-02-17T15:55:47.5291308+00:00"
    },
    {
      "code": "PowerState/running",
      "level": "Info",
      "displayStatus": "VM running"
    }
  ]
```  
