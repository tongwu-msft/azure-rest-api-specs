---
title: Custom Data Source - Azure Data Catalog REST API
description: Manage a Custom Data Source using the Azure Data Catalog REST API.
author: jasonwhowell
ms.author: jasonh
ms.reviewer: jasonwhowell
ms.service: data-catalog
ms.topic: reference
ms.date: 08/08/2019
---

# Manage custom data sources (Azure Data Catalog REST API)

This article describes the REST APIs used to manage a custom data source in Azure Data Catalog. Use the **Enumerate** and **Register** methods:

## Enumerate method

Enumerates custom data source protocols, which are registered with the catalog.

### Request

```json
GET https://api.azuredatacatalog.com/catalogs/{catalog_name}/dataSourceProtocols?api-version={api-version}
```

#### Uri parameters

|Name|Description|Data Type
|---|---|---
|catalog_name|Name of the catalog, or "DefaultCatalog" to use the default catalog.|String
|api-version|The API version.|String

#### GET example

```json
GET https://api.azuredatacatalog.com/catalogs/DefaultCatalog/dataSourceProtocols?api-version=2016-03-30
```

#### Header

```json
Content-Type: application/json
x-ms-client-request-id: 13c45c14…46ab469473f0
Authorization: Bearer eyJ0eX ... FWSXfwtQ
```

### Response
#### Status codes
|Code|Description
|---|---
|200|OK. The response contains list of custom data source protocols.

#### Content-Type
application/json

#### Header
HTTP/1.1 201 Created
x-ms-request-id: 72cf83c0…058f2b2a0c68

#### Body

```json
    {
        "value": [
            {
                "namespace": "Test.Test.MyTestProtocols",
                "name": "abc-def",
                "identityProperties": [
                    {
                        "name": "prop1",
                        "type": "string",
                        "ignoreCase":   
                    },  
                    {  
                        "name": "prop2",
                        "type": "int"
                    }  
                ],  
                "identitySets": [
                    {  
                        "properties": [
                            "prop1"
                        ]
                    },
                    {
                        "properties": [
                            "prop1",
                            "prop2"
                        ]
                    }
                ],
                "id": "https://e2255231-6dd3-1a0d-a6d8-7fc96dd780c2-mycatalog.api.azuredatacatalog.com/catalogs/MyCatalog/dataSourceProtocols/753a4d5a-26af-6491-610c-c3e069b904b1",
                "timestamp": "2016-04-27T00:45:55.8094373"
            }
        ]
    }
```

If Response body contains non-null value for the "nextLink" property, client should use the url specified in the "nextLink" property to continue enumeration until value of the "nextLink" property is null (or not present in the response body).

## Register method

Registers a new data source protocol that can be referenced in the "dsl" property when publishing an asset.

### Request

```json
POST https://api.azuredatacatalog.com/catalogs/{catalog_name}/dataSourceProtocols?api-version={api-version}
```

#### Uri parameters
|Name|Description|Data Type
|---|---|---
|catalog_name|Name of the catalog, or "DefaultCatalog" to use the default catalog.|String
|api-version|The API version.|String

#### POST example
```json
POST https://api.azuredatacatalog.com/catalogs/DefaultCatalog/dataSourceProtocols?api-version=2016-03-30
```

#### Header
```json
Content-Type: application/json
x-ms-client-request-id: 12345c14…46ab469473f0
Authorization: Bearer eyJ0eX ... FWSXfwtQ
```

#### Body example

```json
    {
        "namespace": "Test.MyTestProtocols",
        "name": "abc-def",
        "identityProperties": [
            {
                "name": "prop1",
                "type": "string",
                "ignoreCase":
            },
            {
                "name": "prop2",
                "type": "int"
            }
        ],
        "identitySets": [
            {
                "properties": [
                    "prop1"
                ]
            },  
            {  
                "properties": [
                    "prop1",
                    "prop2"
                ]
            }
        ]
    }
```

##### Response

### Status codes

|Code|Description
|---|---
|200|Ok. The request was fulfilled and a new custom data source protocol was created.
|400|BadRequest. The request was canceled because request payload doesn't conform to the data source protocol specification. Refer to the response's body for error details.
|400|BadRequest with the error code ImmutableViewItem. The request was canceled because the data source protocol with the specified namespace and name already exists and can't be updated.

### Content-Type

```json
application/json
```

#### Header

```json
HTTP/1.1 201 Created
x-ms-request-id: 72cf83c0…058f2b2a0c68
Location: https://e2255231-6dd3-1a0d-a6d8-7fc96dd780c2-mycatalog.api.azuredatacatalog.com/catalogs/MyCatalog/dataSourceProtocols/753a4d5a-26af-6491-610c-c3e069b904b1
```

### How to use custom data source protocol when publishing an asset

Use namespace-qualified name of the custom data source protocol as the value of the "protocol" property in the asset's "dsl" property and provide values for identity properties in "address" property bag:

```json
POST https://api.azuredatacatalog.com/catalogs/DefaultCatalog/views/tables?api-version=2016-03-30
```

Body Example 1: Use identity set that contains only "prop1":

```json
    {  
        "properties": {
            ....
            "dsl": {
                "protocol": "Test.MyTestProtocols.abc-def",
                "authentication": "windows",
                "address": {
                    "prop1": "location1"
                }
            },
            ...
        },
        "annotations": {
            ...
        }
    }
```

Body Example 2: Use identity set that contains both "prop1" and "prop2":

```json
    {  
        "properties": {
            ....
            "dsl": {
                "protocol": "Test.MyTestProtocols.abc-def",
                "authentication": "windows",
                "address": {
                    "prop1": "location1",
                    "prop2": 123,
                }
            },
            ...
        },  
        "annotations": {
            ...
        }
    }
```

> [!NOTE]
> If "address" property bag contains only "prop2", the publish request will be rejected (as BadRequest) because there is no matching identity set defined by the protocol.

Refer to [Data Catalog Developer Concepts](/azure/data-catalog/data-catalog-developer-concepts) for the custom data source protocol specification.
