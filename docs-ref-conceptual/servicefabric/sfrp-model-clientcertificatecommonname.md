---
title: "ClientCertificateCommonName"
ms.date: "2017-04-28"
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
# ClientCertificateCommonName

Client certificate details using common name

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [isAdmin](#isadmin) | boolean | Yes |
| [certificateCommonName](#certificatecommonname) | string | Yes |
| [certificateIssuerThumbprint](#certificateissuerthumbprint) | string | Yes |

____
### isAdmin
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Is this certificate used for admin access from the client, if false , it is used or query only access

____
### certificateCommonName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Certificate common name to be granted access; be carefull using wild card common names

____
### certificateIssuerThumbprint
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Certificate issuer thumbprint
