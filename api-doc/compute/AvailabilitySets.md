---
uid: management.azure.com/ComputeManagementClient/2016-03-30/AvailabilitySets_CreateOrUpdate
summary: Create or update an availability set for virtual machines.
---

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/AvailabilitySets_CreateOrUpdate
parameters:
    - name: api-version
      description: Use the latest version of 2016-03-30.
    - name: location
      description: Specifies the supported Azure location where the resource exists. For more information, see [List all of the available geo-locations](../../api-ref/resources/subscriptions.json#Subscriptions_ListLocations).
    - name: tags
      description: Specifies the tags that will be assigned to the availability set. A tag is a key value pair used to identify a resource. For more information, see [Using tags to organize your resources](https://azure.microsoft.com/en-us/documentation/articles/resource-group-using-tags/).
    - name: platformUpdateDomainCount
      description: Specifies the number of update domains that are used. For more information , see [Manage the availability of virtual machines](https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-windows-manage-availability/) If this element is not specified, the default value of 5 is used. A maximum of 20 fault domains can be used.
    - name: platformFaultDomainCount
      description: Specifies the number of fault domains that are used. For more information , see [Manage the availability of virtual machines](https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-windows-manage-availability/) If this element is not specified, the default value of 3 is used. A maximum of 3 fault domains can be used.
---
