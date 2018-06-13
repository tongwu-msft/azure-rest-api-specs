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
Creates or updates a Service Fabric application type version resource.

Create or update a Service Fabric application type version resource with the specified name.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabric/clusters/{clusterName}/applicationTypes/{applicationTypeName}/versions/{version}?api-version=2017-07-01-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [resourceGroupName](#resourcegroupname) | string | Yes | Path |
| [clusterName](#clustername) | string | Yes | Path |
| [applicationTypeName](#applicationtypename) | string | Yes | Path |
| [version](#version) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [parameters](#parameters) | [ApplicationTypeVersionResource](sfrp-2017-07-01-preview-model-applicationtypeversionresource.md) | Yes | Body |

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
### applicationTypeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the application type name resource.

____
### version
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The application type version.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 2017-07-01-preview <br/>
<br/>
The version of the Service Fabric resource provider API. This is a required parameter and it's value must be "2017-07-01-preview" for this specification.

____
### parameters
__Type__: [ApplicationTypeVersionResource](sfrp-2017-07-01-preview-model-applicationtypeversionresource.md) <br/>
__Required__: Yes<br/>
<br/>
The application type version resource.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | The request was accepted and the operation will complete asynchronously.<br/> | [ApplicationTypeVersionResource](sfrp-2017-07-01-preview-model-applicationtypeversionresource.md) |
| All other status codes | The detailed error response.<br/> | [ErrorModel](sfrp-2017-07-01-preview-model-errormodel.md) |

## Examples

### Put an application type version

#### Request
```
PUT https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applicationTypes/myAppType/versions/1.0?api-version=2017-07-01-preview
```

##### Body
```json
{
  "type": "versions",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applicationTypes/myAppType/versions/1.0",
  "name": "myCluster",
  "tags": {},
  "properties": {
    "appPackageUrl": "http://fakelink.test.com/MyAppType"
  }
}
```

#### 202 Response
##### Headers
```html
Retry-After: 10
Location: http://10.91.140.224/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.ServiceFabric/locations/eastus/operationResults/e2413c7e-d51b-40ac-8155-bc85bf8ae856?api-version=2017-07-01-preview
```

##### Body
```json
{
  "type": "versions",
  "location": "eastus",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resRg/providers/Microsoft.ServiceFabric/clusters/myCluster/applicationTypes/myAppType/versions/1.0",
  "name": "myCluster",
  "tags": {},
  "etag": "W/\"636462502176040417\"",
  "properties": {
    "provisioningState": "Updating",
    "appPackageUrl": "http://fakelink.test.com/MyAppType",
    "defaultParameterList": {}
  }
}
```

