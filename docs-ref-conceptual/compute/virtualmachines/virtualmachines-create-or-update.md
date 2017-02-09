---
title: "Create or update a virtual machine"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# Create or update a virtual machine 

For the update scenario, a PUT or PATCH request can be submitted with a subset of the VM properties. Alternatively, the RESTful way is to do a GET, tweak the properties and submit a PUT request. For non-updateable properties, you can specify them in the update request but they must have the same values as returned by GET.   
    
## Request    
 
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).    
    
| Method | Request URI |    
|--------|-------------|    
| PUT | `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/virtualMachines/{vm}&api-version={apiVersion}` |    

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| resourceGroup | The resource group that will contain the virtual machine. |
| vm | The name of the virtual machine. |
| apiVersion | The version of the API to use. The current version is 2016-04-30-preview. |

 The following example shows the request body for creating a virtual machine from a platform image. For examples of creating virtual machines in other ways, see the Examples section below.    
    
```    
{
  "name": "myvm1",
  "location": "westus",
  "tags": {
    "department": "finance"
  },
  "properties": {
    "licenseType": "Windows_Server | Windows_Client",
    "availabilitySet": {
      "id": "/subscriptions/{subscription-id}/resourceGroups/myresourcegroup1/providers/Microsoft.Compute/availabilitySets/myav1"
    },
    "hardwareProfile": {
      "vmSize": "Standard_A0"
    },
    "storageProfile": {
      "imageReference": {
        "publisher": "Publisher Name",
        "offer": "Publisher Offer",
        "sku": "Offer SKU",
        "version": "Version for the image" // Can also specify "latest" to automatically get the latest image
      },
      "osDisk": {
        "name": "myosdisk1",
        "vhd": {
          "uri": "http://mystorage1.blob.core.windows.net/vhds/myosdisk1.vhd"
        },
        "caching": "ReadOnly | ReadWrite", // Changing this value causes VM to reboot
        "createOption": "fromImage | attach",
        "encryptionSettings": {
          "enabled": true,
          "diskEncryptionKey": {
            "sourceVault": {
              "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.KeyVault/vaults/{vaultName}"
            },
            "secretUrl": "https://mykeyvault.vault.azure.net/secrets/{secret-name}/{secret-version}"
          },
          "keyEncryptionKey": {
            "sourceVault": {
              "id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.KeyVault/vaults/{vaultName}"
            },
            "keyUrl": "https://mykeyvault.vault.azure.net/keys/{key-name}/{key-version}"
          }
        }
      },
      "dataDisks": [
        // sample of creating empty data disk
        {
          "name": "mydatadisk1",
          "diskSizeGB": "1",
          "lun": 0,
          "vhd": {
            "uri": "http://mystorage.blob.core.windows.net/vhds/mydatadisk1.vhd"
          },
          "createOption": "empty"
        },
        // sample of attaching an existing VHD as a data disk
        {
          "name": "mydatadisk2",
          "diskSizeGB": "1",
          "lun": 1,
          "vhd": {
            "uri": "http://mystorage.blob.core.windows.net/vhds/mydatadisk2.vhd"
          },
          "createOption": "attach"
        },
        {
          // sample of attaching a data disk from image
          "name": "mydatadisk3",
          "diskSizeGB": "1",
          "lun": 2,
          "image": { // specifies the location of the data disk vhd when creating the vm from user image
            "uri": "http: //storagename.blob.core.windows.net/vhds/VMImageName-datadisk.vhd"
          },
          "vhd": {
            "uri": "http://mystorage.blob.core.windows.net/vhds/mydatadisk3.vhd"
          },
          "createOption": "fromImage"
        }
      ]
    },
    "osProfile": {
      "computerName": "myvm1",
      "adminUsername": "username",
      "adminPassword": "password",
      "customData": "",
      "windowsConfiguration": {
        "provisionVMAgent": true|false,
        "winRM": {
          "listeners": [
            {
              "protocol": "http"
            },
            {
              "protocol": "https",
              "certificateUrl": "url-to-key-vault-secret-that-has-the-certificate"
            }
          ]
        },
        "additionalUnattendContent": {
          "pass": "oobesystem",
          "component": "Microsoft-Windows-Shell-Setup",
          "settingName": "FirstLogonCommands|AutoLogon",
          "content": "<XML unattend content>"
        },
        "enableAutomaticUpdates": true|false,
        "timeZone": "Pacific Standard Time"
      },
      "linuxConfiguration": {
        "disablePasswordAuthentication": true|false,
        "ssh": {
          "publicKeys": [
            {
              "path": "Path-Where-To-Place-Public-Key-On-VM",
              "keyData": "PEM-Encoded-public-key-file"
            }
          ]
        }
      },
      "secrets": [
        {
          "sourceVault": {
            "id": "/subscriptions/{subscription-id}/resourceGroups/myresourcegroup1/providers/Microsoft.KeyVault/vaults/myvault1"
          },
          "vaultCertificates": [
            {
              "certificateUrl": "https://myvault1.vault.azure.net/secrets/{secretName}/{secretVersion}",
              "certificateStore": "<certificateStoreName on Windows>" // Windows only property
            }
          ]
        }
      ]
    },
    "networkProfile": {
      "networkInterfaces": [
        {
          "id": "/subscriptions/{subscription-id}/resourceGroups/myresourceGroup1/providers /Microsoft.Network/networkInterfaces/mynic1",
          "properties": {
            "primary": true
          }
        },
        {
          "id": "/subscriptions/{subscription-id}/resourceGroups/myresourceGroup1/providers /Microsoft.Network/networkInterfaces/mynic2",
          "properties": {
            "primary": false
          }
        }
      ]
    },
    "diagnosticsProfile": {
      "bootDiagnostics": {
        "enabled": true|false,
        "storageUri": " http://storageaccount.blob.core.windows.net/"
      }
    }
  }
}
```    
    
### <a name="bk_toplevelelements"></a> Top level elements  

| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|      
| name | Yes | String | Specifies the name of the virtual machine. This name should be unique within the resource group. |    
| location | Yes | String | Specifies the supported Azure location where the virtual machine should be created. This location can be different from the location of the resource group. For more information, see [List all the available geo-locations](../../../docs-ref-autogen/resources/subscriptions.json#Subscriptions_ListLocations). |
| tags | No | String | Specifies the tags that are assigned to the virtual machine. For more information about using tags, see [Using tags to organize your Azure resources](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-using-tags.md).|    
| [plan](../virtualmachines/virtualmachines-create-or-update.md#bk_plan) | No | Complex Type| Specifies information about the marketplace image used to create the virtual machine. This element is only used for marketplace images. Before you can use a marketplace image from an API, you must enable the image for programmatic use.  In the Azure portal, find the marketplace image that you want to use and then click **Want to deploy programmatically, Get Started ->**. Enter any required information and then click **Save**. |    
| [properties](../virtualmachines/virtualmachines-create-or-update.md#bk_props) | Yes | Complex Type | Specifies the properties of the virtual machine. |    
    
### <a name="bk_plan"></a> plan    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| name | Yes | String | Specifies the name of the image from the marketplace. This is the same value that you use for Sku under the imageReference element. For more information about how to find image information, see [Navigating and Selecting Azure Virtual Machine images with PowerShell and the Azure CLI](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-cli-ps-findimage?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json)|    
| publisher | Yes | String | Specifies the publisher of the image. |    
| product | Yes | String | Specifies the product of the image from the marketplace. This is the same value as Offer under the imageReference element. |    
    
### <a name="bk_props"></a> properties    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| licenseType | No | String | Specifies that the image or disk that is being used was licensed on-premises. This element is only used for images that contain the Windows Server operating system. <br><br> Possible values are: <br><br> Windows_Client <br><br> Windows_Server <br><br> If this element is included in a request for an update, the value must match the initial value. This value cannot be updated. <br><br> For more information, see [Azure Hybrid Use Benefit for Windows Server](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-hybrid-use-benefit-licensing?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json) <br><br> Minimum api-version: 2015-06-15 |
| [availabilitySet](../virtualmachines/virtualmachines-create-or-update.md#bk_avset) | No |Complex Type|Specifies information about the availability set that the virtual machine should be assigned to. Virtual machines specified in the same availability set are allocated to different nodes to maximize availability. For more information about availability sets, see [Manage the availability of virtual machines](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-manage-availability?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json). <br><br> For more information on Azure planned maintainance, see [Planned maintenance for virtual machines in Azure](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-planned-maintenance?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json) <br><br> Currently, a VM can only be added to availability set at creation time. An existing VM cannot be added to an availability set. |    
| [hardwareProfile](../virtualmachines/virtualmachines-create-or-update.md#bk_hardware)| Yes | Complex Type | Specifies the hardware settings for the virtual machine. |    
| [storageProfile](../virtualmachines/virtualmachines-create-or-update.md#bk_storage) | Yes | Complex Type | Specifies the storage settings for the virtual machine disks. |    
| [osProfile](../virtualmachines/virtualmachines-create-or-update.md#bk_osprofile) | Yes | Complex Type | Specifies the operating system settings for the virtual machine. |    
| [networkProfile](../virtualmachines/virtualmachines-create-or-update.md#bk_netprofile) | Yes | Complex Type | Specifies the network interfaces of the virtual machine. |   
| [diagnosticsProfile](../virtualmachines/virtualmachines-create-or-update.md#bk_netprofile) | No | Complex Type | Specifies the boot diagnostic settings state. <br><br>Minimum api-version: 2015-06-15|   
    
#### <a name="bk_avset"></a> availabilitySet    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| id | Yes | String | Specifies the resource Id for the availability set to which the Virtual Machine is added. To get this, you need to first create the availability set and then get its resource Id. |    
    
#### <a name="bk_hardware"></a> hardwareProfile    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| vmSize | Yes | String | Specifies the size of the virtual machine. For more information about virtual machine sizes, see [Sizes for virtual machines](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-sizes?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json). <br><br> The available VM sizes depend on region and availability set. For a list of available sizes use these APIs:  <br><br> [List all available virtual machine sizes in an availability set](virtualmachines-list-sizes-availability-set.md) <br><br> [List all available virtual machine sizes in a region](virtualmachines-list-sizes-region.md) <br><br> [List all available virtual machine sizes for resizing](virtualmachines-list-sizes-for-resizing.md)
|    
    
####  <a name="bk_storage"></a> storageProfile    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| [imageReference](../virtualmachines/virtualmachines-create-or-update.md#bk_imageref) | No | Complex Type | Specifies information about the image to use. You can specify information about platform images, marketplace images, or virtual machine images. This element is required when you want to use a platform image, marketplace image, or virtual machine image, but is not used in other creation operations. |    
| [osDisk](../virtualmachines/virtualmachines-create-or-update.md#bk_osdisk) | Yes | Complex Type | Specifies information about the operating system disk used by the virtual machine. <br><br> For more information about disks, see [About disks and VHDs for Azure virtual machines](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-about-disks-vhds?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json). |    
| [dataDisks](../virtualmachines/virtualmachines-create-or-update.md#bk_datadisks) | No | Complex Type | Specifies the parameters that are used to add a data disk to a virtual machine. <br><br> For more information about disks, see [About disks and VHDs for Azure virtual machines](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-about-disks-vhds?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json). |    
    
#####  <a name="bk_imageref"></a> imageReference    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| id | Yes, if using a virtual machine image. | String | Specifies the resource identifier of a virtual machine image in your subscription. This element is only used for virtual machine images, not platform images or marketplace images. <br><br>Minimum api-version: 2016-04-30-preview |
| publisher | Yes | String | Specifies the publisher of the platform image or marketplace image used to create the virtual machine. For more information about how to find image information, see [Navigating and Selecting Azure Virtual Machine images with PowerShell and the Azure CLI](https://docs.microsoft.com/azure/virtual-machines//virtual-machines/virtual-machines-windows-cli-ps-findimage?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json). |    
| offer | Yes | String | Specifies the offer of the platform image or marketplace image used to create the virtual machine. |    
| sku | Yes | String | Specifies the SKU of the platform image or marketplace image used to create the virtual machine. |    
| version | Yes | String | Specifies the version of the platform image or marketplace image used to create the virtual machine. You can use the value of **latest** to use the latest version of an image. |    
    
#####  <a name="bk_osdisk"></a> osDisk    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| name | Yes | String | Specifies the disk name. This element can be used to overwrite the name of the disk in a virtual machine image. |    
| Uri | Yes | String | Specifies the vhd uri. |    
| caching | No | String |Specifies the caching requirements. |    
| createOption | Yes | String | Specifies how the virtual machine should be created.<br><br> Possible values are:<br><br> **Attach** – This value is used when you are using a specialized disk to create the virtual machine.<br><br> **FromImage** – This value is used when you are using an image to create the virtual machine. If you are using a platform image, you also use the imageReference element described above. If you are using a marketplace image, you  also use the plan element previously described. |   
| diskSizeGB | No | Int | Specifies the resized size of the OS Disk. Allows you to resize an existing OS disk size. <br><br> This value cannot be larger than 1023 GB. This element is not returned in the GET VM call unless specified on the first resize disk operation. The partitions on the VMs will need to be adjusted for the new size from within the OS. <br><br> Minimum api-version: 2015-06-15 |   
| osType | Yes for user-image deployments <br> Do not specify for platform/marketplace image deployments | Int | This property allows you to specify the type of the OS that is included in the disk if creating a VM from user-image or a specialized VHD. <br><br> Possible values are: <br><br> **Windows** <br><br> **Linux** |
| encryptionSettings | No | Complex Type | Specifies the encryption settings for the OS Disk. <br><br> Minimum api-version: 2015-06-15 |
    
##### <a name="bk_encryptionSettings"></a> encryptionSettings    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| enabled | Yes | boolean | Specifies if the encryption is enabled <br><br> Minimum api-version: 2016-03-30 |    
| diskEncryptionKey | Yes | Complex Object | Specifies the location of the disk encryption key. |    
| keyEncryptionKey | Yes | Complex Object | Specifies the location of the key encryption key. | 

##### <a name="bk_diskEncryptionKey"></a> diskEncryptionKey    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| sourceVault.Id | Yes | String | Specifies the resource Id of the Key Vault to use. <br><br> For more on Key Vault, see [What is Azure Key Vault?](https://docs.microsoft.com/azure/key-vault/key-vault-whatis/) <br><br> [Get started with Azure Key Vault](https://docs.microsoft.com/azure/key-vault/key-vault-get-started/) |    
| keyUrl | Yes | String | Specifies the location of the disk encryption key. |    

##### <a name="bk_keyEncryptionKey"></a> keyEncryptionKey    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| sourceVault.Id | Yes | String | Specifies the resource Id of the Key Vault to use. <br><br> For more on Key Vault, see [What is Azure Key Vault?](https://docs.microsoft.com/azure/key-vault/key-vault-whatis) <br><br> [Get started with Azure Key Vault](https://docs.microsoft.com/azure/key-vault/key-vault-get-started/)|    
|keyUrl|Yes|String|Specifies the location of the key encryption key. |    

#####  <a name="bk_datadisks"></a> dataDisks    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| name | Yes | String | Specifies the name of the data disk. This element can be used to overwrite the name of the disk in a virtual machine image. <br><br> For using letter D: for a data disk, see [Use the D drive as a data drive on a Windows VM](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-classic-change-drive-letter?toc=%2fazure%2fvirtual-machines%2fwindows%2fclassic%2ftoc.json). <br><br> For adding a disk to your vm using CLI, see [Add a disk to a Linux VM](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-linux-add-disk?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json). <br><br> For creating a RAID array on Linux, see [Configure Software RAID on Linux](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-linux-configure-raid?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json). |
| diskSizeGB | Yes | String | Specifies the size of the data disk in gigabytes. This element can be used to overwrite the name of the disk in a virtual machine image. <br><br> This value cannot be larger than 1023 GB |
| caching | No | String | Specifies the caching requirements. <br><br> Possible values are: <br><br> **None** <br><br> **ReadOnly** <br><br> **ReadWrite** <br><br> Default: **None for Standard storage. ReadOnly for Premium storage** |    
| lun | Yes | Int | Specifies the logical unit number of the data disk. |    
| vhd | Yes | String | Specifies the uri of the location in storage where the VHD for the virtual machine should be placed. |    
| creationOption | Yes | String | Specifies how the data disk should be created. <br><br> Possible values are: <br><br> **Attach** - This value is used when you are using a specialized disk/VHD to attach to the virtual machine. <br><br> **FromImage** - This value is used when you are using an image to create the virtual machine. If you are using a platform image, you will also use the imageReference element described above. If you are using a marketplace image, you will also use the plan element described above. |    
    
#### <a name="bk_osprofile"></a> osProfile    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| computerName | No | String | Specifies the host OS name of the virtual machine. <br><br> **Max-length (Windows):** 15 characters <br><br> **Max-length (Linux):** 64 characters. <br><br> For naming conventions and restrictions see [Azure infrastructure services implementation guidelines](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-linux-infrastructure-subscription-accounts-guidelines?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json#1-naming-conventions).
| adminUsername | Yes | String | Specifies the name of the administrator account. <br><br> **Windows-only restriction:** Cannot end in "." <br><br> **Disallowed values:** "administrator", "admin", "user", "user1", "test", "user2", "test1", "user3", "admin1", "1", "123", "a", "actuser", "adm", "admin2", "aspnet", "backup", "console", "david", "guest", "john", "owner", "root", "server", "sql", "support", "support_388945a0", "sys", "test2", "test3", "user4", "user5". <br><br> **Minimum-length (Linux):** 1  character <br><br> **Max-length (Linux):** 64 characters <br><br> **Max-length (Windows):** 20 characters  <br><br><li> For root access to the Linux VM, see [Using root privileges on Linux virtual machines in Azure](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-linux-use-root-privileges?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json)<br><li> For a list of built-in system users on Linux that should not be used in this field, see [Selecting User Names for Linux on Azure](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-linux-usernames?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json)
|adminPassword|Yes on Windows <br><br> No on Linux|Secure String|Specifies the password of the administrator account. <br><br> **Minimum-length (Windows):** 8 characters <br><br> **Minimum-length (Linux):** 6 characters <br><br> **Max-length (Windows):** 123 characters <br><br> **Max-length (Linux):** 72 characters <br><br> **Complexity requirements:** 3 out of 4 conditions below need to be fulfilled <br> Has lower characters <br>Has upper characters <br> Has a digit <br> Has a special character (Regex match [\W_]) <br><br> **Disallowed values:** "abc@123", "P@$$w0rd", "P@ssw0rd", "P@ssword123", "Pa$$word", "pass@word1", "Password!", "Password1", "Password22", "iloveyou!" <br><br> For resetting the password, see [How to reset the Remote Desktop service or its login password in a Windows VM](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-windows-reset-rdp?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json) <br><br> For resetting root password, see [Manage users, SSH, and check or repair disks on Azure Linux VMs using the VMAccess Extension](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-linux-using-vmaccess-extension?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json#reset-root-password) |
| customData | No | String | Specifies a base-64 encoded string of custom data. The base-64 encoded string is decoded to a binary array that is saved as a file on the Virtual Machine. The maximum length of the binary array is 65535 bytes. <br><br> For using cloud-init for your VM, see [Using cloud-init to customize a Linux VM during creation](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-linux-using-cloud-init?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json) |    
| [windowsConfiguration](../virtualmachines/virtualmachines-create-or-update.md#bk_windowsconfig)| Yes on Windows<br><br> No on Linux | Complex Type | Specifies Windows operating system settings on the virtual machine. |    
| [linuxConfiguration](../virtualmachines/virtualmachines-create-or-update.md#bk_linuxconfig)| No on Windows<br><br> Yes on Linux | Complex Type | Specifies the Linux operating system settings on the virtual machine. <br><br>For a list of supported Linux distributions, see [Linux on Azure-Endorsed Distributions](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-linux-endorsed-distros?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json) <br><br> For running non-endorsed distributions, see [Information for Non-Endorsed Distributions](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-linux-create-upload-generic?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json). |    
| [secrets](../virtualmachines/virtualmachines-create-or-update.md#bk_secrets) | No | Complex Type | Specifies set of certificates that should be installed onto the virtual machine. |    
    
##### <a name="bk_windowsconfig"></a> windowsConfiguration    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| provisionVMAgent | No | Boolean | Indicates whether virtual machine agent should be provisioned on the virtual machine. <br><br> When this property is not specified in the request body, default behavior is to set it to true.  This will ensure that VM Agent is installed on the VM so that extensions can be added to the VM later. |
| [winRM](../virtualmachines/virtualmachines-create-or-update.md#bk_winrm) | No | Collection | Specifies the Windows Remote Management listeners. This enables remote Windows PowerShell. |    
| [additionalUnattendContent](../virtualmachines/virtualmachines-create-or-update.md#bk_addcontent) | No | Complex Type |Specifies additional XML formatted information that can be included in the Unattend.xml file, which is used by Windows Setup. |  
| enableAutomaticUpdates | No | Boolean | Indicates whether virtual machine is enabled for automatic updates. |
| timeZone | No | String | Specifies the time zone of the virtual machine. e.g. "Pacific Standard Time" |  

##### <a name="bk_linuxconfig"></a> linuxConfiguration    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| disablePasswordAuthentication | No | Boolean | Specifies whether password authentication should be disabled. | | ssh.publicKeys | <li>No if password specified<li>Yes if password not specified | Collection | Specifies a collection of keys to be placed on the virtual machine. <li> When a SSH key is specified, "disablePasswordAuthentication" property is automatically set to "true".<br><br> For creating ssh keys, see [Create SSH keys on Linux and Mac for Linux VMs in Azure](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-linux-mac-create-ssh-keys?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json). |    
    
##### <a name="bk_publicKeys"></a> publicKeys    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| path | Yes | String | Specifies the full path on the created VM where ssh public key is stored. If the file already exists, the specified key is appended to the file. Example: /home/user/.ssh/authorized_keys |    
| keyData | Yes | String | SSH public key certificate used to authenticate with the VM through ssh. The key needs to be at least 2048-bit and in ssh-rsa format. <br><br> For creating ssh keys, see [Create SSH keys on Linux and Mac for Linux VMs in Azure](https://docs.microsoft.com/azure/virtual-machines/virtual-machines-linux-mac-create-ssh-keys?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json). | 

##### <a name="bk_winrm"></a> winRM    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| protocol | Yes | String | Specifies the protocol of listener. <br><br> Possible values are: <br>**http** <br><br> **https** |    
| certificateUrl | No | String | Specifies URL of the certificate with which new Virtual Machines is provisioned. <br><br> This property is only needed when **https** is the specified protocol above. |    
    
##### <a name="bk_addcontent"></a> additionalUnattendContent    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| pass | Yes | String | Specifies the name of the pass that the content applies to. The only allowable value is oobeSystem. |    
| component | Yes | String | Specifies the name of the component to configure with the added content. The only allowable value is Microsoft-Windows-Shell-Setup. |    
| settingName | Yes | String | Specifies the name of the setting to which the content applies. Possible values are: FirstLogonCommands and AutoLogon. |    
| content | Yes | String | Specifies the XML formatted content that is added to the unattend.xml file for the specified path and component. The XML must be less than 4KB and must include the root element for the setting or feature that is being inserted. |    
    
##### <a name="bk_secrets"></a> secrets    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| [sourceVault](../virtualmachines/virtualmachines-create-or-update.md#bk_srcvault) | Yes | Complex Type | Specifies the key vault to use. |    
| [vaultCertificates](../virtualmachines/virtualmachines-create-or-update.md#bk_vaultcert) | Yes on Windows <br><br> No on Linux | Collection | The certificate store in LocalMachine on windows Virtual Machine where the certificate should be added to. |    
    
##### <a name="bk_srcvault"></a> sourceVault    
    
| Element name | Required | Type | Description |    
|------------------|--------------|----------|-----------------|    
| id | Yes | String | Specifies the uri of the Key Vault that contains all of the secrets. |    
    
##### <a name="bk_vaultcert"></a> vaultCertificates    
    
| Element name | Required | Type| Description |    
|--------------|----------|-----|-------------|    
| certificateUrl | Yes | String | This is the URL of a certificate that has been uploaded to Key Vault as a secret. For adding a secret to the Key Vault, see [Add a key or secret to the key vault](https://docs.microsoft.com/azure/key-vault/key-vault-get-started/#add). In this case, your certificate needs to be It is the Base64 encoding of the following JSON Object which is encoded in UTF-8: <br><br> {<br>  "data":"<Base64-encoded-certificate>",<br>  "dataType":"pfx",<br>  "password":"<pfx-file-password>"<br>} |    
| certificateStore | No | String | Specifies the certificate store on the Virtual Machine where the certificate should be added to. The specified certificate store is implicitly in the LocalMachine account. <br><br>This is only applicable for a Windows VM. |    
    
#### <a name="bk_netprofile"></a> networkProfile    
    
| Element name | Required | Type | Description |    
|--------------|----------|------|-------------|    
| networkInterfaces | Yes | Collection | Specifies the list of resource Ids for the network interfaces associated with the virtual machine. |   

#### <a name="bk_networkInterfaces"></a> networkInterfaces    
    
| Element name | Required | Type | Description | 
|--------------|----------|------|-------------| 
| id | Yes | String | Specifies the resource Id of the network interface. | 
| primary | No | boolean | Specifies the primary network interface in case the virtual machine has more than 1 network interface. | 
 
#### <a name="bk_diagnosticsProfile"></a> diagnosticsProfile 
| Element name | Required | Type | Description | 
|--------------|----------|------|-------------| 
| bootDiagnostics | Yes | Collection | Boot Diagnostics is a debugging feature which allows you to view Console Output and Screenshot to diagnose VM status. <br><br> For Linux Virtual Machines, you can easily view the output of your console log. <br><br> For both Windows and Linux virtual machines, Azure also enables you to see a screenshot of the VM from the hypervisor. | 

#### <a name="bk_bootDiagnostics"></a> bootDiagnostics 
| Element name | Required | Type | Description | 
|--------------|----------|------|-------------| 
| enabled | Yes | String | Specifies if the bootDiagnostics is enabled. | 
| storageUri | Yes | String | Uri of the storage account to use for placing the console output and screenshot. | 

## Response    

Status code: 200 (OK). 404 (NotFound) if a resource does not exist.    
    
The following example shows the response body for a virtual machine that was created from a platform image. Responses from other create operations will include the elements shown in the following Examples section.    
    
```    
{      
  "id":"/subscriptions/{subscription-id}/resourceGroups/myresourcegroup1/providers/Microsoft.Compute/virtualMachines/myvm1",    
  "name":"myvm1",     
  "type":"Microsoft.Compute/virtualMachines",    
  "location":"westus",    
  "tags": {      
    "department":"finance"    
  },    
  "properties": {      
    "availabilitySet": {      
      "id":"/subscriptions/{subscription-id}/resourceGroups/myresourcegroup1/providers/Microsoft.Compute/availabilitySets/myavset1"    
    },    
    "hardwareProfile": {      
      "vmSize":"Standard_A0"    
    },    
    "storageProfile": {      
      "imageReference": {    
        "publisher":"MicrosoftWindowsServerEssentials",    
        "offer":"WindowsServerEssentials",    
        "sku":"WindowsServerEssentials",    
        "version":"latest"    
      },    
      "osDisk": {      
        "name":"myosdisk1",    
        "vhd": {      
          "uri":"mystorage1.blob.core.windows.net/vhds/myosdisk1.vhd"    
        },    
        "caching":"ReadWrite",    
        "createOption":"FromImage"    
      },    
      "dataDisks":[ {     
         "name":"mydatadisk1",     
         "diskSizeGB":"1",     
         "lun": 0,     
         "vhd": {     
           "uri" : "http://mystorage1.blob.core.windows.net/vhds/mydatadisk1.vhd"     
         },     
         "createOption":"Empty"     
       } ]    
    },    
    "osProfile": {      
      "computerName":"myvm1",    
      "adminUsername":"username",    
      "customData":"",    
      "windowsConfiguration": {      
      "provisionVMAgent": true,    
      "winRM": {    
        "listeners": [ {    
          "protocol": "https",    
          "certificateUrl": "url-to-certificate"    
        } ]    
      },    
      "additionalUnattendContent": {      
        "pass":"oobesystem",    
        "component":"Microsoft-Windows-Shell-Setup",    
        "settingName":"FirstLogonCommands|AutoLogon",    
        "content":"<XML unattend content>"    
      }      
      "enableAutomaticUpdates":true    
    },    
    "secrets":[ {     
       "sourceVault": {     
         "id": "/subscriptions/{subscription-id}/resourceGroups/myresourcegroup1/providers/Microsoft.KeyVault/vaults/myvault1"     
         },     
         "vaultCertificates": [ {     
           "certificateUrl": "https://myvault1.vault.azure.net/secrets/{secretName}/{secretVersion}"     
           "certificateStore": "{certificateStoreName}"     
         } ]     
       } ]             
    },    
    "networkProfile": {      
      "networkInterfaces": [ {      
        "id":"/subscriptions/{subscription-id}/resourceGroups/myresourcegroup1/providers/Microsoft.Network/networkInterfaces/mynic1"    
      } ]    
    },    
    "provisioningState":"succeeded"    
  }    
}    
```    
    
The provisioningState element specifies the status of the virtual machine deployment. For descriptions of the other elements in the response, see the Request section.    
    
## Examples    

### Create a VM from a virtual machine image

This example shows how to create a VM from a virtual machine image. The key things to notice are the value fromImage for the createOption property and the imageReference.id property. The imageRefence.id value is the resource identifier of a virtual machine image in your subscription.

```
"storageProfile": {
  "imageReference": {
    "id": "/subscriptions/{subscription-id}/resourceGroups/myresourcegroup1/providers/Microsoft.Compute/images/myImage"
  },
  "osDisk": {
    "name": "osdisk",
    "osType": "<Windows or Linux>",
    "createOption": "fromImage"
  }
}
```

### Create a VM from a virtual machine image with an attached managed disk

```
{
  "storageProfile": {
    "imageReference": {
      "id": "/subscriptions/{subscription-id}/resourceGroups/myresourcegroup1/providers/Microsoft.Compute/images/myImage"
    },
    "osDisk": {
      "name": "myosdisk", # override the os disk name in the VM image
      "createOption": "fromImage"
    },
    "dataDisks": [
      {
        "name": "datadisk1", # override the data disk name in the VM image
        "diskSizeGB": "64" # override the size of the existing data disk
      },
      {
        "lun": "2", # add new managed datadisk
        "name": "datadisk2",
        "managedDisk": {
          "id": "/subscriptions/{subscription-id}/resourceGroups/myresourcegroup1/providers/Microsoft.Compute/disks/myDisk2",
          "storageAccountType": "Standard_LRS"
        },
        "createOption": "attach"
      }
    ]
  }
}
```

### Create a VM from a VHD in Azure storage

This example shows how to create a VM from a generalized/sysprepped VHD in Azure storage. The key things to notice are the value fromImage for the createOption property and image.uri and vhd.uri properties in the osDisk object. image.uri is the location of your image and vhd.uri is where the disk is copied to and the VM is booted from.

```
"osProfile": {
    "computerName": "contosoVM",
    "adminUsername": "contosouser",
    "adminPassword": "Contoso!pas1"
  },
  "storageProfile": {
    "osDisk": {
      "name": "osdisk",
      "osType": "<Windows or Linux>",
      "caching": "ReadWrite",
      "createOption": "FromImage",
      "image": {
        "uri": "http://storagename.blob.core.windows.net/vhds/VMImageName-osdisk.vhd"
      },
      "vhd": {
        "uri": "http://storagename.blob.core.windows.net/vhds/osdisk.vhd"
      }
    }
  },
"dataDisks": [
  {
    "name": "mydatadisk1",
    "diskSizeGB": "1",
    "lun": 0,
    "image": {
      "uri": "http://storagename.blob.core.windows.net/vhds/VMImageName-datadisk.vhd"
    },
    "vhd": {
      "uri": "http://mystorage.blob.core.windows.net/vhds/mydatadisk3.vhd"
    },
    "createOption": "fromImage"
  }
]
```

### Creating a VM using an existing disk

This example shows how to create a VM from an existing disk. The key things to notice are the value attach for the createOption property and vhd.uri properties in the osDisk object. image.uri isn't needed in this case since you are just attaching the vhd.uri and the VM is booted from it.

In this case osProfile is not needed since all OS properties such as username/password as persisted in the VHD when it is not generalized.

```
"storageProfile": {
  "osDisk": {
    "name": "osdisk",
    "osType": "<Windows or Linux>",
    "caching": "ReadWrite",
    "vhd": {
      "uri": "http://mystorage.blob.core.windows.net/vhds/mydatadisk3.vhd"
    },
    "createOption": "Attach"
  }
}
```

### Marketplace image

The following example shows the additional plan element that is required when you use a marketplace image:

```
{
  "id": "/subscriptions/{subscription-id/resourceGroups/myresourcegroup1/providers/Microsoft.Compute/virtualMachines/myvm1",
  "name": "myvm1",
  "type": "Microsoft.Compute/virtualMachines",
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

### Linux VM

The following example shows the linuxConfiguation element that is required when you are creating a Linux virtual machine.

```
"osProfile": {
  "computerName": "virtualMachineName",
  "adminUsername": "username",
  "adminPassword": "password",
  "customData": "", 
  "linuxConfiguration": { 
    "disablePasswordAuthentication": "true|false", 
    "ssh": { 
      "publicKeys": [ { 
        "path": "key-path-on-vm", 
        "keyData": "public-key" 
    } ] 
  } 
} 
...
```

### On-Premises License/Hybrid Use Benefit

The following example shows the licenseType element that is used when the image or disk was licensed on-premises.

```
"properties": {  
   "licenseType": "Windows_Server",
   "availabilitySet": {  
     "id":"/subscriptions/{subscription-id}/resourceGroups/myresourcegroup1/providers/Microsoft.Compute/availabilitySets/myav1"
   },
   ...
```
