---
uid: batch.core.windows.net/BatchService/2016-07-01.3.1/Pool_List
description: *content
---
The value for `{filter}` can be the following or any AND-ed or OR-ed combination of the following:

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
