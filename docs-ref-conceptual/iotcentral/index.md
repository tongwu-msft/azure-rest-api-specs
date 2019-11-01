---
title: Azure IoT Central REST API 
description: The Azure IoT Central REST API allows you to develop client and web applications that use REST calls to work with IoT Central. The API surface lets you manage IoT Central applications programmatically. 
services: iot-central
ms.service: iot-central
ms.subservice: core
ms.topic: reference
author: avneet723
ms.author: avneets
ms.date: 10/28/2019
---

# Azure IoT Central REST API reference

[Azure IoT Central](https://docs.microsoft.com/azure/iot-central/) is an IoT application platform that reduces the burden and cost of developing, managing, and maintaining enterprise-grade IoT solutions. 

The web UI lets you monitor device conditions, create rules, and manage millions of devices and their data throughout their life cycle. Furthermore, it enables you to act on device insights by extending IoT intelligence into line-of-business applications.

The REST API allows you to develop clients that use REST calls to work with the IoT Central service. The IoT Central REST API lets you integrate IoT device management and control into your existing dashboards and applications.

## Rest Operation Groups

IoT Central REST API provides operations for working with the following resources:

| Operation group | Description                                                        | Learn more |
|-----------------|--------------------------------------------------------------------|------------| 
| [API Tokens](https://docs.microsoft.com/rest/api/iotcentral/apitokens)  | Provides operations on access tokens required to interact with the IoT Central application programmatically| [Azure API Authentication](https://docs.microsoft.com/rest/api/apimanagement/apimanagementrest/azure-api-management-rest-api-authentication)
| [Applications](https://docs.microsoft.com/rest/api/iotcentral/applications) | Provides operations to retrieve the list of IoT Central applications | [IoT Central Applications](https://docs.microsoft.com/azure/iot-central/core/quick-deploy-iot-central-pnp)|
| [Continuous Data Exports](https://docs.microsoft.com/rest/api/iotcentral/continuousdataexports) | Provides operations to set up data exports within your IoT Central application | [Export your data](https://docs.microsoft.com/azure/iot-central/core/howto-export-data-pnp)|
| [Device Templates](https://docs.microsoft.com/rest/api/iotcentral/devicetemplates) | Provides operations on Device Templates within an IoT Central application| [Setup device template](https://docs.microsoft.com/azure/iot-central/core/howto-set-up-template)|
| [Devices](https://docs.microsoft.com/rest/api/iotcentral/devices) | Provides operations to manage the set of devices in your IoT Central application| [Manage your devices](https://docs.microsoft.com/azure/iot-central/core/howto-manage-devices-pnp)|
| [Roles](https://docs.microsoft.com/rest/api/iotcentral/roles)| Provides operations to manage the set of roles within your application | [Manage your roles](https://docs.microsoft.com/azure/iot-central/core/howto-manage-users-roles-pnp)

## Next steps

Learn more about this service:
* [Azure IoT Central Documentation](https://docs.microsoft.com/azure/iot-central)
