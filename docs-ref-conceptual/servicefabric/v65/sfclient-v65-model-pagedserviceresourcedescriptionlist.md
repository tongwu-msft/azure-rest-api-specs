---
title: "PagedServiceResourceDescriptionList"
ms.date: 06/12/2019
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
# PagedServiceResourceDescriptionList

The list of service resources. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`ContinuationToken`](#continuationtoken) | string | No |
| [`Items`](#items) | array of [ServiceResourceDescription](sfclient-v65-model-serviceresourcedescription.md) | No |

____
### `ContinuationToken`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. The continuation token is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results, then the continuation token is not included in the response.

____
### `Items`
__Type__: array of [ServiceResourceDescription](sfclient-v65-model-serviceresourcedescription.md) <br/>
__Required__: No<br/>
<br/>
One page of the list.
