---
title: Microsoft Azure Attestation REST API reference
description: Operation groups for the Azure Attestation REST API
author: bandersmsft
ms.author: banders
ms.manager: amberb
ms.date: 08/15/2019
ms.topic: reference
ms.service: attestation
ms.devlang: rest-api
---

# Microsoft Azure Attestation REST API reference

Azure Attestation is a unified solution for remotely verifying the trustworthiness of a platform and integrity of the binaries running inside it. The service supports attestation of the platforms backed by Trusted Platform Modules (TPMs) alongside the ability to attest to the state of Trusted Execution Environments (TEEs) such as [Intel® Software Guard Extensions](https://www.intel.com/content/www/us/en/architecture-and-technology/software-guard-extensions.html) (SGX) enclaves and [Virtualization-based Security](https://docs.microsoft.com/en-us/windows-hardware/design/device-experiences/oem-vbs) (VBS) enclaves. The service allows creation and management of attestation providers, user defined policies and policy signer certificates.
