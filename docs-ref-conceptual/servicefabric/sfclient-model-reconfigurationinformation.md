---
title: "ReconfigurationInformation"
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
# ReconfigurationInformation

Information about current reconfiguration like phase, type, previous configuration role of replica and reconfiguration start date time.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [PreviousConfigurationRole](#previousconfigurationrole) | string (enum) | No |
| [ReconfigurationPhase](#reconfigurationphase) | string (enum) | No |
| [ReconfigurationType](#reconfigurationtype) | string (enum) | No |
| [ReconfigurationStartTimeUtc](#reconfigurationstarttimeutc) | string (date-time) | No |

____
### PreviousConfigurationRole
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Replica role before reconfiguration started.

Replica role before reconfiguration started.


____
### ReconfigurationPhase
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Current phase of ongoing reconfiguration. If no reconfiguration is taking place then this value will be "None".

Current phase of ongoing reconfiguration. If no reconfiguration is taking place then this value will be "None".


____
### ReconfigurationType
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Type of current ongoing reconfiguration. If no reconfiguration is taking place then this value will be "None".

Type of current ongoing reconfiguration. If no reconfiguration is taking place then this value will be "None".


____
### ReconfigurationStartTimeUtc
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
Start time (in UTC) of the ongoing reconfiguration. If no reconfiguration is taking place then this value will be zero date-time.
