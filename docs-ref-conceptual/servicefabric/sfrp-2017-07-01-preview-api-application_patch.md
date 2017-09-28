---
title: "Patch"
ms.date: "2017-09-27"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Patch


Updates an application resource with the specified name.

## Request
| Method | Request URI |
| ------ | ----------- |
| PATCH | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabric/clusters/{clusterName}/applications/{applicationName}?api-version=2016-09-01` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [resourceGroupName](#resourcegroupname) | string | Yes | Path |
| [clusterName](#clustername) | string | Yes | Path |
| [applicationName](#applicationname) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [parameters](#parameters) | [ApplicationResourceUpdate](sfrp-2017-07-01-preview-model-applicationresourceupdate.md) | Yes | Body |

____
### subscriptionId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The customer subscription identifier

____
### resourceGroupName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the resource group.

____
### clusterName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the cluster resource

____
### applicationName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the application resource.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 2016-09-01 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "2016-09-01".

____
### parameters
__Type__: [ApplicationResourceUpdate](sfrp-2017-07-01-preview-model-applicationresourceupdate.md) <br/>
__Required__: Yes<br/>
<br/>
The application resource for patch operations.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | The operation completed successfully.<br/> | [ApplicationResourceUpdate](sfrp-2017-07-01-preview-model-applicationresourceupdate.md) |
| 201 (Created) | The resource creation process has been started. Query the resource to retrieve the latest status for the operation.<br/> | [ApplicationResourceUpdate](sfrp-2017-07-01-preview-model-applicationresourceupdate.md) |
| 202 (Accepted) | The request was accepted and the operation will complete asynchronously.<br/> | [ApplicationResourceUpdate](sfrp-2017-07-01-preview-model-applicationresourceupdate.md) |
| All other status codes | The detailed error response.<br/> | [ErrorModel](sfrp-2017-07-01-preview-model-errormodel.md) |
