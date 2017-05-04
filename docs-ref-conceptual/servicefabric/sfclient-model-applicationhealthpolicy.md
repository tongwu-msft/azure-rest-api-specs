---
title: "ApplicationHealthPolicy"
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
# ApplicationHealthPolicy

Defines a health policy used to evaluate the health of an application or one of its children entities.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ConsiderWarningAsError](#considerwarningaserror) | boolean | No |
| [MaxPercentUnhealthyDeployedApplications](#maxpercentunhealthydeployedapplications) | integer | No |
| [DefaultServiceTypeHealthPolicy](#defaultservicetypehealthpolicy) | [ServiceTypeHealthPolicy](sfclient-model-servicetypehealthpolicy.md) | No |
| [ServiceTypeHealthPolicyMap](#servicetypehealthpolicymap) | array of [ServiceTypeHealthPolicyMapItem](sfclient-model-servicetypehealthpolicymapitem.md) | No |

____
### ConsiderWarningAsError
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: false <br/>
<br/>
Indicates whether warnings are treated with the same severity as errors.

____
### MaxPercentUnhealthyDeployedApplications
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
The maximum allowed percentage of unhealthy deployed applications. Allowed values are Byte values from zero to 100.        
The percentage represents the maximum tolerated percentage of deployed applications that can be unhealthy before the application is considered in error.
This is calculated by dividing the number of unhealthy deployed applications over the number of nodes where the application is currently deployed on in the cluster.
The computation rounds up to tolerate one failure on small numbers of nodes. Default percentage is zero.


____
### DefaultServiceTypeHealthPolicy
__Type__: [ServiceTypeHealthPolicy](sfclient-model-servicetypehealthpolicy.md) <br/>
__Required__: No<br/>
<br/>
The health policy used by default to evaluate the health of a service type.

____
### ServiceTypeHealthPolicyMap
__Type__: array of [ServiceTypeHealthPolicyMapItem](sfclient-model-servicetypehealthpolicymapitem.md) <br/>
__Required__: No<br/>
<br/>
The map with service type health policy per service type name. The map is empty be default.
