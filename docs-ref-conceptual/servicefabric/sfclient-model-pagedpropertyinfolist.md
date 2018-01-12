---
title: "PagedPropertyInfoList"
ms.date: "2017-10-02"
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
# PagedPropertyInfoList

The paged list of Service Fabric properties under a given name. The list is paged when all of the results cannot fit in a single message. The next set of results can be obtained by executing the same query with the continuation token provided in this list.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ContinuationToken](#continuationtoken) | string | No |
| [IsConsistent](#isconsistent) | boolean | No |
| [Properties](#properties) | array of [PropertyInfo](sfclient-model-propertyinfo.md) | No |

____
### ContinuationToken
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. The continuation token is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results then the continuation token is not included in the response.

____
### IsConsistent
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates whether any property under the given name has been modified during the enumeration. If there was a modification, this property value is false.

____
### Properties
__Type__: array of [PropertyInfo](sfclient-model-propertyinfo.md) <br/>
__Required__: No<br/>
<br/>

