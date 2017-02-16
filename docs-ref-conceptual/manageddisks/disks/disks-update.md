---
title: "Update a managed disk"
ms.date: 2017-01-30
ms.prod: azure
ms.service: managed-disks
ms.topic: reference
ms.assetid: 
author: davidmu
manager: timt
---

# Update a managed disk

Updates the specified managed disk.

You can update some of the properties of an existing managed disk using either PUT or PATCH. The difference is that PUT calls need to pass all the mandatory fields in the disk description.  If the disk already exists, the data is compared in the PUT call with the existing disk’s data, and the call is rejected if the change is inconsistent. For PATCH, all fields in the disk description are optional. Missing parameters in a PATCH are interpreted to mean no change of the property is requested. 

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).
  
## Request

| HTTP Method | URI|  
| ----------- |----|  
| PATCH | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/disks/{diskName}?api-version={api-version}` |

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the managed disk is located. |
| resourceGroup | The name of the resource group that contains the managed disk. |
| diskName | The name of the disk that you want to update. |
| api-version | The version of the API to use. The current version is 2016-04-30-preview. |
  
```json
{  
  "accountType": { 
    "name": "Standard_LRS", 
    "tier": "Standard" 
  },
  "tags": {  
    "tagName": "tagValue"
  },      
  "properties": {  
    "diskSizeGB": "256" 
  }  
}    
```

| Element name | Description |
| ------------ | ----------- |
| **name** | Specifies the name of the storage account type. If the accountType element is included, the managed disk is moved to a different storage account of the desired type. |
| **tier** | Specifies the tier of the storage account. |
| **tags** | Specifies the name and value string pairs that can be used to track resources. |
| **diskSizeGB** | Specifies the size that the managed disk should be changed to. |

## Response  
 
The response includes an HTTP status code and a set of response headers.  
  
### Success codes

| Code | Description |
| ---- | ----------- |
| **200 (OK)** | The operation completes synchronously (for example, updating the tag). | 
| **202 (Accepted)** | The operation was accepted.

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. | 
| **404 NotFound** | Source not found. The source can be the platform image, the source disk, or the blob pointed to by the URL. |
| **409 Conflict** | Either another operation is changing the resource in an incompatible way, or the disk is in an incompatible state. Retry the operation. | 
| **429 Too Many Requests** | The operation is being throttled. |
| **500 Internal Server Error** | A server-side error has happened. Retry the operation. |    

This response example includes all optional elements. Your actual response may not include all elements.

```json
{ 
  "accountType": { 
    "name": "Standard_LRS", 
    "tier": "Standard" 
  }, 
  "properties": { 
    "osType": "Windows", 
    "creationData": { 
      "createOption": "Empty" 
    }, 
    "diskSizeGB": 100, 
    "encryptionSettings": { 
      "enabled": true, 
      "diskEncryptionKey": { 
        "sourceVault": { 
          "id": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.KeyVault/vaults/myVMVault" 
        }, 
        "secretUrl": "https://myvmvault.vault-int.azure-int.net/secrets/{secret}" 
      }, 
      "keyEncryptionKey": { 
        "sourceVault": { 
          "id": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.KeyVault/vaults/myVMVault" 
        }, 
        "keyUrl": "https://myvmvault.vault-int.azure-int.net/keys/{key}" 
      } 
    }, 
    "timeCreated": "2016-12-28T02:46:21.3322041+00:00", 
    "provisioningState": "Succeeded", 
    "diskState": "Unattached"
  }, 
  "type": "Microsoft.Compute/disks", 
  "location": "westus", 
  "tags": { 
    "department": "Development", 
    "project": "ManagedDisks" 
  }, 
  "id": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk1", 
  "name": "myManagedDisk1" 
}  
``` 