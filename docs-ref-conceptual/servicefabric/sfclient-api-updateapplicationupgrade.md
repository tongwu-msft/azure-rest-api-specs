---
title: "Update Application Upgrade"
ms.date: "2017-05-08"
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
# Update Application Upgrade
Updates an ongoing application upgrade in the Service Fabric cluster.

Updates the parameters of an ongoing application upgrade from the ones specified at the time of starting the application upgrade. This may be required to mitigate stuck application upgrades due to incorrect parameters or issues in the application to make progress.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Applications/{applicationId}/$/UpdateUpgrade?api-version=3.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [applicationId](#applicationid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |
| [ApplicationUpgradeUpdateDescription](#applicationupgradeupdatedescription) | [ApplicationUpgradeUpdateDescription](sfclient-model-applicationupgradeupdatedescription.md) | Yes | Body |

____
### applicationId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application. This is typically the full name of the application without the 'fabric:' URI scheme.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### timeout
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 60 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The server timeout for performing the operation in seconds. This specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

____
### ApplicationUpgradeUpdateDescription
__Type__: [ApplicationUpgradeUpdateDescription](sfclient-model-applicationupgradeupdatedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the parameters for updating an existing application upgrade.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful response means that the application upgrade has updated with the specified parameters. Use GetApplicationUpgrade operation to get the status of the upgrade.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
