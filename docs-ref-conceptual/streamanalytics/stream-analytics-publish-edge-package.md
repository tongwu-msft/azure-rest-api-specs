---
ms.assetid: 
ms.title: PublishEdgePackage | Microsoft Docs
ms.service: stream-analytics
author: mamccrea
ms.author: mamccrea
---

# PublishEdgePackage

## Publish Edge Package
  Azure IoT Edge and Azure Stream Analytics are integrated so that user can deploy an ASA job as an IoT Edge module by calling the publish API. 
  
### Request  
 The **Publish Edge Package Function** request is specified as follows.  
  
|Method|Request URI|  
|------------|-----------------|  
|**POST**|https://<endpoint\>/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.StreamAnalytics/streamingjobs/{jobName}/publishedgepackage?api-version={apiVersion}|  
  
 **Parameters**  
  
 Replace {subscription-id} with your subscription ID.  
  
 Replace {resource-group-name} with the name of the resource group that this job will belong to. For more information about creating resource groups, see [Using resource groups to manage your Azure resources](). 
  
 Replace {job-name} with the name that you want to assign to the Stream Analytics job that you are creating. The job name is case insensitive and must be unique among all inputs in the job, containing only numbers, letters, and hyphens. It must be 3 to 63 characters long.
  
 Replace {api-version} with 2018-11-01 in the URI.  
  
 **Request Headers**  
  
 Common request headers only.  
  
 **Request Body**  
  
```  
{  
  "bindingType": "Microsoft.MachineLearning/WebService",  
  "bindingRetrievalProperties": {  
    "executeEndpoint": "https://ussouthcentral.services.azureml.net/workspaces/f80d5d7a77fa4a46bf2a30c63c078dca/services/b7be5e40fd194258896fb602c1858eaf/execute",  
    "udfype": "Scalar"  
  }  
}  
```  
  
|Property|Description|  
|--------------|-----------------|  
|bindingType|Type of the function binding. Microsoft.MachineLearning/WebService is the only binding currently supported.|  
|bindingRetrievalProperties|Properties that describe how the interface for the binding can be obtained. Properties are dependent on the type of the binding.|  
  
 Azure Machine Learning RSS binding retrieval properties.  
  
|||  
|-|-|  
|bindingRetrievalProperties.udfType|Type of the UDF. Scalar is currently the only supported type.|  
|bindingRetrievalProperties.executeEndpoint|Request-Response execute endpoint of the Azure Machine Learning Webservice. <br />This endpoint is available from the Request-Response endpoint documentation page in the Azure management portal.|  
  
 **Response**  
  
 **Status Code:**  
  
-   200 if default udf definition is created successfully.  
  
-   400 (Bad Reqeust) if binding retrieval properties are invalid or if the endpoint provided did not respond.  
  
 **Response Headers**  
  
 Common response headers  
  
  