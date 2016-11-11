---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachineScaleSetVMs_List
summary: Lists all virtual machines in a VM scale set.
description: *content
---
>[!NOTE]
>This resource can also be used to list the [instance views](#VirtualMachineScaleSetVMs_GetInstanceView) of all the virtual machines in the scale set. Use this URI with the HTTP GET verb instead. The difference here is that you set the `$select` and `$expand` parameters to **instanceView**.
>
>`GET .../{virtualMachineScaleSetName}/virtualMachines?$expand=instanceView&$select=instanceView&api-version={api-version}` 


---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachineScaleSetVMs_GetInstanceView
summary: Gets the status of a virtual machine in a VM scale set.
description: *content
---

>[!TIP]
>While this resource will return you an instance view of the specified virtual machine instance, it may be easier to return all virtual machine's instance views. This can be done on the [/virtualMachines](#VirtualMachineScaleSetVMs_List) resource.






---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachineScaleSetVMs_Reimage
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
---

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachineScaleSetVMs_Deallocate
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
---

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachineScaleSetVMs_Delete
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
---

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachineScaleSetVMs_GetInstanceView
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
---

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachineScaleSetVMs_List
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
---

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachineScaleSetVMs_PowerOff
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
---

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachineScaleSetVMs_Restart
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
---

---
uid: management.azure.com/ComputeManagementClient/2016-03-30/VirtualMachineScaleSetVMs_Start
parameters:
    - name: api-version
      description: The API version of the resource provider to use for this operation. Use the latest version of 2016-03-30.
    - name: subscriptionId
      description: The identifier of the target subscription. To get a list of subscriptions for a tenant, use [List all aubscriptions](../../api-ref/resources/subscriptions.json#Subscriptions_List).
    - name: resourceGroupName
      description: The name of the resource group that contains the virtual machine. For more information about managing resource groups, see [Resource Groups](../../api-ref/resources/resourcegroups.json).
---
