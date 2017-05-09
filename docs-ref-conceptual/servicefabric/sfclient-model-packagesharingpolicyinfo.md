---
title: "PackageSharingPolicyInfo"
ms.date: "2017-05-08"
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
# PackageSharingPolicyInfo

Represents a policy for the package sharing.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [SharedPackageName](#sharedpackagename) | string | No |
| [PackageSharingScope](#packagesharingscope) | string (enum) | No |

____
### SharedPackageName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of code, configuration or data package that should be shared.

____
### PackageSharingScope
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Represents the scope for PackageSharingPolicy. This is specified during DeployServicePackageToNode operation. Possible values are following.

  - None - No package sharing policy scope. The value is 0.
  - All - Share all code, config and data packages from corresponding service manifest. The value is 1.
  - Code - Share all code packages from corresponding service manifest. The value is 2.
  - Config - Share all config packages from corresponding service manifest. The value is 3.
  - Data - Share all data packages from corresponding service manifest. The value is 4.

