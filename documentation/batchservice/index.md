---
ms.assetid: 9bcc6f00-0b58-4c89-8829-7cbf54be3e24
ms.title: Azure Batch REST API reference | Microsoft Docs
ms.service: batch
author: mmacy
ms.author: marsma
ms.manager: timlt
---

# Azure Batch REST API

Azure Batch enables you to run large-scale parallel and high-performance computing (HPC) applications efficiently in the cloud. It's a platform service that schedules compute-intensive work to run on a managed collection of virtual machines, and can automatically scale compute resources to meet the needs of your jobs.

## REST operation groups

The Batch REST API provides operations for working with the following resources.

| Operation group               | Description                                                                             |
|-------------------------------|-----------------------------------------------------------------------------------------|
| [Account](~/api-ref/batchservice/account.json)          | Provides operations for working with account-level resources. |
| [Application](~/api-ref/batchservice/application.json)  | Application packages provide management and deployment of the applications run by your tasks. |
| [Certificate](~/api-ref/batchservice/certificate.json)  | Operations for managing certificates on compute nodes. |
| [Compute Node](~/api-ref/batchservice/computenode.json) | Compute nodes are the virtual machines (VMs) in a pool that execute your jobs' tasks. |
| [File](~/api-ref/batchservice/file.json)                | Operations for working with the files on a compute node or associated with a task. |
| [Job](~/api-ref/batchservice/job.json)                  | A job manages a collection of tasks. |
| [Job Schedule](~/api-ref/batchservice/jobschedule.json) | Create and manage recurring jobs. |
| [Pool](~/api-ref/batchservice/pool.json)                | A pool is a collection of compute nodes, the virtual machines (VMs) that process your workloads. |
| [Task](~/api-ref/batchservice/task.json)                | A task executes one or more applications on a compute node. |

## See also

- [Azure Batch documentation](https://review.docs.microsoft.com/azure/batch)
- [Azure Batch code samples on GitHub](https://github.com/Azure/azure-batch-samples)
