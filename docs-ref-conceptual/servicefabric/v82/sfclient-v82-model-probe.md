---
title: "Probe v82"
description: "Probe v82"
ms.date: "04/02/2021"
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
# Probe v82

Probes have a number of fields that you can use to control their behavior.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`initialDelaySeconds`](#initialdelayseconds) | integer | No |
| [`periodSeconds`](#periodseconds) | integer | No |
| [`timeoutSeconds`](#timeoutseconds) | integer | No |
| [`successThreshold`](#successthreshold) | integer | No |
| [`failureThreshold`](#failurethreshold) | integer | No |
| [`exec`](#exec) | [ProbeExec](sfclient-v82-model-probeexec.md) | No |
| [`httpGet`](#httpget) | [ProbeHttpGet](sfclient-v82-model-probehttpget.md) | No |
| [`tcpSocket`](#tcpsocket) | [ProbeTcpSocket](sfclient-v82-model-probetcpsocket.md) | No |

____
### `initialDelaySeconds`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `0` <br/>
<br/>
The initial delay in seconds to start executing probe once codepackage has started.

____
### `periodSeconds`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `10` <br/>
<br/>
Periodic seconds to execute probe.

____
### `timeoutSeconds`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `1` <br/>
<br/>
Period after which probe is considered as failed if it hasn't completed successfully.

____
### `successThreshold`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `1` <br/>
<br/>
The count of successful probe executions after which probe is considered success.

____
### `failureThreshold`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `3` <br/>
<br/>
The count of failures after which probe is considered failed.

____
### `exec`
__Type__: [ProbeExec](sfclient-v82-model-probeexec.md) <br/>
__Required__: No<br/>
<br/>
Exec command to run inside the container.

____
### `httpGet`
__Type__: [ProbeHttpGet](sfclient-v82-model-probehttpget.md) <br/>
__Required__: No<br/>
<br/>
Http probe for the container.

____
### `tcpSocket`
__Type__: [ProbeTcpSocket](sfclient-v82-model-probetcpsocket.md) <br/>
__Required__: No<br/>
<br/>
Tcp port to probe inside the container.
