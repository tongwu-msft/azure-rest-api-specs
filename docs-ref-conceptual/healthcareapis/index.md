---
title: Azure REST API for Azure Health Data Services & API for FHIR | Microsoft Docs
ms.service: healthcare-apis
author: mikaelweave
ms.author: mikaelw
ms.manager: matjazl
---

# Azure Health Data Services & API for FHIR REST API reference

## Overview of Azure Health Data Services

Azure Health Data Services is a set of managed API services based on open standards and frameworks that enable workflows to improve healthcare and offer scalable and secure healthcare solutions. Using a set of managed API services and frameworks that’s dedicated to the healthcare industry is important and beneficial because health data collected from patients and healthcare consumers can be fragmented from across multiple systems, device types, and data formats.Gaining insights from health data is one of the biggest barriers to sustaining population and personal health and overall wellness understanding. Bringing disparate systems, workflows, and health data together is more important today. A unified and aligned approach to health data access, standardization, and trend capturing would enable the discovery of operational and clinical insights. We can streamline the process of connecting new device applications and enable new research projects. Using Azure Health Data Services as a scalable and secure healthcare solution can enable workflows to improve healthcare through insights discovered by bringing Protected Health Information (PHI) datasets together and connecting them end-to-end with tools for machine learning, analytics, and AI.

## Azure Health Data Services workspace

The Azure Health Data Services workspace is a logical container for all your healthcare service instances such as Fast Healthcare Interoperability Resources (FHIR®) services, Digital Imaging and Communications in Medicine (DICOM®) services, and MedTech service. The workspace also creates a compliance boundary (HIPAA, HITRUST) within which protected health information can travel.

You can provision multiple data services within a workspace, and by design, they work seamlessly with one another. With the workspace, you can organize all your Azure Health Data Services instances and manage certain configuration settings that are shared among all the underlying datasets and services where it's applicable. For more information, see [About workspace](https://docs.microsoft.com/azure/healthcare-apis/workspace-overview).

## Azure Health Data Services FHIR service

FHIR service includes FHIR APIs and endpoints in Azure for data access and storage in FHIR data format. A FHIR service manages PHI datasets in a secure and compliant cloud environment. Deploying a FHIR service allows you to bring together clinical heath data from multiple systems into the Azure Cloud based on the FHIR interoperable data standard published by HL7. For more information, see [About FHIR service](https://review.docs.microsoft.com/azure/healthcare-apis/fhir/overview).

## Azure Health Data Services DICOM service

DICOM (Digital Imaging and Communications in Medicine) is the international standard to transmit, store, retrieve, print, process, and display medical imaging information, and is the primary medical imaging standard accepted across healthcare. 

DICOM service is a managed service within Azure Health Data Services that ingests and persists DICOM objects at multiple thousands of images per second. It facilitates communication and transmission of imaging data with any DICOMweb™ enabled systems or applications via DICOMweb Standard APIs like Store (STOW-RS), Search (QIDO-RS), Retrieve (WADO-RS). It's backed by a managed Platform-as-a Service (PaaS) offering in the cloud with complete PHI compliance that you can upload PHI data to the DICOM service and exchange it through secure networks. For more information, see [About DICOM service](https://docs.microsoft.com/azure/healthcare-apis/dicom/dicom-services-overview).

## Azure Health Data Services MedTech service

MedTech service is an optional service of the Azure Health Data Services designed to ingest health data from multiple and disparate Internet of Medical Things (IoMT) devices and persisting the health data in a FHIR service. MedTech service transforms device data into FHIR®-based Observation resources and then persists the transformed messages into Azure Health Data Services FHIR service. Allowing for a unified approach to health data access, standardization, and trend capture enabling the discovery of operational and clinical insights, connecting new device applications, and enabling new research projects. For more information, see [About MedTech service](https://docs.microsoft.com/azure/healthcare-apis/iot/iot-connector-overview).

## Azure API for FHIR

Azure API for FHIR enables rapid exchange of data through FHIR APIs, backed by a managed Platform-as-a Service (PaaS) offering in the cloud. It makes it easier for anyone working with health data to ingest, manage, and persist Protected Health Information [PHI](https://www.hhs.gov/answers/hipaa/what-is-phi/index.html) in the cloud.

### Operations

Azure Health Data Services and API for FHIR REST API provides operations for working with the following resources:

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| [Dicom Services](/rest/api/healthcareapis/dicom-services) | Provides operations for working with DICOM services in Azure Health Data Services. |
| [Fhir Destinations](/rest/api/healthcareapis/fhir-destinations) | Provides operations for MedTech service FHIR destinations in Azure Health Data Services. |
| [Fhir Services](/rest/api/healthcareapis/fhir-destinations) | Provides operations for FHIR services in Azure Health Data Services. |
| [IoT Connector FHIR Destination](/rest/api/healthcareapis/iot-connector-fhir-destinations) | Provides operations for MedTech service Iot Connector FHIR destinations in Azure Health Data Services. |
| [IoT Connector](/rest/api/healthcareapis/iot-connector) | Provides operations for MedTech service Iot Connector in Azure Health Data Services. |
| [Operation Result](/rest/api/healthcareapis/operation-result) | Provides interactions for long running Operation Results in Azure API for FHIR. |
| [Operations](/rest/api/healthcareapis/operations) | Provides interactions for Operations in Azure API for FHIR. |
| [Private Endpoint Connections](/rest/api/healthcareapis/private-endpoint-connections) | Provides operations for Private Endpoint Connections in Azure API for FHIR. |
| [Private Link Resources](/rest/api/healthcareapis/private-link-resources) | Provides operations for Private Link Resources in Azure API for FHIR. |
| [Services](/rest/api/healthcareapis/services) | Provides operations for Services in Azure API for FHIR. |
| [Workspace Private Endpoint Connections](/rest/api/healthcareapis/workspace-private-endpoint-connections) | Provides operations for Workspace Private Endpoint Connections in Azure Health Data Services. |
| [Workspace Private Link Resources](/rest/api/healthcareapis/workspace-private-link-resources) | Provides operations for Workspace Private Link Resources in Azure Health Data Services. |
| [Workspaces](/rest/api/healthcareapis/workspaces) | Provides operations for Workspaces in Azure Health Data Services. |


## See also

* [Azure Health Data Services Documentation](https://docs.microsoft.com/azure/healthcare-apis/)
* [API for FHIR Documentation](https://docs.microsoft.com/azure/healthcare-apis/azure-api-for-fhir/)
