---
title: API versions of IoT Central REST APIs 
titleSuffix: Azure IoT Central
description: Lists the generally available and preview versions of the REST APIs for Azure IoT Central.
services: iot-central
ms.service: iot-central
ms.topic: reference
author: avneet723
ms.author: avneets
---

# API versions of Azure IoT Central Data Plane REST APIs

This article lists the current and past versions of the REST APIs for Azure IoT Central.

## Stable versions

This is the stable release versions that can be used to develop production solutions with Azure IoT Central.

| API version | Specification | API updates |
|---------|---------------|-----------------|
| `2022-07-31` (Latest) | [Swagger specicication](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/iotcentral/data-plane/Microsoft.IoTCentral/stable/2022-07-31) | [Release note](#2022-07-31)
| `2022-05-31` (Deprecated) | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/iotcentral/data-plane/Microsoft.IoTCentral/stable/2022-05-31) | [Release note](#2022-05-31)
| `1.0` (Deprecated) | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/iotcentral/data-plane/Microsoft.IoTCentral/stable/1.0) |  [Release note](#10) |

## Preview versions

Preview versions are released to test new functionality, gather feedback, and discover and fix issues. Preview APIs are available under [Supplemental Terms of Use](https://azure.microsoft.com/support/legal/preview-supplemental-terms/), and are not recommended for production workloads.

| API version | Specification | API updates |
|---------|---------------|-----------------|
| `2022-06-30-preview` (Latest) | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/iotcentral/data-plane/Microsoft.IoTCentral/preview/2022-06-30-preview) | [Release note](#2022-06-30-preview) |
| `1.2-Preview` (Deprecated) | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/iotcentral/data-plane/Microsoft.IoTCentral/preview/1.2-preview) | [Release note](#12-preview-deprecated) |
| `1.1-Preview` (Deprecated)| [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/iotcentral/data-plane/Microsoft.IoTCentral/preview/1.1-preview) | [Release note](#11-preview-deprecated) |

## Release notes

### 2022-07-31

Our latest GA release on July 31st, 2022 improves the previously existing `2022-05-31` release and is fully backwards compatible. As of today, the `2022-05-31` release is now marked for `deprecation` and we will look to end support for it by July 2025. Here are set of updates captured in this release:

+ Jobs with progress status support 
+ Scheduled Jobs support
+ Device Enrollment Groups support
+ Device Relationships support
+ Device Groups List Devices support


### 2022-06-30-preview

The preview release of Azure IoT Central REST Data Plane API on June 30th, 2022 delivers a series of improvements to existing endpoints and adds support for the following key capabilities:

+ Support for creating and managing `Enrollment Groups` for device onboarding
+ Ability to create and configure `Scheduled Jobs`
+ Support for programmatically creating `Application Dashboard` via REST API
+ Support for umodeled properties and commands for `Device`
+ Ability to list devices within a `Device Group`
+ Support progress summary from job
+ Removed name field from `Device Relationship`

### 2022-05-31

Our latest GA release on May 31st, 2022 improves the previously existing `1.0` release and is fully backwards compatible. As of today, the `1.0` release is now marked for `deprecation` and we will look to end support for it by May 2025. Here are set of updates captured in this release:

+ File Upload Storage Configuration Support
+ Device Group CRUD Support
+ Organization CRUD Support
+ Organization Support on Devices, Roles, Users, and API Tokens
 
### 1.2-Preview (Deprecated)

The `1.2-preview` release continuously improves our API endpoints from previous preview releases and adds support for the following:

+ Device Group CRUD support
+ New job type to support device template migration

### 1.0

First GA REST API release for Azure IoT Central that captures support for the following endpoints: Devices, Roles List, Users, Device Templates, and API Tokens. You can learn more about each of the [endpoints here](index.md). 

+ Users without organization support.
+ Roles list without organization support.
+ Devices CRUD, properties, commands, credentials, attestation support.
+ API Tokens without organization support.
+ Device Template without PATCH support.

### 1.1-Preview (Deprecated)

This release enable support for DTDL v2 within the REST API surface for Azure IoT Central. It includes breaking changes from legacy `preview` version (now deprecated).

+ `DTDLv2` alignment, read more [details](https://github.com/Azure/opendigitaltwins-dtdl/blob/master/DTDL/v2/dtdlv2.md).
+ Device Relationship support.
+ FileUpload configuration support.
+ Organization support.
+ Telemetry Query support.
+ Jobs support.
+ Removed legacy Continuous Data Export Support.
+ Add Data Export V2 Export/Destination support.
+ Removed api/devices/{deviceId}/cloudProperties, using api/devices/{deviceId}/properties.
+ Properties and telemetries under inherited interface will not be treated as root property and root telemetry.
+ Device Template patching support.
+ Edge manifest support from device template.

### Preview (Deprecated & Removed)

First version of Azure IoT Central public API, with support for `DTDL v1` only, has now been deprecated and removed from our REST API endpoints. 

## See also

+ [Common Error Codes](common-error-codes.md)
+ [Authentication](authentication.md)
+ [Throttling](throttling.md)
