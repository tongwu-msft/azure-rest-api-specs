---
title: "ClientCertificateThumbprint"
description: "Describes the client certificate details using thumbprint. Properties include isAdmin and certificateThumbprint."
ms.date: 05/25/2018
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# ClientCertificateThumbprint

Describes the client certificate details using thumbprint.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [isAdmin](#isadmin) | boolean | Yes |
| [certificateThumbprint](#certificatethumbprint) | string | Yes |

____
### isAdmin
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Indicates if the client certificate has admin access to the cluster. Non admin clients can perform only read only operations on the cluster.

____
### certificateThumbprint
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The thumbprint of the client certificate.
