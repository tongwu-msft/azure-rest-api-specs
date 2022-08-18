---
ms.assetid: f21ddf47-4cbe-42e0-b6e8-670efa4f671d
title: Service Map REST API
description: "Service Map REST API Reference discovers application components on Windows and Linux systems and maps the communication between services."
ms.service: azure-maps
author: JasonWHowell
ms.author: jasonh
service_description: To be added
---


# Service Map REST API Reference

Service Map automatically discovers application components on Windows and Linux systems and maps the communication between services. It allows you to view your servers as you think of them – as interconnected systems that deliver critical services.  Service Map shows connections between servers, processes, and ports across any TCP-connected architecture with no configuration required other than installation of an agent.

The Service Map REST API allows you to query Service Map dependency data from any client that can call a REST API.

## REST Operation Groups

| Resource Groups                    | Description                                                          |
|------------------------------------|----------------------------------------------------------------------|
| [Client Groups](xref:management.azure.com.servicemap.clientgroups)    | Provides operations for retrieving information about client groups.  |
| [Machine Groups](xref:management.azure.com.servicemap.machinegroups)  | Provides operations for managing machine groups.                     |
| [Machines](xref:management.azure.com.servicemap.machines)             | Provides operations for retrieving information about machines.       |
| [Maps](xref:management.azure.com.servicemap.maps)                     | Provides operations for retrieving maps.                             |
| [Ports](xref:management.azure.com.servicemap.ports)                   | Provides operations for retrieving information about ports.          |
| [Processes](xref:management.azure.com.servicemap.processes)           | Provides operations for retrieving information about processes.      |
| [Summaries](xref:management.azure.com.servicemap.summaries)           | Provides operations for retrieving machine summary information       |


## See also

- [Service Map documentation](/azure/operations-management-suite/operations-management-suite-service-map)
- [Configuring Service Map](/azure/azure-monitor/insights/service-map#enable-service-map)
