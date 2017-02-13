---
title: "Create a snapshot"
ms.date: 2017-01-30
ms.prod: azure
ms.service: managed-disks
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: 
author: davidmu
manager: timt
---

# Create a snapshot

Create a snapshot in one of these ways:

- As an empty snapshot
- From an existing snapshot in the same or different subscription
- From importing an unmanaged blob in the same subscription
- From importing an unmanaged blob in a different subscription
- From restoring a previous snapshot 
  
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).
  
## Request

| HTTP Method | URI|  
| ----------- |----|  
| PUT | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/snapshots/{snapshotName}?api-version={api-version} ` |

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the snapshot is being created. |
| resourceGroup | The name of the resource group that will contain the snapshot. |
| snapshotName | The name of the snapshot that is being created. The name can’t be changed after the snapshot is created. Supported characters for the name are a-z, A-Z, 0-9 and _. The max name length is 80 characters. |
| api-version | The version of the API to use. The current version is 2016-04-30-preview. |

The structure of the request body depends on how you want to create a snapshot.

This table lists the elements that are required for all create requests.

| Element name | Description |
| ------------ | ----------- |
| **name** | Specifies the name of the snapshot that is being created. The name can’t be changed after the snapshot is created. Supported characters for the name are a-z, A-Z, 0-9 and _. The max name length is 80 characters. |
| **location** | Specifies the location of the snapshot. |
| **createOption** | Indicates how the snapshot is to be created. Possible values are **Copy**, **Import**, or **Restore**. |

### From an existing snapshot in the same or different subscription

```json
{ 
  "name": "mySnapshot2",
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
| **sourceResourceId** | Specifies a reference to an existing snapshot. Only used if `createOption` is **Copy** or **Restore**. |

### From importing an unmanaged blob in the same subscription

```json
{ 
  "name": "mySnapshot1",
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

### From importing an unmanaged blob in a different subscription

```json
{ 
  "name": "mySnapshot1",
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

### From restoring a previous snapshot

```json
{
  "name": "mySnapshot2",
  "location": "West US",
  "properties": { 
    "creationData": { 
      "createOption": "Restore", 
      "sourceResourceId": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/restorePointCollections/myRestorePointCollection/restorePoints/{restorePoint}/disks/mySnapshot1?id={snapshotId}" 
    }
  }
} 
```

| Element name | Description |
| ------------ | ----------- |
| **sourceResourceId** | Specifies a reference to an existing snapshot. Only used if `createOption` is **Copy** or **Restore**. |

### Optional elements

You can add encryption to the snapshot by adding `encryptionSettings`.

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

You can specify a hidden storage account of the requested supported type to be used, and copy the source blob to a new blob in the storage account. To specify a storage account, add `accountType` to the main body of the request.

```json
"accountType": { 
  "name": "Standard_LRS", 
  "tier": "Standard" 
} 
```

You can assign tags for tracking purposes to the snapshots that you create by adding `tags` to the main body of the request.

```json
"tags": { 
  "department": "Development", 
  "project": "ManagedDisks" 
}
```

You can resize a snapshot as you copy it by adding `diskSizeGB`. This property is only required when you create an empty snapshot. The target size can't be smaller than the source size. 

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
  "accountType": { 
    "name": "Standard_LRS", 
    "tier": "Standard" 
  }, 
  "properties": { 
    "osType": "Windows", 
    "creationData": { 
      "createOption": "Copy" 
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
  "type": "Microsoft.Compute/snapshots", 
  "location": "westus", 
  "tags": { 
    "department": "Development", 
    "project": "Snapshots" 
  }, 
  "id": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/snapshots/mySnapshot1", 
  "name": "mySnapshot1" 
}  
```