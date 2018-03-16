---
title: "Add a certificate to an account | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b0b26391-1b9f-4d4a-87fe-029f51a30a72
caps.latest.revision: 13
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Add a certificate to an account
  Adds a certificate to the specified account.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to certificates.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|https://{account-name}.{region-id}.batch.azure.com/certificates?api-version={api-version}|  
  
```  
  
{  
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#certificates/@Element",  
  "thumbprintAlgorithm":"sha1",  
  "thumbprint":"########################################",  
  "data":"#####...",  
  "certificateFormat":"pfx",  
  "password":"certpassword"  
}  
  
```  
  
|Element name|Required|Type|Notes|  
|------------------|--------------|----------|-----------|  
|thumbprint|Yes|String|The X.509 thumbprint of the certificate. This is a sequence of up to 40 hex digits (it may include spaces but these are removed).|  
|thumbprintAlgorithm|Yes|String|The algorithm used to derive the thumbprint.  This must be **sha1**.|  
|data|Yes|String|The base64-encoded contents of the PFX file containing the certificate.  The maximum size is 10KB|  
|certificateFormat|No|String|The format of the certificate data. This must be **pfx**.|  
|password|No|String|The password to access the certificate private key.|  
  
## Response  
 Status code: 201. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
  