---
title: "Get Property Info"
ms.date: "2018-01-22"
ms.prod: "azure"
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
# Get Property Info
Gets the specified Service Fabric property.

Gets the specified Service Fabric property under a given name. This will always return both value and metadata.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Names/{nameId}/$/GetProperty?api-version=6.0&PropertyName={PropertyName}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [nameId](#nameid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [PropertyName](#propertyname) | string | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### nameId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The Service Fabric name, without the 'fabric:' URI scheme.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 6.0 <br/>
<br/>
The version of this API. This is a required parameter and its value must be "6.0".

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accept any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0, but if the runtime is 6.1, in order to make it easier to write the clients, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### PropertyName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Specifies the name of the property to get.

____
### timeout
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 60 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The server timeout for performing the operation in seconds. This specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | Details on the Service Fabric property.<br/> | [PropertyInfo](sfclient-v61-model-propertyinfo.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v61-model-fabricerror.md) |

## Examples

### Get property info

This example shows how to get a Service Fabric property under a given name.

#### Request
```
GET http://localhost:19080/Names/samples/apps/$/GetProperty?api-version=6.0&PropertyName=AppData
```

#### 200 Response
##### Body
```json
{
  "Name": "CalculatorAppData",
  "Value": {
    "Kind": "String",
    "Data": "1+2=3"
  },
  "Metadata": {
    "TypeId": "String",
    "CustomTypeId": "EquationType",
    "Parent": "fabric:/samples/apps",
    "SizeInBytes": "12",
    "LastModifiedUtcTimestamp": "2017-07-17T04:27:19.049Z",
    "SequenceNumber": "12"
  }
}
```

