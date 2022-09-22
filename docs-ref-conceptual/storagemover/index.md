---
title: Azure Storage Mover REST API reference
description: An overview of Azure Storage Mover REST API, a fully managed migration service for your files and folder migrations to Azure Storage.
author: johnmic

ms.service: storage-mover
ms.date: 09/22/2022
ms.author: johnmic
ms.topic: reference
ms.devlang: rest-api
---

# Azure Storage Mover REST API

Azure Storage Mover is a fully managed migration service that enables you to migrate your files and folders to Azure Storage while minimizing downtime for your workload. You can use Storage Mover for different migration scenarios such as *lift-and-shift*, and for cloud migrations that you'll have to repeat occasionally. Azure Storage Mover also helps maintain oversight and manage the migration of all your globally distributed file shares from a single storage mover resource. The Storage Manager API allows you to create, list, update and delete your migration projects and jobs associated with them.

## REST Operation Groups

The Storage Mover REST API provides operations for working with the following resources:

| Operation Group | Description |
| --- | --- |
| [Agents](xref:management.azure.com.storagemover.agents) | Operations to manage migration agent resources |
| [Operations](xref:management.azure.com.storagemover.operations) | Lists available operations |
| [Job Definitions](xref:management.azure.com.storagemover.jobdefinitions) | Operations to manage migration job definition resources |
| [Job Runs](xref:management.azure.com.storagemover.jobruns) | Operations to manage job run resources |
| [Projects](xref:management.azure.com.storagemover.projects) | Operations to manage the migration project resources |
| [Storage Movers](xref:management.azure.com.storagemover.storagemovers) | Operations to manage the top-level service resource |

## See Also

- [Azure Storage Mover service overview](https://learn.microsoft.com/azure/storage-mover/service-overview)