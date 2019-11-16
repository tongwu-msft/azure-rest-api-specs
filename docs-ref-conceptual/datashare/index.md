---
title: Azure Data Share REST API | Microsoft Docs
description: This article describes the REST APIs available for you to use with Azure Data Share to create, delete, and manage Data Share accounts.
author: zachcmadsen
ms.author: t-zamads
ms.date: 07/19/2019
ms.topic: reference
ms.service: data-share
---

# Azure Data Share

[Azure Data Share](https://azure.microsoft.com/services/data-share/) is a cloud-based service that helps customers share data with other organizations. Azure Data Share provides centralized management, monitoring, and governance for sharing data from multiple Azure data sources. Using this service, you can quickly create shares that consist of multiple datasets from a variety of Azure data stores. You can invite your customers and external partners to access these shares through incremental snapshots of your data and revoke access as needed.

Azure Data Share functionality is available through the REST API endpoints described in the following table.

## REST Operation Groups

| Operation Group | Description |
| --------------- | ----------- |
| [Accounts](xref:management.azure.com.datashare.accounts) | Create, delete, get, list, or update accounts. |
| [Consumer Invitations](xref:management.azure.com.datashare.consumerinvitations) | Get, list, or reject invitations. |
| [Consumer Source Data Sets](xref:management.azure.com.datashare.consumersourcedatasets) | List the source data sets of a share subscription. |
| [Data Set Mappings](xref:management.azure.com.datashare.datasetmappings) | Create, delete, get, or list data set mappings in a share subscription. |
| [Data Sets](xref:management.azure.com.datashare.datasets) | Create, delete, get, or list data sets in a share. |
| [Invitations](xref:management.azure.com.datashare.invitations) | Create, delete, get, or list invitations. |
| [Operations](xref:management.azure.com.datashare.operations) | List the available REST API operations. |
| [Provider Share Subscriptions](xref:management.azure.com.datashare.providersharesubscriptions) | Get, list, reinstate, or revoke share subscriptions in a provider share. |
| [Share Subscriptions](xref:management.azure.com.datashare.sharesubscriptions) | Create, delete, get, or list share subscriptions. Initiate or cancel a synchronization, and list synchronizations, synchronization settings, and synchronization details. |
| [Share](xref:management.azure.com.datashare.shares) | Create, delete, get, or list shares. List synchronizations and synchronization details of a share. |
| [Synchronization Settings](xref:management.azure.com.datashare.synchronizationsettings) | Create, delete, get, or list synchronization settings in a share. |
| [Triggers](xref:management.azure.com.datashare.triggers) | Create, delete, get, or list triggers in a share subscription. |

## See also

- [Azure Data Share Documentation](https://docs.microsoft.com/azure/data-share/)
