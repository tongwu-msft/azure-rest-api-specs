---
title: "Get"
ms.date: "2017-11-30"
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
# Get

Returns an application resource with the specified name.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabric/clusters/{clusterName}/applications/{applicationName}?api-version=2017-07-01-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [resourceGroupName](#resourcegroupname) | string | Yes | Path |
| [clusterName](#clustername) | string | Yes | Path |
| [applicationName](#applicationname) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |

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
__Default__: 2017-07-01-preview <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "2017-07-01-preview" for this specification.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | The operation completed successfully.<br/> | [ApplicationResource](sfrp-2017-07-01-preview-model-applicationresource.md) |
| All other status codes | The detailed error response.<br/> | [ErrorModel](sfrp-2017-07-01-preview-model-errormodel.md) |

## Examples

### Get an application

#### Request
```
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applications/myApp?api-version=2017-07-01-preview
```

#### 200 Response
##### Body
```json
{
  "type": "applications",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applications/myApp",
  "name": "myCluster",
  "tags": {},
  "etag": "W/\"636461852503679537\"",
  "properties": {
    "provisioningState": "Updating",
    "typeName": "myAppType",
    "typeVersion": "1.0",
    "parameters": {
      "param1": "value1"
    },
    "upgradePolicy": {
      "applicationHealthPolicy": {
        "considerWarningAsError": true,
        "maxPercentUnhealthyDeployedApplications": 0,
        "defaultServiceTypeHealthPolicy": {
          "maxPercentUnhealthyServices": 0,
          "maxPercentUnhealthyPartitionsPerService": 0,
          "maxPercentUnhealthyReplicasPerPartition": 0
        }
      },
      "rollingUpgradeMonitoringPolicy": {
        "failureAction": "Rollback",
        "healthCheckRetryTimeout": "00:10:00",
        "healthCheckWaitDuration": "00:02:00",
        "healthCheckStableDuration": "00:05:00",
        "upgradeDomainTimeout": "1.06:00:00",
        "upgradeTimeout": "01:00:00"
      },
      "upgradeReplicaSetCheckTimeout": "01:00:00",
      "forceRestart": false
    },
    "maximumNodes": 3,
    "minimumNodes": 1,
    "removeApplicationCapacity": false,
    "metrics": [
      {
        "name": "metric1",
        "reservationCapacity": 1,
        "maximumCapacity": 3,
        "totalApplicationCapacity": 5
      }
    ]
  }
}
```

