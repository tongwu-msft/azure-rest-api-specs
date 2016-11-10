---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_Capture
summary: Captures the VM by copying virtual hard disks of the VM and outputs a template that can be used to create similar VMs.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_CreateOrUpdate
summary: Create or update a virtual machine in the specified subscription.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that will contain the virtual machine. For more information about creating and managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

The creation of a virtual machine involves an Azure Storage account and typically resources such as a network interface or availability set. For more information about creating these resources, see:

- [Create a resource group](../../api-ref/resources/resourcegroups.json#ResourceGroups_CreateOrUpdate)
- [Create a storage account](../../api-ref/storage/storageaccounts.json#StorageAccounts_Create)
- [Create a virtual network](../../api-ref/network/virtualnetworks.json#VirtualNetworks_CreateOrUpdate)
- [Create a network interface](../../api-ref/network/networkinterfaces.json#NetworkInterfaces_CreateOrUpdate)
- [Create a public IP address](../../api-ref/network/publicipaddresses.json#PublicIPAddresses_CreateOrUpdate)
- [Create an availability set](../../api-ref/compute/availabilitysets.json#AvailabilitySets_CreateOrUpdate)

For the update scenario, a PUT or PATCH request can be submitted with a subset of the VM properties. Alternatively, the RESTful way is to do a GET, tweak the properties and submit a PUT request. For non-updateable properties, it’s OK to be specify them in Update request but they must have the same values as returned by GET. For examples of different VM configurations, see [VM configurations](vm-configuration.md).

These links will be useful when creating the request:

- [List all of the available geo-locations](../../api-ref/resources/subscriptions.json#Subscriptions_ListLocations)
- [Using tags to organize your resources](https://review.docs.microsoft.com/en-us/azure/resource-group-using-tags?toc=%2fazure%2fazure-resource-manager%2ftoc.json)
- [Manage the availability of virtual machines](https://review.docs.microsoft.com/en-us/azure/virtual-machines/virtual-machines-windows-manage-availability?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json)
- [Navigating and Selecting Azure Virtual Machine images with PowerShell and the Azure CLI](https://review.docs.microsoft.com/en-us/azure/virtual-machines/virtual-machines-windows-cli-ps-findimage?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json)
- [Planned maintenance for virtual machines in Azure](https://review.docs.microsoft.com/en-us/azure/virtual-machines/virtual-machines-windows-planned-maintenance-schedule?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json)
- [Sizes for virtual machines](https://review.docs.microsoft.com/en-us/azure/virtual-machines/virtual-machines-windows-sizes?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json)
- [About disks and VHDs for Azure virtual machines](https://review.docs.microsoft.com/en-us/azure/virtual-machines/virtual-machines-windows-about-disks-vhds?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json)
- [Azure infrastructure services implementation guidelines](https://review.docs.microsoft.com/en-us/azure/virtual-machines/virtual-machines-windows-infrastructure-virtual-machine-guidelines?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json)

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_Delete
summary: Delete a virtual machine from the specified resource group.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_Get
summary: Gets information about a virtual machine.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

For more information about the location of rescources, see [List all of the available geo-locations](../../api-ref/resources/subscriptions.json#Subscriptions_ListLocations).

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_Deallocate
summary: Shuts down the Virtual Machine and releases the compute resources.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

You are not billed for the compute resources that this Virtual Machine uses.

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_Generalize
summary: Generalizes the operating system on the virtual machine disk.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

You need to do these tasks to run this operation:

- Run sysprep on the virtual machine.
- Run the Capture operation after running this operation.

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_List
summary: Lists all of the virtual machine in the specified resource group.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

For more information about the location of rescources, see [List all of the available geo-locations](../../api-ref/resources/subscriptions.json#Subscriptions_ListLocations).

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_ListAll
summary: Lists all of the virtual machines in the specified subscription.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

For more information about the location of rescources, see [List all of the available geo-locations](../../api-ref/resources/subscriptions.json#Subscriptions_ListLocations).

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_ListAvailableSizes
summary: Lists all available virtual machine sizes to which the specified virtual machine can be resized.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
description: *content
---

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_PowerOff
summary: Stops a virtual machine. 
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

This operation only stops the virtual machine. The virtual machine can be restarted with the same provisioned resources. You are still charged for this virtual machine. If you want to stop a machine and not be charged for it, use Deallocate.

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_Restart
summary: Restarts a virtual machine.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content    
---

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_Start
summary: Starts a virtual machine.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_Redeploy
summary: Redeploys a virtual machine.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).