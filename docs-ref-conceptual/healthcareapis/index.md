---
title: Azure Health Data Services | Microsoft Docs
ms.service: healthcare-apis
author: mikaelweave
ms.author: mikaelw
ms.manager: matjazl
---

# Azure Health Data Services REST API reference

## Overview of Azure Health Data Services

Azure Health Data Services is a set of managed API services based on open standards and frameworks that enable workflows to improve healthcare and offer scalable and secure healthcare solutions. Using a set of managed API services and frameworks that’s dedicated to the healthcare industry is important and beneficial because health data collected from patients and healthcare consumers can be fragmented from across multiple systems, device types, and data formats.Gaining insights from health data is one of the biggest barriers to sustaining population and personal health and overall wellness understanding. Bringing disparate systems, workflows, and health data together is more important today. A unified and aligned approach to health data access, standardization, and trend capturing would enable the discovery of operational and clinical insights. We can streamline the process of connecting new device applications and enable new research projects. Using Azure Health Data Services as a scalable and secure healthcare solution can enable workflows to improve healthcare through insights discovered by bringing Protected Health Information (PHI) datasets together and connecting them end-to-end with tools for machine learning, analytics, and AI.

**Azure Health Data Services enables you to**:

- Quickly connect disparate health data sources and formats such as structured, imaging, and device data and normalize it to be persisted in the cloud.
Transform and ingest data into FHIR. For example, you can transform health data from legacy formats, such as HL7v2 or CDA, or from high frequency IoT data in device proprietary formats to FHIR.
- Connect your data stored in Azure Health Data Services with services across the Azure ecosystem, like Synapse, and products across Microsoft, like Teams, to derive new insights through analytics and machine learning and to enable new workflows as well as connection to SMART on FHIR applications.
- Manage advanced workloads with enterprise features that offer reliability, scalability, and security to ensure that your data is protected, meets privacy and compliance certifications required for the healthcare industry.

## Azure Health Data Services workspace

The Azure Health Data Services workspace is a logical container for all your healthcare service instances such as Fast Healthcare Interoperability Resources (FHIR®) services, Digital Imaging and Communications in Medicine (DICOM®) services, and MedTech service. The workspace also creates a compliance boundary (HIPAA, HITRUST) within which protected health information can travel.

You can provision multiple data services within a workspace, and by design, they work seamlessly with one another. With the workspace, you can organize all your Azure Health Data Services instances and manage certain configuration settings that are shared among all the underlying datasets and services where it's applicable. For more information, see [About workspace](https://docs.microsoft.com/azure/healthcare-apis/workspace-overview).

## FHIR service

FHIR service includes FHIR APIs and endpoints in Azure for data access and storage in FHIR data format. A FHIR service manages PHI datasets in a secure and compliant cloud environment. Deploying a FHIR service allows you to bring together clinical heath data from multiple systems into the Azure Cloud based on the FHIR interoperable data standard published by HL7. For more information, see [About FHIR service](https://review.docs.microsoft.com/azure/healthcare-apis/fhir/overview).

## DICOM service

DICOM (Digital Imaging and Communications in Medicine) is the international standard to transmit, store, retrieve, print, process, and display medical imaging information, and is the primary medical imaging standard accepted across healthcare. 

DICOM service is a managed service within Azure Health Data Services that ingests and persists DICOM objects at multiple thousands of images per second. It facilitates communication and transmission of imaging data with any DICOMweb™ enabled systems or applications via DICOMweb Standard APIs like Store (STOW-RS), Search (QIDO-RS), Retrieve (WADO-RS). It's backed by a managed Platform-as-a Service (PaaS) offering in the cloud with complete PHI compliance that you can upload PHI data to the DICOM service and exchange it through secure networks. For more information, see [About DICOM service](https://docs.microsoft.com/azure/healthcare-apis/dicom/dicom-services-overview).

## MedTech service

MedTech service is an optional service of the Azure Health Data Services designed to ingest health data from multiple and disparate Internet of Medical Things (IoMT) devices and persisting the health data in a FHIR service. MedTech service transforms device data into FHIR®-based Observation resources and then persists the transformed messages into Azure Health Data Services FHIR service. Allowing for a unified approach to health data access, standardization, and trend capture enabling the discovery of operational and clinical insights, connecting new device applications, and enabling new research projects. For more information, see [About MedTech service](https://docs.microsoft.com/azure/healthcare-apis/iot/iot-connector-overview)

## Operations

Azure Health Data Services REST API provides operations for working with the following resources:

| Operation group | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| [Get](/rest/api/healthcareapis/operationresults/get) | Get the operation result for a long running operation. |


## See also

* [Azure Health Data Services](https://docs.microsoft.com/azure/healthcare-apis/)
