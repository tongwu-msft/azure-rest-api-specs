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

Azure Batch will routinely deprecate API versions that are obsolete. All users of an API version are notified **three years** before final removal. Current users of deprecated API versions are notified via email. Additional announcements are available on the Azure Updates blog (TODO: add link) and on this page.

Azure Batch REST APIs will be supported for a 2-year duration after release, after which they will be marked as deprecated. The deprecation period for an Azure Batch REST API will last 1 year, during which time notifications will be sent out. All Azure Batch SDKs associated with a deprecated REST API will be similarly marked as deprecated. Once the 1-year deprecation period has elapsed, the deprecated REST API and all associated deprecated SDKs will be removed. After removal, all requests using these API versions or SDKs will fail.

## Current API status

All Batch service and Management API versions newer than June 2017 are available and not slated for deprecation. All SDKs associated with these API versions are also available.

## API deprecation status

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

### Batch management

| API version | Deprecation date | Removal date |
|-------------|------------------|--------------|
| 2015-07-01  |    |    |
| 2015-09-01  |    |    |
| 2015-12-01  |    |    |
| 2017-01-01  |    |    |
| 2017-05-01  |    |    |
