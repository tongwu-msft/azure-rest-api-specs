---
title: "ContainerApiRequestBody"
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
# ContainerApiRequestBody

parameters for making container API call.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`HttpVerb`](#httpverb) | string | No |
| [`UriPath`](#uripath) | string | Yes |
| [`Content-Type`](#content-type) | string | No |
| [`Body`](#body) | string | No |

____
### `HttpVerb`
__Type__: string <br/>
__Required__: No<br/>
<br/>
HTTP verb of container REST API, defaults to "GET"

____
### `UriPath`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
URI path of container REST API

____
### `Content-Type`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Content type of container REST API request, defaults to "application/json"

____
### `Body`
__Type__: string <br/>
__Required__: No<br/>
<br/>
HTTP request body of container REST API
