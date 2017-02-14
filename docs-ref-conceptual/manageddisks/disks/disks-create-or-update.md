---
title: "Create a managed disk"
ms.date: 2017-01-30
ms.prod: azure
ms.service: managed-disks
ms.topic: reference
ms.assetid: 
author: davidmu
manager: timt
---

# Create a managed disk

Creates a new managed disk in one of these ways:

- As an empty managed disk
- From a platform image
- From an existing managed disk in the same or different subscription
- From importing an unmanaged blob in the same subscription
- From importing an unmanaged blob in a different subscription
  
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).
  
## Request

| HTTP Method | URI|  
| ----------- |----|  
| PUT | `/subscriptions/{subscriptionId}/resourceGroupName/{resourceGroup}/providers/Microsoft.Compute/disks/{diskName}?api-version={api-version}` |

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the managed disk is being created. |
| resourceGroup | The name of the resource group that will contain the managed disk. |
| diskName | The name of the managed disk that is being created. The name can’t be changed after the disk is created. Supported characters for the name are a-z, A-Z, 0-9 and _. The maximum name length is 80 characters. |
| api-version | The version of the API to use. The current version is 2016-04-30-preview. |

The structure of the request body depends on how you want to create a managed disk. Each of these sections shows the required elements in a request for each creation method. Optional elements are described later in this article.

This table lists the elements that are required for all creation requests.

| Element name | Description |
| ------------ | ----------- |
| **name** | Specifies the name of the managed disk that is being created. The name can’t be changed after the disk is created. Supported characters for the name are a-z, A-Z, 0-9 and _. The maximum name length is 80 characters. |
| **location** | Specifies the location of the managed disk. |
| **createOption** | Indicates how the managed disk is to be created. Possible values are **Empty**, **FromImage**, **Copy**, or **Import**. |

### Create an empty managed disk
  
```json
{ 
  "name": "myManagedDisk1", 
  "location": "West US", 
  "properties": {  
    "creationData": { 
      "createOption": "Empty" 
    }, 
    "diskSizeGB": 200 // Only used in other operations to resize the target disk
  } 
}  
```

| Element name | Description |
| ------------ | ----------- |
| **diskSizeGB** | Specifies the size of the empty managed disk that is being created. This element is only required when creating an empty disk; otherwise, it's used to resize a disk during a copy operation. |

### Create a managed disk from a platform image 

```json
{ 
  "name": "myManagedDisk1", 
  "location": "West US", 
  "properties": { 
    "osType": "Windows", 
    "creationData": { 
      "createOption": "FromImage", 
      "imageReference": { 
        "id": "/Subscriptions/{subscriptionId}/Providers/Microsoft.Compute/Locations/uswest/Publishers/Microsoft/ArtifactTypes/VMImage/Offers/{offer}"  
      } 
    }
  }
}  
```

| Element name | Description |
| ------------ | ----------- |
| **imageReference** | Specifies a reference to an existing platform image. |

### Create a managed disk from an existing managed disk in the same or different subscription

```json
{ 
  "name": "myManagedDisk2",
  "location": "West US",
  "properties": { 
    "creationData": { 
      "createOption": "Copy", 
      "sourceResourceId": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk1" 
    }
  } 
} 
```

| Element name | Description |
| ------------ | ----------- |
| **sourceResourceId** | Specifies a reference to an existing managed disk. Only used if `createOption` is **Copy** or **Restore**. |

### Create a managed disk by importing an unmanaged blob from the same subscription

```json
{ 
  "name": "myManagedDisk1",
  "location": "West US",
  "properties": { 
    "creationData": { 
      "createOption": "Import",
      "sourceUri": "https://mystorageaccount.blob.core.windows.net/osimages/osimage.vhd" 
    }
  }
}  
```

| Element name | Description |
| ------------ | ----------- |
| **sourceUri** | Specifies the storage URI of a blob in an unmanaged storage account. Only used if `createOption` is **Import**. |

### Create a managed disk by importing an unmanaged blob from a different subscription

```json
{ 
  "name": "myManagedDisk1",
  "location": "West US",
  "properties": { 
    "creationData": { 
      "createOption": "Import",
      "storageAccountId": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Storage/storageAccounts/myStorageAccount",
      "sourceUri": "https://mystorageaccount.blob.core.windows.net/osimages/osimage.vhd" 
    }
  }
}  
```

| Element name | Description |
| ------------ | ----------- |
| **storageAccountId** | Specifies the identifier of an unmanaged storage account. Used with `sourceUri` to allow authorization during import of unmanaged blobs from a different subscription. | 
| **sourceUri** | Specifies the storage URI of a blob in an unmanaged storage account. Only used if `createOption` is **Import**. |

### Create a managed disk by copying a snapshot

```json
{
  "name": "myManagedDisk1",
  "location": "West US",
  "properties": { 
    "creationData": { 
      "createOption": "Copy", 
      "sourceResourceId": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/snapshots/mySnapshot1" 
    }
  }
} 
```

| Element name | Description |
| ------------ | ----------- |
| **sourceResourceId** | Specifies a reference to an existing managed disk. Only used if `createOption` is **Copy**. |

### Optional elements

You can add encryption to the managed disk by adding `encryptionSettings`:

```json  
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
} 
```

You can specify a hidden storage account of the requested supported type to be used, and copy the source blob to a new blob in the storage account. To specify a storage account, add `accountType`to the main body of the request. Possible values are **Standard_LRS** or **Premium_LRS**:

```json
  "accountType": "Standard_LRS", 
```

You can assign tags for tracking purposes to the managed disks that you create by adding `tags` to the main body of the request:

```json
  "tags": { 
    "department": "Development", 
    "project": "ManagedDisks" 
  }
```

If you are copying a managed disk other than an operating system disk, you must add `lun` under `imageReference`:

```json
"imageReference": { 
  "id": "/Subscriptions/{subscriptionId}/Providers/Microsoft.Compute/Locations/uswest/Publishers/Microsoft/ArtifactTypes/VMImage/Offers/{offer}",  
  "lun": "1"
}
```

You can resize a managed disk as you copy it by adding `diskSizeGB`. This property is only required when you create an empty managed disk. The target size can't be smaller than the source size: 

```json
"diskSizeGB": 200 
```
## Response  

The response includes an HTTP status code and a set of response headers.  

### Success codes

| Code | Description |
| ---- | ----------- |
| **202 (Accepted)** | The operation was accepted. | 

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. |
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. | 
| **404 NotFound** | Source not found. The source can be the platform image, the source disk, or the blob pointed to by the URL. |
| **409 Conflict** | Either another operation is changing the resource in an incompatible way, or the disk is in an incompatible state. Retry the operation. | 
| **429 Too Many Requests** | The operation is being throttled. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. | 

This response example includes all optional elements. Your actual response may not include all elements.

```json
{ 
  "accountType": "Standard_LRS", 
  "properties": { 
    "osType": "Windows", 
    "creationData": { 
      "createOption": "Empty" 
    }, 
    "diskSizeGB": 10, 
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

## Remarks  
Copying a disk currently attached to a running VM is supported. However this is a risky operation, because the VM’s cache may not be flushed at the time the copy is performed. This may result in inconsistent contents. 

For copying a disk from a different subscription, `sourceResourceId` must be a disk, and the caller must have Azure Resource Manager RBAC access to the source disk. 