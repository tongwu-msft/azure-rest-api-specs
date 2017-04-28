---
title: "Upload File"
ms.date: "2017-04-28"
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
# Upload File
Uploads contents of the file to the image store.

Uploads contents of the file to the image store. Use this API if the file is small enough to upload again if the connection fails. The file's data needs to be added to the request body. The contents will be uploaded to the specified path.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/ImageStore/{contentPath}?api-version=3.0` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [contentPath](#contentpath) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |

____
### contentPath
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Relative path to file or folder in the image store from its root.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | If the upload request succeeds, the server returns the HTTP 200 OK status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
