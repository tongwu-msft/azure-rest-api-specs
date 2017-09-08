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
| [Endpoints](~/docs-ref-autogen/trafficmanager/Profiles.json)    |  Provides operations for managing endpoints. |  
| [Geographic Hierarchies](~/docs-ref-autogen/trafficmanager/Profiles.json)       |  Provides operations for listing geographic hierarchies. | 
| [Profiles](~/docs-ref-autogen/trafficmanager/Profiles.json)    |  Provides operations for managing profiles. |  
