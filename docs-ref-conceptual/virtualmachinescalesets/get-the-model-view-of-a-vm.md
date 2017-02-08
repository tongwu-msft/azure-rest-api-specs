---
title: "Get the model view of a VM"
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
ms.assetid: 3f3a7723-2d3b-401a-91be-6825a08c209b
caps.latest.revision: 12
ms.author: "davidmu"
manager: "timlt"
---
# Get the model view of a VM
Retrieves information about the model view of a virtual machine in the specified virtual machine scale set.    
    
## Request  

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).    
    
|Method|Request URI|    
|------------|-----------------|    
|GET|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/VirtualMachineScaleSets/{vmScaleSet}/virtualMachines/{vmInstanceId}?api-version={apiVersion}`|    
    
| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that will contain the virtual machine. |
| vmScaleSet | The name of the scale set. |
| apiVersion | The version of the API to use. The current version is 2016-04-30-preview. |    
    
## Response    

Status code: 200 (OK).    

```    
{     
  "instanceId": "1",    
  "tags": {    
    "key": "value"          
  },     
  "sku": {    
    "name": "Standard_A1",    
    "tier": "Standard",    
    "capacity": 10    
  },     
  "properties": {    
    "latestModelApplied" : true,    
    "storageProfile": {    
      "osDisk": {    
        "osType": "Windows",    
        "name": "OSDiskName",    
        "creationOption": "FromImage",    
        "vhd": {    
          "uri": "https://mystorage1.blob.core.windows.net/container/mydisk.vhd"    
        },    
        "caching": "ReadWrite”,    
      },    
    },    
    "osProfile": {    
      "computerName": "mycomputer1",    
      "adminUsername": "username1",    
      "adminPassword": "*********",    
      "secrets": [ {    
        "sourceVault": {    
          "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.KeyVault/vaults/mykeyvault1"    
        },    
        "vaultCertificates": [ {    
          "certificateUrl": "https://mykeyvault1.vault.azure.net/secrets/{secret-name}/{secret-version}",    
          "certificateStore": "certificateStoreName"    
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
        "provisionVMAgent": "true",    
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
      "secrets": [ {    
        "sourceVault": {    
          "id": "/subscriptions/{sub-id}/resourceGroups/myrg1/providers/Microsoft.KeyVault/vaults/myvault1"    
        }    
       "vaultCertificates": [ {    
          "certificateUrl": "https://mykeyvault1.vault.azure.net/secrets/{secret-name}/{secret-version}",    
          "certificateStore": "certificateStoreName"    
         } ]    
      } ]    
    },    
    "networkProfile": {     
      "networkInterfaces": [ {    
        "id":"/subscriptions/s1/resourceGroups/g1/providers/Microsoft.Compute/virtualMachineScaleSets/ss1/virtualMachines/1/networkInterfaces/nicconfig1",    
      } ]    
    }    
  }    
  "resources": {    
    "extensions": [ {    
      "type": "Microsoft.Compute/virtualMachineScaleSets/extensions",    
      "name": "MyCustomScriptExtension",    
      "location": "East US",     
      "tags": {             
        "key": "value"    
      },      
      "properties": {    
        "publisher": "Microsoft.Compute",    
        "type": "CustomScript",    
        "typeHandlerVersion": "1.2",    
        "id": "/subscriptions/subid/resourceGroups/resourceGroupName/providers/Microsoft.Compute/VirtualMachineScaleSets/vms01/extensions/MyCustomScriptExtension",    
        "settings": {    
          "commandToExecute": "powershell.exe-Filescript1.ps1",    
          "fileUris": [    
            "uri1"    
          ]    
        },    
        "provisioningState": "creating"    
      }    
    } ]    
    "provisioningState": "Succeeded",    
  }    
  "name" : "{vmssname}_{instanceId}",    
  "type": "Microsoft.Compute/virtualMachineScaleSets/virtualMachines",    
  "location": "East US"    
}    
    
```    
    
|Element name|Description|    
|------------------|-----------------|    
|instanceId|Specifies the unique identifier of the virtual machine.|    
|tags|Specifies the tags that are assigned to the virtual machine. For more information about using tags, see [Using tags to organize your Azure resources](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-using-tags.md).|    
|[sku](#sku)|Specifies configuration information for virtual machine.|    
|latestModelApplied|Specifies whether the latest virtual machine scale set model is applied to this virtual machine or not. <br />;<br /><br /> **true** - Indicates that the latest virtual machine scale set model is applied to this virtual machine.<br /><br /> **false** -  Indicates **manualUpgrade** mode is being used and this virtual machine hasn’t been manually upgraded yet.|    
|[storageProfile](#storageProfile)|Specifies a collection of settings for the storage account associated with the virtual machine.|    
|[osProfile](#osProfile)|Specifies a common collection of settings for the operating system configuration of the virtual machine.|    
|[networkProfile](#networkProfile)|Specifies a collection of setting for the virtual network associated with the virtual machine.|    
|[resources](#resources)|Specifies the extension resources associated with the virtual machine.|    
|name|Specifies the name of the virtual machine.|    
|location|Specifies the supported Azure location where the resource exists. For more information, see [List all of the available geo-locations](../../docs-ref-autogen/resources/subscriptions.json#Subscriptions_ListLocations) .|    
    
###  <a name="sku"></a> sku    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies the size of the virtual machine.|    
|tier|Specifies the tier of virtual machine.<br /><br /> Possible Values:<br /><br /> **Standard**<br /><br /> **Basic**|    
|capacity|Specifies the number of  virtual machines in the  scale set.|    
    
###  <a name="osProfile"></a> osProfile    
    
|Element name|Description|    
|------------------|-----------------|    
|computerName|Specifies the computer name for the virtual machine.|    
|adminUsername|Specifies the administrator account name of the virtual machine.|    
|adminPassword|Specifies the administrator password of the virtual machine.|    
|[secrets](#secrets)|Specifies a list of certificates on the virtual machine.|    
|[linuxConfiguration](#linuxConfiguration)|Specifies the Linux operating system configuration settings.|    
|[windowsConfiguration](#windowsConfiguration)|Specifies the Windows Server operating system configuration settings.|    
    
###  <a name="secrets"></a> secrets    
    
|Element name|Description|    
|------------------|-----------------|    
|[sourceVault](#sourceVault)|Specifies the key vault to use.|    
|[vaultCertificates](#vaultCertificates)|The certificate store in LocalMachine on windows Virtual Machine where the certificate should be added to.|    
    
###  <a name="sourceVault"></a> sourceVault    
    
|Element name|Description|    
|------------------|-----------------|    
|id|Specifies the uri of the Key Vault that contains all of the secrets.|    
    
###  <a name="vaultCertificates"></a> vaultCertificates    
    
|Element name|Description|    
|------------------|-----------------|    
|certificateUrl|Specifies the URI of the key vault secrets.<br /><br /> {secret-version} is a  versioned key vault secret that is a Base64 encoding of the following JSON Object  encoded in UTF-8:<br /><br /> {   <br />  "data":"\<Base64-encoded-certificate>",   <br />  "dataType":"pfx",<br />  "password":"\<pfx-file-password>" <br />}|    
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
|certificateUrl|Specifies the URI of the key vault secrets.|    
    
###  <a name="additionalUnattendContent"></a> additionalUnattendContent    
    
|Element name|Description|    
|------------------|-----------------|    
|pass|Specifies the name of the pass that the content applies to. The only allowable value is oobeSystem.|    
|component|Specifies the name of the component to configure with the added content. The only allowable value is Microsoft-Windows-Shell-Setup.|    
|settingName|Specifies the name of the setting to which the content applies. Possible values are: FirstLogonCommands and AutoLogon.|    
|content|Specifies the base-64 encoded XML formatted content that is added to the unattend.xml file for the specified path and component.|    
    
###  <a name="storageProfile"></a> storageProfile    
    
|Element name|Description|    
|------------------|-----------------|    
|[osDisk](#osDisk)|Specifies information about the operating system disk used by the virtual machines in the scale set.|    
|[imageReference](#imageReference)|Specifies information about the platform or marketplace image to use. This element is required when you want to use a platform or marketplace image, but is not used in other creation operations.|   
|[dataDisks](#dataDisks)|Specifies information about the data disks used by the virtual machines in the scale set. Only used for a scale set with managed disks.| 
    
###  <a name="osDisk"></a> osDisk    
    
|Element name|Description|    
|------------------|-----------------|    
|name|Specifies the disk name.|    
|image|Specifies the blob uri for user image.|    
|vhd|Specifies the url that is used to store operating system disk.|    
|caching|Specifies the caching type of the disk.|    
|osType|Specifies the type of operating system on the disk.|
|[managedDisk](#managedDisk)|Specifies the managed disk parameters of the disk. This element is only used for scale sets with managed disks.|    

###  <a name="dataDisks"></a> dataDisks    
    
|Element name|Description|    
|------------------|--------------|----------|-----------------|    
|lun|Specifies the Logical Unit Number of the of the disk in the virtual machine.|
|caching|Specifies the caching type of the disk.|
|createOption|Specifies how the disk was created.|
|diskSizeInGBSpecifies the size of the disk in GB.|

###  <a name="managedDisk"></a> managedDisk   
    
|Element name|Description|    
|------------------|--------------|----------|-----------------|    
|storageAccountType|Specifies the type of storage account used to create the disk.|

###  <a name="imageReference"></a> imageReference    
    
|Element name|Description|    
|------------------|-----------------|    
|publisher|Specifies the publisher of the image used to create the virtual machine.|    
|offer|Specifies the offer of the image used to create the virtual machine.|    
|sku|Specifies the SKU of the image used to create the virtual machine.|    
|version|Specifies the version of the image used to create the virtual machine.|
|Id|Specifies the resource identifier of a virtual machine image used to create the virtual machine.|
    
###  <a name="networkProfile"></a> networkProfile    
    
|Element name|Description|    
|------------------|-----------------|    
|id|Specifies the name of the network interface configuration.|    
|primary|Indicates whether network interfaces created from the network interface configuration will be the primary NIC of the VM.|    
    
###  <a name="resources"></a> resources    
    
|Element name|Description|    
|------------------|-----------------|    
|type|Specifies the type of the resource, i.e. “Microsoft.Compute/virtualMachineScaleSets/extensions”|    
|name|Specifies the name of the extension.|    
|location|Specifies the location of the resource.|    
|tags|Specifies the tags that are assigned to the resource.|    
|publisher|Specifies the publisher of the extension.|    
|type|Specifies the type of the extension.|    
|typeHandlerVersion|Specifies the version of the script handler.|    
|id|Specifies the identifier of the extension.|    
|commandToExecute|Specifies the command to run.|    
|fileUris|Specifies the URIs of the files that support the extension.|    
|provisioningState|Specifies the provisioning state of the extension.|