---
ms.assetid: e8622dcc-59a3-4f4b-9f63-cd2232515a65
title: Key Vault versions | Microsoft Docs
ms.service: key-vault
author: BrucePerlerMS
ms.author: bruceper
manager: mbaldwin
---
# Key Vault versions
|Version|Change Description|  
|-------------|------------------------|  
|2015-06-01|Certificate management is added as a feature to the GA version 2015-06-01 on September 26, 2016.|  
|2015-06-01|General Availability version 2015-06-01, announced on June 24, 2015. <br /><br /> The following changes were made at this release. <br /><br /> \*Delete a key - “use” field removed <br /><br /> \*Get information about a key - “use” field removed<br /><br /> \*                                                    Import a key into a vault - “use” field removed<br /><br /> \*                                                    Restore a key - “use” field removed<br /><br /> \*                                                    About Keys, Secrets, and Certificates - changed “RSA_OAEP” to “RSA-OAEP” for RSA Algorithms|  
|2015-02-01-preview|Second preview version 2015-02-01-preview, announced on April 20, 2015.<br /><br /> For more information, see                              [REST API Update](http://blogs.technet.com/b/kv/archive/2015/04/20/empty-3.aspx) blog post.<br /><br /> The following tasks were updated:<br /><br /> \*                                                    List the keys in a vault - added pagination support to operation<br /><br /> \*                                                    List the versions of a key - added operation to list the versions of a key<br /><br /> \*                                                    List secrets in a vault - added pagination support<br /><br /> \*                                                    List versions of a secret - add operation to list the versions of a secret<br /><br /> \* All operations - Added created/updated timestamps to attributes<br /><br /> \*                                                    Create a secret - added Content-Type to secrets<br /><br /> \*                                                    Create a key - added tags as optional information<br /><br /> \*                                                    Create a secret - added tags as optional information<br /><br /> \*                                                    Update a key - added tags as optional information<br /><br /> \*                                                    Update a secret - added tags as optional information<br /><br /> \*                                                    About Keys, Secrets, and Certificates - changed max size for secrets to 25K Bytes (was 10K Bytes)|  
|2014-12-08-preview|First preview version 2014-12-08-prevew, announced on January 8, 2015.|
## See Also
- [About keys, secrets and certificates](about-keys--secrets-and-certificates.md)
