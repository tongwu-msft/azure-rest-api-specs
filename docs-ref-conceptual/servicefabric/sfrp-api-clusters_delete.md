---
title: "Delete"
ms.date: "2017-04-28"
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
# Delete
Delete cluster resource

Delete cluster resource


## Request
| Method | Request URI |
| ------ | ----------- |
| DELETE | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabric/clusters/{clusterName}?api-version={api-version}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [resourceGroupName](#resourcegroupname) | string | Yes | Path |
| [clusterName](#clustername) | string | Yes | Path |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |

____
### resourceGroupName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the resource group to which the resource belongs or get created

____
### clusterName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the cluster resource

____
### subscriptionId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The customer subscription identifier

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The version of the ServiceFabric resouce provider api

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK - cluster deleted  successfully<br/> |  |
| 204 (NoContent) | NoContent<br/> |  |
| All other status codes | Error<br/> | [ErrorModel](sfrp-model-errormodel.md) |

## Examples

### Delete a cluster

#### Request
```
DELETE https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster?api-version=2016-09-01
```

#### 200 Response
##### Body
The response body is empty.