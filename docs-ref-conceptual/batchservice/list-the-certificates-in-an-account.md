---
title: "List the certificates in an account | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 8ae155fe-b3e3-4617-acf4-dd1f00f4f99f
caps.latest.revision: 15
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# List the certificates in an account
  Lists all of the certificates that have been added to the specified account.  
  
## Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to accounts.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{account-name}.{region-id}.batch.azure.com/certificates?$skiptoken={skiptoken}&$filter={filter}&$select={select-list}&maxresults={result-number}&api-version={api-version}`|  
  
 The value for {filter} can be the following or any AND-ed or OR-ed combination of the following:  
  
|Property|Operations allowed|Type|  
|--------------|------------------------|----------|  
|state|eq|String|  
|stateTransitionTime|eq, ne, ge, gt, le, lt|DateTime|  
  
## Response  
 Status code: 200 . For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
```  
  
{  
"odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#certificates",  
  "value": [ {  
    "thumbprint":"########################################",  
    "thumbprintAlgorithm":"sha1",  
    "url":"https://myaccount.myregion.batch.azure.com/certificates(thumbprintAlgorithm=sha1,thumbprint=########################################)",  
    "state":"deletefailed",  
    "stateTransitionTime":"2014-07-31T21:12:58.236Z",  
    "previousState":"deleting",  
    "previousStateTransitionTime":"2014-07-31T21:11:58.236Z",  
    "publicData":"#####...",  
    "deleteCertificateError": {  
      "code":"PoolsReferencingCertificate",  
      "message":"The specified certificate is being used by the below mentioned pool(s)",   
      "values": [ {  
        "name":"Pools",  
        "value":"mypool1"  
      } ]   
    }  
  } ]  
}  
  
```  
  
|Element name|Notes|  
|------------------|-----------|  
|state|The current state of the certificate.  Possible values are:<br /><br /> **active** - The certificate is available for use in pools.<br /><br /> **deleting** - The user has requested that the certificate be deleted, but the delete operation has not yet completed. You may not reference the certificate when creating or updating pools.<br /><br /> **deletefailed** - The user requested that the certificate be deleted, but there are pools that still have references to the certificate, or it is still installed on one or more compute nodes.  (The latter can occur if the certificate has been removed from the pool, but the node has not yet restarted.  Nodes refresh their certificates only when they restart.)  You may use [Cancel the deletion of a certificate](../batchservice/cancel-the-deletion-of-a-certificate.md) to return the certificate to the active state, or [Delete a certificate from an account](../batchservice/delete-a-certificate-from-an-account.md) to retry the deletion. .|  
|previousState|The previous state of the certificate. This property is not present if the certificate is in its initial active state.|  
|previousStateTransitionTime|The time at which the certificate entered its previous state.  This property is not present if the certificate is in its initial active state.|  
|deleteCertificateError|The error that occurred on the last attempt to delete this certificate.  This property is present only if the certificate is in the deletefailed state.<br /><br /> For more information, see [deleteCertificateError](../batchservice/list-the-certificates-in-an-account.md#bk_deleteCertificateError).|  
  
##  <a name="bk_deleteCertificateError"></a> deleteCertificateError  
  
|Element name|Type|Notes|  
|------------------|----------|-----------|  
|code|String|An identifier for the certificate deletion error.  Codes are invariant and are intended to be consumed programmatically|  
|message|String|A message describing the certificate deletion error, intended to be suitable for display in a user interface.|  
|values|String|A list of additional error details related to the certificate deletion error.<br /><br /> This list includes details such as the active pools and nodes referencing this certificate. However, if a large number of resources reference the certificate, the list contains only about the first hundred.|  
  
  