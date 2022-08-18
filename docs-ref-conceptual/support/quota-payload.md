---
ms.assetid: 0c725cba-40fa-4ff3-8be5-cef3f5cc5443
title: Request quota increase via Support API 
description: Learn how to request a quota increase using the Azure Support REST API.
ms.service: azure
author: gangan
ms.author: gangan
ms.date: 02/10/2020
ms.manager: ddove
service_description: To be added
---

# Request a quota increase using the Azure Support REST API

You can request additional quota for an Azure service by using the [Azure Support REST API](index.md). This article shows examples for Azure Virtual Machines (cores/vCPU), Azure Batch, Azure SQL Database, and Azure Synapse Analytics. All quota increase requests require details like region and new limits during ticket creation. For the resource types in our examples, Azure requires additional details to ensure the quota request is processed in a timely manner.

You can also request additional quota by opening a support ticket of type "Service and Subscription limits (quota)" in the Azure portal.

## Azure Virtual Machines (cores/vCPU)

### Objects

To request a quota increase for Azure Virtual Machines (cores/vCPU), provide additional details through the _QuotaTicketDetails_ object.

**_QuotaTicketDetails_** includes three properties:

|Property Name|Required|Type|Description|Supported Values|
| :--- |:---|:---| :---|:---|
|quotaChangeRequestSubType|False|string|Sub resource type for which you're requesting a quota increase |Not Applicable|
|quotaChangeRequestVersion|True|string|Quota change request payload version|"1.0"|
|quotaChangeRequests|True|string|List of _QuotaChangeRequest_ objects|List\<QuotaChangeRequest>|

**_QuotaChangeRequest_** includes two properties:

|Property Name|Required|Type|Description|Supported Values|
| :--- |:---|:---| :---|:---|
|region|True|string|Azure location or region for which you're requesting the quota increase|Get [region list by service.](/rest/api/apimanagement/current-preview/region/list-by-service)|
|payload|True|string|Serialized value of _Payload_ object|As described below.|

### Payload details

|Property|Required|Type|Description|Example|
| :---: |:---|:---|:---| :---|
|VmFamily|True|string|Microsoft.Compute [SKU family list](/rest/api/compute/resourceskus/list) |ESv3 Series|
|VmFamily|True|string|regional quota |\*|
|VmFamily|True|string|spot vCPU|All Series|
|NewLimit|True|integer|Desired new quota limit|200|

### Examples

1. The following example illustrate the payload for requesting quota increases for the ESv3 Series and Av2 Series Azure Virtual Machines (cores/vCPU) SKUs:

```json
"quotaTicketDetails": {
  "quotaChangeRequestVersion": "1.0",
  "quotaChangeRequests": [
    {
      "region": "AustraliaEast",
      "payload": "{\"VMFamily\":ESv3 Series\",\"NewLimit\":200}"
    },
    {
      "region": "AustraliaEast",
      "payload": "{\"VMFamily\":Av2 Series\",\"NewLimit\":20}"
    },
  ]
}
```

View the complete request and response body for [Quota increase for Azure Virtual Machines (cores/vCPU)](/rest/api/support/supporttickets/create?branch=support#create-a-ticket-to-request-quota-increase-for-compute-vm-cores).


2. The following example illustrate the payload for requesting a quota increase across all VM series in a given region (regional quota):

```json
"quotaTicketDetails": {
  "quotaChangeRequestVersion": "1.0",
  "quotaChangeRequests": [
    {
      "region": "AustraliaEast",
      "payload": "{\"VMFamily\":*\",\"NewLimit\":200}"
    },
  ]
}
```

3. The following example illustrate the payload for requesting a quota increase for a spot VM:

```json
"quotaTicketDetails": {
  "quotaChangeRequestVersion": "1.0",
  "quotaChangeRequests": [
    {
      "region": "AustraliaEast",
      "payload": "{\"VMFamily\":All Series\",\"NewLimit\":20}"
    },
  ]
}
```

## Azure Batch

For [Azure Batch](/azure/batch/), you can request a quota increase at the subscription level or at the batch account level.

### Objects

To request a quota increase for Azure Batch, provide additional details through the _QuotaTicketDetails_ object.

_QuotaTicketDetails_ includes three properties:

|Property Name|Required|Type|Description|Supported Values|
| :--- |:---|:---| :---|:---|
|quotaChangeRequestSubType|False|string|Sub resource type for which you are requesting a quota increase|Not Applicable|
|quotaChangeRequestVersion|True|string|Quota change request payload Version|"1.0"|
|quotaChangeRequests|True|string|List of _QuotaChangeRequest_ objects|List\<QuotaChangeRequest>|

_QuotaChangeRequest_ includes two properties:

|Property Name|Required|Type|Description|Supported Values|
| :--- |:---|:---| :---|:---|
|region|True|string|Azure location or region for which you are requesting a quota increase|Get [region list by service.](/rest/api/apimanagement/current-preview/region/list-by-service)|
|payload|True|string|Serialized value of Payload object|As described below.|

### Request quota at the subscription level

To request a quota increase at the subscription level, set _quotaChangeRequestSubType_ to "Subscription".

#### Payload Details

|Property|Required|Type|Description|Example|
| :--- |:---|:---|:---| :---|
|Type|True|string|"Account" is the only supported type at the subscription level|Account|
|NewLimit|True|integer|Desired new  number of accounts|5|

#### Example

To request a quota increase for Azure Batch accounts at the subscription level:

```json
"quotaTicketDetails": {
  "quotaChangeRequestVersion": "1.0",
  "quotaChangeRequestSubType": "Subscription",
  "quotaChangeRequests": [
    {
      "region": "EastUS",
      "payload": "{\"NewLimit\":5,\"Type\":\"Account\"}"
    }
  ]
}
```

View the complete request and response body for [Quota increase for Azure Batch account (subscription)](/rest/api/support/supporttickets/create?branch=support#create-a-ticket-to-request-quota-increase-for-batch-accounts-for-a-subscription).

### Request quota at the account level

To request quota at the account level, set _quotaChangeRequestSubType_ to "Account".

#### Payload Details

|Property|Required|Type|Description|Example|
| :--- |:---|:---|:---| :---|
|AccountName|True|string|Unique account name in the Batch service|testBatchAccount|
|Type|string|True|Desired sub-resource type|Jobs|
|VM Family|True|string| Microsoft.Compute [SKU family](/rest/api/compute/resourceskus/list). Specify only for **Dedicated** core sub-resource.|standardDv3Family|
|NewLimit|True|integer|Desired new quota limit|5|

Supported _sub-resource_ types for Batch Account:

|Type|Description|
| :--- |:---|
|Dedicated|Dedicated Azure virtual machine (VM) or cloud service VM|
|LowPriority|Evictable Azure virtual machine (VM) or cloud service VM|
|Pools|Collection of nodes that your application runs on|
|Jobs|Collection of tasks|

#### Examples

To request a quota increase for _Dedicated Cores_ for an Azure Batch account:

```json
"quotaTicketDetails": {
  "quotaChangeRequestVersion": "1.0",
  "quotaChangeRequestSubType": "Account",
  "quotaChangeRequests": [
    {
      "region": "EastUS",
      "payload": "{\"AccountName\":\"testBatchAccount\",\"VMFamily\":\"standardDv3Family\",\"NewLimit\":200,\"Type\":\"Dedicated\"}"
    }
  ]
}
```

View the complete request and response body for [Quota increase for Batch account (Account) and Type: Dedicated](/rest/api/support/supporttickets/create?branch=support#create-a-ticket-to-request-quota-increase-for-specific-vm-family-cores-for-a-batch-account)

To request a quota increase for _Jobs_ for an Azure Batch account:

```json
"quotaTicketDetails": {
  "quotaChangeRequestVersion": "1.0",
  "quotaChangeRequestSubType": "Account",
  "quotaChangeRequests": [
    {
      "region": "EastUS",
      "payload": "{\"AccountName\":\"testBatchAccount\",\"NewLimit\":5,\"Type\":\"Jobs\"}"
    }
  ]
}
```

View complete request and response body for [Quota increase for Batch account (Jobs)](/rest/api/support/supporttickets/create?branch=support#create-a-ticket-to-request-quota-increase-for-active-jobs-and-job-schedules-for-a-batch-account)

To request a quota increase for both _Dedicated Cores_ and _LowPriority Cores_ for an Azure Batch account:

```json
"quotaTicketDetails": {
  "quotaChangeRequestVersion": "1.0",
  "quotaChangeRequestSubType": "Account",
"quotaChangeRequests": [
    {
      "region": "EastUS",
      "payload": "{\"AccountName\":\"testBatchAccount\",\"VMFamily\":\"standardDv3Family\",\"NewLimit\":200,\"Type\":\"Dedicated\"}"
    },
    {
      "region": "EastUS",
      "payload": "{\"AccountName\":\"testBatchAccount\",\"NewLimit\":200,\"Type\":\"LowPriority\"}"
    },
  ]
}
```

## Azure SQL Database

For [Azure SQL Database](/azure/sql-database/), you can request a quota increase based on Database Throughput Units (DTUs) or number of servers.

### Objects

To request a quota increase for Azure SQL Database, provide additional details through the _QuotaTicketDetails_ object.

The _QuotaTicketDetails_ object includes three properties:

|Property Name|Required|Type|Description|Supported Values|
| :--- |:---|:---| :---|:---|
|quotaChangeRequestSubType|False|string|Sub resource type for which you are requesting a quota increase|Not Applicable|
|quotaChangeRequestVersion|True|string|Quota change request payload Version|"1.0"|
|quotaChangeRequests|True|string|List of _QuotaChangeRequest_ objects|List\<QuotaChangeRequest>|

The _QuotaChangeRequest_ object includes two properties:

|Property Name|Required|Type|Description|Supported Values|
| :--- |:---|:---| :---|:---|
|region|True|string|Azure location or region Sub resource type for which you are requesting a quota increase|Get [region list by service.](/rest/api/apimanagement/current-preview/region/list-by-service)|
|payload|True|string|Serialized value of Payload object|As described below.|

### Quota increase for DTUs

To request a quota increase for DTUs, set _quotaChangeRequestSubType_ to "DTUs".

#### Payload Details

|Property|Required|Type|Description|Example|
| :--- |:---|:---|:---| :---|
|ServerName|True|string|Unique name of the SQL Database server|testserver|
|NewLimit|True|integer|Desired new quota limit for DTUs|5000|

#### Example

To request a quota increase for DTUs:

```json
"quotaTicketDetails": {
  "quotaChangeRequestVersion": "1.0",
  "quotaChangeRequestSubType": "DTUs",
  "quotaChangeRequests": [
    {
      "region": "EastUS",
      "payload": "{\"ServerName\":\"testserver\",\"NewLimit\":5000}"
    }
  ]
}
```

### Quota increase for servers

To request a quota increase for servers, set _quotaChangeRequestSubType_ to "Servers".

Payload Details

|Property|Required|Type|Description|Example|
| :---: |:---|:---|:---| :---|
|NewLimit|True|string|Desired number of SQL Database servers for the subscription|200|

#### Example

To request a quota increase for servers:

```json
"quotaTicketDetails": {
      "quotaChangeRequestVersion": "1.0",
      "quotaChangeRequestSubType": "Servers",
      "quotaChangeRequests": [
        {
          "region": "EastUS",
          "payload": "{\"NewLimit\":200}"
        }
      ]
    }
```

## Azure Synapse Analytics

For [Azure Synapse Analytics](/azure/sql-data-warehouse), you can request a quota increase based on Database Throughput Units (DTUs) or number of servers.

### Objects

To request a quota increase for Azure Synapse Analytics, provide additional details through the _QuotaTicketDetails_ object.

_QuotaTicketDetails_ includes three properties:

|Property Name|Required|Type|Description|Supported Values|
| :--- |:---|:---| :---|:---|
|quotaChangeRequestSubType|False|string|Sub resource type for which you are requesting a quota increase|Not Applicable|
|quotaChangeRequestVersion|True|string|Quota change request payload Version|"1.0"|
|quotaChangeRequests|True|string|List of _QuotaChangeRequest_ objects|List\<QuotaChangeRequest>|

_QuotaChangeRequest_ includes two properties:

|Property Name|Required|Type|Description|Supported Values|
| :--- |:---|:---| :---|:---|
|region|True|string|Azure location or region for which you are requesting a quota increase|Get [region list by service.](/rest/api/apimanagement/current-preview/region/list-by-service)|
|payload|True|string|Serialized value of Payload object|As described below.|

### Quota increase for DTUs

To request a quota increase for DTUs, set _quotaChangeRequestSubType_ to "DTUs".

#### Payload details

|Property|Required|Type|Description|Example|
| :--- |:---|:---|:---| :---|
|ServerName|True|string|Unique name of the Azure Synapse Analytics server|testserver|
|NewLimit|True|integer|Desired new quota limit for DTUs|5000|

#### Example

To request a quota increase for DTUs:

```json
"quotaTicketDetails": {
  "quotaChangeRequestVersion": "1.0",
  "quotaChangeRequestSubType": "DTUs",
  "quotaChangeRequests": [
    {
      "region": "EastUS",
      "payload": "{\"ServerName\":\"testserver\",\"NewLimit\":5000}"
    }
  ]
}
```

### Quota increase for servers

To request a quota increase for servers, set _quotaChangeRequestSubType_ to "Servers".

#### Payload Details

|Property|Required|Type|Description|Example|
| :---: |:---|:---|:---| :---|
|NewLimit|True|string|Desired number of Azure Synapse Analytics servers for the subscription|200|

#### Example

To request a quota increase for servers in a region:

```json
"quotaTicketDetails": {
      "quotaChangeRequestVersion": "1.0",
      "quotaChangeRequestSubType": "Servers",
      "quotaChangeRequests": [
        {
          "region": "EastUS",
          "payload": "{\"NewLimit\":200}"
        }
      ]
    }
```

## Next steps

[Azure Support REST API](index.md)
