---
title: List By Search Service
titleSuffix: Azure Cognitive Search REST API
description: Returns the list of query API keys for the given Azure Cognitive Search service (private or public).
ms.service: cognitive-search
ms.topic: "language-reference"

ms.date: 01/15/2020
author: huangbolun
ms.author: bohuan
ms.manager: aagrawal
---

# Query Keys - List By Search Service (Search Management REST API)

**API Version: 2019-10-01-Preview**

Returns the list of query API keys for the given Azure Cognitive Search service (private or public endpoint). In contrast with the generally available version, this preview version uses POST instead of GET.

```http
POST https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Search/searchServices/{searchServiceName}/listQueryKeys?api-version=2019-10-01-Preview
```

## URI Parameters

| Name	| In	| Required	| Type	| Description  | 
|-------|-----|-----------|-------|--------------|
| subscriptionId | path | True | string | The unique identifier for a Microsoft Azure subscription. You can obtain this value from the Azure Resource Manager API or the portal. | 
| resourceGroupName | path | True | string | The name of the resource group within the current subscription. You can obtain this value from the Azure Resource Manager API or the portal. |
| searchServiceName | path | True | string | The name of the Azure Cognitive Search service to create or update. Search service names must only contain lowercase letters, digits or dashes, cannot use dash as the first two or last one characters, cannot contain consecutive dashes, and must be between 2 and 60 characters in length. Search service names must be globally unique since they are part of the service URI (https://.search.windows.net). You cannot change the service name after the service is created. |
| api-version | query | True | string | The API version to use for each request. The current version for preview features is 2019-10-01-Preview.|

## Request Header

| Name	| Required	| Type	| Description  | 
|-------|-----------|-------|--------------|
| x-ms-client-request-id |  | string uuid | A client-generated GUID value that identifies this request. If specified, this will be included in response information as a way to track the request. |

## Request Body
| Name	| Type	| Description  | 
|-------|-------|--------------|
| identity | Identity | The identity of the resource. |
| location | string | The geographic location of the resource. This must be one of the supported and registered Azure Geo Regions (for example, West US, East US, Southeast Asia, and so forth). This property is required when creating a new resource. | 
| properties.hostingMode | HostingMode | Applicable only for the standard3 SKU. You can set this property to enable up to 3 high density partitions that allow up to 1000 indexes, which is much higher than the maximum indexes allowed for any other SKU. For the standard3 SKU, the value is either 'default' or 'highDensity'. For all other SKUs, this value must be 'default'. | 
| properties.networkRuleSet | NetworkRuleSet | Network specific rules that determine how the Azure Cognitive Search service may be reached. | 
| properties.partitionCount	| integer | The number of partitions in the Search service; if specified, it can be 1, 2, 3, 4, 6, or 12. Values greater than 1 are only valid for standard SKUs. For 'standard3' services with hostingMode set to 'highDensity', the allowed values are between 1 and 3. | 
| properties.replicaCount	| integer | The number of replicas in the Search service. If specified, it must be a value between 1 and 12 inclusive for standard SKUs or between 1 and 3 inclusive for basic SKU. | 
| sku	| Sku | The SKU of the Search Service, which determines price tier and capacity limits. This property is required when creating a new Search Service. | 
| tags | object | Tags to help categorize the resource in the Azure portal. | 

## Responses

| Name	| Type	| Description  | 
|-------|-------|--------------|
| 200 OK | ListQueryKeysResult | All query keys for the given Search service were successfully retrieved and are in the response. You can use any of the query keys as the value of the 'api-key' parameter in the Azure Cognitive Search Service REST API or SDK to perform read-only operations on your Search indexes such as querying and looking up documents by ID. |
| Other Status Codes | CloudError | 'HTTP 404 (Not Found): The subscription, resource group, or Search service could not be found. HTTP 409 (Conflict): The specified subscription is disabled.' |

## Security

### azure_auth
Azure Active Directory OAuth2 Flow

|||
|-|-|
| **Type** | oauth2 |
| **Flow** | implicit |
| **Authorization URL** | https://login.microsoftonline.com/common/oauth2/authorize |

**Scopes**

| Name	| Description |
|-------|-------------|
| user_impersonation	| impersonate your user account | 

## Examples

### SearchListQueryKeysBySearchService

#### Sample Request

```http
POST https://management.azure.com/subscriptions/subid/resourceGroups/rg1/providers/Microsoft.Search/searchServices/mysearchservice/listQueryKeys?api-version=2019-10-01-Preview
```

#### Sample Response

Status code: 200

```json
{
  "value": [
    {
      "name": "Query key for browser-based clients",
      "key": "<a query API key>"
    },
    {
      "name": "Query key for mobile clients",
      "key": "<another query API key>"
    }
  ]
}
```

## Definitions

|||
|-|-|
| [CloudError](#CloudError) | Contains information about an API error.|
| [CloudErrorBody](#CloudErrorBody) | Describes a particular API error with an error code and a message. |
| [ListQueryKeysResult](#ListQueryKeysResult) | Response containing the query API keys for a given Azure Cognitive Search service.|
| [QueryKey](#QueryKey) | Describes an API key for a given Azure Cognitive Search service that has permissions for query operations only. |


### <a name="CloudError">CloudError</a>

Contains information about an API error.

| Name | Type | Description |
|------|------|-------------|
| error | [CloudErrorBody](#CloudErrorBody) | Describes a particular API error with an error code and a message. |


### <a name="CloudErrorBody">CloudErrorBody </a>

Describes a particular API error with an error code and a message.

| Name | Type | Description |
|------|------|-------------|
| code | string | An error code that describes the error condition more precisely than an HTTP status code. Can be used to programmatically handle specific error cases. |
| details  | CloudErrorBody[]| Contains nested errors that are related to this error.|
| message  | string | A message that describes the error in detail and provides debugging information. |
| target  | string | The target of the particular error (for example, the name of the property in error). |

### <a name="ListQueryKeysResult">ListQueryKeysResult</a>

Response containing the query API keys for a given Azure Cognitive Search service.

| Name | Type | Description |
|------|------|-------------|
| value | [QueryKey](#QueryKey) | The query keys for the Azure Cognitive Search service. |

### <a name="QueryKey">c</a>

Describes an API key for a given Azure Cognitive Search service that has permissions for query operations only.

| Name | Type | Description |
|------|------|-------------|
| name | string | The name of the query API key; may be empty.  |
| key | string | The value of the query API key.  |

## See also

[How to use the Management REST API](../search-howto-management-rest-api.md)