---
title: Azure IoT Central REST API 
description: The Azure IoT Central REST API allows you to develop client and web applications that use REST calls to work with IoT Central. The API surface lets you manage IoT Central applications programmatically. 
services: iot-central
ms.service: iot-central
ms.topic: reference
author: avneet723
ms.author: avneets
ms.date: 11/01/2021
---

# Azure IoT Central REST API reference

[Azure IoT Central](/azure/iot-central/) is an IoT application platform that is highly secure, scales with your business as it grows, ensures your investments are repeatable, and integrates with your existing business apps. It reduces the burden and cost of developing, managing, and maintaining enterprise-grade IoT solutions. 

Use IoT Central to connect and manage millions of devices, visualize the data and insights your devices generate, and monitor your devices at scale. The extensibility surface of the platform enables you to act on device insights by extending IoT intelligence into line-of-business applications.

The IoT Central REST API enables you to develop clients that integrate with your application. Use the REST API to build applications and experiences using the power of IoT Central for device provisioning, management, and operations.

> [!Note]
> The IoT Central REST API can be used with IoT Central V3 applications. Learn about [how to check the version of your application](/azure/iot-central/core/howto-get-app-info).

Try our [guided learning journey](/learn/modules/manage-iot-central-apps-with-rest-api/) to learn about how to use the IoT Central APIs.

## Release History
[Versions](versions.md)

## Operation groups

The IoT Central REST API provides operations for working with the following resources:

| Operation group | Description                                                        | Learn more |
|-----------------|--------------------------------------------------------------------|------------| 
| [API Tokens](https://aka.ms/iotcapi-token)  | Create, read, delete access tokens used to interact with the IoT Central public APIs| [Authenticating against the API](https://aka.ms/iotcentralapidocsauth)
| [Destinations](https://aka.ms/iotcapi-destinations) | Manage destinations utilized to configure data exports within your IoT Central application | [Configure your destination](/azure/iot-central/preview/howto-export-data#destinations)|
| [Device Templates](https://aka.ms/iotcapi-devicetemplates) | Create, read, and delete device templates within an IoT Central application| [Setup device template](/azure/iot-central/core/howto-set-up-template)|
| [Devices](https://aka.ms/iotcapi-devices) | Get information about and manage devices and IoT Edge modules in your IoT Central application| [Manage your devices](/azure/iot-central/preview/howto-manage-devices)|
| [Device Groups](https://aka.ms/iotc-devicegroups)| Create, read, and delete device groups within an IoT Central application | [Manage Device Groups](/azure/iot-central/core/tutorial-use-device-groups) |
| [Exports](https://aka.ms/iotcapi-cde) | Manage data export definitions within your IoT Central application | [Manage your data exports](/azure/iot-central/preview/howto-export-data)|
| [File Upload](https://aka.ms/iotcapi-fileupload) | Update, retrieve and delete file upload configurations| [Configure File Upload](/azure/iot-central/core/howto-configure-file-uploads)|
| [Jobs](https://aka.ms/iotcapi-jobs)|Get information about and manage jobs within your application | [Manage your jobs](/azure/iot-central/core/howto-run-a-job) |
| [Organizations](https://aka.ms/iotcapi-orgs) | Create, read, delete and list organizations within your IoT Central application| [Manage your organizations](/azure/iot-central/core/howto-create-organizations)|
| [Query](https://aka.ms/iotcapi-query) | Query for devices or device data from within your IoT Central application using IoT Central Query Language| [Query your data](/azure/iot-central/core/howto-query-with-rest-api)|
| [Roles](https://aka.ms/iotcapi-roles)| List roles within your application | [Manage users and roles](/azure/iot-central/core/howto-manage-users-roles)|
| [Users](https://aka.ms/iotcapi-users)| Add, update, and remove users within your application | [Manage users and roles](/azure/iot-central/core/howto-manage-users-roles) |

## Next steps

Learn how to authenticate to use the IoT Central API
* [Authentication and authorization](authentication.md)

Learn more about IoT Central
* [Azure IoT Central Documentation](/azure/iot-central)
