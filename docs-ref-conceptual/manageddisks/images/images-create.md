---
title: "Create a virtual machine image"
ms.date: 2017-01-30
ms.prod: azure
ms.service: managed-disks
ms.topic: reference
ms.assetid: 
author: davidmu
manager: timt
---

# Create a virtual machine image

Creates a virtual machine image using the specified blob, snapshot, managed disk, or existing virtual machine.
  
For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../../index.md).
  
## Request

| HTTP Method | URI|  
| ----------- |----|  
| PUT | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/images/{imageName}?api-version={api-version}` |

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the virtual machine image is being created. |
| resourceGroup | The name of the resource group that will contain the virtual machine image. |
| imageName | The name of the virtual machine image that is being created. |
| api-version | The version of the API to use. The current version is 2017-03-30. |

The structure of the request body depends on how you want to create a virtual machine image. Each of these sections shows the required elements in a request for each source type. Optional elements are described later in this article.

### Create a virtual machine image from a blob

```json
{
  "location": "West US",
  "properties": {
    "storageProfile": {
      "osDisk": {
        "osType": "Windows",
        "blobUri": "https://mystorageaccount.blob.core.windows.net/osimages/osimage.vhd",
        "osState": "generalized"
      }
    }
  }
} 
```

| Element name | Description |
| ------------ | ----------- |
| **location** | Specifies the location of the virtual machine image. |
| **osType** | Specifies the type of operating system contained in the the virtual machine image. Possible values are: **Windows** or **Linux**. |
| **blobUri** | Specifies the URI in Azure storage of the blob that you want to use to create the virtual machine image. |
| **osState** | Specifies the state of the operating system contained in the blob. Possible values are: **generalized** or **specialized**. |

### Create a virtual machine image from a snapshot

```json
{
  "location": "West US",
  "properties": {
    "storageProfile": {
      "osDisk": {
        "osType": "Windows",
        "snapshot": {
          "id": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/snapshots/mySnapshot1"
        },
        "osState": "generalized"
      }
    }
  }
}
 
```

| Element name | Description |
| ------------ | ----------- |
| **location** | Specifies the location of the virtual machine image. |
| **osType** | Specifies the type of operating system contained in the the virtual machine image. Possible values are: **Windows** or **Linux**. |
| **snapshot** | Specifies the identifier of the snapshot that you want to use to create the virtual machine image. |
| **osState** | Specifies the state of the operating system contained in the snapshot. Possible values are: **generalized** or **specialized**. |

### Create a virtual machine image from a managed disk

```json
{
  "location": "West US",
  "tags": {
    "key": "value"
  },
  "properties": {
    "storageProfile": {
      "osDisk": {
        "osType": "Windows",
        "managedDisk": {
          "id": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk1"
        },
        "osState": "generalized"
      }
    }
  }
}
```

| Element name | Description |
| ------------ | ----------- |
| **location** | Specifies the location of the virtual machine image. |
| **osType** | Specifies the type of operating system contained in the virtual machine image. Possible values are: **Windows** or **Linux**. |
| **managedDisk** | Specifies the identifier of the managed disk that you want to use to create the virtual machine image. |
| **osState** | Specifies the state of the operating system contained in the managed disk. Possible values are: **generalized** or **specialized**. |

### Create a virtual machine image from an existing virtual machine

The virtual machine must be stopped and in a generalized state to be used for creating a virtual machine image.

```json
{
  "location": "West US",
  "properties": {
    "sourceVirtualMachine": {
      "id": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM"
    }
  }
}

```

 Element name | Description |
| ------------ | ----------- |
| **location** | Specifies the location of the virtual machine image. |
| **sourceVirtualMachine** | Specifies the resource identifier of the virtual machine that you want to use for the virtual machine image. |

### Create a virtual machine image that includes a data disk from a blob

```json
{
  "location": "West US",
  "properties": {
    "storageProfile": {
      "osDisk": {
        "osType": "Windows",
        "managedDisk": {
          "id": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk1"
        },
        "osState": "generalized"
      },
      "dataDisks": [
        {
          "lun": "1",
          "blobUri": "https://mystorageaccount.blob.core.windows.net/dataimages/dataimage.vhd"
        }
      ]
    }
  }
}
```

| Element name | Description |
| ------------ | ----------- |
| **lun** | Specifies the identifier of a data disk. This element is only required for data disks.|
| **blobUri** | Specifies the URI in Azure storage of the blob that you want to use for the data disk. |

### Create a virtual machine image that includes a data disk from a snapshot

```json
{
  "location": "West US",
  "properties": {
    "storageProfile": {
      "osDisk": {
        "osType": "Windows",
        "managedDisk": {
          "id": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk1"
        },
        "osState": "generalized"
      },
      "dataDisks": [
        {
          "lun": "1",
          "snapshot": {
            "id": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/snapshots/mySnapshot1"
          },
        }
      ]
    }
  }
}
```

| Element name | Description |
| ------------ | ----------- |
| **lun** | Specifies the identifier of a data disk. This element is only required for data disks. |
| **snapshot** | Specifies the identifier of the snapshot that you want to use to create the virtual machine image. |

### Create a virtual machine image that includes a data disk from a managed disk

```json
{
  "location": "West US",
  "properties": {
    "storageProfile": {
      "osDisk": {
        "osType": "Windows",
        "managedDisk": {
          "id": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk1"
        },
        "osState": "generalized"
      },
      "dataDisks": [
        {
          "lun": "1",
          "managedDisk": {
            "id": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk2"
          },
        }
      ]
    }
  }
}
```

| Element name | Description |
| ------------ | ----------- |
| **lun** | Specifies the identifier of a data disk. This element is only required for data disks.|
| **managedDisk** | Specifies the identifier of the managed disk that you want to use for the data disk. |

### Optional elements

You can assign tags for tracking purposes to the virtual machine images that you create by adding `tags` to the main body of the request:

```json
"tags": { 
  "department": "Development", 
  "project": "ManagedDisks" 
}
```

You can resize an operating system disk or the data disk in the virtual machine image as you create it by adding `diskSizeGB`. The target size can't be smaller than the source size: 

```json
"diskSizeGB": 200 
```

You can specify the type of storage account that is used for a VM disk by adding `storageAccountType`. The default is Standard_LRS:

```json
"storageAccountType": "Premium_LRS",
```

You can specify the caching mode of the disks as **readonly**, **readwrite**, or **none**, by adding `hostCaching`. The default is **none**:

```json
"hostCaching": "readwrite",
```

## Response  

The response includes an HTTP status code and a set of response headers.  

### Success codes

| Code | Description |
| ---- | ----------- |
| **201 (Created)** | The virtual machine image is being created. |
| **200 (OK)** | The operation was completed successfully. |

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. |
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. | 
| **404 NotFound** | Source not found. |
| **409 Conflict** | Either another operation is changing the resource in an incompatible way, or the source is in an incompatible state. Retry the operation. | 
| **429 Too Many Requests** | The operation is being throttled. |
| **500 Internal Server Error** |  A server-side error has happened. Retry the operation. |

This response example includes all optional elements. Your actual response may not include all elements.

```json
{
  "location": "West US",
  "tags": {
    "key": "value"
  },
  "properties": {
    "sourceVirtualMachine": {
      "id": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM"
    },
    "storageProfile": {
      "osDisk": {
        "osType": "Windows",
        "blobUri": "https://mystorageaccount.blob.core.windows.net/osimages/osimage.vhd",
        "snapshot": {
          "id": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/snapshots/mySnapshot1"
        },
        "managedDisk": {
          "id": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk1"
        },
        "osState": "generalized",
        "hostCaching": "readwrite",
        "storageAccountType": "Standard_LRS"
        "diskSizeGB": 20
      },
      "dataDisks": [
        {
          "lun": "1",
          "blobUri": "https://mystorageaccount.blob.core.windows.net/dataimages/dataimage.vhd",
          "snapshot": {
            "id": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/snapshots/mySnapshot2"
          },
          "managedDisk": {
            "id": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk2"
          },
          "hostCaching": "readwrite",
          "storageAccountType": "Standard_LRS",
          "diskSizeInGB": 20
        }
      ]
    },
    "provisioningState": "creating"
  }
}
```