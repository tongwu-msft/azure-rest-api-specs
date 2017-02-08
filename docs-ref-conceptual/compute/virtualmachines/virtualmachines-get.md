---
title: "Get information about a virtual machine"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# Get information about a virtual machine    
    
## Request 

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md). 
    
| Method | Information View | Request URI |    
|--------|------------------|-------------|     
| GET | Model View | `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/virtualMachines/{vm}?api-version={apiVersion}` | 
| GET | Instance View | `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/virtualMachines/{vm}/InstanceView?api-version={apiVersion}` |
| GET | Model View and Instance View | `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/virtualMachines/{vm}?$expand=instanceView&api-version={apiVersion}` |  
  
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that contains the virtual machine. |
| vm | The name of the virtual machine to get information about. |
| apiVersion | The version of the API to use. The current version is 2016-04-30-preview. |    
    
## Response    
 
Status code: If successful, the operation returns 200 (OK); otherwise 404 (Not Found) is returned.    
    
**Model view of a virtual machine**    
    
```    
{    
   "id":"/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM",  
   "vmId": "{vm-id}",  
   "name":"virtualMachineName”,    
   "type":"Microsoft.Compute/virtualMachines",    
   "location":"westus",    
   "tags":{    
      "department":"finance"    
   },    
   "properties":{    
      "licenseType": "Windows_Server",    
      "availabilitySet":{    
         "id":"/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/availabilitySets/myAVSet"    
      },    
      "hardwareProfile":{    
         "vmSize":"Standard_A0"    
      },    
      "storageProfile":{    
         "imageReference":{    
            "publisher":"MicrosoftWindowsServerEssentials",    
            "offer":"WindowsServerEssentials",    
            "sku":"WindowsServerEssentials",    
            "version":"1.0.131018"    
         },    
         "osDisk":{    
            "osType":"Windows",    
            "name":"osName-osDisk",    
            "vhd":{    
               "uri":"http://mystorage.blob.core.windows.net/vhds/osDisk.vhd"    
            },    
            "caching":"ReadWrite",    
            "createOption":"FromImage"    
         },    
         "dataDisks":[    
    
         ]    
      },    
      "osProfile":{    
         "computerName":"virtualMachineName",    
         "adminUsername":"username",    
         "adminPassword":"password",    
         "customData":"",    
         "windowsConfiguration":{    
            "provisionVMAgent":true,    
            "winRM": {    
               "listeners":[{    
               "protocol": "https",    
               "certificateUrl": "[parameters('certificateUrl')]"    
               }]    
            },    
            “additionalUnattendContent”:[    
               {    
                  “pass”:“oobesystem”,    
                  “component”:“Microsoft-Windows-Shell-Setup”,    
                  “settingName”:“FirstLogonCommands|AutoLogon”,    
                  “content”:“<XML unattend content>”    
               }               "enableAutomaticUpdates":true    
            },    
            "secrets":[    
    
            ]    
         },    
         "networkProfile":{    
            "networkInterfaces":[    
               {    
                  "id":"/subscriptions/########-####-####-####-############/resourceGroups/CloudDep/providers/Microsoft.Network/networkInterfaces/myNic"    
               }    
            ]    
         },    
         "provisioningState":"succeeded"    
      }    
   }    
```    
    
| Element name | Description |    
|--------------|-------------|    
| Id | Specifies the identifying URL of the virtual machine. |   
| vmId | Specifies the VM unique ID, which is a 128-bits identifier that is encoded and stored in all Azure IaaS VMs SMBIOS and can be read using platform BIOS commands. |  
| name | Specifies the name of the virtual machine. |    
| type | Specifies the type of compute resource. |    
| location | Specifies the supported Azure location where the resource exists. For more information, see [List all the available geo-locations](../../../docs-ref-autogen/resources/subscriptions.json#Subscriptions_ListLocations). |    
| tags | Specifies an identifier for the virtual machine. |    
| licenseType | Specifies that the image or disk that is being used was licensed on-premises. This element is only used for images that contain the Windows Server operating system.<br><br> Possible values are: <br><br> Windows_Client <br><br> Windows_Server |    
| availabilitySet | Specifies the name of a collection of virtual machines. Virtual machines specified in the same availability set are allocated to different nodes to maximize availability. |    
| vmSize | Specifies the size of the virtual machine. |    
| publisher | Specifies the publisher of the image used to create the virtual machine. |    
| offer | Specifies the offer of the image used to create the virtual machine. |    
| sku | Specifies the sku of the image used to create the virtual machine. |    
| version | Specifies the version of the image used to create the virtual machine. |    
| osType | Specifies the type of operating system. |    
| name | Specifies the disk name. |    
| Uri | Specifies the vhd uri. |    
| caching | Specifies the caching requirements. |    
| createOption | Specifies how the virtual machine was created. |    
| dataDisks | Specifies the parameters that are used to add a data disk to a virtual machine. |    
| computerName | Specifies the computer name. |    
| adminUsername | Specifies the admin username. |    
| adminPassword | Specifies the admin password. |    
| customData | Specifies a base-64 encoded string of custom data. The base-64 encoded string is decoded to a binary array that is saved as a file on the Virtual Machine. The maximum length of the binary array is 65,535 bytes. |    
| provisionVMAgent | Indicates whether virtual machine agent should be provisioned on the virtual machine. |    
| winrRMListener | Contains configuration settings for the Windows Remote Management service on the virtual machine. This element enables remote Windows PowerShell. |    
| protocol | Specifies the protocol of listener. |    
| certificateUrl | Specifies the URL of the certificate with which new virtual machines are provisioned. |    
| additionalUnattendContent | Specifies additional base-64 encoded XML formatted information that can be included in the Unattend.xml file, which is used by Windows Setup. |    
| pass | Specifies the name of the pass that the content applies to. The only allowable value is oobeSystem. |
| component | Specifies the name of the component to configure with the added content. The only allowable value is Microsoft-Windows-Shell-Setup. |    
| settingName | Specifies the name of the setting to which the content applies. Possible values are: FirstLogonCommands and AutoLogon. |    
| content | Specifies the base-64 encoded XML formatted content that is added to the unattend.xml file for the specified path and component. |    
| enableAutomaticUpdates | Indicates whether virtual machine is enabled for automatic updates. |    
| secrets | Specifies set of certificates that should be installed onto the virtual machine. |    
| networkInterfaces | Specifies the network interfaces of the virtual machine. |    
    
**Instance view of the virtual machine**    
    
```    
{    
  "platformUpdateDomain": 0,    
  "platformFaultDomain": 0,    
  "vmAgent": {    
    "vmAgentVersion": "2.5.1198.709",    
    "statuses": [    
      {    
        "code": "ProvisioningState/succeeded",    
        "level": "Info",    
        "displayStatus": "Ready",    
        "message": "GuestAgent is running and accepting new configurations.",    
        "time": "2015-04-21T11:42:44-07:00"    
      }    
    ]    
  },    
  "disks": [    
    {    
      "name": "myosdisk",    
      "statuses": [    
        {    
          "code": "ProvisioningState/succeeded",    
          "level": "Info",    
          "displayStatus": "Provisioning succeeded",    
          "time": "2015-04-10T12:44:10.4562812-07:00"    
        }    
      ]    
    }    
  ],    
  "statuses": [    
    {    
      "code": "ProvisioningState/succeeded",    
      "level": "Info",    
      "displayStatus": "Provisioning succeeded",    
      "time": "2015-04-10T12:50:09.0031588-07:00"    
    },    
    {    
      "code": "PowerState/running",    
      "level": "Info",    
      "displayStatus": "VM running"    
    }    
  ]    
}    
    
```    
    
| Element name | Description |    
|--------------|-------------|    
| platformUpdateDomain | Specifies the update domain of the virtual machine. |    
| platformFaultDomain | Specifies the fault domain of the virtual machine. |    
| vmAgent | Captures guest agent status. |    
| disks | Captures disks status. |    
| statuses | Captures virtual machines status. |