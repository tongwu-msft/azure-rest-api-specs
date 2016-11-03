---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_CreateOrUpdate
summary: Create or update a virtual machine in the specified subscription.
description: *content
---

For the update scenario, a PUT or PATCH request can be submitted with a subset of the VM properties. Alternatively, the RESTful way is to do a GET, tweak the properties and submit a PUT request. For non-updateable properties, it’s OK to be specify them in Update request but they must have the same values as returned by GET. For examples of different VM configurations, see [VM configurations](vm-configurations.md).
