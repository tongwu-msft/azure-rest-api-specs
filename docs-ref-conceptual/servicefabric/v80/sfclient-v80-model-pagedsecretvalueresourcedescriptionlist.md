---
title: "PagedSecretValueResourceDescriptionList"
description: "PagedSecretValueResourceDescriptionList"
ms.date: "10/21/2020"
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
# PagedSecretValueResourceDescriptionList

The list of values of a secret resource, paged if the number of results exceeds the limits of a single message. The next set of results can be obtained by executing the same query with the continuation token provided in the previous page.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ContinuationToken`](#continuationtoken) | string | No |
| [`Items`](#items) | array of [SecretValueResourceDescription](sfclient-v80-model-secretvalueresourcedescription.md) | No |

____
### `ContinuationToken`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. The continuation token is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results, then the continuation token is not included in the response.

____
### `Items`
__Type__: array of [SecretValueResourceDescription](sfclient-v80-model-secretvalueresourcedescription.md) <br/>
__Required__: No<br/>
<br/>
One page of the list.
