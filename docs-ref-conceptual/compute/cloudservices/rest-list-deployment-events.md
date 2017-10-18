---
title: "Azure Cloud Services REST - List Deployment Events | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cloud-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 82c78980-ac0c-4ec2-8c75-740b110a1f4b
caps.latest.revision: 9
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# List Deployment Events
The `List Deployment Events` operation lists the events that impacted a deployment in the specified timeframe.  
  
## Request  
 The `List Deployment Events` request can be used to retrieve deployment events for a single deployment slot (staging or production) or for a specific deployment name. If you want to retrieve information by deployment name, you must first get the unique name for the deployment. This unique name is part of the response when you make a request to [Get Deployment](rest-get-deployment.md) for a deployment slot.  
  
 For example, if you have a cloud service deployed to the production environment, you can get the unique name by making a request to [Get Deployment](rest-get-deployment.md) for the production slot. The response includes a `Name` element for the cloud service. That `Name` element value can be used to make a request to `…/deployments/<deployment-name>/events` if you want to retrieve information about that specific deployment.  
  
 To generate the request URI, replace `<subscription-id>` with your subscription ID, `<cloudservice-name>` with the name of the cloud service, `<deployment-slot>` with `staging` or `production`, or `<deployment-name>` with the name of the deployment.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deploymentslots/<deployment-slot>/events`|  
|GET|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deployments/<deployment-name>/events`|  
  
### URI Parameters  
 `List Deployment Events` has the following URI Parameters:  
  
|Argument|Description|  
|--------------|-----------------|  
|`subscriptionId`|Required. The subscription ID for the Azure user.|  
|`cloudservice-name`|Required. The name of the cloud service.|  
|`deployment-slot`|Required if not using `deployment-name`. The deployment slot, which can be `staging` or `production`.|  
|`deployment-name`|Required if not using `deployment-slot`. The name of the deployment.|  
|`StartTime=<start-of-timeframe>`|Required. Datetime in UTC representing the start time of the query.|  
|`EndTime=<end-of-timeframe>`|Required. Datetime in UTC representing the end time of the query.|  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header should be set to `2009-10-01` or higher.|  
  
### Request Body  
 None.  
  
## Response  
 The response includes an HTTP status code, a set of response headers, and a response body.  
  
### Status Code  
 A successful operation returns status code 200 (OK).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers.  
  
|Response Header|Description|  
|---------------------|-----------------|  
|`x-ms-request-id`|Specifies a value that uniquely identifies a request made against the management service.|  
|`x-ms-continuation-token`|Specifies a continuation token that enables you to get the remainder of the response when there are more cloud services to list than can be returned in the allotted time. If a large number of cloud services exist in the subscription, not all of them can be listed in a single response. You can use the token in this header in subsequent operation requests until all cloud services are returned.|  
  
### Response Body  
 The format of the response body is as follows:  
  
```xml  
<DeploymentEventCollection xmlns="http://schemas.microsoft.com/windowsazure" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">  
  <RebootEvents>  
    <RebootEvent>  
      <RoleName>KenazDemo-A4</RoleName>  
      <InstanceName>KenazDemo-A4</InstanceName>  
      <RebootReason>Virtual machine rebooted due to planned maintenance event.</RebootReason>  
      <RebootStartTime>2014-09-14T03:50:09.4299879Z</RebootStartTime>  
    </RebootEvent>  
    <RebootEvent>  
      <RoleName>KenazDemo-D4</RoleName>  
      <InstanceName>KenazDemo-D4</InstanceName>  
      <RebootReason>Virtual machine rebooted due to planned maintenance event.</RebootReason>  
      <RebootStartTime>2014-09-14T05:22:03.5531204Z</RebootStartTime>  
    </RebootEvent>  
  </RebootEvents>  
</DeploymentEventCollection>  
  
```  
  
 The following table describes the elements of the response body.  
  
|Element Name|Description|  
|------------------|-----------------|  
|`RoleName`|Role name of the Role Instance that was rebooted.|  
|`InstanceName`|Name of the Role Instance that was rebooted.|  
|`RebootReason`|Hardcoded to "PlannedMaintenance" in version "2014-06-01".|  
|`RebootStartedTime`|Datetime in UTC representing the time that the Reboot event started, rounded to nearest minute.|