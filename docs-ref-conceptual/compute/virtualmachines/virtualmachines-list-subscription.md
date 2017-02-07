---
title: "Lists the virtual machines in a subscription"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
author: davidmu
manager: timt
---

# Lists the virtual machines in a subscription    
    
## Request    

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).

| Method | Request URI |    
|--------|-------------|    
| GET | `https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Compute/virtualmachines?api-version={apiVersion}` | 

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| apiVersion | The version of the API to use. The current version is 2017-03-30. |   
    
## Response    

Status code: If successful, the operation returns 200 (OK); otherwise 404 (Not Found) will be returned.    
    
```    
{    
  "value": [    
    {    
      "id": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM",    
      "name": "myVM",    
      "type": "Microsoft.Compute/virtualMachines",    
      "location": "westus",    
      "tags": {     
        "department": "finance"     
      },     
      "properties": {    
        "availabilitySet": {     
          "id": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/availabilitySets/myAVSet"     
        },    
        "hardwareProfile": {    
          "vmSize": "Standard_A0"    
        },    
        "storageProfile": {    
          "imageReference": {    
            "publisher": "MicrosoftWindowsServerEssentials",    
            "offer": "WindowsServerEssentials",    
            "sku": "WindowsServerEssentials",     
            "version": "1.0.131018"    
          },                
          "osDisk": {    
            "osType": "Windows",    
            "name": "osName-osDisk",    
            "vhd": {    
              "uri": "http://mystorage.blob.core.windows.net/vhds/osDisk.vhd"    
            },    
            "caching": "ReadWrite",    
            "createOption": "FromImage"    
          },    
          "dataDisks": []    
        },    
        "osProfile": {    
          "computerName": "virtualMachineName",    
          "adminUsername": "username",    
          "customData": "",     
          "windowsConfiguration": {    
            "provisionVMAgent": true,    
            "winRM": {    
              "listeners":[{    
                "protocol": "https",    
                "certificateUrl": "[parameters('certificateUrl')]"    
              }]    
            },    
            "winrRMListener" : {     
              "protocol" : "http|https",     
              "certificateUrl":"https://myvault.vault.azure.net/secrets/{secret}"    
            },     
            "additionalUnattendContent" : [     
            {     
              "pass" : "oobesystem",     
              "component" : "Microsoft-Windows-Shell-Setup",     
              "settingName" : "FirstLogonCommands|AutoLogon",     
              "content" : "<XML unattend content>"     
            }     
            "enableAutomaticUpdates": true    
          },    
          "secrets": []    
        },    
        "networkProfile": {    
          "networkInterfaces": [    
            {    
              "id": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Network/networkInterfaces/myNic"    
            }    
          ]    
        },    
        "provisioningState": "succeeded"    
      }    
    },    
    ... 
  ]    
}    
```    
    
| Element name | Description |    
|--------------|-------------|    
| Id | Specifies the identifying URL of the virtual machine. |    
| name | Specifies the name of the virtual machine. |    
| type | Specifies the type of compute resource. |    
| location | Specifies the supported Azure location where the resource exists. For more information, see [List all of the available geo-locations](../../../docs-ref-autogen/resources/subscriptions.json#Subscriptions_ListLocations). |    
| Tags | Specifies an identifier for the virtual machine. |    
| availabilitySet | Specifies the name of a collection of virtual machines. Virtual machines specified in the same availability set are allocated to different nodes to maximize availability. |    
| vmSize | Specifies the size of the virtual machine. |    
| publisher | Specifies the publisher of the image used to create the virtual machine. |    
| offer | Specifies the offer of the image used to create the virtual machine. |    
| sku | Specifies the sku of the image used to create the virtual machine. |    
| version | Specifies the version of the image used to create the virtual machine. |    
| osType | Specifies the operating system type. |    
| name | Specifies the disk name. |    
| Uri | Specifies the vhd uri. |    
| caching | Specifies the caching requirements. |    
| createOption | Specifies how the virtual machine was created. |    
| dataDisks | Specifies the parameters that are used to add a data disk to a virtual machine. |    
| computerName | Specifies the computer name. |    
| adminUsername | Specifies the admin username. |    
| customData | Specifies a base-64 encoded string of custom data. The base-64 encoded string is decoded to a binary array that is saved as a file on the virtual machine. The maximum length of the binary array is 65535 bytes. |    
| provisionVMAgent | Indicates whether virtual machine agent should be provisioned on the virtual machine. |    
| winrRMListener | Contains configuration settings for the Windows Remote Management service on the virtual machine. This enables remote Windows PowerShell. |    
| protocol | Specifies the protocol of listener. |    
| certificateUrl | Specifies the URL of the certificate with which new virtual machine is provisioned. |    
| additionalUnattendContent | Specifies additional base-64 encoded XML formatted information that can be included in the Unattend.xml file, which is used by Windows Setup. |    
| pass | Specifies the name of the pass that the content applies to. The only allowable value is oobeSystem. |
| component | Specifies the name of the component to configure with the added content. The only allowable value is Microsoft-Windows-Shell-Setup. |    
| settingName | Specifies the name of the setting to which the content applies. Possible values are: FirstLogonCommands and AutoLogon. |    
| content | Specifies the base-64 encoded XML formatted content that is added to the unattend.xml file for the specified path and component. |    
| enableAutomaticUpdates | Indicates whether virtual machine is enabled for automatic updates. |    
| secrets | Specifies set of certificates that should be installed onto the virtual machine. |    
| networkInterfaces | Specifies the network interfaces of the virtual machine. |    
| provisioningState | Specifies the provisioned state of the virtual machine. |