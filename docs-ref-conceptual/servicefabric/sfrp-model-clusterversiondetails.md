---
title: "ClusterVersionDetails"
ms.date: "2017-05-08"
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
# ClusterVersionDetails

The detail of the Service Fabric runtime version result

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [codeVersion](#codeversion) | string | No |
| [supportExpiryUtc](#supportexpiryutc) | string | No |
| [environment](#environment) | string (enum) | No |

____
### codeVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The Service Fabric runtime version of the cluster.

____
### supportExpiryUtc
__Type__: string <br/>
__Required__: No<br/>
<br/>
The date of expiry of support of the version.

____
### environment
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Indicates if this version is for Windows or Linux operating system.

Cluster operating system, the default will be Windows

