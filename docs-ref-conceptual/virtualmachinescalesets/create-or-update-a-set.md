---
title: "Create or update a scale set"
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
ms.assetid: fc8b7914-99e0-4975-b635-09c7726c79db
caps.latest.revision: 16
ms.author: "davidmu"
manager: "timlt"
robots: noindex
---

# Create or update a set
Create or updates a virtual machine scale set in the specified subscription.    
    
## Request 
   
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md). 

| Method | Request URI |    
|--------|-------------|    
|PUT or PATCH| `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vmScaleSet}?api-version={apiVersion}`|    

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that will contain the scale set. |
| vmScaleSet | The name of the scale set. |
| apiVersion | The version of the API to use. The current version is 2016-04-30-preview. |

The following example shows the request to create a new virtual machine scale set using managed disks:

```    
{     
  "tags": {    
    "key": "value"          
  },     
  "location": "East US",    
  "sku": {    
    "name": "Standard_A1",    
    "tier": "Standard",    
    "capacity": 10          
  },     
  "properties": {  
    "singlePlacementGroup": true,  
    "overprovision": true,    
    "upgradePolicy": {    
      "mode": "Manual"    
    },       
    "virtualMachineProfile": {     
      "osProfile": {    
        "computerNamePrefix": "myvmss",    
        "adminUsername": "username1",    
        "adminPassword": "********",    
        "secrets": [ {      
          "sourceVault": {    
            "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.KeyVault/vaults/mykeyvault1"    
          }    
          "vaultCertificates": [ {    
            "certificateUrl": "https://mykeyvault1.vault.azure.net/secrets/{secret-name}/{secret-version}",    
            "certificateStore": "certificateStoreName",    
          } ]    
        } ],    
        "linuxConfiguration": {      
          "ssh": {      
            "publicKeys": [ {      
              "path": "path",    
              "keyData": "publickey"    
            } ]    
          },    
        },    
        "windowsConfiguration": {    
          "provisionVMAgent": true,    
          "winRM": {    
            "listeners": [ {    
              "protocol": "https",    
              "certificateUrl": "https://mykeyvault1.vault.azure.net/secrets/{secret-name}/{secret-version}"    
            } ]    
          },    
          "additionalUnattendContent": {    
            "pass": "oobesystem",    
            "component": "Microsoft-Windows-Shell-Setup",    
            "settingName": "FirstLogonCommands",    
            "content": "<XML unattend content>"    
          },                 
          "enableAutomaticUpdates": true    
        }    
      },    
      "extensionProfile": {    
        "extensions": [ {    
          "name": "extensionName",    
          "properties": {    
            "publisher": "Microsoft.Compute",    
            "type": "CustomScriptExtension",    
            "typeHandlerVersion": "1.1",    
            "autoUpgradeMinorVersion": false,    
            "settings": {    
              "fileUris": [    
               "https://mystorage1.blob.core.windows.net/winvmextekfacnt/SampleCmd_1.cmd"    
              ],    
              "commandToExecute": "SampleCmd_1.cmd"    
            }    
            "protectedSettings": {    
              "StorageAccountKey": "storageaccount-key"    
            }    
          }    
        } ]    
      },    
      "storageProfile": {       
        "imageReference": {     
          "publisher": "Microsoft.Windows",       
          "offer": "Windows2014",      
          "sku": "Enterprise",    
          "version": "latest"     
        }
        "dataDisks": {
          {
            "lun": 0,
            "createOption": "Empty",
            "caching": "None",
            "managedDisk": {
              "storageAccountType": "Standard_LRS"
            },
            "diskSizeGB": 100
          }
        }    
      },    
      "networkProfile": {       
        "networkInterfaceConfigurations": [ {    
          "name": "nicconfig1",    
          "properties": {    
            "primary": true,    
            "ipConfigurations": [ {    
              "name": "ipconfig1",    
              "properties": {    
                "subnet": {     
                  "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet1"     
                },    
                "loadBalancerBackendAddressPools": [ {     
                  "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.Network/loadBalancers/lb1/backendAddressPools/pool1"     
                } ],    
                "loadBalancerInboundNatPools": [ {    
                  "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.Network/loadBalancers/lb1/inboundNatPools/pool1"    
                } ],    
                "applicationGatewayBackendAddressPools": [ {    
                  "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.Network/applicationGateways/appGate1/backendAddressPools/pool1"    
                } ]    
              }    
            } ]    
          }    
        } ]    
      }    
    }    
  }    
}    
    
```

The following example shows the request to create a new virtual machine scale set with an unmanged disk and a storage account:    
    
```    
{     
  "tags": {    
    "key": "value"          
  },     
  "location": "East US",    
  "sku": {    
    "name": "Standard_A1",    
    "tier": "Standard",    
    "capacity": 10          
  },     
  "properties": { 
    "singlePlacementGroup": true,   
    "overprovision": true,    
    "upgradePolicy": {    
      "mode": "Manual"    
    },       
    "virtualMachineProfile": {     
      "osProfile": {    
        "computerNamePrefix": "myvmss",    
        "adminUsername": "username1",    
        "adminPassword": "********",    
        "secrets": [ {      
          "sourceVault": {    
            "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.KeyVault/vaults/mykeyvault1"    
          }    
          "vaultCertificates": [ {    
            "certificateUrl": "https://mykeyvault1.vault.azure.net/secrets/{secret-name}/{secret-version}",    
            "certificateStore": "certificateStoreName",    
          } ]    
        } ],    
        "linuxConfiguration": {      
          "ssh": {      
            "publicKeys": [ {      
              "path": "path",    
              "keyData": "publickey"    
            } ]    
          },    
        },    
        "windowsConfiguration": {    
          "provisionVMAgent": true,    
          "winRM": {    
            "listeners": [ {    
              "protocol": "https",    
              "certificateUrl": "https://mykeyvault1.vault.azure.net/secrets/{secret-name}/{secret-version}"    
            } ]    
          },    
          "additionalUnattendContent": {    
            "pass": "oobesystem",    
            "component": "Microsoft-Windows-Shell-Setup",    
            "settingName": "FirstLogonCommands",    
            "content": "<XML unattend content>"    
          },                 
          "enableAutomaticUpdates": true    
        }    
      },    
      "extensionProfile": {    
        "extensions": [ {    
          "name": "extensionName",    
          "properties": {    
            "publisher": "Microsoft.Compute",    
            "type": "CustomScriptExtension",    
            "typeHandlerVersion": "1.1",    
            "autoUpgradeMinorVersion": false,    
            "settings": {    
              "fileUris": [    
               "https://mystorage1.blob.core.windows.net/winvmextekfacnt/SampleCmd_1.cmd"    
              ],    
              "commandToExecute": "SampleCmd_1.cmd"    
            }    
            "protectedSettings": {    
              "StorageAccountKey": "storageaccount-key"    
            }    
          }    
        } ]    
      },    
      "storageProfile": {    
        "osDisk": {    
          "name": "OSDiskName",    
          "image": {        
            "uri": "https://mystorage1.blob.core.windows.net/container/myosdisk1.vhd"    
          },    
          "vhdContainers": [    
            "http://mystorage1.blob.core.windows.net/vhds",    
            "http://mystorage2.blob.core.windows.net/vhds"    
          ],    
          "caching": "ReadWrite”,    
          "osType": "Windows",    
          "createOption": "FromImage"    
        },    
        "imageReference": {     
          "publisher": "Microsoft.Windows",       
          "offer": "Windows2014",      
          "sku": "Enterprise",    
          "version": "latest"     
        }    
      },    
      "networkProfile": {       
        "networkInterfaceConfigurations": [ {    
          "name": "nicconfig1",    
          "properties": {    
            "primary": true,    
            "ipConfigurations": [ {    
              "name": "ipconfig1",    
              "properties": {    
                "subnet": {     
                  "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet1"     
                },    
                "loadBalancerBackendAddressPools": [ {     
                  "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.Network/loadBalancers/lb1/backendAddressPools/pool1"     
                } ],    
                "loadBalancerInboundNatPools": [ {    
                  "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.Network/loadBalancers/lb1/inboundNatPools/pool1"    
                } ],    
                "applicationGatewayBackendAddressPools": [ {    
                  "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.Network/applicationGateways/appGate1/backendAddressPools/pool1"    
                } ]    
              }    
            } ]    
          }    
        } ]    
      }    
    }    
  }    
}    
    
```    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|tags|No|String|Specifies the tags that are assigned to the scale set. For more information about using tags, see [Using tags to organize your Azure resources](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-using-tags.md).|    
|location|Yes|String|Specifies the supported Azure location where the resource exists. For more information, see [List all of the available geo-locations](../../docs-ref-autogen/resources/subscriptions.json#Subscriptions_ListLocations) .|    
|[sku](#sku)|Yes|Complex Type|Specifies configuration information for virtual machines in the scale set.|    
|singlePlacementGroup|No|Boolean|Indicates whether the scale set is limited to a single placement group, of max size 100 virtual machines. Set this value to false for large scale sets, greater than 100 for platform images and greater than 40 for custom images. The default is true.|
|overprovision|No|Boolean|Indicates whether over-provisioning should be enabled. An attempt is made to reliably provision the count of virtual machines requested in the value of the capacity element. The number of new virtual machines may over-provisioned. A success status is  returned  as soon as the capacity value is reached.<br /><br /> The count of successfully provisioned virtual machines is maximized while providing best-effort Fault Domain (FD) distribution. It is possible that in some cases, due to higher number of provisioning failures the FD distribution can be uneven.<br /><br /> Applications may start temporarily on over-provisioned virtual machines, but are terminated when the machines are deleted.<br /><br /> The over-provisioned virtual machines can be accessed using APIs while an operation is in progress. When the operation completes, the machines are deleted and no longer accessible.<br /><br /> This element is only used with version **2016-03-30** and higher.|    
|[upgradePolicy](#upgradepolicy)|Yes|Complex Type|Specifies the mode of the upgrade policy.|    
|[virtualMachineProfile](#virtualmachineprofile)|Yes|Complex Type|Specifies configuration settings for the virtual machines in the scale set.|    
    
###  <a name="sku"></a> sku    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|name|Yes|String|Specifies the size of  virtual machines in a scale set.|    
|tier|No|String|Specifies the tier of virtual machines in a scale set.<br /><br /> Possible Values:<br /><br /> **Standard**<br /><br /> **Basic**|    
|capacity|Yes||Specifies the number of virtual machines in the scale set.|    

### <a name="plan"></a> plan    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| name | Yes | String | Specifies the name of the image from the marketplace. This is the same value that you use for Sku under the imageReference element. For more information about how to find image information, see [Navigating and Selecting Azure Virtual Machine images with PowerShell and the Azure CLI](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-cli-ps-findimage?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json)|    
| publisher | Yes | String | Specifies the publisher of the image. |    
| product | Yes | String | Specifies the product of the image from the marketplace. This is the same value as Offer under the imageReference element. |    
    
###  <a name="upgradepolicy"></a> upgradePolicy    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|mode|Yes|String|Specifies the mode of an upgrade to virtual machines in the scale set.<br /><br /> Possible values are:<br /><br /> **Manual** - You  control the application of updates to virtual machines in the scale set. You do this by using the manualUpgrade action in [Manage all VMs in a set](manage-all-vms-in-a-set.md).<br /><br /> **Automatic** - All virtual machines in the scale set are  automatically updated at the same time.|    
    
###  <a name="virtualmachineprofile"></a> virtualMachineProfile    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|[osProfile](#osprofile)|Yes|Complex Type|Specifies a common collection of settings for the operating system configuration for a virtual machine in the scale set.|    
|[extensionProfile](#extensionsprofile)|Yes|Complex Type|Specifies a collection of setting for extensions installed on virtual machines in the scale set.|    
|[storageProfile](#storageprofile)|Yes|Complex Type|Specifies a collection of settings for the storage account associated with the scale set.|    
|[networkProfile](#networkprofile)|Yes|Complex Type|Specifies a collection of setting for the virtual network associated with the scale set.|    
    
###  <a name="osprofile"></a> osProfile    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|computerNamePrefix|Yes|String|Specifies the computer name prefix for all of the virtual machines in the scale set. Computer name prefixes must be 1 to 15 characters long.|    
|adminUsername|Yes|String|Specifies the administrator account name to use for all the instances of virtual machines in the scale set.|    
|adminPassword|Yes|String|Specifies the administrator password to use for all the instances of virtual machines in a scale set.|    
|[secrets](#secrets)|No|Complex Type|Specifies a list of certificates that are added to virtual machines in the scale set.|    
|[linuxConfiguration](#linuxconfiguration)|No|Complex Type|Specifies the Linux operating system configuration settings.|    
|[windowsConfiguration](#windowsconfiguration)|No|Complex Type|Specifies the Windows Server operating system configuration settings.|    
    
###  <a name="secrets"></a> secrets    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|[sourceVault](#sourcevault)|Yes|Complex Type|Specifies the key vault to use.|    
|[vaultCertificates](#vaultcertificates)|Yes|Collection|The certificate store in LocalMachine on a Windows Virtual Machine where the certificate should be added to.|    
    
###  <a name="sourcevault"></a> sourceVault    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|id|Yes|String|Specifies the URI  of the key vault that contains all of the secrets.|    
    
###  <a name="vaultcertificates"></a> vaultCertificates    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|certificateUrl|Yes|String|Specifies the URI of the key vault secret.<br /><br /> {secret-version} is a  versioned key vault secret that is a Base64 encoding of the following JSON Object  encoded in UTF-8:<br /><br /> {   <br />  "data":"\<Base64-encoded-certificate>",   <br />  "dataType":"pfx",<br />  "password":"\<pfx-file-password>" <br />}|    
|certificateStore|Yes on Windows|String|Specifies the certificate store on the virtual machines in the scale set where the certificate is added.|    
    
###  <a name="linuxconfiguration"></a> linuxConfiguration    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|ssh|No|Collection|Specifies the ssh key configuration for a Linux OS.|    
|path|Yes|String|Specifies the Linux file path that the ssh keys or certificate should be placed at.|    
|keyData|Yes|String|Specifies a base64 encoded ssh public key.|    
    
###  <a name="windowsconfiguration"></a> windowsConfiguration    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|provisionVMAgent|No|Boolean|Indicates whether virtual machine agent should be provisioned on the virtual machines in the scale set.|    
|[winRM](#winrm)|No|Collection|Specifies the Windows Remote Management listeners. This enables remote Windows PowerShell.|    
|[additionalUnattendContent](#additionalunattendcontent)|No|Complex Type|Specifies additional base-64 encoded XML formatted information that can be included in the Unattend.xml file, which is used by Windows Setup.|    
|enableAutomaticUpdates|No|Boolean|Indicates whether virtual machines in the scale set are enabled for automatic updates.|    
    
###  <a name="winrm"></a> winRM    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|protocol|Yes|String|Specifies the protocol of listener.|    
|certificateUrl|No|String|Specifies URL of the key vault secrets.|    
    
###  <a name="additionalunattendcontent"></a> additionalUnattendContent    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|pass|Yes|String|Specifies the name of the pass that the content applies to. The only allowable value is oobeSystem.|    
|component|Yes|String|Specifies the name of the component to configure with the added content. The only allowable value is Microsoft-Windows-Shell-Setup.|    
|settingName|Yes|String|Specifies the name of the setting to which the content applies. Possible values are: FirstLogonCommands and AutoLogon.|    
|content|Yes|String|Specifies the base-64 encoded XML formatted content that is added to the unattend.xml file for the specified path and component.|    
    
###  <a name="extensionsprofile"></a> extensionProfile    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|name|Yes|String|Specifies the name of the extension.|    
|publisher|Yes|String|Specifies the name of the publisher of the extension.|    
|type|Yes|String|Specifies the type of the extension, i.e. “CustomScriptExtension”|    
|typeHandlerVersion|Yes|String|Specifies the version of the script handler.|    
|autoUpgradeMinorVersion|Yes|Boolean|Indicates whether the extension should allow automatic upgrades if a newer minor version is discovered.|    
|fileUris|No|Collection|Specifies the URIs of the files that support the extension.|    
|commandToExecute|Yes|String|Specifies the command to run.|    
|protectedSettings|No|Collection|The extension can contain either protectedSettings or protectedSettingsFromKeyVault or no protected settings at all.|    
    
###  <a name="storageprofile"></a> storageProfile    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|[osDisk](#osdisk)|No|Complex Type|Specifies information about the operating system disk used by the virtual machines in the scale set. If not specified, the operating sytem disk is created automatically.|    
|[imageReference](#imagereference)|No|Complex Type|Specifies information about the platform or marketplace image to use. This element is required when you want to use a platform or marketplace image, but is not used in other creation operations.|
|[dataDisks](#datadisks)|No|Collection|Specifies information about the data disks to be attached to the virtual machines in the scale set.|    
    
###  <a name="osdisk"></a> osDisk    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|name|No|String|Specifies the disk name.|    
|image|No|String|Specifies the blob uri for user image. A virtual machine scale set creates an os disk in the same container as the user image.<br /><br /> Updating the osDisk image causes the existing  disk to be deleted and a new one created with the new image. If the VM scale set is in Manual upgrade mode then the virtual machines are not updated until they have manualUpgrade  applied to them. See [Manage all VMs in a set](manage-all-vms-in-a-set.md) for more information.|    
|vhdContainers|No|Collection|Specifies the container urls that are used to store operating system disks for the scale set. If not specified, they are implicitly created.|    
|caching|No|String|Specifies the caching type of the disk.<br /><br /> Possible values are:<br /><br /> **None**<br /><br /> **ReadOnly**<br /><br /> **ReadWrite**. The default value is **None**.|    
|osType|Yes|String|Specifies the type of operating system on the disk.<br /><br /> Possible values are:<br /><br /> **Windows**<br /><br /> **Linux**|    
|createOption|No|String|Specifies how the virtual machine should be created. The only possible value is **FromImage**. which is used when you are using an image to create the virtual machine. If you are using a platform image, you will also use the imageReference element described below.|    

###  <a name="datadisks"></a> dataDisks    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|lun|Yes|Integer|Specifies the Logical Unit Number of the disk in each virtual machine in the scale set.|
|caching|No|String|Specifies the caching type of the disk. Possible values are: **None**, **ReadOnly**, **ReadWrite**. The default value is **None**.|
|createOption|No|String|Specifies how the disk should be created. Possible values are: **Empty** or **FromImage**.|
|diskSizeInGB|No|Integer|Specifies the size of the disk in GB. This element is required when creating an empty disk.|

###  <a name="imagereference"></a> imageReference    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|publisher|No|String|Specifies the publisher of the image used to create the virtual machines in the scale set. For more information about how to find image information, see [Navigating and Selecting Azure Virtual Machine images with PowerShell and the Azure CLI](https://azure.microsoft.com/en-us/documentation/articles/resource-groups-vm-searching/) .|    
|offer|No|String|Specifies the offer of the image used to create the virtual machines in the scale set.|    
|sku|No|String|Specifies the SKU of the image used to create the virtual machines in the scale set.|    
|version|No|String|Specifies the version of the image used to create the virtual machine. You can use the value of latest to use the latest version of an image.<br /><br /> Updating the version of an  image causes the existing  disk to be deleted and a new one created with the new version. If the VM scale set is in Manual upgrade mode then the virtual machines are not updated until they have manualUpgrade  applied to them. See [Manage all VMs in a set](manage-all-vms-in-a-set.md) for more information.|    
|Id|No|String|Specifies the resource identifier of a virtual machine image.|
|storageAccountType|No|String|Specifies the type of storage account to be used on the disk. Possible values are: **Standard_LRS** or **Premium_LRS**.

###  <a name="networkprofile"></a> networkProfile    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|name|Yes|String|Specifies the name of the network interface configuration.|    
|primary|Yes|Boolean|Indicates whether network interfaces created from the network interface configuration will be the primary NIC of the VM.|    
|[ipConfigurations](#ipconfigurations)|Yes|Collection|Specifies the IP configurations of the network interface.|    
    
###  <a name="ipconfigurations"></a> ipConfigurations    
    
|Element name|Required|Type|Description|    
|------------------|--------------|----------|-----------------|    
|name|Yes|String|Specifies name of the IP configuration.|    
|subnet|Yes|String|Specifies the identifier of the subnet.|    
|loadBalancerBackendAddressPools|No|Collection|Specifies an array of references to backend address pools of load balancers. A scale set can reference backend address pools of one public and one internal load balancer. Multiple scale sets cannot use the same load balancer.|    
|loadBalancerInboundNatPools|No|Collection|Specifies an array of references to inbound Nat pools of the load balancers. A scale set can reference inbound nat pools of one public and one internal load balancer. Multiple scale sets cannot use the same load balancer|    
|applicationGatewayBackendAddressPools|No|Collection|Specifies an array of references to backend address pools of application gateways. A scale set can reference backend address pools of multiple application gateways. Multiple scale sets cannot use the same application gateway.|    
    
 The following example shows a request to update a virtual machine scale set:    
    
```    
{     
  "tags": {    
    "key": "value"          
  },    
  "sku": {    
    "name": "Standard_A1",    
    "tier": "Standard",    
    "capacity": 10          
  },     
  "properties": {    
    "upgradePolicy": {    
      "mode": "Manual"    
    },       
    "virtualMachineProfile": {     
      "osProfile": {    
        "secrets": [ {      
          "sourceVault": {    
            "id": "/subscriptions/{subrciption-id}/resourceGroups/myrg1/providers/Microsoft.KeyVault/vaults/mykeyvault1"    
          }    
          "vaultCertificates": [ {    
            "certificateUrl": "https://mykeyvault1.vault.azure.net/secrets/{secret-name}/{secret-version}",    
            "certificateStore": "certificateStoreName",    
          } ]    
        } ]    
      },    
      "extensionProfile": {    
        "extensions": [ {    
          "name": "extensionName",    
          "properties": {    
            "publisher": "Microsoft.Compute",    
            "type": "CustomScriptExtension",    
            "typeHandlerVersion": "1.1",    
            "autoUpgradeMinorVersion": false,    
            "settings": {    
              "fileUris": [    
               "https://mystorage1.blob.core.windows.net/winvmextekfacnt/SampleCmd_1.cmd"    
              ],    
              "commandToExecute": "SampleCmd_1.cmd"    
            }    
            "protectedSettings": {    
              "StorageAccountKey": "storageaccount-key"    
            }    
          }    
        } ]    
      },    
      "storageProfile": {    
        "osDisk": {    
          "image": {        
            "uri": "https://mystorage1.blob.core.windows.net/container/myosdisk1.vhd"    
          },    
          "vhdContainers": [    
            "http://mystorage1.blob.core.windows.net/vhds",    
            "http://mystorage2.blob.core.windows.net/vhds"    
          ],    
          "caching": "ReadWrite",    
          "osType": "Windows",    
          "createOption": "FromImage"    
        },    
        "imageReference": {     
          "publisher": "Microsoft.Windows",       
          "offer": "Windows2014",      
          "sku": "Enterprise",    
          "version": "latest"     
        }    
      }    
  }    
  "networkProfile": {       
    "networkInterfaceConfigurations": [ {    
      "name": "nicconfig1",    
      "properties": {    
        "primary": true,    
        "ipConfigurations": [ {    
          "name": "ipconfig1",    
          "properties": {    
            "subnet": {     
              "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet1"     
            },    
            "loadBalancerBackendAddressPools": [ {     
              "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.Network/loadBalancers/lb1/backendAddressPools/pool1"     
            } ],     
            "loadBalancerInboundNatPools": [ {     
              "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.Network/loadBalancers/lb1/inboundNatPools/pool1"     
            } ],    
            "applicationGatewayBackendAddressPools": [ {     
              "id": "/subscriptions/{subscription-id}/resourceGroups/myrg1/providers/Microsoft.Network/applicationGateways /appgateway1/backendAddressPools/pool1"     
            } ]    
          }    
        } ]    
      }    
    } ]    
  }    
}    
    
}    
    
```    

## Examples

### Marketplace image

The following example shows the additional plan element that is required when you use a marketplace image:

```
{
  "id": "/subscriptions/{subscription-id/resourceGroups/myresourcegroup1/providers/Microsoft.Compute/virtualMachineScaleSets/myvmss1",
  "name": "myvmss1",
  "type": "Microsoft.Compute/virtualMachineScaleSets",
  "location": "westus",
  "tags": { 
    "department": "finance" 
   }, 
  "plan": {
    "name": "imageName",
    "publisher": "imagePublisher",
    "product": "imageProduct"
  },
  "properties": {
  ...
```
    
### Response    

Status code: 201 (Created).
