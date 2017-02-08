---
title: "Get information about a virtual machine extension"
author: davidmu1
ms.date: 2017-02-06
ms.prod: azure
ms.service: virtual-machines
ms.topic: reference
ms.assetid:
ms.author: davidmu
manager: timt
---

# Get information about a virtual machine extension   
    
## Request    

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).    
    
| Method | Request URI |    
|--------|-------------|    
| GET | `https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/virtualMachines/{vm}/extensions/{extension}?api-version={apiVersion}` |    

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the virtual machine is located. |
| resourceGroup | The name of the resource group that contains the virtual machine. |
| vm | The name of the virtual machine. |
| extension | The name of the extension to get information about. |
| apiVersion | The version of the API to use. The current version is 2017-03-30. |

## Response    
 
Status code: If the validation is complete, the operation returns 202 (OK). If successful, the operation returns HTTP status code of 200 (OK). If resource does not exist, 404 (NotFound) is returned.    
    
```  
{    
  "id":"/subscriptions/{subscription-id}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM/extensions/myExtension",    
  "name": "myExtension",    
  "type": "Microsoft.Compute/virtualMachines/extensions",    
  "location": "westus",    
  "properties": {    
    "publisher": "Microsoft.OSTCExtensions",    
    "type": "CustomScriptForLinux",    
    "typeHandlerVersion": "1.2",    
    "settings": {    
      "fileUris": [ "scriptFilePpath"],    
      "commandToExecute": "command"    
    },    
   "provisioningState": "succeeded"    
  }    
}    
```    
    
| Element name | Description |    
|--------------|-------------|    
| id | Specifies the identifying URL of the virtual machine. |    
| name | Specifies the name of the virtual machine. |    
| type | Specifies the type of compute resource. |    
| location | Specifies the supported Azure location where the resource exists. For more information, see [List all the available geo-locations](../../../docs-ref-autogen/resources/subscriptions.json#Subscriptions_ListLocations). |    
| publisher | Specifies name of the extension’s publisher. |    
| type | Specifies type of extension. |    
| typeHandlerVersion | Specifies version of the extension. |    
| fileUris | Specifies the script file path. |    
| commandToExecute | Specifies command used to execute the script. |    
| provisioningState | Specifies the provisioned state of the extension. |