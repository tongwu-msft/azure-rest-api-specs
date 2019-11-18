---
title: "Delete"
ms.date: 06/12/2019
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
# Delete
Deletes the Volume resource.

Deletes the Volume resource identified by the name.

## Request
| Method | Request URI |
| ------ | ----------- |
| DELETE | `/Resources/Volumes/{volumeResourceName}?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`volumeResourceName`](#volumeresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |

____
### `volumeResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the volume.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.4-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.4-preview'.


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> |  |
| 202 (Accepted) | Accepted<br/> |  |
| 204 (NoContent) | No Content - the specified volume was not found.<br/> |  |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### DeleteVolumeResource

This example shows how to delete an existing volume resource. If the volume resource exists and is deleted successfully, an empty response with 200 status code is returned. If the volume resource does not exist, an empty response with 204 status code is returned.

#### Request
```
DELETE http://localhost:19080/Resources/Volumes/sampleVolume?api-version=6.4-preview
```

#### 200 Response
##### Body
The response body is empty.
#### 202 Response
##### Body
The response body is empty.
#### 204 Response
##### Body
The response body is empty.