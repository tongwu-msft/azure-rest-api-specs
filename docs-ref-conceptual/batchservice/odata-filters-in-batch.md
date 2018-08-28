---
title: "OData filters in Azure Batch | Microsoft Docs"
ms.custom: ""
ms.date: "08/27/2018"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
caps.latest.revision: 18
author: "matthchr"
ms.author: "matthchr"
manager: "daryls"
---

# OData Filters in Azure Batch
OData filters are used to limit the amount of data returned from a query issued to the Batch service by filtering the results based on some criteria. Filter conditions can be combined using the "AND" and "OR" operators. Not every API supports filter queries, and each supported API allows filtering on a unique set of properties, as listed below.

## List node agent skus
[Reference](/rest/api/batchservice/account)

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|osType|eq, ne|String|

## List certificates
[Reference](/rest/api/batchservice/certificate/list)

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|state|eq|String|
|stateTransitionTime|eq, ne, ge, gt, le, lt|DateTime|


## List nodes in a pool
[Reference](/rest/api/batchservice/computenode/list)

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|state|eq|String|
|stateTransitionTime|eq, ne, ge, gt, le, lt|DateTime|
|lastBootTime|eq, ne, ge, gt, le, lt|DateTime|
|allocationTime|eq, ne, ge, gt, le, lt|DateTime|
|startTaskInfo/state|eq|String|
|startTaskInfo/result|eq, ne|String|
|startTaskInfo/exitCode|eq, ne, ge, gt, le, lt|Int|
|startTaskInfo/startTime|eq, ne, ge, gt, le, lt|DateTime|
|startTaskInfo/endTime|eq, ne, ge, gt, le, lt|DateTime|

## List pool node counts
[Reference](/rest/api/batchservice/account/listpoolnodecounts)

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|poolId|eq|String|

## List task files
[Reference](/rest/api/batchservice/file/listfromtask)

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|name|startswith|String|

## List compute node files
[Reference](/rest/api/batchservice/file/listfromcomputenode)

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|name|startswith|String|

## List jobs in a job schedule
[Reference](/rest/api/batchservice/job/listfromjobschedule)

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|state|eq|String|
|stateTransitionTime|eq, ne, ge, gt, le, lt|DateTime|
|creationTime|eq, ne, ge, gt, le, lt|DateTime|
|lastModified|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/startTime|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/endTime|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/poolId|startswith, eq, ne, ge, gt, le, lt|String|

## List job schedules
[Reference](/rest/api/batchservice/jobschedule/list)

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|id|startswith, eq, ne, ge, gt, le, lt|String|
|state|eq|String|
|stateTransitionTime|eq, ne, ge, gt, le, lt|DateTime|
|creationTime|eq, ne, ge, gt, le, lt|DateTime|
|lastModified|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/endTime|eq, ne, ge, gt, le, lt|DateTime|
|schedule/doNotRunUntil|eq, ne, ge, gt, le, lt|DateTime|
|schedule/doNotRunAfter|eq, ne, ge, gt, le, lt|DateTime|

## List jobs
[Reference](/rest/api/batchservice/job/list)

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|id|startswith, eq, ne, ge, gt, le, lt|String|
|state|eq|String|
|stateTransitionTime|eq, ne, ge, gt, le, lt|DateTime|
|creationTime|eq, ne, ge, gt, le, lt|DateTime|
|lastModified|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/startTime|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/endTime|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/poolId|startswith, eq, ne, ge, gt, le, lt|String|


## List pools
[Reference](/rest/api/batchservice/pool/list)

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|id|startswith, eq, ne, ge, gt, le, lt|String|
|state|eq|String|
|stateTransitionTime|eq, ne, ge, gt, le, lt|DateTime|
|allocationState|eq|String|
|allocationStateTransitionTime|eq, ne, ge, gt, le, lt|DateTime|
|creationTime|eq, ne, ge, gt, le, lt|DateTime|
|enableAutoScale|eq, ne|Boolean|
|lastModified|eq, ne, ge, gt, le, lt|DateTime|
|vmSize|eq, ne|String|
|enableInterNodeCommunication|eq, ne|Boolean|

## List job preparation and release status
[Reference](/rest/api/batchservice/job/listpreparationandreleasetaskstatus)

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|poolId|eq, ne|String|
|nodeId|eq, ne|String|
|jobPreparationTaskExecutionInfo/state|eq|String|
|jobPreparationTaskExecutionInfo/startTime|eq, ne, ge, gt, le, lt|DateTime|
|jobPreparationTaskExecutionInfo/endTime|eq, ne, ge, gt, le, lt|DateTime|
|jobPreparationTaskExecutionInfo/exitCode|eq, ne, ge, gt, le, lt|Int|
|jobPreparationTaskExecutionInfo/result|eq, ne|String|
|jobReleaseTaskExecutionInfo/state|eq|String|
|jobReleaseTaskExecutionInfo/startTime|eq, ne, ge, gt, le, lt|DateTime|
|jobReleaseTaskExecutionInfo/endTime|eq, ne, ge, gt, le, lt|DateTime|
|jobReleaseTaskExecutionInfo/exitCode|eq, ne, ge, gt, le, lt|Int|
|jobReleaseTaskExecutionInfo/result|eq, ne|String|

## List tasks
[Reference](/rest/api/batchservice/task/list)

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|id|startswith, eq, ge, gt, le, lt, ne|String|
|state|eq|String|
|stateTransitionTime|eq, ne, ge, gt, le, lt|DateTime|
|creationTime|eq, ne, ge, gt, le, lt|DateTime|
|lastModifiedTime|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/startTime|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/endTime|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/exitCode|eq, ne, ge, gt, le, lt|Int|
|executionInfo/result|eq, ne|String|

## List account usage metrics
[Reference](/rest/api/batchservice/pool/listusagemetrics)

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|poolId|eq, ge, gt, le, lt, startswith|String|
