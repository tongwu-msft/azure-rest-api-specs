---
title: "Provision Application Type"
ms.date: "2018-07-20"
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
# Provision Application Type
Provisions or registers a Service Fabric application type with the cluster using the '.sfpkg' package in the external store or using the application package in the image store.

Provisions a Service Fabric application type with the cluster. The provision is required before any new applications can be instantiated.
The provision operation can be performed either on the application package specified by the relativePathInImageStore, or by using the URI of the external '.sfpkg'.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/ApplicationTypes/$/Provision?api-version=6.2&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`ProvisionApplicationTypeDescriptionBaseRequiredBodyParam`](#provisionapplicationtypedescriptionbaserequiredbodyparam) | [ProvisionApplicationTypeDescriptionBase](sfclient-model-provisionapplicationtypedescriptionbase.md) | Yes | Body |

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.2` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.2'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This version is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accepts any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0 and the runtime is 6.1, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


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
### `ProvisionApplicationTypeDescriptionBaseRequiredBodyParam`
__Type__: [ProvisionApplicationTypeDescriptionBase](sfclient-model-provisionapplicationtypedescriptionbase.md) <br/>
__Required__: Yes<br/>
<br/>
The base type of provision application type description which supports either image store-based provision or external store-based provision.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful provision will return 200 status code.<br/> |  |
| 202 (Accepted) | A 202 status code indicates the operation was accepted and the provision operation has been initiated.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
