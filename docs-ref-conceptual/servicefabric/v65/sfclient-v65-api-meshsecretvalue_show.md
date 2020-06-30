---
title: "Show"
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
# Show
Lists the specified value of the secret resource.

Lists the decrypted value of the specified named value of the secret resource. This is a privileged operation.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Resources/Secrets/{secretResourceName}/values/{secretValueResourceName}/list_value?api-version=6.4-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`secretResourceName`](#secretresourcename) | string | Yes | Path |
| [`secretValueResourceName`](#secretvalueresourcename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |

____
### `secretResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the secret resource.

____
### `secretValueResourceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the secret resource value which is typically the version identifier for the value.

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
| 200 (OK) | OK<br/> | [SecretValue](sfclient-v65-model-secretvalue.md) |
| All other status codes | Error<br/> | [FabricError](sfclient-v65-model-fabricerror.md) |

## Examples

### ListMeshSecretValue

This example shows how to get the unencrypted value of the secret. If the specified named value resource exists, its unencrypted value is returned along with status code 200. If the specified named value does not exist, an error is returned with an appropriate status code.

#### Request
```
POST http://localhost:19080/Resources/Secrets/dbConnectionString/values/v1/list_value?api-version=6.4-preview
```

#### 200 Response
##### Body
```json
{
  "value": "mongodb://contoso123:0Fc3IolnL12312asdfawejunASDF@asdfYXX2t8a97kghVcUzcDv98hawelufhawefafnoQRGwNj2nMPL1Y9qsIr9Srdw==@contoso123.documents.azure.com:10255/mydatabase?ssl=true"
}
```

