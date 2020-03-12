---
title: Services - Update (Search Management REST API)
titleSuffix: Azure Cognitive Search REST API
description: Updates an existing Search service (public or private endpoint) in the given resource group.
ms.service: cognitive-search
ms.topic: "language-reference"

ms.date: 03/10/2020
author: huangbolun
ms.author: bohuan
ms.manager: aagrawal
---

# Services - Update (Search Management REST API)

**API Version: 2019-10-01-Preview**

Updates an existing Search service (public or private endpoint) in the given resource group.

```http
PATCH https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Search/searchServices/{searchServiceName}?api-version=2019-10-01-Preview
```

## URI Parameters

| Name    | In    | Required    | Type    | Description  | 
|-------|-----|-----------|-------|--------------|
| subscriptionId | path | True | string | The unique identifier for a Microsoft Azure subscription. You can obtain this value from the Azure Resource Manager API or the portal. | 
| resourceGroupName | path | True | string | The name of the resource group within the current subscription. You can obtain this value from the Azure Resource Manager API or the portal. |
| searchServiceName | path | True | string | The name of the Azure Cognitive Search service to update. |
| api-version | query | True | string | The API version to use for each request. The current version for preview features is 2019-10-01-Preview.|

## Request Header

| Name    | Required    | Type    | Description  | 
|-------|-----------|-------|--------------|
| x-ms-client-request-id |  | string uuid | A client-generated GUID value that identifies this request. If specified, this will be included in response information as a way to track the request. |

## Request Body
| Name    | Type    | Description  | 
|-------|-------|--------------|
| identity | Identity | The identity of the resource. |
| location | string | The geographic location of the resource. This must be one of the supported and registered Azure Geo Regions (for example, West US, East US, Southeast Asia, and so forth). This property is required when creating a new resource. | 
| properties.hostingMode | HostingMode | Applicable only for the standard3 SKU. You can set this property to enable up to 3 high density partitions that allow up to 1000 indexes, which is much higher than the maximum indexes allowed for any other SKU. For the standard3 SKU, the value is either 'default' or 'highDensity'. For all other SKUs, this value must be 'default'. | 
| properties.networkRuleSet | NetworkRuleSet | Network specific rules that determine how the Azure Cognitive Search service may be reached. | 
| properties.partitionCount    | integer | The number of partitions in the Search service; if specified, it can be 1, 2, 3, 4, 6, or 12. Values greater than 1 are only valid for standard SKUs. For 'standard3' services with hostingMode set to 'highDensity', the allowed values are between 1 and 3. | 
| properties.replicaCount    | integer | The number of replicas in the Search service. If specified, it must be a value between 1 and 12 inclusive for standard SKUs or between 1 and 3 inclusive for basic SKU.| 
| sku    | Sku | The SKU of the Search Service, which determines price tier and capacity limits. This property is required when creating a new Search Service. | 
| tags | object | Tags to help categorize the resource in the Azure portal. | 

## Responses

| Name    | Type    | Description  | 
|-------|-------|--------------|
| 200 OK | SearchService | The existing service definition was successfully updated. If you changed the number of replicas or partitions, the scale operation will happen asynchronously. You can periodically get your service definition and monitor progress via the `provisioningState` property. |
| Other Status Codes | CloudError | 'HTTP 400 (Bad Request): The given service definition is invalid or you attempted to change a property that is immutable; See the error code and message in the response for details. HTTP 404 (Not Found): The subscription or resource group could not be found. HTTP 409 (Conflict): The specified subscription is disabled.' |

## Security

### azure_auth
Azure Active Directory OAuth2 Flow

|||
|-|-|
| **Type** | oauth2 |
| **Flow** | implicit |
| **Authorization URL** | https://login.microsoftonline.com/common/oauth2/authorize |

**Scopes**

| Name    | Description |
|-------|-------------|
| user_impersonation    | impersonate your user account | 


## Examples

### SearchUpdateService

#### Sample Request

```http
PATCH https://management.azure.com/subscriptions/subid/resourceGroups/rg1/providers/Microsoft.Search/searchServices/mysearchservice?api-version=2019-10-01-Preview
```

##### Request Body
```json
{
  "tags": {
    "app-name": "My e-commerce app",
    "new-tag": "Adding a new tag"
  },
  "properties": {
    "replicaCount": 2
  }
}
```

#### Sample Response

Status code: 200

```json
{
  "id": "/subscriptions/subid/resourceGroups/rg1/providers/Microsoft.Search/searchServices/mysearchservice",
  "name": "mysearchservice",
  "location": "westus",
  "type": "Microsoft.Search/searchServices",
  "tags": {
    "app-name": "My e-commerce app",
    "new-tag": "Adding a new tag"
  },
  "sku": {
    "name": "standard"
  },
  "properties": {
    "replicaCount": 2,
    "partitionCount": 1,
    "status": "provisioning",
    "statusDetails": "",
    "hostingMode": "default",
    "provisioningState": "provisioning",
    "networkRuleSet": {
      "endpointAccess": "Public",
      "ipRules": []
    },
    "privateEndpointConnections": []
  }
}
```

### SearchUpdateServiceToRemoveIdentity

#### Sample Request

```http
PATCH https://management.azure.com/subscriptions/subid/resourceGroups/rg1/providers/Microsoft.Search/searchServices/mysearchservice?api-version=2019-10-01-Preview
```

##### Request Body

```json
{
  "sku": {
    "name": "standard"
  },
  "identity": {
    "type": "None"
  }
}
```

#### Sample Response

Status code: 200

```json
{
  "id": "/subscriptions/subid/resourceGroups/rg1/providers/Microsoft.Search/searchServices/mysearchservice",
  "name": "mysearchservice",
  "location": "westus",
  "type": "Microsoft.Search/searchServices",
  "tags": {},
  "sku": {
    "name": "standard"
  },
  "properties": {
    "replicaCount": 3,
    "partitionCount": 1,
    "status": "running",
    "statusDetails": "",
    "hostingMode": "default",
    "provisioningState": "succeeded",
    "networkRuleSet": {
      "endpointAccess": "Public",
      "ipRules": []
    }
  },
  "identity": {
    "type": "None"
  }
}
```

### searchUpdateServiceToAllowAccessFromCustomIPs

#### Sample Request

```http
PATCH https://management.azure.com/subscriptions/subid/resourceGroups/rg1/providers/Microsoft.Search/searchServices/mysearchservice?api-version=2019-10-01-Preview
```

##### Request Body

```json
{
  "properties": {
    "replicaCount": 3,
    "partitionCount": 1,
    "networkRuleSet": {
      "endpointAccess": "Public",
      "ipRules": [
        {
          "value": "10.2.3.4"
        }
      ]
    }
  }
}
```

#### Sample Response

Status code: 200

```json
{
  "id": "/subscriptions/subid/resourceGroups/rg1/providers/Microsoft.Search/searchServices/mysearchservice",
  "name": "mysearchservice",
  "location": "westus",
  "type": "Microsoft.Search/searchServices",
  "tags": {
    "app-name": "My e-commerce app",
    "new-tag": "Adding a new tag"
  },
  "sku": {
    "name": "standard"
  },
  "properties": {
    "replicaCount": 3,
    "partitionCount": 1,
    "status": "running",
    "statusDetails": "",
    "hostingMode": "default",
    "provisioningState": "succeeded",
    "networkRuleSet": {
      "endpointAccess": "Public",
      "ipRules": [
        {
          "value": "10.2.3.4"
        }
      ]
    },
    "privateEndpointConnections": []
  }
}
```
### searchUpdateServiceToAllowAccessFromPrivateEndpoints

#### Sample Request

```http
PATCH https://management.azure.com/subscriptions/subid/resourceGroups/rg1/providers/Microsoft.Search/searchServices/mysearchservice?api-version=2019-10-01-Preview
```

##### Request Body

```json
{
  "properties": {
    "replicaCount": 1,
    "partitionCount": 1,
    "networkRuleSet": {
      "endpointAccess": "Private"
    }
  }
}
```

#### Sample Response

Status code: 200

```json
{
  "id": "/subscriptions/subid/resourceGroups/rg1/providers/Microsoft.Search/searchServices/mysearchservice",
  "name": "mysearchservice",
  "location": "westus",
  "type": "Microsoft.Search/searchServices",
  "tags": {
    "app-name": "My e-commerce app",
    "new-tag": "Adding a new tag"
  },
  "sku": {
    "name": "basic"
  },
  "properties": {
    "replicaCount": 1,
    "partitionCount": 1,
    "status": "running",
    "statusDetails": "",
    "hostingMode": "default",
    "provisioningState": "succeeded",
    "networkRuleSet": {
      "endpointAccess": "Private"
    },
    "privateEndpointConnections": []
  }
}
```

## Definitions

|||
|-|-|
| [CloudError](#CloudError) | Contains information about an API error.|
| [CloudErrorBody](#CloudErrorBody) | Describes a particular API error with an error code and a message. |
| [EndpointAccess](#EndpointAccess) | The level of access to the search service endpoint. Public, the search service endpoint is reachable from the internet. Private, the search service endpoint can only be accessed via private endpoints. Default is Public. |
| [HostingMode](#HostingMode) |Applicable only for the standard3 SKU. You can set this property to enable up to 3 high density partitions that allow up to 1000 indexes, which is much higher than the maximum indexes allowed for any other SKU. For the standard3 SKU, the value is either 'default' or 'highDensity'. For all other SKUs, this value must be 'default'.|
| [Identity](#Identity) | Identity for the resource. |
| [IdentityType](#IdentityType) | The identity type. |
| [IpRule](#IpRule) | The IP restriction rule of the Azure Cognitive Search service. |
| [NetworkRuleSet](#NetworkRuleSet) | Network specific rules that determine how the Azure Cognitive Search service may be reached. |
| [PrivateEndpoint](#PrivateEndpoint) | The private endpoint resource from Microsoft.Network provider. |
| [PrivateEndpointConnection](#PrivateEndpointConnection) | Describes an existing Private Endpoint connection to the Azure Cognitive Search service. |
| [PrivateEndpointConnectionProperties](#PrivateEndpointConnectionProperties) | Describes the properties of an existing Private Endpoint connection to the Azure Cognitive Search service. |
| [PrivateLinkServiceConnectionState](#PrivateLinkServiceConnectionState) | Describes the current state of an existing Private Link Service connection to the Azure Private Endpoint. |
| [PrivateLinkServiceConnectionStatus](#PrivateLinkServiceConnectionStatus) | Status of the private link service connection. Can be Pending, Approved, Rejected, or Disconnected. |
| [ProvisioningState](#ProvisioningState) | The state of the last provisioning operation performed on the Search service. Provisioning is an intermediate state that occurs while service capacity is being established. After capacity is set up, provisioningState changes to either 'succeeded' or 'failed'. Client applications can poll provisioning status (the recommended polling interval is from 30 seconds to one minute) by using the Get Search Service operation to see when an operation is completed. If you are using the free service, this value tends to come back as 'succeeded' directly in the call to Create Search service. This is because the free service uses capacity that is already set up. |
| [SearchService](#SearchService) | Describes an Azure Cognitive Search service and its current state. |
| [SearchServiceStatus](#SearchServiceStatus) | The status of the Search service. Possible values include: 'running': The Search service is running and no provisioning operations are underway. 'provisioning': The Search service is being provisioned or scaled up or down. 'deleting': The Search service is being deleted. 'degraded': The Search service is degraded. This can occur when the underlying search units are not healthy. The Search service is most likely operational, but performance might be slow and some requests might be dropped. 'disabled': The Search service is disabled. In this state, the service will reject all API requests. 'error': The Search service is in an error state. If your service is in the degraded, disabled, or error states, it means the Azure Cognitive Search team is actively investigating the underlying issue. Dedicated services in these states are still chargeable based on the number of search units provisioned. |
| [Sku](#Sku)  | Defines the SKU of an Azure Cognitive Search Service, which determines price tier and capacity limits. |
| [SkuName](#SkuName)  | The SKU of the Search service. Valid values include: 'free': Shared service. 'basic': Dedicated service with up to 3 replicas. 'standard': Dedicated service with up to 12 partitions and 12 replicas. 'standard2': Similar to standard, but with more capacity per search unit. 'standard3': The largest Standard offering with up to 12 partitions and 12 replicas (or up to 3 partitions with more indexes if you also set the hostingMode property to 'highDensity'). 'storage_optimized_l1': Supports 1TB per partition, up to 12 partitions. 'storage_optimized_l2': Supports 2TB per partition, up to 12 partitions.' |

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

### <a name="EndpointAccess">EndpointAccess </a>

The level of access to the search service endpoint. Public, the search service endpoint is reachable from the internet. Private, the search service endpoint can only be accessed via private endpoints. Default is Public.

| Name | Type | Description |
|------|------|-------------|
| Public | string | | 
| Private | string | | 

### <a name="HostingMode">HostingMode </a>

Applicable only for the standard3 SKU. You can set this property to enable up to 3 high density partitions that allow up to 1000 indexes, which is much higher than the maximum indexes allowed for any other SKU. For the standard3 SKU, the value is either 'default' or 'highDensity'. For all other SKUs, this value must be 'default'.

| Name | Type | Description |
|------|------|-------------|
| default | string | | 
| highDensity | string | | 

### <a name="Identity">Identity </a>
Identity for the resource.

| Name | Type | Description |
|------|------|-------------|
| principalId | string |  The principal ID of resource identity. |
| tenantId | string | The tenant ID of resource. |
| type | [IdentityType](#IdentityType) | The identity type. |

### <a name="IdentityType">IdentityType </a>
The identity type.

| Name | Type | Description |
|------|------|-------------|
| None | string | | 
| SystemAssigned | string | | 

### <a name="IpRule">IpRule </a>

The IP restriction rule of the Azure Cognitive Search service.

| Name | Type | Description |
|------|------|-------------|
| value | string | Value corresponding to a single IPv4 address (eg., 123.1.2.3) or an IP range in CIDR format (eg., 123.1.2.3/24) to be allowed. |

### <a name="NetworkRuleSet">NetworkRuleSet </a>
Network specific rules that determine how the Azure Cognitive Search service may be reached.

| Name | Type | Description |
|------|------|-------------|
| endpointAccess | [EndpointAccess](#EndpointAccess) | The level of access to the search service endpoint. Public, the search service endpoint is reachable from the internet. Private, the search service endpoint can only be accessed via private endpoints. Default is Public. |
| ipRules | [IpRule](#IpRule)[] | A list of IP restriction rules that defines the inbound network access to the search service endpoint. These restriction rules are applied only when the EndpointAccess of the search service is Public. |

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

### <a name="ProvisioningState">ProvisioningState </a>

The state of the last provisioning operation performed on the Search service. Provisioning is an intermediate state that occurs while service capacity is being established. After capacity is set up, provisioningState changes to either 'succeeded' or 'failed'. Client applications can poll provisioning status (the recommended polling interval is from 30 seconds to one minute) by using the Get Search Service operation to see when an operation is completed. If you are using the free service, this value tends to come back as 'succeeded' directly in the call to Create Search service. This is because the free service uses capacity that is already set up.

| Name | Type | Description |
|------|------|-------------|
| failed | string |  |
| provisioning | string |  |
| succeeded | string |  |

### <a name="SearchService">SearchService </a>

Describes an Azure Cognitive Search service and its current state.

| Name | Type | Description |
|------|------|-------------|
| id | string | The ID of the resource. This can be used with the Azure Resource Manager to link resources together. | 
| identity | [Identity](#Identity) | The identity of the resource.  |
| location | string | The geographic location of the resource. This must be one of the supported and registered Azure Geo Regions (for example, West US, East US, Southeast Asia, and so forth). This property is required when creating a new resource. | 
| name | string | The name of the resource. | 
| tags | object | Tags to help categorize the resource in the Azure portal.| 
| type | string | The resource type. | 
| sku | [Sku](#Sku) | The SKU of the Search Service, which determines price tier and capacity limits. This property is required when creating a new Search Service. |
| properties.hostingMode | [HostingMode](#HostingMode) | Applicable only for the standard3 SKU. You can set this property to enable up to 3 high density partitions that allow up to 1000 indexes, which is much higher than the maximum indexes allowed for any other SKU. For the standard3 SKU, the value is either 'default' or 'highDensity'. For all other SKUs, this value must be 'default'. |
| properties.networkRuleSet | [NetworkRuleSet](#NetworkRuleSet) | Network specific rules that determine how the Azure Cognitive Search service may be reached. |
| properties.partitionCount | integer | The number of partitions in the Search service; if specified, it can be 1, 2, 3, 4, 6, or 12. Values greater than 1 are only valid for standard SKUs. For 'standard3' services with hostingMode set to 'highDensity', the allowed values are between 1 and 3. |
| properties.privateEndpointConnections | [PrivateEndpointConnection[]](#PrivateEndpointConnection) | The list of private endpoint connections to the Azure Cognitive Search service. | 
| properties.provisioningState | [ProvisioningState](#ProvisioningState) | The state of the last provisioning operation performed on the Search service. Provisioning is an intermediate state that occurs while service capacity is being established. After capacity is set up, provisioningState changes to either 'succeeded' or 'failed'. Client applications can poll provisioning status (the recommended polling interval is from 30 seconds to one minute) by using the Get Search Service operation to see when an operation is completed. If you are using the free service, this value tends to come back as 'succeeded' directly in the call to Create Search service. This is because the free service uses capacity that is already set up. |
| properties.replicaCount | integer | The number of replicas in the Search service. If specified, it must be a value between 1 and 12 inclusive for standard SKUs or between 1 and 3 inclusive for basic SKU. |
| properties.status | [SearchServiceStatus](#SearchServiceStatus) | The status of the Search service. Possible values include: 'running': The Search service is running and no provisioning operations are underway. 'provisioning': The Search service is being provisioned or scaled up or down. 'deleting': The Search service is being deleted. 'degraded': The Search service is degraded. This can occur when the underlying search units are not healthy. The Search service is most likely operational, but performance might be slow and some requests might be dropped. 'disabled': The Search service is disabled. In this state, the service will reject all API requests. 'error': The Search service is in an error state. If your service is in the degraded, disabled, or error states, it means the Azure Cognitive Search team is actively investigating the underlying issue. Dedicated services in these states are still chargeable based on the number of search units provisioned. |
| properties.statusDetails | string | The details of the Search service status. |

### <a name="SearchServiceStatus">SearchServiceStatus </a>

The status of the Search service. Possible values include: 'running': The Search service is running and no provisioning operations are underway. 'provisioning': The Search service is being provisioned or scaled up or down. 'deleting': The Search service is being deleted. 'degraded': The Search service is degraded. This can occur when the underlying search units are not healthy. The Search service is most likely operational, but performance might be slow and some requests might be dropped. 'disabled': The Search service is disabled. In this state, the service will reject all API requests. 'error': The Search service is in an error state. If your service is in the degraded, disabled, or error states, it means the Azure Cognitive Search team is actively investigating the underlying issue. Dedicated services in these states are still chargeable based on the number of search units provisioned.

| Name | Type | Description |
|------|------|-------------|
| degraded | string |  |
| deleting | string |  |
| disabled | string |  |
| error | string |  |
| provisioning | string |  |
| running | string |  |

### <a name="Sku">Sku </a>
Defines the SKU of an Azure Cognitive Search Service, which determines price tier and capacity limits.

| Name | Type | Description |
|------|------|-------------|
 name | [SkuName](#SkuName) | The SKU of the Search service. Valid values include: 'free': Shared service. 'basic': Dedicated service with up to 3 replicas. 'standard': Dedicated service with up to 12 partitions and 12 replicas. 'standard2': Similar to standard, but with more capacity per search unit. 'standard3': The largest Standard offering with up to 12 partitions and 12 replicas (or up to 3 partitions with more indexes if you also set the hostingMode property to 'highDensity'). 'storage_optimized_l1': Supports 1TB per partition, up to 12 partitions. 'storage_optimized_l2': Supports 2TB per partition, up to 12 partitions.' |

### <a name="SkuName">SkuName </a>

The SKU of the Search service. Valid values include: 'free': Shared service. 'basic': Dedicated service with up to 3 replicas. 'standard': Dedicated service with up to 12 partitions and 12 replicas. 'standard2': Similar to standard, but with more capacity per search unit. 'standard3': The largest Standard offering with up to 12 partitions and 12 replicas (or up to 3 partitions with more indexes if you also set the hostingMode property to 'highDensity'). 'storage_optimized_l1': Supports 1TB per partition, up to 12 partitions. 'storage_optimized_l2': Supports 2TB per partition, up to 12 partitions.'

| Name | Type | Description |
|------|------|-------------|
| free | string |  |
| basic | string |  |
| standard | string |  |
| standard2 | string |  |
| standard3 | string |  |
| storage_optimized_l1 | string |  |
| storage_optimized_l2 | string |  |


## See also

[How to use the Management REST API](../search-howto-management-rest-api.md)