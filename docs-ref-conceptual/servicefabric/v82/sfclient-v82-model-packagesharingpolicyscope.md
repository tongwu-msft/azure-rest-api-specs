---
title: "PackageSharingPolicyScope v82"
description: "PackageSharingPolicyScope v82"
ms.date: "10/21/2020"
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
# PackageSharingPolicyScope enum v82

type: string

Represents the scope for PackageSharingPolicy. This is specified during DeployServicePackageToNode operation.

Possible values are: 

  - `None` - No package sharing policy scope. The value is 0.
  - `All` - Share all code, config and data packages from corresponding service manifest. The value is 1.
  - `Code` - Share all code packages from corresponding service manifest. The value is 2.
  - `Config` - Share all config packages from corresponding service manifest. The value is 3.
  - `Data` - Share all data packages from corresponding service manifest. The value is 4.

