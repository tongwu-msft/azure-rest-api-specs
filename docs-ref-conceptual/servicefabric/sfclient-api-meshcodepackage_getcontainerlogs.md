---
title: "Get Container Logs"
ms.date: 06/12/2019
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
# Get Container Logs
Gets the logs from the container.

Gets the logs for the container of the specified code package of the service replica.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Applications/{applicationResourceName}/Services/{serviceResourceName}/Replicas/{replicaName}/CodePackages/{codePackageName}/Logs?api-version=6.4-preview&Tail={Tail}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationResourceName`](#applicationresourcename) | string | Yes | Path |
| [`serviceResourceName`](#serviceresourcename) | string | Yes | Path |
| [`replicaName`](#replicaname) | string | Yes | Path |
| [`codePackageName`](#codepackagename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`Tail`](#tail) | string | No | Query |

____
### `applicationResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application.

____
### `serviceResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service.

____
### `replicaName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Service Fabric replica name.


____
### `codePackageName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of code package of the service.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.4-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.4-preview'.


____
### `Tail`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Number of lines to show from the end of the logs. Default is 100. 'all' to show the complete logs.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [ContainerLogs](sfclient-model-containerlogs.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### GetContainerLogs

This example shows how to get logs from the container of service replica. If the container exists, the logs are returned with an OK (200) status code, otherwise an error is returned with an appropriate status code.

#### Request
```
GET http://localhost:19080/Resources/Applications/sbzDocApp/Services/sbzDocService/Replicas/0/CodePackages/sbzDocCode/Logs?api-version=6.4-preview
```

#### 200 Response
##### Body
```json
{
  "Content": " * Running on http://0.0.0.0:8080/ (Press CTRL+C to quit)\n * Downloading style https://assets-cdn.github.com/assets/frameworks-8f281eb0a8d2308ceb36e714ba3c3aec.css\n * Downloading style https://assets-cdn.github.com/assets/github-a698da0d53574b056d3c79ac732d4a70.css\n * Downloading style https://assets-cdn.github.com/assets/site-83dc1f7ebc9c7461fe1eab799b56c4c4.css\n * Cached all downloads in /root/.grip/cache-4.5.2\n167.220.0.83 - - [06/Apr/2018 07:16:02] \"GET / HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:02] \"GET /__/grip/asset/frameworks-8f281eb0a8d2308ceb36e714ba3c3aec.css HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:02] \"GET /__/grip/asset/site-83dc1f7ebc9c7461fe1eab799b56c4c4.css HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:02] \"GET /__/grip/asset/github-a698da0d53574b056d3c79ac732d4a70.css HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:02] \"GET /__/grip/static/octicons/octicons.css HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:03] \"GET /__/grip/static/octicons/octicons.woff2?ef21c39f0ca9b1b5116e5eb7ac5eabe6 HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:03] \"GET /__/grip/static/favicon.ico HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:05] \"GET /seabreeze-index.md HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:09] \"GET /seabreeze-api-application_get.md HTTP/1.1\" 200 -\n"
}
```

