---
title: "Azure Cloud Services REST - Delete Cloud Service1 | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cloud-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: e934ee2a-03bc-42ab-b65c-a57ff6489964
caps.latest.revision: 14
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Delete Cloud Service
The `Delete Cloud Service` operation deletes the specified cloud service from your subscription.  
  
## Request  
 The `Delete Cloud Service` request may be specified as follows. Replace `<subscription-id>` with your subscription ID, and `<cloudservice-name>` with the name of the cloud service.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>`|  
  
### URI Parameters  
  
|URI Parameter|Description|  
|-------------------|-----------------|  
|`comp=media`|Optional. Specifies that the operating system disk, attached data disks, and the source blobs for the disks should also be deleted from storage.<br /><br /> The `comp=media` parameter is only available using version 2013-08-01 and higher.|  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. The value of this header must be set to `2010-10-28` or higher.|  
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 If you use the `comp=media` parameter, the operation is asynchronous and always returns the status code 202 (Accepted). The status code for the request is embedded in the response; if successful, the status code is 200 (OK).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers.  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|A value that uniquely identifies a request made against the Management service. For an asynchronous operation, you can call [Get Operation Status](http://msdn.microsoft.com/library/azure/1215ece5-cbef-4a85-a3db-ab6c20c2c6df) with the value of the header to determine whether the operation is complete, has failed, or is still in progress.|  
  
### Response Body  
 None.  
  
## Remarks  
 If you do not use the `comp=media` parameter, you must delete all of the deployments in a cloud service before you can delete the cloud service. You can use the Management Portal or you can use [Delete Deployment](rest-delete-deployment.md) to delete deployments.