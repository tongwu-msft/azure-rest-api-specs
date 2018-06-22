---
title: "Create"
ms.date: "2018-05-25"
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
# Create
Creates or updates a Service Fabric application resource.

Create or update a Service Fabric application resource with the specified name.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabric/clusters/{clusterName}/applications/{applicationName}?api-version=2017-07-01-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [resourceGroupName](#resourcegroupname) | string | Yes | Path |
| [clusterName](#clustername) | string | Yes | Path |
| [applicationName](#applicationname) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [parameters](#parameters) | [ApplicationResource](sfrp-2017-07-01-preview-model-applicationresource.md) | Yes | Body |

____
### subscriptionId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The customer subscription identifier.

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
The name of the cluster resource.

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
The version of the Service Fabric resource provider API. This is a required parameter and it's value must be "2017-07-01-preview" for this specification.

____
### parameters
__Type__: [ApplicationResource](sfrp-2017-07-01-preview-model-applicationresource.md) <br/>
__Required__: Yes<br/>
<br/>
The application resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | The request was accepted and the operation will complete asynchronously.<br/> | [ApplicationResource](sfrp-2017-07-01-preview-model-applicationresource.md) |
| All other status codes | The detailed error response.<br/> | [ErrorModel](sfrp-2017-07-01-preview-model-errormodel.md) |

## Examples

### Put an application with mininum parameters

#### Request
```
PUT https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applications/myApp?api-version=2017-07-01-preview
```

##### Body
```json
{
  "type": "applications",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applications/myApp",
  "name": "myCluster",
  "tags": {},
  "properties": {
    "typeName": "myAppType",
    "typeVersion": "1.0",
    "removeApplicationCapacity": false
  }
}
```

#### 202 Response
##### Headers
```html
Retry-After: 10
Location: http://10.91.140.224/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.ServiceFabric/locations/eastus/operationResults/5dce62ce-439b-47af-81d8-99ab14708e91?api-version=2017-07-01-preview
```

##### Body
```json
{
  "type": "applications",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applications/myApp",
  "name": "myCluster",
  "tags": {},
  "etag": "W/\"636462502180261857\"",
  "properties": {
    "provisioningState": "Updating",
    "typeName": "myAppType",
    "typeVersion": "1.0",
    "removeApplicationCapacity": false
  }
}
```


### Put an application with maximum parameters

#### Request
```
PUT https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applications/myApp?api-version=2017-07-01-preview
```

##### Body
```json
{
  "type": "applications",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applications/myApp",
  "name": "myCluster",
  "tags": {},
  "properties": {
    "typeName": "myAppType",
    "typeVersion": "1.0",
    "parameters": {
      "param1": "value1"
    },
    "upgradePolicy": {
      "applicationHealthPolicy": {
        "considerWarningAsError": true,
        "maxPercentUnhealthyDeployedApplications": "0",
        "defaultServiceTypeHealthPolicy": {
          "maxPercentUnhealthyServices": "0",
          "maxPercentUnhealthyPartitionsPerService": "0",
          "maxPercentUnhealthyReplicasPerPartition": "0"
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
    "maximumNodes": "3",
    "minimumNodes": "1",
    "removeApplicationCapacity": false,
    "metrics": [
      {
        "name": "metric1",
        "reservationCapacity": "1",
        "maximumCapacity": "3",
        "totalApplicationCapacity": "5"
      }
    ]
  }
}
```

#### 202 Response
##### Headers
```html
Retry-After: 10
Location: http://10.91.140.224/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.ServiceFabric/locations/eastus/operationResults/9c2ce367-47ea-43de-b69e-c5a423da4557?api-version=2017-07-01-preview
```

##### Body
```json
{
  "type": "applications",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applications/myApp",
  "name": "myCluster",
  "tags": {},
  "etag": "W/\"636462502180261859\"",
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
        "maxPercentUnhealthyDeployedApplications": "0",
        "defaultServiceTypeHealthPolicy": {
          "maxPercentUnhealthyServices": "0",
          "maxPercentUnhealthyPartitionsPerService": "0",
          "maxPercentUnhealthyReplicasPerPartition": "0"
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
    "maximumNodes": "3",
    "minimumNodes": "1",
    "removeApplicationCapacity": false,
    "metrics": [
      {
        "name": "metric1",
        "reservationCapacity": "1",
        "maximumCapacity": "3",
        "totalApplicationCapacity": "5"
      }
    ]
  }
}
```

