---
title: "Get information about a managed disk"
ms.date: 2017-01-30
ms.prod: azure
ms.service: managed-disks
ms.topic: reference
ms.assetid: 
author: davidmu
manager: timt
---

# Get information about a managed disk

Gets information about the specified managed disk.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request

| HTTP Method | URI|  
| ----------- |----|  
| GET | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.Compute/disks/{diskName}?api-version={api-version}` |

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription where the managed disk is located. |
| resourceGroup | The name of the resource group that contains the managed disk. |
| diskName | The name of the disk that you want information about. |
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
| **429 Too Many Requests** | The operation is being throttled. |
| **500 Internal Server Error** |  A server side error has happened. Retry the operation. |     

This reponse example includes all optional elements. Your actual response may not include all elements.

```json
{ 
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
    "timeCreated": "2016-12-28T04:41:35.079872+00:00", 
    "provisioningState": "Succeeded", 
    "disableBilling": false, 
    "isArmResource": true, 
    "computeAvailabilitySetId": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/availabilitySets/myAV", 
    "pseudoSubscriptionId": "{subscriptionId}", 
    "storageAccountName": "md-mockbaedfd88fde6", 
    "blobUrl": "https://md-mockbaedfd88fde6.blob.core.test-cint.azure-test.net/s3gwt23k4scb/abcd", 
    "diskState": "Unattached", 
    "faultDomain": 0 
  }, 
  "type": "Microsoft.Compute/disks", 
  "location": "westus", 
  "tags": { 
    "department": "Development", 
    "project": "ManagedDisks" 
  }, 
  "id": "/subscriptions/{subscriptionId}/resourceGroups/myResourceGroup/providers/Microsoft.Compute/disks/myManagedDisk", 
  "name": "myManagedDisk" 
}    
```
 