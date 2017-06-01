---
ms.assetid: f21ddf47-4cbe-42e0-b6e8-670efa4f671d
ms.title: Service Map REST API
ms.service: ServiceMap
author: daveirwin1
ms.author: dairwin
ms.manager: niburlin
service_description: To be added
---


# Service Map REST API Reference

Service Map automatically discovers application components on Windows and Linux systems and maps the communication between services. It allows you to view your servers as you think of them – as interconnected systems that deliver critical services.  Service Map shows connections between servers, processes, and ports across any TCP-connected architecture with no configuration required other than installation of an agent.

The Service Map REST API allows you to query Service Map dependency data from any client that can call a REST API.

## REST Operation Groups

| Resource Groups                    | Description                                                          |
|------------------------------------|----------------------------------------------------------------------|
| [Client Groups](./clientgroups)    | Provides operations for retrieving information about client groups.  |
| [Machine Groups](./machinegroups)  | Provides operations for managing machine groups.                     |
| [Machines](./machines)             | Provides operations for retrieving information about machines.       |
| [Maps](./maps)                     | Provides operations for retrieving maps.                             |
| [Ports](./ports)                   | Provides operations for retrieving information about ports.          |
| [Processes](./processes)           | Provides operations for retrieving information about processes.      |
| [Summaries](./summaries)           | Provides operations for retrieving machine summary information       |


## See also

- [Service Map documentation](https://docs.microsoft.com/azure/operations-management-suite/operations-management-suite-service-map)
- [Configuring Service Map](https://docs.microsoft.com/azure/operations-management-suite/operations-management-suite-service-map-configure)
