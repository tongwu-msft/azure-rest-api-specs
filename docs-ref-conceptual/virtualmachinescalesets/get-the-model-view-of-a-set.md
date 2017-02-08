---
title: "Get the model view of a set"
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
ms.assetid: 976bc11f-3f95-43c5-a154-2bd0844565da
caps.latest.revision: 10
ms.author: "davidmu"
manager: "timlt"
---
# Get the model view of a set
Retrieves information about the model  view of a virtual machine scale set.    
    
## Request    
 See [Common parameters and headers](../Topic/Virtual%20Machine%20Scale%20Sets_deleted.md#bk_common) for headers and parameters that are used by virtual machine scale sets.    
    
|Method|Request URI|    
|------------|-----------------|    
|GET|`https://management.azure.com/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Compute/VirtualMachineScaleSet/{vm-scaleset-name}?api-version={api-version}`|    
    
## Response    
 Status code: 200 (OK).    
    
```    
{     
  "name": "myscaleset1",    
  "id": "subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Compute/virtualMachineScaleSets/myscaleset1",    
  "tags": {    
    "department": "finance"          
  },     
  "location": "East US",    
  "sku": {    
    "name": "Standard_A1",    
    "tier": "Standard",    
    "capacity": 10          
  },     
  "properties": {    
    "overprovision": true,    
    "upgradePolicy": {    
      "mode": "Manual"    
    },       
    "virtualMachineProfile": {     
      "osProfile": {    
        "computerNamePrefix": "mycomputer",    
        "adminUsername": "username1",    
        "adminPassword": "*******",    
        "secrets": [ {      
          "sourceVault": {    
            "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.KeyVault/vaults/mykeyvault1"    
          },    
          "vaultCertificates": [ {    
            "certificateUrl": "https://mykeyvault1.vault.azure.net/secrets/{secret-name}/{secret-version}",    
            "certificateStore": "certificateStoreName",    
          } ]    
        } ],    
        "linuxConfiguration": {      
          "ssh": {      
            "publicKeys": [ {      
              "path":"path",    
              "keyData": "publickey"    
            } ]    
          }    
        },    
        "windowsConfiguration": {    
          "provisionVMAgent" : "true",    
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
          "enableAutomaticUpdates": true,    
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
            },    
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
          "vhdsContainers": [    
            "http://mystorage1.blob.core.windows.net/vhds",    
            "http://mystorage2.blob.core.windows.net/vhds"    
          ],    
          "caching" : "ReadWrite”,    
          "osType" : "Windows",    
        },    
        "imageReference": {     
          "publisher": "Microsoft.Windows",       
          "offer": "Windows2014",      
          "sku": "Enterprise",    
          "version": "latest"     
        },    
        "disks": [ {    
          "accountType": "Premium_LRS",    
          "diskId": "OSDisk",    
          "attributes": [ {     
            "name": "Encrypted",     
            "value": "True"    
          } ]    
        } ]    
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
                  "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet1"     
                },    
                "loadBalancerBackendAddressPools": [ {     
                  "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/loadBalancers/lb1/backendAddressPools/pool1"     
                } ],    
                "loadBalancerInboundNatPools": [ {    
                  "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/loadBalancers/lb1/inboundNatPools/pool1"    
                } ],    
                "applicationGatewayBackendAddressPools": [ {    
                  "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.Network/applicationGateways/appgateway1/backendAddressPools/pool1"    
                } ]    
              }    
            } ]    
          }    
        } ]    
      }    
    },    
    "provisioningState" : "creating"    
  }    
}    
    
```    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies the name of the virtual machine scale set.|    
|id|Specifies the identifier of the virtual machine scale set.|    
|tags|Specifies the tags that will be assigned to the virtual machine scale set.|    
|location|Specifies the supported Azure location where the resource exists.|    
|[sku](#sku)|Specifies configuration information for virtual machines in the scale set.|    
|[upgradePolicy](#upgradePolicy)|Specifies the mode of the upgrade policy.|    
|[virtualMachineProfile](#virtualMachineProfile)|Specifies configuration setting for the virtual machines in the scale set.|    
|provisioningState|Specifies the provisioning state of the virtual machine scale set.|    
|overprovision|Indicates whether over-provisioning should be enabled. An attempt is made to reliably provision the count of virtual machines requested in the value of the capacity element. The number of new virtual machines may over-provisioned. A success status is  returned  as soon as the capacity value is reached.<br /><br /> The count of successfully provisioned virtual machines is maximized while providing best-effort Fault Domain (FD) distribution. It is possible that in some cases, due to higher number of provisioning failures the FD distribution can be uneven.<br /><br /> Applications may start temporarily on over-provisioned virtual machines, but are terminated when the machines are deleted.<br /><br /> The over-provisioned virtual machines can be accessed using APIs while an operation is in progress. When the operation completes, the machines are deleted and no longer accessible.<br /><br /> This element is only used with version **2016-03-30** and higher.|    
    
###  <a name="sku"></a> sku    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies the size of virtual machines in the scale set.|    
|tier|Specifies the tier of virtual machines in the scale set.|    
|capacity|Specifies the number of virtual machines in the  scale set.|    
    
###  <a name="upgradePolicy"></a> upgradePolicy    
    
|Element name|Description|    
|------------------|-----------------|    
|mode|Specified the mode of an upgrade to virtual machines in the scale set.<br /><br /> Possible values are:<br /><br /> **Manual** - You  control the application of updates to virtual machines in the scale set. You do this by using the manualUpgrade action in [Manage all VMs in a set](../VirtualMachineScaleSetsREST/manage-all-vms-in-a-set.md).<br /><br /> **Automatic** - All virtual machines in the scale set are  automatically updated at the same time.|    
    
###  <a name="virtualMachineProfile"></a> virtualMachineProfile    
    
|Element name|Description|    
|------------------|-----------------|    
|[osProfile](#osProfile)|Specifies a common collection of settings for the operating system configuration for a virtual machine in the scale set.|    
|[extensionProfile](#extensionsProfile)|Specifies a collection of setting for extensions installed on virtual machines in the scale set.|    
|[storageProfile](#storageProfile)|Specifies a collection of settings for the storage account associated with the scale set.|    
|[networkProfile](#networkProfile)|Specifies a collection of setting for the virtual network associated with the scale set.|    
    
###  <a name="osProfile"></a> osProfile    
    
|Element name|Description|    
|------------------|-----------------|    
|computerNamePrefix|Specifies the computer name prefix for all the instances of virtual machines in the scale set. Computer names must be 1 to 15 characters long.|    
|adminUsername|Specifies the administrator account name to use for all the instances of virtual machines in the scale set.|    
|adminPassword|Specifies the administrator password to use for all the instances of virtual machines in a scale set.|    
|[secrets](#secrets)|Specifies a list of certificates that are added to virtual machines in the scale set.|    
|[linuxConfiguration](#linuxConfiguration)|Specifies the Linux operating system configuration settings.|    
|[windowsConfiguration](#windowsConfiguration)|Specifies the Windows Server operating system configuration settings.|    
    
###  <a name="secrets"></a> secrets    
    
|Element name|Description|    
|------------------|-----------------|    
|[sourceVault](#sourceVault)|Specifies the key vault to use.|    
|[vaultCertificates](#vaultCertificates)|The certificate store in LocalMachine on Windows Virtual Machine where the certificate should be added to.|    
    
###  <a name="sourceVault"></a> sourceVault    
    
|Element name|Description|    
|------------------|-----------------|    
|id|Specifies the uri of the Key Vault that contains all of the secrets.|    
    
###  <a name="vaultCertificates"></a> vaultCertificates    
    
|Element name|Description|    
|------------------|-----------------|    
|certificateUrl|Specifies the URL of the key vault secret.<br /><br /> {secret-version} is a  versioned key vault secret that is a Base64 encoding of the following JSON Object  encoded in UTF-8:<br /><br /> {   <br />  "data":"\<Base64-encoded-certificate>",   <br />  "dataType":"pfx",<br />  "password":"\<pfx-file-password>" <br />}|    
|certificateStore|Specifies the certificate store on the virtual machines in the scale set where the certificate is added.|    
    
###  <a name="linuxConfiguration"></a> linuxConfiguration    
    
|Element name|Description|    
|------------------|-----------------|    
|ssh|Specifies the ssh key configuration for a Linux OS.|    
|path|Specifies the Linux file path that the ssh keys or certificate should be placed at.|    
|keyData|Specifies a base64 encoded ssh public key.|    
    
###  <a name="windowsConfiguration"></a> windowsConfiguration    
    
|Element name|Description|    
|------------------|-----------------|    
|provisionVMAgent|Indicates whether virtual machine agent should be provisioned on the virtual machines in the scale set.|    
|[winRM](#winRM)|Specifies the Windows Remote Management listeners. This enables remote Windows PowerShell.|    
|[additionalUnattendContent](#additionalUnattendContent)|Specifies additional base-64 encoded XML formatted information that can be included in the Unattend.xml file, which is used by Windows Setup.|    
|enableAutomaticUpdates|Indicates whether virtual machines in the scale set are enabled for automatic updates.|    
    
###  <a name="winRM"></a> winRM    
    
|Element name|Description|    
|------------------|-----------------|    
|protocol|Specifies the protocol of listener.|    
|certificateUrl|Specifies URL of the key vault secrets.|    
    
###  <a name="additionalUnattendContent"></a> additionalUnattendContent    
    
|Element name|Description|    
|------------------|-----------------|    
|pass|Specifies the name of the pass that the content applies to. The only allowable value is oobeSystem.|    
|component|Specifies the name of the component to configure with the added content. The only allowable value is Microsoft-Windows-Shell-Setup.|    
|settingName|Specifies the name of the setting to which the content applies. Possible values are: FirstLogonCommands and AutoLogon.|    
|content|Specifies the base-64 encoded XML formatted content that is added to the unattend.xml file for the specified path and component.|    
    
###  <a name="extensionsProfile"></a> extensionProfile    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies the name of the extension.|    
|publisher|Specifies the name of the publisher of the extension.|    
|type|Specifies the type of the extension, i.e. “CustomScriptExtension”|    
|typeHandlerVersion|Specifies the version of the script handler.|    
|autoUpgradeMinorVersion|Indicates whether the extension should allow automatic upgrades if a newer minor version is discovered.|    
|fileUris|Specifies the URIs of the files that support the extension.|    
|commandToExecute|Specifies the command to run.|    
|protectedSettings|The extension can contain either protectedSettings or protectedSettingsFromKeyVault or no protected settings at all.|    
    
###  <a name="storageProfile"></a> storageProfile    
    
|Element name|Description|    
|------------------|-----------------|    
|[osDisk](#osDisk)|Specifies information about the operating system disk used by the virtual machines in the scale set.|    
|[imageReference](#imageReference)|Specifies information about the platform or marketplace image to use. This element is required when you want to use a platform or marketplace image, but is not used in other creation operations.|    
    
###  <a name="osDisk"></a> osDisk    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies the disk name.|    
|image|Specifies the blob uri for user image. Virtual machine scale set will create an os disk in the same container of the user image.|    
|vhdsContainers|Specifies the container urls that are used to store operating system disks for the scale set.|    
|caching|Specifies the caching type of the disk.|    
|osType|Specifies the type of operating system on the disk.|    
    
###  <a name="imageReference"></a> imageReference    
    
|Element name|Description|    
|------------------|-----------------|    
|publisher|Specifies the publisher of the image used to create the virtual machines in the scale set.|    
|offer|Specifies the offer of the image used to create the virtual machines in the scale set.|    
|sku|Specifies the SKU of the image used to create the virtual machines in the scale set.|    
|version|Specifies the version of the image used to create the virtual machine. You can use the value of latest to use the latest version of an image.|    
    
### disks    
    
|Element name|Description|    
|------------------|-----------------|    
|accountType|Specifies the type of account where the disk is stored.|    
|diskId|Specifies the identifier of the disk.|    
|attributes|Specifies name and value pairs that describe the disk.|    
    
###  <a name="networkProfile"></a> networkProfile    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies the name of the network interface configuration.|    
|primary|Indicates whether network interfaces created from the network interface configuration will be the primary NIC of the VM.|    
|[ipConfigurations](#ipConfigurations)|Specifies the IP configurations of the network interface.|    
    
###  <a name="ipConfigurations"></a> ipConfigurations    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies name of the IP configuration.|    
|subnet|Specifies the identifier of the subnet.|    
|loadBalancerBackendAddressPools|Specifies an array of references to backend address pools of load balancers. A scale set can reference backend address pools of one public and one internal load balancer.|    
|loadBalancerInboundNatPools|Specifies an array of references to inbound Nat pools of the load balancers. A scale set can reference backend address pools of one public and one internal load balancer.|    
|applicationGatewayBackendAddressPool|Specifies an array of references to backend address pools of application gateways. A scale set can reference backend address pools of multiple application gateways. Multiple scale sets cannot use the same application gateway.|