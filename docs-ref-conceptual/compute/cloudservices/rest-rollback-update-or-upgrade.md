---
title: "Azure Cloud Services REST - Rollback Update Or Upgrade | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cloud-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 5b5d8f4e-cdee-4b73-a6e1-8b5224071097
caps.latest.revision: 16
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Rollback Update Or Upgrade
The `Rollback Update Or Upgrade` operation cancels an in-progress configuration update and returns the deployment to its state before the update was started.  
  
## Request  
 The `Rollback Update Or Upgrade` request may be specified as follows. Replace `<subscription-id>` with the subscription ID, `<cloudservice-name>` with the name of the cloud service, and `<deployment-name>` with the name of the deployment.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deploymentslots/`|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deployments/<deployment-name>/`|  
  
### URI Parameters  
  
|URI Parameter|Description|  
|-------------------|-----------------|  
|`comp=rollback`|Required. Specifies that the operation in progress is to be halted and the deployment is returned to its previous state.|  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header must be set to `2011-10-01` or higher.|  
  
### Request Body  
  
```  
  
<?xml version="1.0" encoding="utf-8"?>  
<RollbackUpdateOrUpgrade xmlns=”http://schemas.microsoft.com/windowsazure”>  
  <Mode>type-of-upgrade</Mode>  
  <Force>upgrade-forced</Force>  
</RollbackUpdateOrUpgrade>  
  
```  
  
 The following table describes the elements of the request.  
  
|||  
|-|-|  
|Element Name|Description|  
|Mode|Required. Specifies whether the rollback should proceed automatically.<br /><br /> -   `Auto` – The rollback proceeds without further user input.<br />-   `Manual` – You must call the [Walk Upgrade Domain](rest-walk-upgrade-domain.md) operation to apply the rollback to each upgrade domain.|  
|Force|Required. Specifies whether the rollback should proceed even when it will cause local data to be lost from some role instances. `True` if the rollback should proceed; otherwise `false`.|  
  
## Response  
 The response includes an HTTP status code and a set of response headers.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers.  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|A value that uniquely identifies a request made against the management service.|  
  
## Response Body  
 None.  
  
## Remarks  
 The `Rollback Update Or Upgrade` operation can only be called when an update is in progress on the deployment. The deployment status can be detected by calling the [Get Deployment](rest-get-deployment.md) operation or [Get Cloud Service Properties](rest-get-cloud-service-properties.md) operation and inspecting the **RollbackAllowed** element. If the value returned is **true** a rollback can be performed.