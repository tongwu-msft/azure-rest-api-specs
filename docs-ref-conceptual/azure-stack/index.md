---
# required metadata

title: Azure Stack administrator API reference | Microsoft Docs
description: "Azure Stack Admin APIs provide REST API interfaces for each Resource Provider that ships with Azure Stack inbox, for performing operations on selected entities, such as Scale Unit Nodes, Alerts, Updates, Backup, Marketplace, Subscriptions, Offers."
keywords:
author: thoroet
ms.author: thoroet
manager: femila
ms.date: 04/20/2017
ms.topic: article
ms.service: azure-stack

# optional metadata

ms.devlang: PowerShell, REST
ms.reviewer: thoroet

---


# Azure Stack Admin API reference

Azure Stack Admin APIs provide REST API interfaces for each Resource Provider that ships with Azure Stack inbox, for performing operations on selected entities, such as Scale Unit Nodes, Alerts, Updates, Backup, Marketplace, Subscriptions, Offers, and much more. This reference provides a guide for working with the Azure Stack Admin REST API, as well as specific reference information for each available operation, grouped by resource provider.

## Resource providers

| Resource Provider              | Description                                                                     |
|--------------------------------|---------------------------------------------------------------------------------|
| Health Resource Provider       | Provides operations for Alert management and list component health              |
| Azure Bridge                   | Provides operations to manage marketplace syndication                           |
| Backup Resource Provider       | Provides operations to manage backup & restore of Azure Stack infrastructure    |
| Commerce                       | Provides operations to manage usage data in Azure Stack                         |
| Compute Resource Provider      | Provides operations to manage compute in Azure Stack                            |
| Fabric Resource Provider       | Provides operations to manage the underlying infrastructure of Azure Stack      |
| Gallery                        | Provides operations to manage the Marketplace in Azure Stack                    |
| Keyvault                       | Provides operations to manage Quotas for Keyvault                               |
| Network Resource Provider      | Provides operations to manage network in Azure Stack                            |
| Update Resource Provider       | Provides operations to manage Updates in Azure Stack                            |
| Storage Resource Provider      | Provides operations to manage storage (Blobs, Queues, and Tables) in Azure Stack |
| Subscription Resource Provider | Provides operations to manage Offers, Plan, and Subscriptions in Azure Stack     |

## See also

To learn more about Azure APIs and SDKI, see [Azure SDK/Tools](https://docs.microsoft.com/azure/#pivot=sdkstools).