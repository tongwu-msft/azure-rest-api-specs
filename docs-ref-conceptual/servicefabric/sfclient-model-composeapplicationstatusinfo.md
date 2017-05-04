---
title: "ComposeApplicationStatusInfo"
ms.date: "2017-05-04"
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
# ComposeApplicationStatusInfo

Information about a Service Fabric compose application.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Name](#name) | string | No |
| [Status](#status) | string (enum) | No |
| [StatusDetails](#statusdetails) | string | No |

____
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the application, including the 'fabric:' URI scheme.

____
### Status
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The status of the compose application. Possible values are.

- Invalid - Indicates the compose application status is invalid. The value is zero.
- Provisioning - Indicates the compose application is being provisioned in background. The value is 1.
- Creating - Indicates the compose application is being created in background. The value is 2.
- Created - Indicates the compose application has been successfully created. The value is 3.
- Unprovisioning - Indicates the compose application is being unprovisioned in background. The value is 4.
- Deleting - Indicates the compose application is being deleted in background. The value is 5.
- Failed - Indicates the compose application was terminated due to persistent failures. The value is 6.


____
### StatusDetails
__Type__: string <br/>
__Required__: No<br/>
<br/>
The status details of compose application including failure message.
