---
title: Traffic Manager REST
ms.date: 08/09/2017
ms.service: traffic-manager
ms.devlang: rest-api
ms.topic: reference
author: georgewallace
ms.author: gwallace
manager: timlt
---
# Traffic Manager REST

Microsoft Azure Traffic Manager allows you to control the distribution of user traffic for service endpoints in different datacenters. Service endpoints supported by Traffic Manager include Azure VMs, Web Apps, and cloud services. You can also use Traffic Manager with external, non-Azure endpoints.

Each profile contains a list of endpoints.  These endpoints are child resource of the profile, each with their own unique resource id.  Thus endpoints can be managed in two ways: both by modifying the endpoints list when updating a profile, or by modifying the endpoint resource directly.  

| Operation Group | Description | 
|---------|-----------|
| [Endpoints](xref:management.azure.com.trafficmanager.endpoints)    |  Provides operations for managing endpoints. |  
| [Geographic Hierarchies](xref:management.azure.com.trafficmanager.geographichierarchies)       |  Provides operations for listing geographic hierarchies. | 
| [Profiles](xref:management.azure.com.trafficmanager.profiles)    |  Provides operations for managing profiles. |  
| [Heat Maps](xref:management.azure.com.trafficmanager.heatmap)    |  Provides operations for managing heat maps. |
| [Traffic Manager User Metrics Keys](xref:management.azure.com.trafficmanager.trafficmanagerusermetricskeys)    |  Provides operations for managing Traffic Manager User Metrics Keys. | 
