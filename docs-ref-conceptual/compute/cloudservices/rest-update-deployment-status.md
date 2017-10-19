---
title: "Azure Cloud Services REST - Update Deployment Status | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cloud-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 671f463f-5acb-4bd5-801c-6a291727504f
caps.latest.revision: 20
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Update Deployment Status
The `Update Deployment Status` asynchronous operation changes the running status of a deployment. The status of a deployment can be running or suspended.  
  
## Request  
 The `Update Deployment Status` request may be specified as follows. Replace `<subscription-id>` with the subscription ID, `<cloudservice-name>` with the name of the cloud service, `<deployment-slot>` with `staging` or `production`, or `<deployment-name>` with the name of the deployment.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deploymentslots/<deployment-slot>/`|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deployments/<deployment-name>/`|  
  
### URI Parameters  
  
|URI Parameter|Description|  
|-------------------|-----------------|  
|`comp=status`|Required. Specifies that the status of the deployment must be updated.|  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Content-Type`|Required. Set this header to `application/xml`.|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header should be set to `2009-10-01` or higher.|  
  
### Request Body  
 The format of the request body is as follows:  
  
```  
  
<?xml version="1.0" encoding="utf-8"?>  
<UpdateDeploymentStatus xmlns="http://schemas.microsoft.com/windowsazure">  
  <Status>deployment-status</Status>  
</UpdateDeploymentStatus>  
  
```  
  
 The following table describes the elements in the request body.  
  
|Element name|Description|  
|------------------|-----------------|  
|Status|Required. Specifies the new status of the deployment.<br /><br /> Possible values are:<br /><br /> -   `Running`<br />-   `Suspended`|  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers.  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|A value that uniquely identifies a request made against the management service. For an asynchronous operation, you can call [Get Operation Status](http://msdn.microsoft.com/library/azure/1215ece5-cbef-4a85-a3db-ab6c20c2c6df) with the value of the header to determine whether the operation is complete, has failed, or is still in progress.|  
  
### Response Body  
 None.