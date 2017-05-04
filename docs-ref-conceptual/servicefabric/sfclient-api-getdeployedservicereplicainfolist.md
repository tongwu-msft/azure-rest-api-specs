---
title: "Get Deployed Service Replica Info List"
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
# Get Deployed Service Replica Info List
Gets the list of replicas deployed on a Service Fabric node.

Gets the list containing the information about replicas deployed on a Service Fabric node. The information include partition id, replica id, status of the replica, name of the service, name of the service type and other information. Use PartitionId or ServiceManifestName query parameters to return information about the deployed replicas matching the specified values for those parameters.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Nodes/{nodeName}/$/GetApplications/{applicationId}/$/GetReplicas?api-version=3.0&PartitionId={PartitionId}&ServiceManifestName={ServiceManifestName}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [nodeName](#nodename) | string | Yes | Path |
| [applicationId](#applicationid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [PartitionId](#partitionid) | string (uuid) | No | Query |
| [ServiceManifestName](#servicemanifestname) | string | No | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### nodeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the node.

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
### PartitionId
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
The identity of the partition.

____
### ServiceManifestName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of a service manifest registered as part of an application type in a Service Fabric cluster.

____
### timeout
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 60 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The server timeout for performing the operation in seconds. This specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the list of deployed service replica information.<br/> | array of [DeployedServiceReplicaInfo](sfclient-model-deployedservicereplicainfo.md) |
| 204 (NoContent) | An empty response is returned if the specified applicationId is not found on the specified node. An empty respose is also returned if there are no replicas matching the specified filter values for PartitionId or ServiceManifestName query parameters.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
