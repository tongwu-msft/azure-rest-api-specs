---
title: "List managed disks in a resource group"
ms.date: 2017-01-30
ms.prod: azure
ms.service: managed-disks
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: 
author: davidmu
manager: timt
---

# List managed disks in a resource group

Lists the managed disks in the specified resource group.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| GET | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/disks/?api-version={api-version}` |

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the managed disks are located. |
| resourceGroup | The name of the resource group that contains the managed disks. |
| api-version | The version of the API to use. The current version is 2017-03-30. |
 
## Response  

The response includes an HTTP status code and a set of response headers.  

### Success codes

| Code | Description |
| ---- | ----------- |
| **200 (OK)** | The disk manager selects the disks in the resource group and returns the list. | 

### Error codes

| Code | Description |
| ---- | ----------- |
| **400 BadRequest** | Invalid parameter value or combination of parameters. | 
| **403 Forbidden** | Caller doesn’t have the privilege to call this API. | 
| **404 NotFound** | Source not found. The source can be the platform image, the source disk, or the blob pointed to by the URL. |
| **409 Conflict** | Either another operation is changing the resource in an incompatible way, or the disk is in an incompatible state. Retry the operation. | 
| **429 Too Many Requests** | The operation is being throttled. |
| **500 Internal Server Error** |  A server side error has happened. Retry the operation. |   

This reponse example includes all optional elements. Your actual response may not include all elements.

```json
{ 
  "value": [ 
    { 
      "sku": { 
        "name": "Standard_LRS", 
        "tier": "Standard" 
      }, 
      "properties": { 
        "osType": "Windows", 
        "creationData": { 
          "createOption": "Copy", 
          "sourceResourceId": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk" 
        }, 
        "diskSizeGB": 200, 
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
        "timeCreated": "2016-12-28T04:41:35.9278721+00:00", 
        "provisioningState": "Succeeded", 
        "disableBilling": false, 
        "isArmResource": true, 
        "computeAvailabilitySetId": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/availabilitySets/myAV", 
        "diskState": "Unattached" 
      }, 
      "type": "Microsoft.Compute/disks", 
      "location": "westus", 
      "tags": { 
        "department": "Development", 
        "project": "ManagedDisks" 
      }, 
      "id": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk", 
      "name": "myManagedDisk" 
    }, 
    { 
      "managedBy": "subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM", 
      "sku": { 
        "name": "Standard_LRS", 
        "tier": "Standard" 
      }, 
      "properties": { 
        "osType": "Windows", 
        "creationData": { 
          "createOption": "Empty" 
        }, 
        "diskSizeGB": 10, 
        "timeCreated": "2016-12-28T04:41:36.872242+00:00", 
        "provisioningState": "Succeeded", 
        "disableBilling": false, 
        "isArmResource": true, 
        "computeAvailabilitySetId": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/availabilitySets/myAV", 
        "crpDiskId": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk", 
        "pseudoSubscriptionId": "{subscriptionId}", 
        "storageAccountName": "md-mock00bacc832f20",
        "blobUrl": "https://md-mock00bacc832f20.blob.core.test-cint.azure-test.net/vlvxg5rw4ch2/abcd", 
        "diskState": "Attached", 
        "faultDomain": 0 
      }, 
      "type": "Microsoft.Compute/disks", 
      "location": "westus", 
      "id": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk", 
      "name": "myManagedDisk" 
    }, 
    { 
      "sku": { 
        "name": "Standard_LRS", 
        "tier": "Standard" 
      }, 
      "properties": { 
        "osType": "Windows", 
        "creationData": { 
          "createOption": "FromImage", 
          "imageReference": { 
            "id": "/Subscriptions/{subscriptionId}/Providers/Microsoft.Compute/Locations/uswest/Publishers/Microsoft/ArtifactTypes/VMImage/Offers/{offer}" 
          } 
        }, 
        "diskSizeGB": 200, 
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
        "timeCreated": "2016-12-28T04:41:36.3973934+00:00", 
        "provisioningState": "Succeeded", 
        "disableBilling": false, 
        "isArmResource": true, 
        "computeAvailabilitySetId": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/availabilitySets/myAV", 
        "diskState": "Unattached" 
      }, 
      "type": "Microsoft.Compute/disks", 
      "location": "westus", 
      "tags": { 
        "department": "Development", 
        "project": "ManagedDisks" 
      }, 
      "id": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk", 
      "name": "myManagedDisk" 
    }, 
  ], 
  "nextLink": "http://disksvchost:99/subscriptions/{subscriptionId}/providers/Microsoft.Compute/disks?$skiptoken={token}/Subscriptions/{subscriptionId}/ResourceGroups/myResourceGroup/Disks/myManagedDisk"   
```
 