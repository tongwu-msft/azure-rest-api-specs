---
title: Create an Azure SQL Database using REST | Microsoft Docs
description: Use the Azure REST APIs to create a new Azure SQL Database instance.
services: sql-database
author: MightyPen
ms.reviewer: jaredmoo
manager: craigg
ms.service: sql-database
ms.custom: REST
ms.topic: reference
ms.date: 10/01/2017
ms.author: genemi
---

# Create an Azure SQL Database using the REST API

This how-to shows how to create a new [Azure SQL Database](/azure/sql-database/sql-database-technical-overview) using the [Azure REST API](/rest/api/azure/).

Complete reference documention and additional samples are available in the [Azure SQL Database REST reference](/rest/api/sql/).

## Build the request

Use the following HTTP PUT request to create a new Azure SQL Database.

```http
PUT https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Sql/servers/{serverName}/databases/{databaseName}?api-version=2017-10-01-preview
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
| serverName | The name of the Azure SQL Database server. |
| databaseName | The name of the database.
| api-version | The API version to use for the request.<br /><br /> This document covers api-version `2017-10-01-preview`, included in the above URL.  |
| &nbsp; | &nbsp; |

### Request body

The only required parameter is `location`. Use [optional parameters](/rest/api/sql/databases/createorupdate#request-body) to customize the database.

| Name | Type | Description |
| :--- | :--- | :---------- |
| location | string | Resource location. Get a current list of locations using the [List Locations](/rest/api/resources/subscriptions/listlocations) operation. |


## Handle the response

Status code 201 is returned when successfully creating the database. A full list of response codes, including error codes, are available in the [reference documentation](/rest/api/sql/databases/createorupdate#response).

## Example response 

```json
{
  "sku": {
    "name": "S0",
    "tier": "Standard"
  },
  "kind": "v12.0,user",
  "properties": {
    "collation": "SQL_Latin1_General_CP1_CI_AS",
    "maxSizeBytes": 1073741824,
    "status": "Online",
    "databaseId": "6c764297-577b-470f-9af4-96d3d41e2ba3",
    "creationDate": "2017-06-07T04:41:33.937Z",
    "currentServiceObjectiveName": "S0",
    "defaultSecondaryLocation": "North Europe",
    "catalogCollation": "SQL_Latin1_General_CP1_CI_AS"
  },
  "location": "southeastasia",
  "id": "/subscriptions/00000000-1111-2222-3333-444444444444/resourceGroups/Default-SQL-SouthEastAsia/providers/Microsoft.Sql/servers/testsvr/databases/testdb",
  "name": "testdb",
  "type": "Microsoft.Sql/servers/databases"
}
```
