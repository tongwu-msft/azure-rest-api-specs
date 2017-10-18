---
title: "Azure Cloud Services REST - Reboot Role Instance | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cloud-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 7b99104f-cdc3-4c8e-8cc2-f97f1a1fe94b
caps.latest.revision: 17
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Reboot Role Instance
The `Reboot Role Instance` asynchronous operation requests a reboot of a role instance that is running in a deployment.  
  
## Request  
 The `Reboot Role Instance` request may be specified as follows. Replace `<subscription-id>` with your subscription ID, `<cloudservice-name>` with the name of the cloud service, `<deployment-slot>` with `staging` or `production`, or `<deployment-name>` with the name of your deployment. Replace `<role-instance-name>` with the name of your role instance.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deploymentslots/<deployment-slot>/roleinstances/<role-instance-name>`|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deployments/<deployment-name>/roleinstances/<role-instance-name>`|  
  
### URI Parameters  
  
|URI Parameter|Description|  
|-------------------|-----------------|  
|`comp=reboot`|Required. Specifies that the instance of the role must be rebooted.|  
  
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
 When you reboot a role instance, the instance is taken offline, the underlying operating system is restarted for that instance, and the instance is brought back online. Any data that is written to the local disk is persisted across reboots. Any data that is in-memory is lost.