---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachines_CreateOrUpdate
remarks: *content
---

# Remarks

This shows an example of creating a VM from a generalized/sysprepped user image. The key things to notice are the value fromImage for the createOption property and image.uri and vhd.uri properties in the osDisk object. image.uri is the location of your image and vhd.uri is where that disk will be copied to and the VM be booted from.
