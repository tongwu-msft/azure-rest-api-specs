---
title: "RepositoryCredential"
ms.date: "2017-05-03"
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
# RepositoryCredential

Credential information to connect to container repository.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [RepositoryUserName](#repositoryusername) | string | No |
| [RepositoryPassword](#repositorypassword) | string | No |
| [PasswordEncrypted](#passwordencrypted) | boolean | No |

____
### RepositoryUserName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The user name to connect to container repository.

____
### RepositoryPassword
__Type__: string <br/>
__Required__: No<br/>
<br/>
The password for supplied username to connect to container repository.

____
### PasswordEncrypted
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates that supplied container repository password is encrypted.
