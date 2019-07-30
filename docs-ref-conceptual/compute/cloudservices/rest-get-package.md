---
title: "Azure Cloud Services REST - Get Package | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""

ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: bcac0a24-d753-4b95-8fbc-3b5edb30a471
caps.latest.revision: 16
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Get Package
The `Get Package` operation retrieves a cloud service package for a deployment and stores the package files in Microsoft Azure Blob storage.  
  
 The following package files are placed in storage:  
  
-   **Service configuration file** - The cloud service configuration file (.cscfg) provides configuration settings for the cloud service and individual roles, including the number of role instances.  
  
-   **Service package** - The service package (.cspkg) contains the application code and the service definition file.  
  
## Request  
 The `Get Package` request may be specified as follows. Replace `<subscription-id>` with the subscription ID, `<cloudservice-name>` with the name of the cloud service, `<deployment-slot>` with `staging` or `production`, or `<deployment-name>` with the name of the deployment.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deployments/<deployment-name>/package`|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deploymentslots/<deployment-slot>/package`|  
  
### URI Parameters  
  
|URI Parameter|Description|  
|-------------------|-----------------|  
|containerUri=`<container-uri>`|Required. Specifies the URI of the container to which the packages will be saved.|  
|overwriteExisting=`<overwriteExisting>`|Optional. Specifies whether an existing package in the storage container should be overwritten. If `true` the packages with the same names under the specified storage container will be overwritten; otherwise `false`.|  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header should be set to `2012-03-01` or higher.|  
|`ContentLength`|Required. Must be set to 0.|  
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 202 (Accepted).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers.  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|A value that uniquely identifies a request made against the management service.|  
  
### Response Body  
 None.