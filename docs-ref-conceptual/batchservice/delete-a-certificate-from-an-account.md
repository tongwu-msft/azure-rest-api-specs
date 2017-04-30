---
title: "Delete a certificate from an account | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 387f5a38-41da-40aa-8a05-148bd0756e37
caps.latest.revision: 11
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Delete a certificate from an account
  Deletes a certificate from the specified account.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to certificates.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://{account-name}.{region-id}.batch.azure.com/certificates(thumbprintAlgorithm=sha1,thumbprint={certificate-thumbprint})?api-version={api-version}`|  
  
 Replace {certificate-thumbprint} with the thumbprint of the certificate that you want to delete.  
  
## Response  
 Status code: 202 . For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
## Remarks  
 You cannot delete a certificate if a resource (pool or compute node) is using it.  Before you can delete a certificate, you must therefore make sure that:  
  
-   The certificate is not associated with any existing pools.  
  
-   The certificate is not associated with any pool that is currently being created.  
  
-   The certificate is not installed on any compute nodes.  (Even if you remove a certificate from a pool, it is not removed from existing compute nodes in that pool until they restart.)  
  
-   No running tasks depend on the certificate.  
  
 If you try to delete a certificate that is in use, the deletion fails.  The certificate status changes to deletefailed. You can use Cancel Delete Certificate to set the status back to active if you decide that you want to continue using the certificate.  
  
  