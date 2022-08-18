---
title: "IdentityDescription v82"
description: "IdentityDescription v82"
ms.date: "10/21/2020"
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
# IdentityDescription v82

Information describing the identities associated with this application.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`tokenServiceEndpoint`](#tokenserviceendpoint) | string | No |
| [`type`](#type) | string | Yes |
| [`tenantId`](#tenantid) | string | No |
| [`principalId`](#principalid) | string | No |
| [`userAssignedIdentities`](#userassignedidentities) | map of string to [IdentityItemDescription](sfclient-v82-model-identityitemdescription.md) | No |

____
### `tokenServiceEndpoint`
__Type__: string <br/>
__Required__: No<br/>
<br/>
the endpoint for the token service managing this identity

____
### `type`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
the types of identities associated with this resource; currently restricted to 'SystemAssigned and UserAssigned'

____
### `tenantId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
the identifier of the tenant containing the application's identity.

____
### `principalId`
__Type__: string <br/>
__Required__: No<br/>
<br/>
the object identifier of the Service Principal of the identity associated with this resource.

____
### `userAssignedIdentities`
__Type__: map of string to [IdentityItemDescription](sfclient-v82-model-identityitemdescription.md) <br/>
__Required__: No<br/>
<br/>
represents user assigned identities map.
