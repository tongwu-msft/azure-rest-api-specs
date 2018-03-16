---
title: "Add a user account to a node | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 5c7e9862-cb0e-439d-8907-817bf889e9be
caps.latest.revision: 12
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Add a user account to a node
  Adds a user account to the specified node. You can then use the specified user name and password to remotely log into the node.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to user accounts on nodes.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/nodes/{node-id}/users?api-version={api-version}`|  
  
 Replace {pool-id} with the id of the pool that contains the node. Replace {node-id} with the id of the node on which you want to create a user account.  
  
 The following example shows a basic request body to add a user account to a node.  
  
```  
{  
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#users/@Element",  
  "name":"myuseraccount1",  
  "isAdmin":false,  
  "password":"mypassword",  
  "expiryTime": "2014-09-22T23:00:00.000Z"  
}  
```  
  
|Element name|Required|Type|Notes|  
|------------------|--------------|----------|-----------|  
|name|Yes|String|The user name of the account.|  
|isAdmin|No|Boolean|Specifies whether the account should be an administrator on the node.<br /><br /> The default value is **false**.|  
|password|No|String|The password of the account.<br /><br /> The password is required for compute nodes in PaaS pools (pools created with ‘cloudServiceConfiguration’) and for Windows IaaS nodes. For Linux compute nodes, the password can optionally be specified along with the sshPublicKey property.|  
|expiryTime|No|DateTime|The time at which the account should expire. The default is 1 day from the time of creation.<br /><br /> The default value is 1 day.<br /><br /> For Linux compute nodes, the expiryTime has a precision up to a day.|  
|sshPublicKey|No|String|The SSH public key that can be used for remote login to the compute node. The public key should be compatible with OpenSSH encoding and should be base 64 encoded. This property can be specified only for Linux nodes. If this is specified for pools created with ‘cloudServiceConfiguration’ or ‘virtualMachineConfiguration’ with Windows VMs, then the Batch service returns 400 (Bad Request).|  
  
## Response  
 Status code: 201. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
## Remarks  
 You can add a user account to a node only when it is in the idle or running state.  
  
  