---
title: Azure IoT Hub Device Provisioning Service REST API | Microsoft Docs
author: sethmanheim
ms.author: sethm
ms.date: 09/05/2017
ms.topic: reference
ms.service: iot-dps
ms.devlang: rest-api

---

# Azure IoT Hub Device Provisioning Service REST API

The IoT Hub Device Provisioning Service is a helper service for IoT Hub that enables automatic device provisioning to a specified IoT hub without requiring human intervention. You can use the Device Provisioning Service to provision millions of devices in a secure and scalable manner. For more information about the Device Provisioning Service, see [Provisioning IoT devices in Azure](/azure/iot-dps/about-iot-dps).

The REST APIs for the Device Provisioning Service provide programmatic access to the following enrollment and registration options supported by the Device Provisioning Service:

## REST Operation Groups 

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| [Device Enrollment](xref:your-dps.azure-devices-provisioning.net.iot-dps.deviceenrollment)          | Provides device enrollment operations with the Device Provisioning Service. |
| [Device Enrollment Group](xref:your-dps.azure-devices-provisioning.net.iot-dps.deviceenrollmentgroup)  | Provides operations for managing device enrollment groups. |
| [Registration Status](xref:your-dps.azure-devices-provisioning.net.iot-dps.registrationstate)  | Provides operations for retrieving and managing the status of device registrations. |
| [Runtime Registration](xref:global.azure-devices-provisioning.net.iot-dps.runtimeregistration)  | Provides runtime operations for managing device registrations. |
