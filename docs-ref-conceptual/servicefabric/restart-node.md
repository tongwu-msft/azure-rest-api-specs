---
title: "Restart Node"
ms.date: "2017-04-27"
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
# Restart Node
Restarts a Service Fabric cluster node.

Restarts a Service Fabric cluster node that is already started.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Nodes/{nodeName}/$/Restart?api-version=3.0` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [nodeName](#nodename) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [RestartNodeDescription](#restartnodedescription) | [RestartNodeDescription](model-RestartNodeDescription.md) | Yes | Body |

____
### nodeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the node.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### RestartNodeDescription
__Type__: [RestartNodeDescription](model-RestartNodeDescription.md) <br/>
__Required__: Yes<br/>
<br/>
The instance of the node to be restarted and a flag indicating the need to take dump of the fabric process.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code. A successful operation means that the restart command was received by the node and it is in the process of restarting. Check the status of the node by calling GetNode operation.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
