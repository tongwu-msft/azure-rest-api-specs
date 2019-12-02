---
title: "Get"
ms.date: 06/12/2019
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Get
Gets the Application resource with the given name.

Gets the information about the Application resource with the given name. The information include the description and other properties of the Application.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Resources/Applications/{applicationResourceName}?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationResourceName`](#applicationresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |

____
### `applicationResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.4-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.4-preview'.


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [ApplicationResourceDescription](sfclient-v65-model-applicationresourcedescription.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-v65-model-fabricerror.md) |

## Examples

### GetApplicationResource

This example shows how to get a application resource. If the application resource exists, its description is returned along with an OK (200) status code. If the application resource does not exist, an error is returned with an appropriate status code.

#### Request
```
GET http://localhost:19080/Resources/Applications/sampleApplication?api-version=6.4-preview
```

#### 200 Response
##### Body
```json
{
  "name": "sampleApplication",
  "properties": {
    "description": "Service Fabric Mesh sample application.",
    "serviceNames": [
      "helloWorldService"
    ],
    "healthState": "Ok",
    "status": "Ready"
  },
  "identity": {
    "type": "SystemAssigned,UserAssigned",
    "tokenServiceEndpoint": "http://tokenservice",
    "tenantId": "D47A6CD5-E870-4ADF-8C00-1C0B758BC567",
    "principalId": "84DFA616-1F44-4D63-BC08-43B5F758D16C",
    "userAssignedIdentities": {
      "/subscriptions/c1089427-83d3-4286-9f35-5af546a6eb67/resourcegroups/myGroup/providers/Microsoft.Identity/Identities/identity1": {
        "clientId": "5287A675-78D2-4E49-BF09-D3BFE02493D4",
        "principalId": "7D6F0B1C-AF9F-4E21-9B3C-AE22F4D926F8"
      },
      "/subscriptions/c1089427-83d3-4286-9f35-5af546a6eb67/resourcegroups/myGroup/providers/Microsoft.Identity/Identities/identity2": {
        "clientId": "AF1509EC-9B5F-43CC-8A6F-FA7CC84AEBE1",
        "principalId": "31144ACF-46F4-4639-A711-A257229EE0C0"
      }
    }
  }
}
```

