---
title: "RunToCompletionExecutionPolicy"
ms.date: "11/23/2019"
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
# RunToCompletionExecutionPolicy

The run to completion execution policy

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`restart`](#restart) | string (enum) | Yes |

____
### `restart`
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>


Enumerates the restart policy for RunToCompletionExecutionPolicy

Possible values are: 

  - `onFailure` - Service will be restarted when it encounters a failure.
  - `never` - Service will never be restarted. If the service encounters a failure, it will move to Failed state.


