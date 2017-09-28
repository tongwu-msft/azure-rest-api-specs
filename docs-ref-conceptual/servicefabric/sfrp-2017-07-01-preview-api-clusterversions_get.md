---
title: "Get"
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
# Get
Get cluster code versions

Get cluster code versions by location


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/providers/Microsoft.ServiceFabric/locations/{location}/clusterVersions/{clusterVersion}?api-version=2016-09-01` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [location](#location) | string | Yes | Path |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [clusterVersion](#clusterversion) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |

____
### location
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The location for the cluster code versions, this is different from cluster location

____
### subscriptionId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The customer subscription identifier

____
### clusterVersion
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The cluster code version

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 2016-09-01 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "2016-09-01".

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK - Get cluster code versions successfully<br/> | [ClusterCodeVersionsListResult](sfrp-2017-07-01-preview-model-clustercodeversionslistresult.md) |


## Examples

### Get cluster version

#### Request
```
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.ServiceFabric/locations/westus/clusterVersions/5.5.216.0?api-version=2016-09-01
```

#### 200 Response
##### Body
```json
{
  "value": [
    {
      "id": "subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.ServiceFabric/locations/westus/environments/Windows/clusterVersions/5.5.216.0",
      "name": "5.5.216.0",
      "type": "Microsoft.ServiceFabric/locations/environments/clusterVersions",
      "properties": {
        "codeVersion": "5.5.216.0",
        "supportExpiryUtc": "2017-08-10T00:00:00",
        "environment": "Windows"
      }
    }
  ]
}
```

