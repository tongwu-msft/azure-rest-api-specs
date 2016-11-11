---
uid: management.azure.com/ComputeManagementClient/2016-03-30/AvailabilitySets_CreateOrUpdate
summary: Create or update an availability set for virtual machines.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that will contains the availability set. For more information about creating and managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

These links will be useful when creating the request:

- [List all of the available geo-locations](../../api-ref/resources/subscriptions.json#Subscriptions_ListLocations)
- [Using tags to organize your resources](https://review.docs.microsoft.com/en-us/azure/resource-group-using-tags?toc=%2fazure%2fazure-resource-manager%2ftoc.json)
- [Manage the availability of virtual machines](https://review.docs.microsoft.com/en-us/azure/virtual-machines/virtual-machines-windows-manage-availability?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json)

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/AvailabilitySets_Delete
summary: Deletes an availability set from the specified subscription.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the availability set. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/AvailabilitySets_Get
summary: Gets information about an availability set.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the availability set. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

For more information about the location of rescources, see [List all of the available geo-locations](../../api-ref/resources/subscriptions.json#Subscriptions_ListLocations).

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/AvailabilitySets_List
summary: Lists all availability sets in a subscription.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the availability set. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/AvailabilitySets_ListAvailableSizes
summary: Lists all available virtual machine sizes that can be used to create a new VM in an existing availability set.
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation.Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the availability set. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
description: *content
---

You must make sure that requests are secure. For more information, see [Authenticating Azure Resource Manager requests](https://review.docs.microsoft.com/en-us/azure/resource-group-authenticate-service-principal?toc=%2fazure%2fazure-resource-manager%2ftoc.json).