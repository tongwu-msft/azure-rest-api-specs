---
# required metadata

title: Azure Stack administrator API reference | Microsoft Docs
description: "This document lists all of the Azure Stack Hub Admin resource providers and their supported versions."
keywords:
author: mattbriggs
ms.author: mabrigg
manager: femila
ms.date: 06/09/2018
ms.topic: article
ms.service: azure-stack

# optional metadata

ms.devlang: PowerShell, REST
ms.reviewer: thoroet

---

# Azure Stack Admin API versioning, support, and breaking changes for Azure Stack Hub

This document lists all of the Azure Stack Hub Admin resource providers and their supported versions. As new versions of the APIs will be available or earlier version be retired this document is used to announce and track all changes.

## API contract

All APIs will follow the general Azure Stack Hub support policy that Azure Stack Hub support the current version and two prior version releases.


## Versioning

|     Resource Provider                      |     API Version supported                      |
|--------------------------------------------|------------------------------------------------|
|     [Health Resource Provider](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/azsadmin/resource-manager/infrastructureinsights)             |     2016-05-01                                 |
|     [Azure Bridge](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/azsadmin/resource-manager/azurebridge)                           |     2016-01-01                                 |
|     [Backup Resource Provider](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/azsadmin/resource-manager/backup)               |     2018-09-01                                 |
|     [Commerce](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/azsadmin/resource-manager/commerce)                               |     2015-06-01-preview                         |
|     [Compute Resource Provider](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/azsadmin/resource-manager/compute)              |     2015-12-01-preview,2018-02-0,2018-07-30    |
|     [Fabric Resource Provider](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/azsadmin/resource-manager/fabric)               |     2016-05-01,   2018-10-01,2019-05-01        |
|     [Gallery](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/azsadmin/resource-manager/gallery)                                |     2015-04-01                                 |
|     [Keyvault](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/azsadmin/resource-manager/keyvault)                               |     2017-02-01-preview                         |
|     [Network Resource Provider](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/azsadmin/resource-manager/network)              |     2015-06-15                                 |
|     [Update Resource Provider](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/azsadmin/resource-manager/update)               |     2016-05-01                                 |
|     [Storage Resource Provider](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/azsadmin/resource-manager/storage)              |     2019-08-08                                 |
|     [Subscription Resource Provider](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/azsadmin/resource-manager/subscriptions)         |     2015-11-01                                 |
|     [User Subscription Resource Provider](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/azsadmin/resource-manager/user-subscriptions)    |     2015-11-01                                 |

## Breaking changes

|     Resource Provider    |     Resource    |     Version    |     Announcement    |     Release    |
|-|-|-|-|-|
|     Microsoft.Storage.Admin    |     Farms    |     2015-12-01-preview    |          |     2002    |
|     Microsoft.Storage.Admin    |     arms/acquisitions          |     2015-12-01-preview    |          |     2002    |
|     Microsoft.Storage.Admin    |     farms/shares          |     2015-12-01-preview    |          |     2002    |
|     Microsoft.Storage.Admin    |     farms/storageaccounts          |     2015-12-01-preview    |          |     2002    |
|     Microsoft.Backup.Admin    |     backupLocation    |     2016-05-01    |          |     2002    |
|     Microsoft.Backup.Admin    |     backups    |     2016-05-01    |          |     2002    |
|     Microsoft.Backup.Admin          |     operations    |     2016-05-01    |          |     2002    |

## Next steps

Find more information about the [Azure Stack Admin API reference](index.md)