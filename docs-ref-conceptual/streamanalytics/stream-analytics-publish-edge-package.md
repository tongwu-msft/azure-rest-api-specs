---
ms.assetid: 
title: PublishEdgePackage | Microsoft Docs
ms.service: stream-analytics
author: mamccrea
ms.author: mamccrea
---

# PublishEdgePackage

## Publish Edge Package
  Azure IoT Edge and Azure Stream Analytics are integrated so that users can deploy an ASA job as an IoT Edge module by calling the publish API. 

> [!NOTE]
> Set the `JobStorageAccount` property on the job level before using this API. For more information on setting and updating the Job property, see the [Job API reference](stream-analytics-job.md).
  
### Request  
 The **Publish Edge Package Function** request is specified as follows.  
  
|Method|Request URI|  
|------------|-----------------|  
|**POST**|https://<endpoint\>/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.StreamAnalytics/streamingjobs/{jobName}/publishedgepackage?api-version={apiVersion}|  
  
 **Parameters**  
  
 Replace {subscription-id} with your subscription ID.  
  
 Replace {resource-group-name} with the name of the resource group that this job will belong to. For more information about creating resource groups, see [Using resource groups to manage your Azure resources](https://azure.microsoft.com/documentation/articles/azure-preview-portal-using-resource-groups/). 
  
 Replace {job-name} with the name that you want to assign to the Stream Analytics job that you are creating. The job name is case insensitive and must be unique among all inputs in the job, containing only numbers, letters, and hyphens. It must be 3 to 63 characters long.
  
 Replace {api-version} with 2018-11-01 in the URI.  
  
 **Request Headers**  
  
 Common request headers only.  
  
### Response  
  This asynchronous operation returns a status of 202 until the job has been successfully published. The location response header contains the URI used to get the status of the process. While the process is running, a call to the URI in the location header returns a status of 202. When the process finishes, the URI in the location header returns a status of 200.

**Status Code:**  
  
   - 200 if default udf definition is created successfully.  
  
   - 400 (Bad Reqeust) if binding retrieval properties are invalid or if the endpoint provided did not respond.  
  
**Response Headers**  
  
 Common response headers  
  
  
