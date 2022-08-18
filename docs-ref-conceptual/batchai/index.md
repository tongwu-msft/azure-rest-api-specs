---
title: Azure Batch AI REST API | Microsoft Docs
description: Batch AI is a managed service that enables data scientists and AI researchers to train AI and other machine learning models on clusters of Azure virtual machines.
author: dlepow
ms.author: danlep
manager: timlt
ms.date: 03/26/2019
ms.topic: reference
ms.service: azure
ms.devlang: rest-api
service_description: To be added
---

# Azure Batch AI REST API

>[!Note]
>**Azure Batch AI has been retired.** The capabilities of Azure Batch AI are now available as a managed compute target in Azure Machine Learning. For more information, see [What happened to Batch AI?](https://aka.ms/batchai-retirement)

Batch AI is a managed service that enables data scientists and AI researchers to train AI and other machine learning models on clusters of Azure virtual machines, including VMs with GPU support.

## REST Operation Groups 

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| [Clusters](/rest/api/batchai/clusters) | Provides operations to create and manage Batch AI clusters |
| [Experiments](/rest/api/batchai/experiments) | Provides operations to create and manage Batch AI experiments |
| [File Servers](/rest/api/batchai/fileservers) | Provides operations to create and manage file servers for a Batch AI cluster | 
| [Jobs](/rest/api/batchai/jobs) | Provides operations to create and manage training jobs on a Batch AI cluster  |
| [Operations](/rest/api/batchai/operations) | Lists available operations for the Microsoft.BatchAI provider |
| [Usages](/rest/api/batchai/usages) | Gets the current usage information as well as limits for Batch AI resources for a given subscription |
| [Workspaces](/rest/api/batchai/workspaces) | Provides operations to create and manage Batch AI workspaces |

