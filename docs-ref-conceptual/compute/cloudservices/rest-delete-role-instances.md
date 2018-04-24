---
title: "Azure Cloud Services REST - Delete Role Instances | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""

ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 0cbda247-7dee-4b0c-a51c-a3c205ded075
caps.latest.revision: 10
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Delete Role Instances
The `Delete Role Instances` operation deletes multiple role instances from a deployment in a cloud service.  
  
## Request  
 The `Delete Role Instances` request is specified as follows. Replace `<subscription-id>` with your subscription ID, `<cloudservice-name>` with the name of your service, `<deployment-slot>` with `staging` or `production`, or `<deployment-name>` with the name of the deployment.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deployments/<deployment-name>/roleinstances/`|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deploymentslots/<deployment-slot>/roleinstances/`|  
  
### URI Parameters  
  
|URI Parameter|Description|  
|-------------------|-----------------|  
|`comp=delete`|Required. Specifies that the roles instances defined in the request should be deleted from the deployment.|  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header should be set to `2013-08-01` or higher.|  
  
### Request Body  
  
```  
  
<RoleInstances xmlns="http://schemas.microsoft.com/windowsazure" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">  
  <Name>name-of-role-instance</Name>  
</RoleInstances>  
  
```  
  
 The following table describes the elements of the request body.  
  
|Element name|Description|  
|------------------|-----------------|  
|RoleInstances|Required. Specifies the set of role instances to delete.|  
|Name|Required. Specifies the name of a role instance to delete.|  
  
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