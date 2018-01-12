---
title: "Azure Batch REST API Reference | Microsoft Docs"
ms.custom: ""
ms.date: 11/10/2017
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 88634071-061f-40de-8e57-100970ea8d0f
caps.latest.revision: 15
author: dlepow
ms.author: danlep
manager: "timlt"
service_description: To be added
---
# Azure Batch Service REST API Reference
  The REST APIs for the Azure Batch service offer developers a means to schedule large-scale parallel and HPC applications in the cloud.  
  
 Azure Batch REST APIs can be accessed from within a service running in Azure, or directly over the Internet from any application that can send an HTTPS request and HTTPS response.  
  
## Batch account  
 All access to the Batch service requires a Batch account, and the account is the basis for authentication.  
  
 The Base URL for Batch service is https://{account-name}.{region-id}.batch.azure.com  
  
## REST APIs  
 Use these APIs to schedule and run large scale computational workloads. All operations conform to the HTTP/1.1 protocol specification and each operation returns a request-id header that can be used to obtain information about the request. You must make sure that requests made to these resources are secure. For more information, see [Authenticate Requests to the Azure Batch Service](../batchservice/authenticate-requests-to-the-azure-batch-service.md).  
  
-   [Account](/rest/api/batchservice/account)  
  
-   [Application](/rest/api/batchservice/application) 

-   [Certificate](/rest/api/batchservice/certificate) 
 
-   [Compute Node](/rest/api/batchservice/computenode) 

-   [File](/rest/api/batchservice/file)    
  
-   [Job](/rest/api/batchservice/job)  
  
-   [Job Schedule](/rest/api/batchservice/jobschedule)
  
-   [Pool](/rest/api/batchservice/pool)  
  
-   [Task](/rest/api/batchservice/task)  
   
  
## Common operations  
  
-   [Add a pool to an account](/rest/api/batchservice/pool/add)  
  
-   [Add a task to a job](/rest/api/batchservice/task/add)  
  
-   [List the compute nodes in a pool](/rest/api/batchservice/computenode/list)  
  
-   [Get information about a task](/rest/api/batchservice/task/get)  
  
  