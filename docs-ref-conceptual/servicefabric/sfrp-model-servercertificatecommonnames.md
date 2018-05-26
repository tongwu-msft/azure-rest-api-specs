---
title: "ServerCertificateCommonNames"
ms.date: "2018-05-25"
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
# ServerCertificateCommonNames

Describes a list of server certificates referenced by common name that are used to secure the cluster.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [commonNames](#commonnames) | array of [ServerCertificateCommonName](sfrp-model-servercertificatecommonname.md) | No |
| [x509StoreName](#x509storename) | string (enum) | No |

____
### commonNames
__Type__: array of [ServerCertificateCommonName](sfrp-model-servercertificatecommonname.md) <br/>
__Required__: No<br/>
<br/>
The list of server certificates referenced by common name that are used to secure the cluster.

____
### x509StoreName
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The local certificate store location.

