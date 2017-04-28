---
title: "Invoke Infrastructure Query"
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
# Invoke Infrastructure Query
Invokes a read-only query on the given infrastructure service instance.

For clusters that have one or more instances of the Infrastructure Service configured,
this API provides a way to send infrastructure-specific queries to a particular
instance of the Infrastructure Service.

Available commands and their corresponding response formats vary depending upon
the infrastructure on which the cluster is running.

This API supports the Service Fabric platform; it is not meant to be used directly from your code.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/$/InvokeInfrastructureQuery?api-version=3.0&Command={Command}&ServiceId={ServiceId}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [Command](#command) | string | Yes | Query |
| [ServiceId](#serviceid) | string | No | Query |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### Command
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The text of the command to be invoked. The content of the command is infrastructure-specific.

____
### ServiceId
__Type__: string <br/>
__Required__: No<br/>
<br/>
The identity of the infrastructure service. This is  the full name of the infrastructure service without the 'fabric:' URI scheme. This parameter required only for the cluster that have more than one instance of infrastructure service running.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | The response from the infrastructure service.<br/>The response format is a JSON stream.<br/>The contents of the response depend on which command was issued.<br/> | file |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
