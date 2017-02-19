---
uid: batch.core.windows.net/BatchService/2016-07-01.3.1/JobSchedule_List
description: *content
---
The value for `{filter}` can be the following or any AND-ed or OR-ed combination of the following:

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
