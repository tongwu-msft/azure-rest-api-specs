---
title: "Get Container Log"
description: Service Fabric Mesh Resource Manager API Reference
services: service-fabric-mesh
author: VipulM-MSFT
ms.date: "2018-07-17"
ms.prod: "azure"
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Get Container Log
Gets the logs for the container.

Get the logs for the container of a given code package of an application.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabricMesh/applications/{applicationName}/services/{serviceName}/replicas/{replicaName}/codePackages/{codePackageName}/logs?api-version=2018-07-01-preview&tail={tail}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`subscriptionId`](#subscriptionid) | string | Yes | Path |
| [`resourceGroupName`](#resourcegroupname) | string | Yes | Path |
| [`applicationName`](#applicationname) | string | Yes | Path |
| [`serviceName`](#servicename) | string | Yes | Path |
| [`replicaName`](#replicaname) | string | Yes | Path |
| [`codePackageName`](#codepackagename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`tail`](#tail) | integer | No | Query |

____
### `subscriptionId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The customer subscription identifier

____
### `resourceGroupName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Azure resource group name

____
### `applicationName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application.

____
### `serviceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service.

____
### `replicaName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service replica.

____
### `codePackageName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the code package.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `2018-07-01-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be `2018-07-01-preview`.

____
### `tail`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
Number of lines to show from the end of the logs. Default is 100.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | Successful response<br/> | [ContainerLogs](sfmeshrp-model-containerlogs.md) |
| All other status codes | Error<br/> | [ErrorModel](sfmeshrp-model-errormodel.md) |

## Examples

### ContainerLogsList

#### Request
```
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/applications/sbzDocApp/services/sbzDocService/replicas/0/codePackages/sbzDocCode/logs?api-version=2018-07-01-preview
```

#### 200 Response
##### Body
```json
{
  "content": " * Running on http://0.0.0.0:8080/ (Press CTRL+C to quit)\n * Downloading style https://assets-cdn.github.com/assets/frameworks-8f281eb0a8d2308ceb36e714ba3c3aec.css\n * Downloading style https://assets-cdn.github.com/assets/github-a698da0d53574b056d3c79ac732d4a70.css\n * Downloading style https://assets-cdn.github.com/assets/site-83dc1f7ebc9c7461fe1eab799b56c4c4.css\n * Cached all downloads in /root/.grip/cache-4.5.2\n167.220.0.83 - - [06/Apr/2018 07:16:02] \"GET / HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:02] \"GET /__/grip/asset/frameworks-8f281eb0a8d2308ceb36e714ba3c3aec.css HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:02] \"GET /__/grip/asset/site-83dc1f7ebc9c7461fe1eab799b56c4c4.css HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:02] \"GET /__/grip/asset/github-a698da0d53574b056d3c79ac732d4a70.css HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:02] \"GET /__/grip/static/octicons/octicons.css HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:03] \"GET /__/grip/static/octicons/octicons.woff2?ef21c39f0ca9b1b5116e5eb7ac5eabe6 HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:03] \"GET /__/grip/static/favicon.ico HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:05] \"GET /seabreeze-index.md HTTP/1.1\" 200 -\n167.220.0.83 - - [06/Apr/2018 07:16:09] \"GET /seabreeze-api-application_get.md HTTP/1.1\" 200 -\n"
}
```

