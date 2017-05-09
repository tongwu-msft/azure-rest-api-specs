---
title: "CreateComposeApplicationDescription"
ms.date: "2017-05-09"
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
# CreateComposeApplicationDescription

Defines description for creating a Service Fabric compose application.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ApplicationName](#applicationname) | string | Yes |
| [ComposeFileContent](#composefilecontent) | string | Yes |
| [RepositoryCredential](#repositorycredential) | [RepositoryCredential](sfclient-model-repositorycredential.md) | No |

____
### ApplicationName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the application, including the 'fabric:' URI scheme.

____
### ComposeFileContent
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The content of the compose file that describes application to create.

____
### RepositoryCredential
__Type__: [RepositoryCredential](sfclient-model-repositorycredential.md) <br/>
__Required__: No<br/>
<br/>
Credential information to connect to container repository.
