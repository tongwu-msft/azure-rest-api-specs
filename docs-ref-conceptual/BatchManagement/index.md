---
ms.assetid: 372812a7-d718-44f2-8099-1df7e3c75c36
ms.title: Azure Batch Management REST API reference | Microsoft Docs
ms.service: batch
author: dlepow
ms.author: danlep
ms.manager: timlt
ms.date: 11/10/2017
service_description: To be added
---

# Batch Management REST API Reference

Azure Batch enables you to run large-scale parallel and high-performance computing (HPC) applications efficiently in the cloud. It's a platform service that schedules compute-intensive work to run on a managed collection of virtual machines, and can automatically scale compute resources to meet the needs of your jobs.

The Batch Management REST API provides operations for working with the Batch service through the Microsoft.Batch provider.

## REST operation groups



| Operation group               | Description                                                                             |
|-------------------------------|-----------------------------------------------------------------------------------------|
| [Application](xref:management.azure.com.batchmanagement.application)          | Provides operations for working with the applications in your Batch account. An application has one or more application packages. |
| [Application Package](xref:management.azure.com.batchmanagement.applicationpackage)  | Provides operations for working with application packages. |
| [Batch Account](xref:management.azure.com.batchmanagement.batchaccount)  | Provides operations for working with Batch accounts. |
| [Certificate](xref:management.azure.com.batchmanagement.certificate)  | Provides operations for working with certificates in your Batch account. |
| [Location](xref:management.azure.com.batchmanagement.location) | Gets information about Batch account name availabilty and quotas in an Azure region. |
| [Operations](xref:management.azure.com.batchmanagement.operations) | Lists available operations for the Microsoft.Batch provider. |
| [Pool](xref:management.azure.com.batchmanagement.pool) | Provides operations for working with pools in your Batch account. |

## See also

- [Azure Batch documentation](/azure/batch/)
- [Azure Batch code samples on GitHub](https://github.com/Azure/azure-batch-samples)