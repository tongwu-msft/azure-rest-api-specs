---
title: "Azure Batch REST API Reference | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 88634071-061f-40de-8e57-100970ea8d0f
caps.latest.revision: 15
author: "tamram"
ms.author: "tamram"
manager: "timlt"
service_description: To be added
---
# Azure Batch REST API Reference
  The REST APIs for the Azure Batch service offer developers a means to schedule large-scale parallel and HPC applications in the cloud.  
  
 Azure Batch REST APIs can be accessed from within a service running in Azure, or directly over the Internet from any application that can send an HTTPS request and HTTPS response.  
  
## Batch account  
 All access to the Batch service requires a Batch account, and the account is the basis for authentication.  
  
 The Base URL for Batch service is https://{account-name}.{region-id}.batch.azure.com  
  
## REST APIs  
 Use these APIs to schedule and run large scale computational workloads. All operations conform to the HTTP/1.1 protocol specification and each operation returns a request-id header that can be used to obtain information about the request. You must make sure that requests made to these resources are secure. For more information, see [Authenticate Requests to the Azure Batch Service](../batchservice/authenticate-requests-to-the-azure-batch-service.md).  
  
-   [Accounts](../batchservice/accounts.md)  
  
-   [Applications](../batchservice/applications.md)  
  
-   [Certificates](../batchservice/certificates-in-batch.md)  
  
-   [Pools](../batchservice/pools.md)  
  
-   [Jobs](../batchservice/jobs.md)  
  
-   [Job Schedules](../batchservice/job-schedules.md)  
  
-   [Tasks](../batchservice/tasks-in-batch.md)  
  
-   [Task and node files](../batchservice/task-and-node-files.md)  
  
-   [Nodes](../batchservice/nodes.md)  
  
-   [Node Users](../batchservice/node-users.md)  
  
-   [OData Batch Processing](../batchservice/odata-batch-processing.md)  
  
## Common operations  
  
-   [Add a pool to an account](../batchservice/add-a-pool-to-an-account.md)  
  
-   [Add a task to a job](../batchservice/add-a-task-to-a-job.md)  
  
-   [List the compute nodes in a pool](../batchservice/list-the-compute-nodes-in-a-pool.md)  
  
-   [Get information about a task](../batchservice/get-information-about-a-task.md)  
  
  