---
title: "Azure Mixed Reality Resource Management REST API Reference"
description: Learn how Microsoft provides a series of Azure services to empower Mixed Reality devices and applications.
ms.date: "04/15/2019"
ms.service: azure
ms.topic: "reference"
ms.assetid: 169BB708-1C45-4E21-98D2-8779717CC7A2
caps.latest.revision: 01
author: "XiangyuL-Microsoft"
ms.author: "xiangyul"
manager: "dgriff"
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
service_description: 'The common control plane shared by a series of Mixed Reality cloud service: Azure Spatial Anchors, Azure Remote Rendering, etc.'
---

# Azure Mixed Reality REST API Reference
Microsoft provides a series of Azure services to empower Mixed Reality devices and applications. Currently such services are provided:

* [Azure Spatial Anchors](https://azure.microsoft.com/services/spatial-anchors/)
* [Azure Remote Rendering](https://azure.microsoft.com/services/remote-rendering/)

The Azure Mixed Reality REST API provides programmatic access to create, query, and delete Azure Mixed Reality resources. To perform operations on Azure Mixed Reality resources, you send HTTPS requests with a supported method: `GET`, `POST`, `PUT`, `PATCH` or `DELETE` to an endpoint that targets a resource collection or a specific resource. This section explains how to work with resources by using the REST API.

## Supported REST API Versions
The following table lists the supported REST API versions by the Azure Mixed Reality services. The version must be specified as a query `api-version` in URI of every request.

|Version|Change introduced|Retirement date|
|-------------|---------------------|-----------------------|
|2019-02-28-preview|Public Preview of Spatial Anchors||
|2021-01-01-preview|Public Preview of Remote Rendering||
|2021-01-01|General Availability of Remote Rendering||

## Azure Mixed Reality Resources
The following articles describe the supported REST APIs for each resource type.

* [Spatial Anchors Accounts](xref:management.azure.com.mixedreality.2021-01-01.spatialanchorsaccounts)

## See Also
* [Azure Mixed Reality](https://azure.microsoft.com/topic/mixed-reality/)
* [Azure Spatial Anchors](https://azure.microsoft.com/services/spatial-anchors/)
* [Azure Remote Rendering](https://azure.microsoft.com/services/remote-rendering/)