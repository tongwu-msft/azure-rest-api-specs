---
title: Create an Azure Storage account using the REST APIs | Microsoft Docs
description: Use REST APIs to create a new Azure Storage account.
service: storage
author: tamram
ms.reviewer: routlaw
manager: jeconnoc
ms.service: storage
ms.custom: REST
ms.topic: article
ms.date: 6/6/2017
ms.author: tamram
---

# Create an Azure Storage account with the  REST API

This sample shows how to create a new [Azure Storage Account](/azure/storage/common/storage-introduction) using the [Azure REST API](/rest/api/azure/).

Complete reference documention and additional samples are available in the [Azure Storage Services REST API Reference](/rest/api/storageservices/).

## Build the request

Use the following HTTP PUT request to create a new Azure SQL Database.

```http
PUT https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{accountName}?api-version=2017-06-01
```

### Request headers

The following headers are required: 

|Request header|Description|  
|--------------------|-----------------|  
|*Content-Type:*|Required. Set to `application/json`.|  
|*Authorization:*|Required. Set to a valid `Bearer` [access token](/rest/api/azure/#authorization-code-grant-interactive-clients). |  

### URI parameters

| Name | Description |
| :--- | :---------- |
| subscriptionId | The subscription ID that identifies an Azure subscription. If you have multiple subscriptions, see [Working with multiple subscriptions](https://docs.microsoft.com/cli/azure/manage-azure-subscriptions-azure-cli?view=azure-cli-latest#working-with-multiple-subscriptions) |
| resourceGroupName | The name of the resource group that contains the resource. You can obtain this value from the Azure Resource Manager API, CLI, or the portal. |
| accountName | The name of the storage account. Following [naming accounts best practices](/azure/architecture/best-practices/naming-conventions#storage) is recommended.  |
| api-version | The API version to use for the request.<br /><br /> This document covers api-version `2017-06-01`, included in the above URL.  |
| &nbsp; | &nbsp; |

### Request body

The table below describes the required JSON properties for the request body. Use [optional parameters](/rest/api/storagerp/storageaccounts/create#request-body) to further customize the storage account.

| Name | Type | Description |
| :--- | :--- | :---------- |
| location | string | Resource location. Get a current list of locations using the [List Locations](/rest/api/resources/subscriptions/listlocations) operation. |
| kind | [Kind](/rest/api/storagerp/storageaccounts/create#kind) |  Indicates the type of storage account. The `Storage` choice is recommended and used in this sample.
| sku | [Sku](/rest/api/storagerp/storageaccounts/create#sku) | Defines the  capabilities of the Storage account, such as redundancy strategy and encryption. This sample uses [Geo-Redundant storage](/azure/storage/common/storage-redundancy).

## Example request body

```json
{
  "sku": {
    "name": "Standard_GRS"
  },
  "kind": "Storage",
  "location": "eastus2euap",
}
```

## Handle the response

Status code 202 w/ an empty response body is returned when the account create request is accepted-the operation will complete asynchronously. A full list of response codes, including error codes, are available in the [Error code reference documentation](/rest/api/storagerp/srp_error_codes_create_storage_account). A 200 status code is returned on the same request during provisioning and after the storage account is created.

## Example 200 response code

```json
{
  "id": "/subscriptions/{subscriptionId}/resourceGroups/res9101/providers/Microsoft.Storage/storageAccounts/{accountName}",
  "kind": "Storage",
  "location": "eastus2euap",
  "name": "{accountName}",
  "properties": {
    "creationTime": "2017-05-24T13:25:33.4863236Z",
    "primaryEndpoints": {
      "blob": "https://{accountName}.blob.core.windows.net/",
      "file": "https://{accountName}.file.core.windows.net/",
      "queue": "https://{accountName}.queue.core.windows.net/",
      "table": "https://{accountName}.table.core.windows.net/"
    },
    "primaryLocation": "eastus2",
    "provisioningState": "Succeeded",
    "secondaryLocation": "centraluseuap",
    "statusOfPrimary": "available",
    "statusOfSecondary": "available",
    "supportsHttpsTrafficOnly": false
  },
  "sku": {
    "name": "Standard_GRS",
    "tier": "Standard"
  },
  "type": "Microsoft.Storage/storageAccounts"
}
```
