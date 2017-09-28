---
title: "VersionProperties"
ms.date: "2017-09-27"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# VersionProperties

The properties of the version resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [provisioningState](#provisioningstate) | string | No |
| [appPackageUrl](#apppackageurl) | string | No |
| [defaultParameterList](#defaultparameterlist) | array of [ApplicationParameter](sfrp-2017-07-01-preview-model-applicationparameter.md) | No |

____
### provisioningState
__Type__: string <br/>
__Required__: No<br/>
<br/>
The current deployment or provisioning state, which only appears in the response

____
### appPackageUrl
__Type__: string <br/>
__Required__: No<br/>
<br/>
The URL to the application package

____
### defaultParameterList
__Type__: array of [ApplicationParameter](sfrp-2017-07-01-preview-model-applicationparameter.md) <br/>
__Required__: No<br/>
<br/>
List of application type parameters that can be overridden when creating or updating the application.
