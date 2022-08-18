---
title: "Update Application Type Arm Metadata"
description: "Update Application Type Arm Metadata"
ms.date: "04/25/2022"
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
# Update Application Type Arm Metadata
Updates the Arm Metadata for a specific Application Type.

Updates the Arm Metadata for a specific Application Type. Is able to be called immediately after the provision app type API is called.  


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/ApplicationTypes/{applicationTypeName}/$/UpdateArmMetadata?ApplicationTypeVersion={ApplicationTypeVersion}&api-version=9.0&timeout={timeout}&Force={Force}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationTypeName`](#applicationtypename) | string | Yes | Path |
| [`ApplicationTypeVersion`](#applicationtypeversion) | string | Yes | Query |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`Force`](#force) | boolean | No | Query |
| [`ApplicationTypeArmMetadataUpdateDescription`](#applicationtypearmmetadataupdatedescription) | [ArmMetadata](sfclient-model-armmetadata.md) | Yes | Body |

____
### `applicationTypeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the application type.

____
### `ApplicationTypeVersion`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The version of the application type.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `9.0` <br/>
<br/>
The version of the API. This parameter is required and its value must be '9.0'.

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
### `Force`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Force parameter used to prevent accidental Arm metadata update.

____
### `ApplicationTypeArmMetadataUpdateDescription`
__Type__: [ArmMetadata](sfclient-model-armmetadata.md) <br/>
__Required__: Yes<br/>
<br/>
The Arm metadata to be assocated with a specific application type

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful update will return 200 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
