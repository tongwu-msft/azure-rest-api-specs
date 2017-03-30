---
title: "Update the properties of a user account on a node | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ddfba05d-0639-456b-a113-9535bf4a410d
caps.latest.revision: 16
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Update the properties of a user account on a node
  Updates the password and expiration time of a user account on the specified node.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to user accounts on nodes.  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/nodes/{node-id}/users/{user-account-name}?api-version={api-version}`|  
  
 Replace {pool-id} with the id of the pool that contains the node. Replace {node-id} with the id of the node on which you want to update a user account. Replace {user-account-name} with the name of the user to update.  
  
 The following example shows a request to update a user account:  
  
```  
{  
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#users/@Element",    
  "password":"mypassword",  
  "expiryTime": "2014-09-22T23:00:00.000Z"  
}  
```  
  
|Element name|Required|Type|Notes|  
|------------------|--------------|----------|-----------|  
|password|No|String|The password of the account.<br /><br /> The password is required for compute nodes in PaaS pools (pools created with ‘cloudServiceConfiguration’) and for Windows IaaS nodes. For Linux compute nodes, the password can optionally be specified along with the sshPublicKey property.|  
|expiryTime|No|DateTime|The time at which the account should expire.<br /><br /> The default is 1 day from the time of the update.<br /><br /> For Linux compute nodes, the expiryTime has a precision up to a day.|  
|sshPublicKey|No|String|The SSH public key that can be used for remote login to the compute node. The public key should be compatible with OpenSSH encoding and should be base 64 encoded. This property can be specified only for Linux nodes. If this is specified for pools created with ‘cloudServiceConfiguration’ or ‘virtualMachineConfiguration’ with Windows VMs, then the Batch service returns 400 (Bad Request).|  
  
## Response  
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
## Remarks  
 This operation replaces of all the updateable properties of the account. For example, if the expiryTime element is not specified, the current value is replaced with the default value, not left unmodified.  
  
 You can update a user account on a node only when it is in the **idle** or **running** state.  
  
  