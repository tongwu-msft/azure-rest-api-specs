---
title: "Put"
ms.date: "2018-01-22"
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
# Put
Creates or updates a Service Fabric service resource.

Create or update a Service Fabric service resource with the specified name.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabric/clusters/{clusterName}/applications/{applicationName}/services/{serviceName}?api-version=2017-07-01-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [resourceGroupName](#resourcegroupname) | string | Yes | Path |
| [clusterName](#clustername) | string | Yes | Path |
| [applicationName](#applicationname) | string | Yes | Path |
| [serviceName](#servicename) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [parameters](#parameters) | [ServiceResource](sfrp-2017-07-01-preview-model-serviceresource.md) | Yes | Body |

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
### serviceName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the service resource in the format of {applicationName}~{serviceName}.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 2017-07-01-preview <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "2017-07-01-preview" for this specification.

____
### parameters
__Type__: [ServiceResource](sfrp-2017-07-01-preview-model-serviceresource.md) <br/>
__Required__: Yes<br/>
<br/>
The service resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | The request was accepted and the operation will complete asynchronously.<br/> | [ServiceResource](sfrp-2017-07-01-preview-model-serviceresource.md) |
| All other status codes | The detailed error response.<br/> | [ErrorModel](sfrp-2017-07-01-preview-model-errormodel.md) |

## Examples

### Put a service with mininum parameters

#### Request
```
PUT https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applications/myApp/services/myService?api-version=2017-07-01-preview
```

##### Body
```json
{
  "type": "services",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applications/myApp/services/myService",
  "name": "myCluster",
  "tags": {},
  "properties": {
    "serviceKind": "Stateless",
    "serviceTypeName": "myServiceType",
    "partitionDescription": {
      "partitionScheme": "Singleton"
    },
    "instanceCount": 1
  }
}
```

#### 202 Response
##### Headers
```html
Retry-After: 10
Location: http://10.91.140.224/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.ServiceFabric/locations/eastus/operationResults/5bc615c3-6c5b-4593-80e1-008f55376ec7?api-version=2017-07-01-preview
```

##### Body
```json
{
  "type": "services",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applications/myApp/services/myService",
  "name": "myCluster",
  "tags": {},
  "etag": "W/\"636462502183671256\"",
  "properties": {
    "provisioningState": "Updating",
    "serviceKind": "Stateless",
    "serviceTypeName": "myServiceType",
    "partitionDescription": {
      "partitionScheme": "Singleton"
    },
    "instanceCount": 1
  }
}
```


### Put a service with maximum parameters

#### Request
```
PUT https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applications/myApp/services/myService?api-version=2017-07-01-preview
```

##### Body
```json
{
  "type": "services",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applications/myApp/services/myService",
  "name": "myCluster",
  "tags": {},
  "properties": {
    "serviceKind": "Stateless",
    "placementConstraints": "NodeType==frontend",
    "serviceTypeName": "myServiceType",
    "partitionDescription": {
      "partitionScheme": "Singleton"
    },
    "serviceLoadMetrics": [
      {
        "name": "metric1",
        "weight": "Low"
      }
    ],
    "correlationScheme": [
      {
        "serviceName": "fabric:/app1/app1~svc1",
        "scheme": "Affinity"
      }
    ],
    "servicePlacementPolicies": [],
    "defaultMoveCost": "Medium",
    "instanceCount": 5
  }
}
```

#### 202 Response
##### Headers
```html
Retry-After: 10
Location: http://10.91.140.224/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.ServiceFabric/locations/eastus/operationResults/2e633105-aadc-4928-9164-d76b974170a3?api-version=2017-07-01-preview
```

##### Body
```json
{
  "type": "services",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applications/myApp/services/myService",
  "name": "myCluster",
  "tags": {},
  "etag": "W/\"636462502183671258\"",
  "properties": {
    "provisioningState": "Updating",
    "serviceKind": "Stateless",
    "placementConstraints": "NodeType==frontend",
    "serviceTypeName": "myServiceType",
    "partitionDescription": {
      "partitionScheme": "Singleton"
    },
    "serviceLoadMetrics": [
      {
        "name": "metric1",
        "weight": "Low"
      }
    ],
    "servicePlacementPolicies": [],
    "defaultMoveCost": "Medium",
    "instanceCount": 5
  }
}
```

