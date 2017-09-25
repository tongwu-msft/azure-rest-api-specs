---
title: "ComposeDeploymentStatusInfo"
ms.date: "2017-09-24"
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
# ComposeDeploymentStatusInfo

Information about a Service Fabric compose deployment.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Name](#name) | string | No |
| [ApplicationName](#applicationname) | string | No |
| [Status](#status) | string (enum) | No |
| [StatusDetails](#statusdetails) | string | No |

____
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the deployment.

____
### ApplicationName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the application, including the 'fabric:' URI scheme.

____
### Status
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The status of the compose deployment. Possible values are.

- Invalid - Indicates that the compose deployment status is invalid. The value is zero.
- Provisioning - Indicates that the compose deployment is being provisioned in background. The value is 1.
- Creating - Indicates that the compose deployment is being created in background. The value is 2.
- Ready - Indicates that the compose deployment has been successfully created or upgraded. The value is 3.
- Unprovisioning - Indicates that the compose deployment is being unprovisioned in background. The value is 4.
- Deleting - Indicates that the compose deployment is being deleted in background. The value is 5.
- Failed - Indicates that the compose deployment was terminated due to persistent failures. The value is 6.
- Upgrading - Indicates that the compose deployment is being upgraded in the background. The value is 7.


____
### StatusDetails
__Type__: string <br/>
__Required__: No<br/>
<br/>
The status details of compose deployment including failure message.
