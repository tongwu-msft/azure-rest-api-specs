---
title:  Concurrency Limits for Spark in Azure Synapse Analytics
description: View the concurrency and throttling limits allocated to the various scope levels and API rate limits for Spark pools and jobs in Azure Synapse Analytics.
services: synapse-analytics
author: saravi
manager: chrisfin
ms.service: synapse-analytics
ms.subservice: spark
ms.topic: conceptual
ms.date: 10/17/2022
ms.author: saravi
ms.reviewer: sngun
---

# Concurrency and API rate limits for Apache Spark pools in Azure Synapse Analytics

The following sections list various numerical limits for Spark Pools and APIs to manage jobs in Azure Synapse Analytics.

## Resource limits

The following table shows the maximum limits of Jobs and Cores for individual spark pools and workspaces. 

> [!IMPORTANT]
> The limits specified for the spark pools are irrespective of their node sizes, vCore, and memory configurations. 


| Resource   | Metric                    | Limit                          | Scope         | Regions | Notes                          |
|:----------:|:-------------------------:|:------------------------------:|:-------------:|:-------:|:------------------------------:|
| Jobs       | Running Simultaneously    | 50                             |   Spark Pool  | All     |                                |
| Jobs       | Queued                    | 200                            |   Spark Pool  | All     |                                |
| Jobs       | Maximum Active Jobs       | 250                            |   Spark Pool  | All     |                                |
| Jobs       | Maximum Active Jobs       | 1000                           |   Workspace   | All     |                                |
| Cores      | Cores Limit Per User      | Based on the Pool Definition   |   Spark Pool  | All     | If a spark pool is defined as a 50-core pool, in this case each user can use max up to 50 cores within the specific spark pool|
| Cores      | Cores Limit Per User      | Based on Workspace Definition  |   Workspace   | All     | If a workspace has 200 cores allocated. All the users across all the pools within the workspace cannot use beyond 200 cores.  |

> [!NOTE]
> Maximum Active Jobs is Total Number of Jobs Submitted, which includes both Jobs Running Simultaneously and Jobs Queued.
> Max Active Jobs = Jobs Running Simultaneously +  Jobs Queued


## API rate limits

The following table shows the throttling limits for the spark job and session management APIs. 

| Resource   | Metric                        | Limit (Queries per Second) | Scope         | Regions             |
|:----------:|:-----------------------------:|:--------------------------:|:-------------:|:-------------------:|
| [Jobs API](/rest/api/synapse/data-plane/spark-session/get-spark-session?tabs=HTTP)        |  Get Spark Session             |  200                       | Spark Session | All                 |
| [Jobs API](/rest/api/synapse/data-plane/spark-session/get-spark-sessions?tabs=HTTP)        |  Get Spark Session             |  200                       | Spark Pool    | All                 |
| [Jobs API](/rest/api/synapse/data-plane/spark-session/get-spark-statement?tabs=HTTP)        |  Get Spark Statement           |  200                       | Spark Session | All                 |
| [Jobs API](/rest/api/synapse/data-plane/spark-session/get-spark-statements?tabs=HTTP)        |  Get Multiple Spark Statements |  200                       | Spark Session | All                 |
| [Jobs API](/rest/api/synapse/data-plane/spark-session/create-spark-session?tabs=HTTP)        |  Create Session                |  2                         | Workspace     | EastUS, EastUS2, WestUS, WestUS2, CentralUS, EastUS2EUAP, West Europe     |
| [Jobs API](/rest/api/synapse/data-plane/spark-session/create-spark-session?tabs=HTTP)        |  Create Session                |  5                         | Workspace     | All other regions   |
| [Jobs API](/rest/api/synapse/data-plane/spark-batch/create-spark-batch-job?tabs=HTTP)        |  Create Batch Job             |  5                         | Workspace     | All                 |
| [Jobs API](/rest/api/synapse/data-plane/spark-batch/get-spark-batch-job?tabs=HTTP)        |  Get Spark Batch Job             |  200                         | Workspace     | All                 |
| [Jobs API](/rest/api/synapse/data-plane/spark-batch/get-spark-batch-jobs?tabs=HTTP)        |  Get Multiple Spark Batch Job    |  200                         | Workspace     | All                 |

> [!NOTE]
> The maximum requests limit for all resources and operations is 200 queries per second for all regions. 


> [!TIP]
>**If you get an error message or HTTP 429 response that reads**
>```
>_Your request has hit layered throttling rate-limit of 5 requests per 1 second(s) for requests on resource(s) identified by pattern {subscriptionId}. {workspaceName}. {HTTP-Verb}. {operationName} - You are currently hitting at a rate of 282 requests per 1 second(s). Please retry after 1 second(s)_
```
>
> Or 
>```
>_Your request has hit layered throttling rate-limit of 5 requests per 1 second(s) for requests on resource(s) identified by {subscriptionId}. {workspaceName}. {HTTP-Verb}. {operationName} - You are currently hitting at a rate of 24 requests per 1 second(s). Please retry after 1 second(s)_
```
>It is recommended to use Retry-After header value in the api by providing the value in seconds, which is evaluated based on the incoming traffic and optimizes the submitted job requests to get successfully accepted on retries. 


