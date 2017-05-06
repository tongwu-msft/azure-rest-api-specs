---
title: "AzureActiveDirectory"
ms.date: "2017-05-06"
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
# AzureActiveDirectory

The settings to enable AAD authentication on the cluster.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [tenantId](#tenantid) | string | No |
| [clusterApplication](#clusterapplication) | string | No |
| [clientApplication](#clientapplication) | string | No |

____
### tenantId
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure active directory tenant id.

____
### clusterApplication
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure active directory cluster application id.

____
### clientApplication
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure active directory client application id.
