---
ms.assetid: e8622dcc-59a3-4f4b-9f63-cd2232515a65
title: Key Vault versions
ms.service: key-vault
author: BrucePerlerMS
ms.author: bruceper
manager: mbaldwin
ms.date: 08/17/2017

---
# Key Vault versions

## Version = **2015-06-01**

Certificate management is added as a feature to the GA version 2015-06-01 on September 26, 2016.

## Version = **2015-06-01**

General Availability version 2015-06-01, announced on June 24, 2015.

The following changes were made at this release:

- Delete a key - “use” field removed.
- Get information about a key - “use” field removed.
- Import a key into a vault - “use” field removed.
- Restore a key - “use” field removed.

About Keys, Secrets, and Certificates - changed “RSA_OAEP” to “RSA-OAEP” for RSA Algorithms.

## Version = **2015-02-01-preview**

Second preview version 2015-02-01-preview, announced on April 20, 2015. For more information, see [REST API Update](http://blogs.technet.com/b/kv/archive/2015/04/20/empty-3.aspx) blog post.

The following tasks were updated:

- List the keys in a vault - added pagination support to operation.
- List the versions of a key - added operation to list the versions of a key.
- List secrets in a vault - added pagination support.
- List versions of a secret - add operation to list the versions of a secret.
- All operations - Added created/updated timestamps to attributes.
- Create a secret - added Content-Type to secrets.
- Create a key - added tags as optional information.
- Create a secret - added tags as optional information.
- Update a key - added tags as optional information.
- Update a secret - added tags as optional information.

About Keys, Secrets, and Certificates - changed max size for secrets to 25K Bytes (was 10K Bytes).

## Version = **2014-12-08-preview**

First preview version 2014-12-08-preview, announced on January 8, 2015.

## See also
- [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md)
