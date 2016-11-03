---
uid: batch.core.windows.net/BatchService/2016-07-01.3.1/Job_List
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
|executionInfo/startTime|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/endTime|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/poolId|startswith, eq, ne, ge, gt, le, lt|String|

---
uid: batch.core.windows.net/BatchService/2016-07-01.3.1/Job_ListFromJobSchedule
description: *content
---
Replace `{jobScheduleId}` with the ID of the job schedule from which you want to get a list of jobs.

The value for `{filter}` can be the following or any AND-ed or OR-ed combination of the following:

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|state|eq|String|
|stateTransitionTime|eq, ne, ge, gt, le, lt|DateTime|
|creationTime|eq, ne, ge, gt, le, lt|DateTime|
|lastModified|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/startTime|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/endTime|eq, ne, ge, gt, le, lt|DateTime|
|executionInfo/poolId|startswith, eq, ne, ge, gt, le, lt|String|

---
uid: batch.core.windows.net/BatchService/2016-07-01.3.1/Job_ListPreparationAndReleaseTaskStatus
description: *content
---
Replace `{jobId}` with the ID of the job for which to get job preparation and job release task execution status.

The value for `{filter}` can be the following, or any AND-ed or OR-ed combination of the following:

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|poolId|eq, ne|String|
|nodeId|eq, ne|String|
|jobPreparationTaskExecutionInfo/state|eq|String|
|jobPreparationTaskExecutionInfo/startTime|eq, ne, ge, gt, le, lt|DateTime|
|jobPreparationTaskExecutionInfo/endTime|eq, ne, ge, gt, le, lt|DateTime|
|jobPreparationTaskExecutionInfo/exitCode|eq, ne, ge, gt, le, lt|Int|
|jobReleaseTaskExecutionInfo/state|eq|String|
|jobReleaseTaskExecutionInfo/startTime|eq, ne, ge, gt, le, lt|DateTime|
|jobReleaseTaskExecutionInfo/endTime|eq, ne, ge, gt, le, lt|DateTime|
|jobReleaseTaskExecutionInfo/exitCode|eq, ne, ge, gt, le, lt|Int|