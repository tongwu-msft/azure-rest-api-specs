---
title: Azure Batch API Life Cycle and Deprecation
description: Understand the deprecation and removal process of Azure Batch API versions.
author: laurenhughes
ms.author: jafreck
ms.service: batch
ms.topic: reference
ms.date: 09/11/2019
---

# Batch API life cycle

Azure Batch routinely deprecates API versions that are obsolete. All users of an API version are notified **one year** before final removal. Current users of deprecated API versions are notified via email.

Azure Batch REST APIs are supported for a two-year duration after release, after which they are marked as deprecated. The deprecation period for an Azure Batch REST API lasts for one year, during which time notifications are sent out to users of the API version. All Azure Batch SDKs associated with a deprecated REST API are similarly marked as deprecated. When the one year deprecation period has elapsed, the deprecated REST API and all associated deprecated SDKs are subject to removal. After removal, all requests using these API versions or SDKs will fail.

## Current API status

All Batch service and Management API versions newer than September 2017 are available and not currently slated for deprecation. All SDKs associated with these API versions are also available.

## REST API deprecation status and upgrade instructions

### Batch service

The following Batch service API versions are scheduled for future deprecation and removal.

| API Version      | Scheduled Removal Date |
|------------------|------------------------|
| `2014-01-01.1.0` | 10/31/2020             |
| `2014-04-01.1.0` | 10/31/2020             |
| `2014-10-01.1.0` | 10/31/2020             |
| `2015-03-01.1.1` | 10/31/2020             |
| `2015-06-01.2.0` | 10/31/2020             |
| `2015-11-01.2.1` | 10/31/2020             |
| `2015-12-01.2.2` | 10/31/2020             |
| `2016-02-01.3.0` | 10/31/2020             |
| `2016-07-01.3.1` | 10/31/2020             |
| `2017-01-01.4.0` | 04/01/2021             |
| `2017-05-01.5.0` | 10/31/2020             |
| `2017-06-01.5.1` | 10/31/2020             |
| `2017-09-01.6.0` | 04/01/2021             |

The Batch service SDKs scheduled for future deprecation and removal are as follows.

| Language | Version             | Upgrade Instructions |
|----------|---------------------|-----------------------
| C#       | `<= 8.0.1`          | [Here](https://azure.github.io/azure-sdk/releases/latest/all/#net) (named `Microsoft.Azure.Batch`)
| Go       | `<= 2017-09-01.6.0` | [Here](https://github.com/Azure/azure-sdk-for-go/blob/master/CHANGELOG.md) (named `batch`)
| Java     | `<= 3.0.0`          | [Here](https://azure.github.io/azure-sdk/releases/latest/all/#java) (named `azure-batch`)
| Node.js  | `<= 3.0.0`          | [Here](https://azure.github.io/azure-sdk/releases/latest/all/#javascript) (named `@azure/batch`)
| Python   | `<= 4.0.0`          | [Here](https://azure.github.io/azure-sdk/releases/latest/all/#python) (named `azure-batch`)


### Batch management

The following Batch management API versions are scheduled for future deprecation and removal.

| API Version      | Scheduled Removal Date |
|------------------|------------------------|
| `2015-07-01`     | 10/31/2020             |
| `2015-09-01`     | 10/31/2020             |
| `2015-12-01`     | 10/31/2020             |
| `2017-01-01`     | 10/31/2020             |
| `2017-05-01`     | 10/31/2020             |
| `2017-09-01`     | 10/31/2020             |

The Batch management SDKs scheduled for future deprecation and removal are as follows.

| Language  | Version         | Upgrade Instructions |
|-----------|-----------------|------------------------
| Azure CLI | `<= 2.0.54`     | [Here](/cli/azure/install-azure-cli)
| C#        | `<= 6.0.0`      | [Here](https://azure.github.io/azure-sdk/releases/latest/all/#net) (named `Microsoft.Azure.Management.Batch`)
| Go        | `<= 2017-09-01` | [Here](https://github.com/Azure/azure-sdk-for-go/blob/master/CHANGELOG.md) (named `batch`)
| Java      | `<= 1.25.0`     | [Here](https://azure.github.io/azure-sdk/releases/latest/all/#java) (named `azure-mgmt-batch`)
| Node.js   | `<= 3.0.0`      | [Here](https://azure.github.io/azure-sdk/releases/latest/all/#javascript) (named `@azure/arm-batch`)
| PowerShell (Az.Batch) | `<= 1.1.1` | [Here](/powershell/azure/install-az-ps)
| PowerShell (AzureRm.Batch) | `<= 5.0.0-preview` | [Here](/powershell/azure/install-az-ps)
| Python    | `<= 5.0.0`      | [Here](https://azure.github.io/azure-sdk/releases/latest/all/#python) (named `azure-mgmt-batch`)
| Ruby      | `<= 0.15.1`     | [Here](https://rubygems.org/gems/azure_mgmt_batch)

## Special Advisory for Azure Data Factory Custom Activity Users
For Azure Data Factory Custom Activity users, if you use the Azure Batch linked service feature, you may receive a notice about usage of deprecated Azure Batch REST APIs. Users that only interact with the Azure Batch resources through Azure Data Factory Custom Activity can ignore this notice. Azure Batch linked service allows the Azure Data Factory Custom Activity service to make API calls against your Batch account and pools. 
