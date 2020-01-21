---
title: Update privateEndpointConnectionName
titleSuffix: Azure Cognitive Search REST API
description: Updates a Private Endpoint connection to the Search service in the given resource group.
ms.service: cognitive-search
ms.topic: "language-reference"

ms.date: 01/15/2020
author: huangbolun
ms.author: bohuan
ms.manager: aagrawal
---

# PrivateEndpointConnection - Update (Search Management REST API)
**API Version: 2019-10-01-Preview**

Updates a Private Endpoint connection to the Search service in the given resource group.

```http
PUT https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Search/searchServices/{searchServiceName}/privateEndpointConnections/{privateEndpointConnectionName}?api-version=2019-10-01-Preview
```

## URI Parameters

| Name	| In	| Required	| Type	| Description  | 
|-------|-----|-----------|-------|--------------|
| subscriptionId | path | True | string | The unique identifier for a Microsoft Azure subscription. You can obtain this value from the Azure Resource Manager API or the portal. | 
| resourceGroupName | path | True | string | The name of the resource group within the current subscription. You can obtain this value from the Azure Resource Manager API or the portal. |
| searchServiceName | path | True | string | The name of the Azure Cognitive Search service associated with the specified resource group. |
| privateEndpointConnectionName | path | True | string | The name of the private endpoint connection to the Azure Cognitive Search service with the specified resource group. |
| api-version | query | True | string | The API version to use for each request. The current version for preview features is 2019-10-01-Preview.|

## Request Header

| Name	| Required	| Type	| Description  | 
|-------|-----------|-------|--------------|
| x-ms-client-request-id |  | string uuid | A client-generated GUID value that identifies this request. If specified, this will be included in response information as a way to track the request. |

## Request Body
| Name	| Type	| Description  | 
|-------|-------|--------------|
| id    | string | The ID of the private endpoint connection. This can be used with the Azure Resource Manager to link resources together. |
| properties | PrivateEndpointConnectionProperties | Describes the properties of an existing Private Endpoint connection to the Azure Cognitive Search. |

## Responses

| Name	| Type	| Description  | 
|-------|-------|--------------|
| 200 OK | PrivateEndpointConnection | The existing private endpoint connection definition was successfully updated. |
| Other Status Codes | CloudError | HTTP 400 (Bad Request): The given private endpoint connection name or the private endpoint connection definition is invalid; See the error code and message in the response for details. HTTP 404 (Not Found): The subscription, resource group, search service or private endpoint connection could not be found. HTTP 409 (Conflict): The specified subscription is disabled. |

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

### PrivateEndpointConnectionUpdate

#### Sample Request

```http
PUT https://management.azure.com/subscriptions/subid/resourceGroups/rg1/providers/Microsoft.Search/searchServices/mysearchservice/privateEndpointConnections/testEndpoint.50bf4fbe-d7c1-4b48-a642-4f5892642546?api-version=2019-10-01-Preview
```

#### Sample Response
Status code:200

```json
      {
        "id": "/subscriptions/subid/resourceGroups/rg1/providers/Microsoft.Search/searchServices/mysearchservice/privateEndpointConnections/testEndpoint.50bf4fbe-d7c1-4b48-a642-4f5892642546",
        "properties": {
          "privateLinkServiceConnectionState": {
            "status": "Rejected",
            "description": "Rejected for some reason"
          }
        }
      }
```

## Definitions

|||
|-|-|
| [CloudError](#cloudError) | Contains information about an API error.|
| [CloudErrorBody](#cloudErrorBody) | Describes a particular API error with an error code and a message. |
| [PrivateEndpoint](#PrivateEndpoint) | The private endpoint resource from Microsoft.Network provider. |
| [PrivateEndpointConnection](#PrivateEndpointConnection) | Describes an existing Private Endpoint connection to the Azure Cognitive Search service. |
| [PrivateEndpointConnectionProperties](#PrivateEndpointConnectionProperties) | Describes the properties of an existing Private Endpoint connection to the Azure Cognitive Search service. |
| [PrivateLinkServiceConnectionState](#PrivateLinkServiceConnectionState) | Describes the current state of an existing Private Link Service connection to the Azure Private Endpoint. |
| [PrivateLinkServiceConnectionStatus](#PrivateLinkServiceConnectionStatus) | Status of the the private link service connection. Can be Pending, Approved, Rejected, or Disconnected. |


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


### <a name="PrivateEndpoint">PrivateEndpoint </a>
The private endpoint resource from Microsoft.Network provider.

| Name | Type | Description |
|------|------|-------------|
| id | string | The resource id of the private endpoint resource from Microsoft.Network provider. |

### <a name="PrivateEndpointConnection">PrivateEndpointConnection </a>
Describes an existing Private Endpoint connection to the Azure Cognitive Search service.

| Name | Type | Description |
|------|------|-------------|
| id | string | The ID of the private endpoint connection. This can be used with the Azure Resource Manager to link resources together. |
| name | string | The name of the private endpoint connection. |
| properties | [PrivateEndpointConnectionProperties](#PrivateEndpointConnectionProperties) | Describes the properties of an existing Private Endpoint connection to the Azure Cognitive Search service. |
| type | string | The resource type. |

### <a name="PrivateEndpointConnectionProperties">PrivateEndpointConnectionProperties </a>
Describes the properties of an existing Private Endpoint connection to the Azure Cognitive Search service.

| Name | Type | Description |
|------|------|-------------|
| privateEndpoint | [PrivateEndpoint](#PrivateEndpoint) | The private endpoint resource from Microsoft.Network provider. |
| privateLinkServiceConnectionState | [PrivateLinkServiceConnectionState](#PrivateLinkServiceConnectionState) | Describes the current state of an existing Private Link Service connection to the Azure Private Endpoint. |

### <a name="PrivateLinkServiceConnectionState">PrivateLinkServiceConnectionState </a>

Describes the current state of an existing Private Link Service connection to the Azure Private Endpoint.

| Name | Type | Description |
|------|------|-------------|
| status | [PrivateLinkServiceConnectionStatus](#PrivateLinkServiceConnectionStatus) | Status of the private link service connection. Can be Pending, Approved, Rejected, or Disconnected. |
| description  | string |  The description for the private link service connection state. |
| actionsRequired | string | A description of any extra actions that may be required. |

### <a name="PrivateLinkServiceConnectionStatus">PrivateLinkServiceConnectionStatus </a>

Status of the private link service connection. Can be Pending, Approved, Rejected, or Disconnected.

| Name | Type | Description |
|------|------|-------------|
| Approved | string |  |
| Disconnected | string |  |
| Pending | string |  |
| Rejected | string |  |

## See also

[How to use the Management REST API](../search-howto-management-rest-api.md)