---
title: "Get Aad Metadata"
ms.date: "2017-04-27"
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
# Get Aad Metadata
Gets the Azure Active Directory metadata used for secured connection to cluster.

Gets the Azure Active Directory metadata used for secured connection to cluster.
This API is not supposed to be called separately. It provides information needed to set up an Azure Active Directory secured connection with a Service Fabric cluster.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/$/GetAadMetadata?api-version=1.0` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 1.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "1.0".

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the Azure Active Directory metadata.<br/> | [AadMetadataObject](model-AadMetadataObject.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
