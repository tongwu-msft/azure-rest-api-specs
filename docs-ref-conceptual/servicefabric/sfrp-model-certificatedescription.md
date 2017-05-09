---
title: "CertificateDescription"
ms.date: "2017-05-09"
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
# CertificateDescription

Describes the certificate details.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [thumbprint](#thumbprint) | string | Yes |
| [thumbprintSecondary](#thumbprintsecondary) | string | No |
| [x509StoreName](#x509storename) | string (enum) | No |

____
### thumbprint
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Thumbprint of the primary certificate.

____
### thumbprintSecondary
__Type__: string <br/>
__Required__: No<br/>
<br/>
Thumbprint of the secondary certificate.

____
### x509StoreName
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The local certificate store location.
