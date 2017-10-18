---
title: "Azure Cloud Services REST - Delete Extension | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cloud-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 7cb016dc-34fa-4764-a03f-93fcf15b7bdd
caps.latest.revision: 6
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Delete Extension
The `Delete Extension` operation deletes the specified extension from a cloud service.  
  
## Request  
 The `Delete Extension` request may be specified as follows. Replace `<subscription-id>` with your subscription ID, `<cloudservice-name>` with the name of the cloud service, and `<extensionId>` with the identifier that was assigned to the extension when it was added to the cloud service.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/extensions/<extensionId>`|  
  
### URI Parameters  
 None.  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. The value of this header must be set to `2013-03-01` or higher.|  
  
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
|`x-ms-request-id`|A value that uniquely identifies a request made against the management service.|  
  
### Response Body  
 None.