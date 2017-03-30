---
title: "Get information about a certificate in Batch | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c3117939-bd27-46cc-86c4-e78afea23483
caps.latest.revision: 13
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Get information about a certificate in Batch
  Gets information about the specified certificate.  
  
## Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to certificates.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{account-name}.{region-id}.batch.azure.com/certificates(thumbprintAlgorithm=sha1,thumbprint={certificate-thumbprint})?$select={select-list}&api-version={api-version}`|  
  
 Replace {certificate-thumbprint} with the thumbprint of the certificate for which you want to get information.  
  
## Response  
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
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
  
|Element name|Type|Notes|  
|------------------|----------|-----------|  
|thumbprint|String|The X.509 thumbprint of the certificate. This is a sequence of up to 40 hex digits.|  
|thumbprintAlgorithm|String|The algorithm used to derive the thumbprint.|  
|url|String|The URL of the certificate.|  
|state|String|The current state of the certificate. Possible values are:<br /><br /> **active** - The certificate is available for use in pools.<br /><br /> **deleting** - The user has requested that the certificate be deleted, but the delete operation has not yet completed. You may not reference the certificate when creating or updating pools.<br /><br /> **deletefailed** - The user requested that the certificate be deleted, but there are pools that still have references to the certificate, or it is still installed on one or more compute nodes.  (The latter can occur if the certificate has been removed from the pool, but the node has not yet restarted.  Nodes refresh their certificates only when they restart.)  You may use [Cancel the deletion of a certificate](../batchservice/cancel-the-deletion-of-a-certificate.md) to return the certificate to the active state, or [Delete a certificate from an account](../batchservice/delete-a-certificate-from-an-account.md) to retry the deletion.|  
|stateTransitionTime|DateTime|The time at which the certificate entered the current state.|  
|previousState|String|The previous state of the certificate. This property is not present if the certificate is in its initial active state.|  
|previousStateTransitionTime|DateTime|This element is only returned if the status of the certificate has changed and the value contains the time in which the certificate entered the previous state.|  
|publicData|String|The public part of the certificate as a base-64 encoded .cer file.|  
|deleteCertificateError|Complex Type|The error that occurred on the last attempt to delete this certificate.  This property is present only if the certificate is in the deletefailed state.<br /><br /> For more information, see [deleteCertificateError](#bk_deletecerterr).|  
  
###  <a name="bk_deletecerterr"></a> deleteCertificateError  
  
|Element name|Type|Notes|  
|------------------|----------|-----------|  
|code|String|An identifier for the certificate deletion error.  Codes are invariant and are intended to be consumed programmatically.|  
|message|String|A message describing the certificate deletion error, intended to be suitable for display in a user interface.|  
|values|String|A list of additional error details related to the certificate deletion error.<br /><br /> This list includes details such as the active pools and nodes referencing this certificate. However, if a large number of resources reference the certificate, the list contains only about the first hundred.|  
  
  