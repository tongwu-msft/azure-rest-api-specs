---
title: "ServerCertificateCommonName"
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
# ServerCertificateCommonName

Describes the server certificate details using common name.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [certificateCommonName](#certificatecommonname) | string | Yes |
| [certificateIssuerThumbprint](#certificateissuerthumbprint) | string | Yes |

____
### certificateCommonName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The common name of the server certificate.

____
### certificateIssuerThumbprint
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The issuer thumbprint of the server certificate.
