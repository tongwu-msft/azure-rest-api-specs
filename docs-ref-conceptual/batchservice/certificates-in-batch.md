---
title: "Certificates in Batch | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a4022b40-84c6-461b-864e-a59d2d30706e
caps.latest.revision: 8
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Certificates in Batch
  The Batch service can install user provided certificates on compute nodes in order to authenticate operations, perform encryption and decryption, etc.  
  
 A typical use of certificates is to encrypt user secret information. The user creates a certificate, adds it to the Batch account (via the Add a certificate API) and associates it with the pool where the information is going to be used (via the Add a pool API).  The user then encrypts the secrets using the certificate, and passes them to a task either as a command line parameter or in one of the resource files. The task program has access to the certificate, and can use it to decrypt the secrets. A common example of a user secret is an Azure Storage account key, where the user wants the task to download data from a storage account.  
  
 The Add a certificate API can be used to add a certificate to an account. The user can then refer to the certificate when creating a new pool, or can update an existing pool to refer to the new certificate. The Batch service then installs the referenced certificates on each node of the pool.  
  
 You can do the following with certificates:  
  
-   [Add a certificate to an account](../batchservice/add-a-certificate-to-an-account.md)  
  
-   [Cancel the deletion of a certificate](../batchservice/cancel-the-deletion-of-a-certificate.md)  
  
-   [Delete a certificate from an account](../batchservice/delete-a-certificate-from-an-account.md)  
  
-   [Get information about a certificate in Batch](../batchservice/get-information-about-a-certificate-in-batch.md)  
  
-   [List the certificates in an account](../batchservice/list-the-certificates-in-an-account.md)  
  
  