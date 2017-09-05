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
| [Device Enrollment](~/docs-ref-autogen/iot-dps/DeviceEnrollment.json)          | Provides device enrollment operations with the Device Provisioning Service. |
| [Device Enrollment Group](~/docs-ref-autogen/iot-dps/DeviceEnrollmentGroup.json)  | Provides operations for managing device enrollment groups. |
| [Registration Status](~/docs-ref-autogen/iot-dps/RegistrationStatus.json)  | Provides operations for retrieving and managing the status of device registrations. |
| [Runtime Registration](~/docs-ref-autogen/iot-dps/RuntimeRegistration.json)  | Provides runtime operations for managing device registrations. |
