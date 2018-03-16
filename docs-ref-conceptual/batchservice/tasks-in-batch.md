---
title: "Tasks in Batch | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ebe72016-8144-4116-88a8-0031729b32ad
caps.latest.revision: 19
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Tasks in Batch
  A task is a piece of work that is associated with a job and runs on a compute node. A task runs by executing a program specified in the task definition.

 A task normally runs on a single compute node.  However, for tasks such as MPI \(Message Passing Interface\) programs, you can specify that the task can run across multiple nodes.  Such tasks are called [Multi-Instance Tasks](https://azure.microsoft.com/documentation/articles/batch-mpi/).

 You can do the following with tasks:

-   [Add a task to a job](../batchservice/add-a-task-to-a-job.md)

-   [Add a collection of tasks to a job](../batchservice/add-a-collection-of-tasks-to-a-job.md)

-   [Delete a task from a job](../batchservice/delete-a-task-from-a-job.md)

-   [Get information about a task](../batchservice/get-information-about-a-task.md)

-   [List the subtasks of a task](../batchservice/list-the-subtasks-of-a-task.md)

-   [List the files associated with a task](../batchservice/list-the-files-associated-with-a-task.md)

-   [List the tasks associated with a job](../batchservice/list-the-tasks-associated-with-a-job.md)

-   [Reactivate a task](../batchservice/reactivate-a-task.md)

-   [Terminate a task](../batchservice/terminate-a-task.md)

-   [Update the properties of a task](../batchservice/update-the-properties-of-a-task.md)

-   [List the subtasks of a task](../batchservice/list-the-subtasks-of-a-task.md)