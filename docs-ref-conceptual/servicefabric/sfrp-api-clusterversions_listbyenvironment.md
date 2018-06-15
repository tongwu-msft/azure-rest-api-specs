---
title: "List By Environment"
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
# List By Environment
Gets the list of Service Fabric cluster code versions available for the specified environment.

Gets all available code versions for Service Fabric cluster resources by environment.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/providers/Microsoft.ServiceFabric/locations/{location}/environments/{environment}/clusterVersions?api-version=2018-02-01` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [location](#location) | string | Yes | Path |
| [environment](#environment) | string (enum) | Yes | Path |
| [subscriptionId](#subscriptionid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |

____
### location
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The location for the cluster code versions. This is different from cluster location.

____
### environment
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>
The operating system of the cluster. The default means all. Possible values include: 'Windows', 'Linux'

____
### subscriptionId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The customer subscription identifier.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 2018-02-01 <br/>
<br/>
The version of the Service Fabric resource provider API. This is a required parameter and it's value must be "2018-02-01" for this specification.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | The operation completed successfully.<br/> | [ClusterCodeVersionsListResult](sfrp-model-clustercodeversionslistresult.md) |


## Examples

### List cluster versions by environment

#### Request
```
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.ServiceFabric/locations/eastus/environments/Windows/clusterVersions?api-version=2018-02-01
```

#### 200 Response
##### Body
```json
{
  "value": [
    {
      "id": "subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.ServiceFabric/locations/eastus/environments/Windows/clusterVersions/6.1.480.9494",
      "name": "6.1.480.9494",
      "type": "Microsoft.ServiceFabric/locations/environments/clusterVersions",
      "properties": {
        "codeVersion": "6.1.480.9494",
        "supportExpiryUtc": "2018-06-15T23:59:59.9999999",
        "environment": "Windows"
      }
    }
  ]
}
```

