---
title: "Virtual Machine Scale Sets REST"
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
ms.assetid: 30a2c884-e1ae-4914-bdd8-4fc56c6df278
caps.latest.revision: 6
ms.author: "davidmu"
manager: "timlt"
---
# Virtual Machine Scale Sets REST
These APIs allow you to create and manage virtual machine scale sets.    
    
##  <a name="bk_common"></a> Common parameters and headers    
 The following information is common to all tasks that you might do related to virtual machine scale sets:    
    
-   Replace {api-version} with 2016-03-30.    
    
-   Replace {subscription-id} with your subscription identifier in the URI.    
    
-   Replace {resource-group-name} with the resource group. For more information, see [Using Resource groups to manage your Azure resources](http://azure.microsoft.com/en-us/documentation/articles/azure-preview-portal-using-resource-groups/) .    
    
-   Replace {vm-scaleset-name} with the name of the virtual machine scale set.    
    
-   Set the Content-Type header to **application/json**.    
    
-   Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](../Topic/Authenticating%20Azure%20Resource%20Manager%20requests.md) .    
    
## Tasks    
    
-   [Create or update a set](../VirtualMachineScaleSetsREST/create-or-update-a-set.md)    
    
-   [Delete a VM from a set](../VirtualMachineScaleSetsREST/delete-a-vm-from-a-set.md)    
    
-   [Delete a set](../VirtualMachineScaleSetsREST/delete-a-set.md)    
    
-   [Get the instance view of a NIC](../VirtualMachineScaleSetsREST/get-the-instance-view-of-a-nic.md)    
    
-   [Get the instance view of a VM](../VirtualMachineScaleSetsREST/get-the-instance-view-of-a-vm.md)    
    
-   [Get the instance view of a set](../VirtualMachineScaleSetsREST/get-the-instance-view-of-a-set.md)    
    
-   [Get the model view of a VM](../VirtualMachineScaleSetsREST/get-the-model-view-of-a-vm.md)    
    
-   [Get the model view of a set](../VirtualMachineScaleSetsREST/get-the-model-view-of-a-set.md)    
    
-   [List all NICs in a set](../VirtualMachineScaleSetsREST/list-all-nics-in-a-set.md)    
    
-   [List all VMs in a set](../VirtualMachineScaleSetsREST/list-all-vms-in-a-set.md)    
    
-   [List all sets in a resource group](../VirtualMachineScaleSetsREST/list-all-sets-in-a-resource-group.md)  

-   [List all sets in a subscription](../VirtualMachineScaleSetsREST/list-all-sets-in-a-subscription.md)    
    
-   [List available skus for VMs](../VirtualMachineScaleSetsREST/list-available-skus-for-vms.md)    
    
-   [List all NICs of a VM](../VirtualMachineScaleSetsREST/list-all-nics-of-a-vm.md)    
    
-   [Manage all VMs in a set](../VirtualMachineScaleSetsREST/manage-all-vms-in-a-set.md)    
    
-   [Manage a VM](../VirtualMachineScaleSetsREST/manage-a-vm.md)