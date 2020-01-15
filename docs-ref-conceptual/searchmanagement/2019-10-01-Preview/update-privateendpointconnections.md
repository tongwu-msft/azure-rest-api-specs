---
title: UPDATE privateEndpointConnectionName
titleSuffix: Azure Cognitive Search REST API
description: Updates a Private Endpoint connection to the Search service in the given resource group.
ms.service: cognitive-search
ms.topic: "language-reference"

ms.date: 01/15/2020
author: huangbolun
ms.author: bohuan
ms.manager: aagrawal
---

# UPDATE privateEndpointConnectionName (Search Management REST API)
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
| api-version | query | True | string | The API version to use for each request. The current version is 2019-10-01-Preview.|

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

```
azure_auth
Azure Active Directory OAuth2 Flow

Type: oauth2
Flow: implicit
Authorization URL: https://login.microsoftonline.com/common/oauth2/authorize
Scopes
Name	Description
user_impersonation	impersonate your user account
```


## Examples

### PrivateEndpointConnectionDelete

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

```
definitions:
- name: PrivateEndpointConnectionProperties
  description: Describes the properties of an existing Private Endpoint connection to the Azure Cognitive Search service.
  kind: object
  properties:
  - name: privateEndpoint
    description: The private endpoint resource from Microsoft.Network provider.
    types:
    - uid: PrivateEndpoint
  - name: privateLinkServiceConnectionState
    description: Describes the current state of an existing Private Link Service connection to the Azure Private Endpoint.
    types:
    - uid: PrivateLinkServiceConnectionState
- name: PrivateEndpointConnection
  description: Describes an existing Private Endpoint connection to the Azure Cognitive Search service.
  kind: object
  properties:
  - name: id
    description: The ID of the private endpoint connection. This can be used with the Azure Resource Manager to link resources together.
    types:
    - uid: string
  - name: name
    isReadyOnly: true
    description: The name of the private endpoint connection.
    types:
    - uid: string
  - name: type
    isReadyOnly: true
    description: The resource type.
    types:
    - uid: string
  - name: properties
    description: Describes the properties of an existing Private Endpoint connection to the Azure Cognitive Search service.
    types:
    - uid: PrivateEndpointConnectionProperties
- name: CloudError
  description: Contains information about an API error.
  kind: object
  properties:
  - name: error
    description: Describes a particular API error with an error code and a message.
    types:
    - uid: CloudErrorBody
- name: PrivateEndpoint
  description: The private endpoint resource from Microsoft.Network provider.
  kind: object
  properties:
  - name: id
    description: The resource id of the private endpoint resource from Microsoft.Network provider.
    types:
    - uid: string
- name: PrivateLinkServiceConnectionState
  description: Describes the current state of an existing Private Link Service connection to the Azure Private Endpoint.
  kind: object
  properties:
  - name: status
    description: Status of the the private link service connection. Can be Pending, Approved, Rejected, or Disconnected.
    types:
    - uid: PrivateLinkServiceConnectionStatus
  - name: description
    description: The description for the private link service connection state.
    types:
    - uid: string
  - name: actionsRequired
    description: A description of any extra actions that may be required.
    types:
    - uid: string
- name: CloudErrorBody
  description: Describes a particular API error with an error code and a message.
  kind: object
  properties:
  - name: code
    description: An error code that describes the error condition more precisely than an HTTP status code. Can be used to programmatically handle specific error cases.
    types:
    - uid: string
  - name: message
    description: A message that describes the error in detail and provides debugging information.
    types:
    - uid: string
  - name: target
    description: The target of the particular error (for example, the name of the property in error).
    types:
    - uid: string
  - name: details
    description: Contains nested errors that are related to this error.
    types:
    - uid: CloudErrorBody
      isArray: true
- name: PrivateLinkServiceConnectionStatus
  description: Status of the the private link service connection. Can be Pending, Approved, Rejected, or Disconnected.
  kind: enum
  properties:
  - name: Pending
    types:
    - uid: string
  - name: Approved
    types:
    - uid: string
  - name: Rejected
    types:
    - uid: string
  - name: Disconnected
    types:
    - uid: string
```