---
title: "CreateComposeDeploymentDescription v82"
description: "CreateComposeDeploymentDescription v82"
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
# CreateComposeDeploymentDescription v82

Defines description for creating a Service Fabric compose deployment.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`DeploymentName`](#deploymentname) | string | Yes |
| [`ComposeFileContent`](#composefilecontent) | string | Yes |
| [`RegistryCredential`](#registrycredential) | [RegistryCredential](sfclient-v82-model-registrycredential.md) | No |

____
### `DeploymentName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the deployment.

____
### `ComposeFileContent`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The content of the compose file that describes the deployment to create.

____
### `RegistryCredential`
__Type__: [RegistryCredential](sfclient-v82-model-registrycredential.md) <br/>
__Required__: No<br/>
<br/>
Credential information to connect to container registry.
