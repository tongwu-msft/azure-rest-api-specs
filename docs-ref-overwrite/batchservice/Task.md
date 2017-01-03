---
uid: batch.core.windows.net/BatchService/2016-07-01.3.1/Task_List
description: *content
---
For multi-instance tasks, information such as affinityId, executionInfo, and nodeInfo refer to the primary task. Use the list subtasks API to retrieve information about subtasks.

Replace `{jobId}` with the ID of the job whose tasks you want to retrieve.

The value for `{filter}` can be the following or any AND-ed or OR-ed combination of the following:

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