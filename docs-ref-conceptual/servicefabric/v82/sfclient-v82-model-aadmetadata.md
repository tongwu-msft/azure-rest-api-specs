---
title: "AadMetadata v82"
description: "AadMetadata v82"
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
# AadMetadata v82

Azure Active Directory metadata used for secured connection to cluster.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`authority`](#authority) | string | No |
| [`client`](#client) | string | No |
| [`cluster`](#cluster) | string | No |
| [`login`](#login) | string | No |
| [`redirect`](#redirect) | string | No |
| [`tenant`](#tenant) | string | No |

____
### `authority`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The AAD authority url.

____
### `client`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The AAD client application Id.

____
### `cluster`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The AAD cluster application Id.

____
### `login`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The AAD login url.

____
### `redirect`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The client application redirect address.

____
### `tenant`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The AAD tenant Id.
