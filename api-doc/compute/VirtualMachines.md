---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_CreateOrUpdate
summary: Create or update a virtual machine in the specified subscription.
description: *content
---

The creation of a virtual machine involves an Azure Storage account and typically resources such as a network interface or availability set. For more information about creating these resources, see:

- [Create a resource group](../resources/resourcegroups#ResourceGroups_CreateOrUpdate)
- [Create a storage account](../storage/storageaccounts#StorageAccounts_Create)
- [Create a virtual network](../network/virtualnetworks#VirtualNetworks_CreateOrUpdate)
- [Create a network interface](../network/networkinterfaces#NetworkInterfaces_CreateOrUpdate)
- [Create a public IP address](../network/publicipaddresses#PublicIPAddresses_CreateOrUpdate)
- [Create an availability set](./availabilitysets#AvailabilitySets_CreateOrUpdate)

For the update scenario, a PUT or PATCH request can be submitted with a subset of the VM properties. Alternatively, the RESTful way is to do a GET, tweak the properties and submit a PUT request. For non-updateable properties, it’s OK to be specify them in Update request but they must have the same values as returned by GET. For examples of different VM configurations, see [VM configurations](vm-configuration.md).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_CreateOrUpdate#parameters/ApiVersionParameter
description: Use 2015-05-01-preview as the current version.
---

