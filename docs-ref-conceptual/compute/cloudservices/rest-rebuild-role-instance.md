---
title: "Azure Cloud Services REST - Rebuild Role Instance | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cloud-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 1f00e28e-be02-4223-92a2-8468673a279c
caps.latest.revision: 6
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Rebuild Role Instance
The `Rebuild Role Instance` asynchronous operation reinstalls the operating system on instances of web roles or worker roles and initializes the storage resources that are used by them. If you do not want to initialize storage resources, you can use [Reimage Role Instance](rest-reimage-role-instance.md).  
  
## Request  
 The `Rebuild Role Instance` request may be specified as follows. Replace `<subscription-id>` with your subscription ID, `<cloudservice-name>` with the name of the cloud service, `<deployment-slot>` with `staging` or `production`, or `<deployment-name>` with the name of the deployment. Replace `<role-instance-name>` with the name of the role instance.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deploymentslots/<deployment-slot>/roleinstances/<role-instance-name>`|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deployments/<deployment-name>/roleinstances/<role-instance-name>`|  
  
### URI Parameters  
  
|URI Parameter|Description|  
|-------------------|-----------------|  
|`comp=rebuild`|Required. Specifies that a role instance and its resources must be rebuilt.|  
|`resources=<resources>`|Required. Specifies the resources that must be rebuilt. Currently, the only supported value is `allLocalDrives`.|  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Content-Type`|Required. Set this header to `application/xml`.|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. The value of this header must be set to `2013-06-01` or higher.|  
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
 When the role instance is rebuilt, the instance is taken offline, a fresh guest operating system image is applied, and the data drives that are attached to the instance are initialized. The role instance is then brought back online.