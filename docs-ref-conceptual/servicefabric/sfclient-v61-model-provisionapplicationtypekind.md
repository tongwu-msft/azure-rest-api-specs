---
title: "ProvisionApplicationTypeKind"
ms.date: "2018-01-22"
ms.prod: "azure"
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
# ProvisionApplicationTypeKind enum

type: string

The kind of application type registration or provision requested. The application package can be registered or provisioned either from the image store or from an external store. Following are the kinds of the application type provision.

Possible values are: 

  - Invalid - Indicates that the provision kind is invalid. This value is default and should not be used. The value is zero.
  - ImageStorePath - Indicates that the provision is for a package that was previously uploaded to the image store. The value is 1.
  - ExternalStore - Indicates that the provision is for an application package that was previously uploaded to an external store. The application package ends with the extension *.sfpkg. The value is 2.

