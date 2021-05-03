---
title: Azure IoT Central REST API 
description: The Azure IoT Central REST API allows you to develop client and web applications that use REST calls to work with IoT Central. The API surface lets you manage IoT Central applications programmatically. 
services: iot-central
ms.service: iot-central
ms.topic: reference
author: avneet723
ms.author: avneets
ms.date: 11/17/2020
---

# Azure IoT Central REST API reference

[Azure IoT Central](https://docs.microsoft.com/azure/iot-central/) is an IoT application platform that is highly secure, scales with your business as it grows, ensures your investments are repeatable, and integrates with your existing business apps. It reduces the burden and cost of developing, managing, and maintaining enterprise-grade IoT solutions. 

Use IoT Central to connect and manage millions of devices, visualize the data and insights your devices generate, and monitor your devices at scale. The extensibility surface of the platform enables you to act on device insights by extending IoT intelligence into line-of-business applications.

The IoT Central REST API enables you to develop clients that integrate with your application. Use the REST API to build applications and experiences using the power of IoT Central for device provisioning, management, and operations.

> [!Note]
> The IoT Central REST API can be used with IoT Central V3 applications. Learn about [how to check the version of your application](https://docs.microsoft.com/azure/iot-central/core/howto-get-app-info).

Try our [guided learning journey](https://aka.ms/iotcentralapimslearnjourney) to learn about how to use the IoT Central APIs.

## Operation groups

The IoT Central REST API provides operations for working with the following resources:

| Operation group | Description                                                        | Learn more |
|-----------------|--------------------------------------------------------------------|------------| 
| [API Tokens](https://docs.microsoft.com/rest/api/iotcentral/1.0/apitokens)  | Create, read, delete access tokens used to interact with the IoT Central public APIs| [Authenticating against the API](https://aka.ms/iotcentralapidocsauth)
| [Continuous Data Exports](https://docs.microsoft.com/rest/api/iotcentral/2021-04-30preview/continuousdataexports) | Manage data exports within your IoT Central application | [Export your data](/azure/iot-central/preview/howto-export-data)|
| [Device Templates](https://docs.microsoft.com/rest/api/iotcentral/1.0/devicetemplates) | Create, read, and delete device templates within an IoT Central application| [Setup device template](https://docs.microsoft.com/azure/iot-central/core/howto-set-up-template)|
| [Devices](https://docs.microsoft.com/rest/api/iotcentral/1.0/devices) | Get information about and manage devices and IoT Edge modules in your IoT Central application| [Manage your devices](/azure/iot-central/preview/howto-manage-devices)|
| [Device Groups](https://docs.microsoft.com/rest/api/iotcentral/2021-04-30preview/devicegroups)| List the set of device groups within your application | [List Device Groups](https://docs.microsoft.com/azure/iot-central/core/tutorial-use-device-groups) |
| [Jobs](https://docs.microsoft.com/rest/api/iotcentral/2021-04-30preview/jobs)|Get information about and manage jobs within your application | [Manage your jobs](/azure/iot-central/core/howto-run-a-job) |
| [Roles](https://docs.microsoft.com/rest/api/iotcentral/1.0/roles)| List roles within your application | [Manage users and roles](/azure/iot-central/core/howto-manage-users-roles)|
| [Users](https://docs.microsoft.com/rest/api/iotcentral/1.0/users)| Add, update, and remove users within your application | [Manage users and roles](/azure/iot-central/core/howto-manage-users-roles) |

## Next steps

Learn how to authenticate to use the API
* [Authentication and authorization](authentication.md)
Learn more about IoT Central
* [Azure IoT Central Documentation](https://docs.microsoft.com/azure/iot-central)
