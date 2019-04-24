---
title: "Azure Cloud Services REST - Swap Deployment | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""

ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ce6d28fe-745d-4c5e-9a04-cef4229e49ac
caps.latest.revision: 24
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Swap Deployment
The `Swap Deployment` asynchronous operation initiates a virtual IP address swap between the staging and production deployment environments for a service. If the service is currently running in the staging environment, it will be swapped to the production environment. If it is running in the production environment, it will be swapped to staging.  
  
## Request  
 The `Swap Deployment` request may be specified as follows. Replace `<subscription-id>` with the subscription ID, and `<cloudservice-name>` with the name of the cloud service.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>`|  
  
### URI Parameters  
 None.  
  
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
<Swap xmlns="http://schemas.microsoft.com/windowsazure">  
  <Production>production-deployment-name</Production>  
  <SourceDeployment>deployment-name-to-be-swapped-with-production</SourceDeployment>  
</Swap>  
```  
  
 The following table describes the elements of the request body.  
  
|Element name|Description|  
|------------------|-----------------|  
|Production|Required. The name of the production deployment.|  
|SourceDeployment|Required. The name of the source deployment.|  
  
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
  
## Remarks  
 If the `Swap Deployment` operation is specified with deployment names that do not match what is currently in production and staging, status code 409 (Conflict) is returned.  
  
 You can swap VIP addresses only if the number of endpoints specified by the service definition is identical for both deployments. For example, if you add an HTTPS endpoint to a web role that previously exposed only an HTTP endpoint, you cannot upgrade your service by swapping VIP addresses; you must delete your production deployment and redeploy instead. You can obtain information about endpoints that are used by using the [Get Deployment](rest-get-deployment.md) operation.