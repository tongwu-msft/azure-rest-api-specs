---
ms.assetid: 372812a7-d718-44f2-8099-1df7e3c75c36
ms.title: Azure Batch Management REST API reference | Microsoft Docs
ms.service: batch
author: mmacy
ms.author: marsma
ms.manager: timlt
service_description: To be added
---

# Azure Batch Management REST API

Azure Batch enables you to run large-scale parallel and high-performance computing (HPC) applications efficiently in the cloud. It's a platform service that schedules compute-intensive work to run on a managed collection of virtual machines, and can automatically scale compute resources to meet the needs of your jobs.

## REST operation groups

The Batch Management REST API provides operations for working with Batch accounts. This includes Batch account creation and deletion, key rotation, resource quota discovery (including core quotas), and application package management.

| Operation group               | Description                                                                             |
|-------------------------------|-----------------------------------------------------------------------------------------|
| [Application](~/docs-ref-autogen/batchmanagement/application.json)          | Provides operations for working with the applications in your Batch account. An application has one or more application packages that you can deploy to the compute nodes in your pools. |
| [Application Package](~/docs-ref-autogen/batchmanagement/applicationpackage.json)  | Application packages provide management and deployment of the applications run by your tasks. |
| [Batch Account](~/docs-ref-autogen/batchmanagement/batchaccount.json)  | Operations for working with Azure Batch accounts. Create, delete, and list accounts. List and regenerate account keys, and get information about the resource quotas for a given Batch account. |
| [Location](~/docs-ref-autogen/batchmanagement/location.json) | Get information about Batch account quotas (such as the maximum number of accounts) for a given subscription. |

## See also

- [Azure Batch documentation](/azure/batch/)
- [Azure Batch code samples on GitHub](https://github.com/Azure/azure-batch-samples)