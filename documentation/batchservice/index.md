---
ms.assetid: 9bcc6f00-0b58-4c89-8829-7cbf54be3e24
ms.title: Azure Batch REST API reference
ms.prod: azure
ms.service: batch
author: mmacy
ms.author: marsma
ms.manager: timlt
---

# Azure Batch

Azure Batch enables you to run large-scale parallel and high-performance computing (HPC) applications efficiently in the cloud. It's a platform service that schedules compute-intensive work to run on a managed collection of virtual machines, and can automatically scale compute resources to meet the needs of your jobs.

## REST operation groups

The Batch REST API provides operations for working with the following resources.

| Operation group               | Description |
|-------------------------------|-------------|
| [Account](./account)          | Provides operations for working with account-level resources. |
| [Application](./application)  | Application packages provide management and deployment of applications run by your tasks. |
| [Certificate](./certificate)  | Operations for managing certificates on compute nodes. |
| [Compute Node](./computenode) | Compute nodes are the virtual machines (VMs) in a pool that execute a job's tasks. |
| [File](./file)                | Operations for working with the files on a compute node or associated with a task. |
| [Job](./job)                  | A job manages a collection of tasks. |
| [Job Schedule](./jobschedule) | Create and manage recurring jobs. |
| [Pool](./pool)                | A pool is a collection of compute nodes. |
| [Task](./task)                | A task executes one or more applications on a compute node. |

## See also

- [Azure Batch documentation](http://microsoft.com)
- [Azure Batch .NET reference](http://microsoft.com)
- [Azure Batch code samples on GitHub](http://microsoft.com)


