---
title: "Key Vault Versions"
ms.custom: ""
ms.date: "2016-09-28"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "key-vault"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "Azure Key Vault"
ms.assetid: e8622dcc-59a3-4f4b-9f63-cd2232515a65
caps.latest.revision: 10
author: "bruceperlerMS"
ms.author: "bruceper"
manager: "mbaldwin"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Key Vault versions
|Version|Change Description|  
|-------------|------------------------|  
|2015-06-01|Certificate management is added as a feature to the GA version 2015-06-01 on September 26, 2016.|  
|2015-06-01|General Availability version 2015-06-01, announced on June 24, 2015.<br /><br /> The following changes were made at this release.<br /><br /> *                                                    [Delete a key](../KeyVaultREST/delete-a-key.md) - “use” field removed<br /><br /> \*                                                    [Get information about a key](../KeyVaultREST/get-information-about-a-key.md) - “use” field removed<br /><br /> \*                                                    [Import a key into a vault](../KeyVaultREST/import-a-key-into-a-vault.md) - “use” field removed<br /><br /> \*                                                    [Restore a key](../KeyVaultREST/restore-a-key.md) - “use” field removed<br /><br /> \*                                                    [About Keys, Secrets, and Certificates](../KeyVaultREST/about-keys--secrets-and-certificates.md) - changed “RSA_OAEP” to “RSA-OAEP” for RSA Algorithms|  
|2015-02-01-preview|Second preview version 2015-02-01-preview, announced on April 20, 2015.<br /><br /> For more information, see                              [REST API Update](http://blogs.technet.com/b/kv/archive/2015/04/20/empty-3.aspx) blog post.<br /><br /> The following tasks were updated:<br /><br /> *                                                    [List the keys in a vault](../KeyVaultREST/list-the-keys-in-a-vault.md) - added pagination support to operation<br /><br /> \*                                                    [List the versions of a key](../KeyVaultREST/list-the-versions-of-a-key.md) - added operation to list the versions of a key<br /><br /> \*                                                    [List secrets in a vault](../KeyVaultREST/list-secrets-in-a-vault.md) - added pagination support<br /><br /> \*                                                    [List versions of a secret](../KeyVaultREST/list-versions-of-a-secret.md) - add operation to list the versions of a secret<br /><br /> \* All operations - Added created/updated timestamps to attributes<br /><br /> \*                                                    [Create a secret](../KeyVaultREST/create-a-secret.md) - added Content-Type to secrets<br /><br /> \*                                                    [Create a key](../KeyVaultREST/create-a-key.md) - added tags as optional information<br /><br /> \*                                                    [Create a secret](../KeyVaultREST/create-a-secret.md) - added tags as optional information<br /><br /> \*                                                    [Update a key](../KeyVaultREST/update-a-key.md) - added tags as optional information<br /><br /> \*                                                    [Update a secret](../KeyVaultREST/update-a-secret.md) - added tags as optional information<br /><br /> \*                                                    [About Keys, Secrets, and Certificates](../KeyVaultREST/about-keys--secrets-and-certificates.md) - changed max size for secrets to 25K Bytes (was 10K Bytes)|  
|2014-12-08-preview|First preview version 2014-12-08-prevew, announced on January 8, 2015.|
## See Also
- [About keys, secrets and certificates](../KeyVaultREST/about-keys--secrets-and-certificates.md)