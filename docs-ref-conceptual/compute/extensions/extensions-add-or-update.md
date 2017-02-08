---
title: "Add or update a virtual machine extension"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# Add or update a virtual machine extension  
    
## Request    
 
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).    
    
| Method | Request URI |    
|--------|-------------|    
| PUT | `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/virtualMachines/{vm}/extensions/{extension}?api-version={apiVersion}` |    

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the virtual machine is located. |
| resourceGroup | The name of the resource group that contains the virtual machine. |
| vm | The name of the virtual machine. |
| extension | The name of the extension to add or update. |
| apiVersion | The version of the API to use. The current version is 2017-03-30. | 

```    
{  
  "location": "westus",
  "properties": {
    "publisher": "Microsoft.OSTCExtensions",
    "type": "CustomScriptForLinux",
    "typeHandlerVersion": "Extension Version e.g. 1.5",
    "autoUpgradeMinorVersion": true|false,
    "forceUpdateTag": "RerunExtension",
    "settings": {
       "fileUris": [ "scriptFilePpath", "File2path"],
       "commandToExecute": "command"
    }
  },
  "protectedSettings": {
      "StorageaccountKey": "storageaccount-key"
   }
}
```    
    
| Element name | Required | Type | Description |
|--------------|----------|------| ----------- |
| location | Yes | String | Specifies the location of the virtual machine to which the extension needs to be added. | 
| publisher | Yes | String | Specifies name of the extension’s publisher. | 
| type | Yes | String | Specifies type of extension. | 
| typeHandlerVersion | Yes | String  | Specifies version of the extension. | 
| autoUpgradeMinorVersion | No | Boolean | Specifies if the platform deploys the latest minor version update to the typeHandlerVersion specified. For example, typeHandlerVersion specified value = 1.1 with autoUpgradeMinorVersion = true. The latest versions of the extension available in Azure are 1.2 and 2.0. Then 1.2 version of extension is added to the virtual machine. |
| forceUpdateTag | No | String | Specifies that the extension should be run again with the same public or protected settings. The value can be any string different from the current value. If forceUpdateTag is not changed, updates to public or protected settings would still be applied by the handler. | 
| settings | No | Object | Public configuration for the Extension that does not require encryption. | 
| fileUris | No | String | Specifies the script file path. | 
| commandToExecute | No | String | Specifies command used to execute the script. | 
| protectedSettings | No | Object | Private configuration for the Extension that is encrypted. For example,pass a database password to the script. NOTE: This value is not returned on the GET. | 
 
## Response    
 
Status code: If the validation is complete, the operation returns 202 (OK). If successful, the operation returns HTTP status code of 200 (OK). If resource does not exist, 404 (NotFound) is returned.    

## Examples

### Example requests

**Custom Script Public Storage** 

```    
{ 
  "location": "westus",
  "properties": {
    "publisher": "Microsoft.OSTCExtensions",
    "type": "CustomScriptForLinux",
    "typeHandlerVersion": "1.5",
    "autoUpgradeMinorVersion": true,
    "settings": {
       "fileUris": [ "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/dokku-vm/deploy_dokku.sh"],
       "commandToExecute": "sh deploy_dokku.sh 0.5.8"
    }
  }
}  
```    
    
**Custom Script Azure Storage** 

```    
{ 
  "location": "westus",
  "properties": {
    "publisher": "Microsoft.OSTCExtensions",
    "type": "CustomScriptForLinux",
    "typeHandlerVersion": "1.5",
    "autoUpgradeMinorVersion": true,
    "settings": {
       "fileUris": [ "https://mystorage.blob.core.windows.net/vhds/deploy_dokku.sh"],
       "commandToExecute": "sh deploy_dokku.sh 0.5.8"
    },
    "protectedSettings": {
      "storageAccountName": "mystorage",
      "storageAccountKey": "{storage-key}"
    }
  }
}
```

### Example responses

**Custom Script Public Storage**
```    
{
  "properties": {
    "publisher": "Microsoft.OSTCExtensions",
    "type": "CustomScriptForLinux",
    "typeHandlerVersion": "1.5",
    "autoUpgradeMinorVersion": true,
    "settings": {"fileUris":["https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/dokku-vm/deploy_dokku.sh"],"commandToExecute":"sh deploy_dokku.sh 0.5.8"},
    "provisioningState": "Creating"
  },
  "id": "/subscriptions/{subscription-id}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM/extensions/dokku",
  "name": "dokku",
  "type": "Microsoft.Compute/virtualMachines/extensions",
  "location": "westus"
}
```

**Custom Script Azure Storage**
```    
{
  "properties": {
    "publisher": "Microsoft.OSTCExtensions",
    "type": "CustomScriptForLinux",
    "typeHandlerVersion": "1.5",
    "autoUpgradeMinorVersion": true,
    "settings": {"fileUris":["https://mystorage.blob.core.windows.net/vhds/deploy_dokku.sh"],"commandToExecute":"sh deploy_dokku.sh 0.5.8"},
    "provisioningState": "Creating"
  },
  "id": "/subscriptions/{subscription-id}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM/extensions/dokku",
  "name": "dokku",
  "type": "Microsoft.Compute/virtualMachines/extensions",
  "location": "westus"
}
```