---
title: "Cancel the deletion of a certificate | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 1f82d18e-e76e-49b6-aab1-4c2818c954a7
caps.latest.revision: 14
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Cancel the deletion of a certificate
  Cancels a failed deletion of a certificate from the specified account.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to certificates.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/certificates(thumbprintAlgorithm=sha1,thumbprint={certificate-thumbprint})/canceldelete?api-version={api-version}`|  
  
 Replace {certificate-thumbprint} with the thumbprint of the certificate.  
  
## Response  
 Status code: 204  
  
## Remarks  
 If you try to delete a certificate that is being used by a pool or compute node, the status of the certificate changes to **deletefailed**. If you decide that you want to continue using the certificate, you can use this operation to set the status of the certificate back to active.  
  
 If you intend to delete the certificate, you do not need to run this operation after the deletion failed. You must make sure that the certificate is not being used by any resources, and then you can try again to delete the certificate.  
  
  