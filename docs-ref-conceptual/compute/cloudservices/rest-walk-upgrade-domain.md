---
title: "Azure Cloud Services REST - Walk Upgrade Domain | Microsoft Docs"
ms.custom: 
  - "VMClassic"
ms.date: "06/28/2015"
ms.prod: "azure"
ms.reviewer: ""

ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 063f8c52-ca54-4840-a5fd-16eb8a165834
caps.latest.revision: 28
author: "thraka"
ms.author: "adegeo"
manager: "timlt"
---
# Walk Upgrade Domain
The `Walk Upgrade Domain` asynchronous operation specifies an update domain in which a role instance must be updated.  
  
## Request  
 The `Walk Upgrade Domain` request may be specified as follows. replace `<subscription-id>` with the subscription ID, `<cloudservice-name>` with the name of the cloud service, `<deployment-slot>` with `staging` or `production`, and `<deployment-name>` with the name of the deployment.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deploymentslots/<deployment-slot>/?comp=walkupgradedomain`|  
|POST|`https://management.core.windows.net/<subscription-id>/services/hostedservices/<cloudservice-name>/deployments/<deployment-name>/?comp=walkupgradedomain`|  
  
### URI Parameters  
  
|URI Parameter|Description|  
|-------------------|-----------------|  
|`comp=walkupgradedomain`|Required. Specifies that the role instances in a deployment are updated one update domain at a time during a manual in-place update.|  
  
### Request Headers  
 The following table describes the request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Content-Type`|Required. Set this header to `application/xml`.|  
|`x-ms-version`|Required. Specifies the version of the operation to use for this request. This header should be set to `2009-10-01` or higher.|  
  
### Request Body  
 The format of the request body is as follows:  
  
```  
  
<?xml version="1.0" encoding="utf-8"?>  
<WalkUpgradeDomain xmlns="http://schemas.microsoft.com/windowsazure">  
  <UpgradeDomain>update-domain-id</UpgradeDomain>  
</WalkUpgradeDomain>  
  
```  
  
 The following table describes the elements in the request body.  
  
|Element name|Description|  
|------------------|-----------------|  
|UpgradeDomain|Required. Specifies an integer value that identifies the update domain to update. Update domains are identified with a zero-based index: the first update domain has an ID of 0, the second has an ID of 1, and so on.|  
  
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
 Prior to calling the `Walk Upgrade Domain` operation you must have called [Upgrade Deployment](rest-upgrade-deployment.md), [Change Deployment Configuration](rest-change-deployment-configuration.md), or [Rollback Update Or Upgrade](rest-rollback-update-or-upgrade.md).  
  
 By default, a service is deployed with five update domains, which are updated one at a time during an in-place update.  
  
 To perform a manual update of a deployment, proceed in this order:  
  
1.  Call [Upgrade Deployment](rest-upgrade-deployment.md) with the `Mode` element set to `manual`.  
  
2.  Call `Walk Upgrade Domain` to update each domain within the deployment. Update domains must be updated in order. For example, begin with domain 0, proceed to domain 1, and so on.  
  
 An update that adds or removes role instances will result in a configuration update to all roles that are deployed in the cloud service. Existing role instances need to be notified of new role instances so that all role instances can communicate together in the cloud service.  
  
 While an update is in progress, call [Get Deployment](rest-get-deployment.md) to determine its status. If the update is in progress, `Get Deployment` returns an `UpgradeStatus` element that contains information about the update. If the update is complete, or if no update is in progress, then the `UpgradeStatus` element is null.