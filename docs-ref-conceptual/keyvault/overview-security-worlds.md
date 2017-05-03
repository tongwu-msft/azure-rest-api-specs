---
ms.assetid: 
title: Key Vault security worlds and geographic boundaries | Microsoft Docs
ms.service: key-vault
author: BrucePerlerMS
ms.author: bruceper
manager: mbaldwin
ms.date: 05/03/2017
---
# Security worlds and geographic boundaries

Azure Key Vault is a multi-tenant service and uses a pool of Hardware Security Modules (HSMs) in each Azure location. All the Azure locations in the same geographic region share the same cryptographic boundary (Thales Security World). For example, all Azure locations in the US, such as; East US, West US, South Central US, share the same security world. All Azure locations in Japan share the same security world, and all Azure locations in Australia, India, and so on. 

A backup taken of a key from a key vault in one Azure location can be restored to a key vault in another Azure location, as long as both the Azure locations belong to the same geography and, both key vaults belong to the same subscription. For example, a backup taken by a given subscription of a key in a key vault in West India, can only be restored to another key vault in the same subscription and geography; West India, Central India or South India. For a complete list of Azure geographic regions and locations, see LINK-HERE.

## See Also

- [Common parameters and headers](common-parameters-and-headers.md)
- [About keys, secrets, and certificates](about-keys--secrets-and-certificates.md)
