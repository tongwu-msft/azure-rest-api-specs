---
title: "Start Application Upgrade v82"
description: "Start Application Upgrade v82"
ms.date: "10/20/2021"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
# Start Application Upgrade v82
Starts upgrading an application in the Service Fabric cluster.

Validates the supplied application upgrade parameters and starts upgrading the application if the parameters are valid.
Note, application parameters are not preserved across an application upgrade.
In order to preserve current application parameters, the user should get the parameters using [GetApplicationInfo](./sfclient-v82-api-getapplicationupgrade.md) operation first and pass them into the upgrade API call as shown in the example.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Applications/{applicationId}/$/Upgrade?api-version=6.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationId`](#applicationid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`ApplicationUpgradeDescription`](#applicationupgradedescription) | [ApplicationUpgradeDescription](sfclient-v82-model-applicationupgradedescription.md) | Yes | Body |

____
### `applicationId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application. This is typically the full name of the application without the 'fabric:' URI scheme.
Starting from version 6.0, hierarchical names are delimited with the "~" character.
For example, if the application name is "fabric:/myapp/app1", the application identity would be "myapp~app1" in 6.0+ and "myapp/app1" in previous versions.


____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.0` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.0'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accept any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0, but if the runtime is 6.1, in order to make it easier to write the clients, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `timeout`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `60` <br/>
__InclusiveMaximum__: `4294967295` <br/>
__InclusiveMinimum__: `1` <br/>
<br/>
The server timeout for performing the operation in seconds. This timeout specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

____
### `ApplicationUpgradeDescription`
__Type__: [ApplicationUpgradeDescription](sfclient-v82-model-applicationupgradedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Parameters for an application upgrade.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful response means that the application upgrade has started. Use GetApplicationUpgrade operation to get the status of the upgrade.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v82-model-fabricerror.md) |

## Examples

### Upgrade an application preserving current application parameters

This example shows how to start upgrading an application in a Service Fabric cluster.

#### Request
```
POST http://localhost:19080/Applications/samples~CalculatorApp/$/Upgrade?api-version=6.0
```

##### Body
```json
{
  "Name": "fabric:/samples/CalculatorApp",
  "TargetApplicationTypeVersion": "2.0",
  "Parameters": [
    {
      "Key": "CalculatorAppParameter1",
      "Value": "314"
    },
    {
      "Key": "CalculatorAppParameter2",
      "Value": "271"
    }
  ],
  "UpgradeKind": "Rolling",
  "RollingUpgradeMode": "Monitored",
  "MonitoringPolicy": {
    "FailureAction": "Rollback"
  }
}
```

#### 200 Response
##### Body
The response body is empty.