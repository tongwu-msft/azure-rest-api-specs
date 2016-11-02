---
uid: batch.core.windows.net/BatchService/2016-07-01.3.1/File_ListFromComputeNode
description: *content
---
Replace `{pool-id}` with the id of the pool that contains the node. Replace {node-id} with the id of the node.

The optional recursive parameter can be used to list all of the contents of the working directory. This parameter can be used in combination with the filter parameter to list specific type of files.

The value for `{filter}` can be the following:

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|name|startswith|String|

---
uid: batch.core.windows.net/BatchService/2016-07-01.3.1/File_ListFromTask
description: *content
---
Replace `{job-id}` with the id of the job that contains the task. Replace `{task-id}` with the id of the task from which you want to list associated files.

The optional recursive parameter can be used to list all of the contents of the working directory. This parameter can be used in combination with the filter parameter to list specific type of files.

 The value for `{filter}` can be the following:

|Property|Operations allowed|Type|
|--------------|------------------------|----------|
|name|startswith|String|
