---
title: "Azure Cloud Services REST - Delete Deployment | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""

ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: e1cff130-ed49-4e10-b942-87aff1f81e82
caps.latest.revision: 21
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Delete Deployment
The `Delete Deployment` asynchronous operation deletes the specified deployment.  
  
## Request  
 The `Delete Deployment` request may be specified as follows. Replace `<subscription-id>` with your subscription ID, `<cloudservice-name>` with the name of the service, `<deployment-slot>` with `staging` or `production`, or `<deployment-name>` with the name of the deployment.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deploymentslots/<deployment-slot>`|  
|DELETE|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deployments/<deployment-name>`|  
  
### URI Parameters  
  
|URI Parameter|Description|  
|-------------------|-----------------|  
|`comp=media`|Optional. Specifies that the operating system disk, attached data disks, and the source blobs for the disks should also be deleted from storage.<br /><br /> The `comp=media` parameter is only available using version 2013-08-01 and higher.|  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header should be set to `2009-10-01` or higher.|  
  
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
 If the deployment that is being deleted is using a reserved IP address, the address continues to be reserved for your subscription. The unused reserved IP address continues to incur charges.  To delete the reserved IP address if you don’t need it anymore, use [Delete Reserved IP Address](http://msdn.microsoft.com/library/azure/b5830165-aa90-4676-9fa8-1aab4d9de5e1).