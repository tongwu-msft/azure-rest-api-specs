---
uid: batch.core.windows.net/BatchService/2016-07-01.3.1/ComputeNode_List
description: *content
---
The value for `{filter}` can be the following or any AND-ed or OR-ed combination of the following:

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|state|eq|String|
|stateTransitionTime|eq, ne, ge, gt, le, lt|DateTime|
|lastBootTime|eq, ne, ge, gt, le, lt|DateTime|
|allocationTime|eq, ne, ge, gt, le, lt|DateTime|
|startTaskInfo/state|eq|String|
|startTaskInfo/exitCode|eq, ne, ge, gt, le, lt|Int|
|startTaskInfo/startTime|eq, ne, ge, gt, le, lt|DateTime|
|startTaskInfo/endTime|eq, ne, ge, gt, le, lt|DateTime|