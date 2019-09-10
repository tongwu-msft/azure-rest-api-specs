---
title: Batch API life cycle
description: Understand the deprecation and removal process of Azure Batch API versions.
author: laurenhughes
ms.author: jafreck
ms.service: batch
ms.topic: reference
ms.date: 09/09/2019
---

# Batch API life cycle

Azure Batch routinely deprecates API versions that are obsolete. All users of an API version are notified **one year** before final removal. Current users of deprecated API versions are notified via email.

Azure Batch REST APIs are supported for a two-year duration after release, after which they are marked as deprecated. The deprecation period for an Azure Batch REST API lasts for one year, during which time notifications are sent out to users of the API version. All Azure Batch SDKs associated with a deprecated REST API are similarly marked as deprecated. When the one year deprecation period has elapsed, the deprecated REST API and all associated deprecated SDKs are subject to removal. After removal, all requests using these API versions or SDKs will fail.

## Current API status

All Batch service and Management API versions newer than September 2017 are available and not currently slated for deprecation. All SDKs associated with these API versions are also available.

## REST API deprecation status

### Batch service

The following Batch service API versions are scheduled for future deprecation and removal.

* `2014-01-01.1.0`
* `2014-04-01.1.0`
* `2014-10-01.1.0`
* `2015-03-01.1.1`
* `2015-06-01.2.0`
* `2015-11-01.2.1`
* `2015-12-01.2.2`
* `2016-02-01.3.0`
* `2016-07-01.3.1`
* `2017-01-01.4.0`
* `2017-05-01.5.0`
* `2017-06-01.5.1`
* `2017-09-01.6.0`

The Batch service SDKs scheduled for future deprecation and removal are as follows.

| Language | Version    |
|----------|------------|
| C#       | `<= 8.0.1` |
| Python   | `<= 4.0.0` |
| Java     | `<= 3.0.0` |
| Node.js  | `<= 3.0.0` |
| Go | `<= 2017-09-01.6.0` |

### Batch management

The following Batch management API versions are scheduled for future deprecation and removal.

* `2015-07-01`
* `2015-09-01`
* `2015-12-01`
* `2017-01-01`
* `2017-05-01`
* `2017-09-01`

The Batch service SDKs scheduled for future deprecation and removal are as follows.

| Language | Version     |
|----------|-------------|
| C#       | `<= 6.0.0`  |
| Python   | `<= 5.0.0`  |
| Java     | `<= 1.25.0` |
| Node.js  | `<= 3.0.0`  |
| Go | `<= 2017-09-01` |
| Ruby | `<= 0.15.1` |
