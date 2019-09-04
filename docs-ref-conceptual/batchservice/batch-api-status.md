---
title: Batch API life cycle
description: Understand the deprecation and removal process of Azure Batch API versions.
author: laurenhughes
ms.author: jafreck
ms.service: batch
ms.topic: reference
ms.date: 08/08/2019
---

# Batch API life cycle

Azure Batch will routinely deprecate API versions that are obsolete. All users of an API version are notified **one year** before final removal. Current users of deprecated API versions are notified via email.

Azure Batch REST APIs will be supported for a 2-year duration after release, after which they will be marked as deprecated. The deprecation period for an Azure Batch REST API will last 1 year, during which time notifications will be sent out. All Azure Batch SDKs associated with a deprecated REST API will be similarly marked as deprecated. Once the 1-year deprecation period has elapsed, the deprecated REST API and all associated deprecated SDKs will be subject to removal. After removal, all requests using these API versions or SDKs will fail.

## Current API status

All Batch service and Management API versions newer than September 2017 are available and not currently slated for deprecation. All SDKs associated with these API versions are also available.

## REST API deprecation status

### Batch service

| API version | Deprecation date | Removal date |
|-------------|------------------|--------------|
| 2014-01-01.1.0 |    |    |
| 2014-04-01.1.0 |    |    |
| 2014-10-01.1.0 |    |    |
| 2015-03-01.1.1 |    |    |
| 2015-06-01.2.0 |    |    |
| 2015-11-01.2.1 |    |    |
| 2015-12-01.2.2 |    |    |
| 2016-02-01.3.0 |    |    |
| 2016-07-01.3.1 |    |    |
| 2017-01-01.4.0 |    |    |
| 2017-05-01.5.0 |    |    |
| 2017-06-01.5.1 |    |    |
| 2017-09-01.6.0 |    |    |

### Batch management

| API version | Deprecation date | Removal date |
|-------------|------------------|--------------|
| 2015-07-01  |    |    |
| 2015-09-01  |    |    |
| 2015-12-01  |    |    |
| 2017-01-01  |    |    |
| 2017-05-01  |    |    |
| 2017-09-01  |    |    |

# SDK Deprecation Status
### Batch Service
| Language | Version  | Removal Date |
|----------|----------|--------------|
| C#       | <= 8.0.1 |              |
| Python   | <= 4.0.0 |              |
| Java     | <= 3.0.0 |              |
| Node     | <= 3.0.0 |              |
| Go       | <= github.com/Azure/azure-sdk-for-go/services/batch/2017-09-01.6.0/batch |              |

### Batch Management
| Language | Version   | Removal Date |
|----------|-----------|--------------|
|C#        | <= 6.0.0  |              |
|Python    | <= 5.0.0  |              |
|Java      | <= 1.25.0 |              |
|Node      | <= 3.0.0  |              |
|Go        | <= github.com/Azure/azure-sdk-for-go/services/services/batch/mgmt/2017-09-01/batch |              |
|Ruby      | <= 0.15.1 |              |
