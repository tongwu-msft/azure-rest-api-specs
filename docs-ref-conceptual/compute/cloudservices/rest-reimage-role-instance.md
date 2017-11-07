---
title: "Azure Cloud Services REST - Reimage Role Instance | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cloud-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 6afe55b1-450a-498a-be6c-b72a4b3ada9d
caps.latest.revision: 16
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Reimage Role Instance
The `Reimage Role Instance` asynchronous operation reinstalls the operating system on instances of web roles or worker roles.  
  
## Request  
 The `Reimage Role Instance` request may be specified as follows. Replace `<subscription-id>` with the subscription ID, `<cloudservice-name>` with the name of the cloud service, `<deployment-slot>` with `staging` or `production`, or `<deployment-name>` with the name of the deployment. Replace `<role-instance-name>` with the name of the role instance.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deploymentslots/<deployment-slot>/roleinstances/<role-instance-name>`|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deployments/<deployment-name>/roleinstances/<role-instance-name>`|  
  
### URI Parameters  
  
|URI Parameter|Description|  
|-------------------|-----------------|  
|`comp=reimage`|Required. Specified that an instance of a role must be reimaged.|  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Content-Type`|Required. Set this header to `application/xml`.|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. The value of this header must be set to `2010-10-28` or higher.|  
|`ContentLength`|Required. Must be set to 0.|  
  
### Request Body  
 None.  
  
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
 When the role instance is reimaged, the instance is taken offline and a fresh guest operating system image is applied. The role instance is then brought back online. An attempt is made to maintain data in any local storage resources when the role is reimaged; however, in case of a transient hardware failure, the local storage resource may be lost. If your application requires that this data be persisted, it is recommended that you write it to a durable data source, such as an Azure drive. Any data that is written to a local directory other than that defined by the local storage resource will be lost when the role is reimaged.