---
title: "ClientCertificateCommonName"
ms.date: "2017-04-29"
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

Describes the client certificate details using common name.

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
Indicates if the client certificate has admin access to the cluster. Non admin clients can perform only read only operations on the cluster.

____
### certificateCommonName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The common name of the client certificate.

____
### certificateIssuerThumbprint
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The issuer thumbprint of the client certificate.
