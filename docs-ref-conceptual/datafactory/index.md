---
ms.assetid: b5b9ca4d-ede3-491c-8dbc-96f6b5d2912d
ms.title: Azure Data Factory
ms.service: data-factory
author: spelluru
ms.author: spelluru
ms.manager: jhubbard
service_description: To be added
---


# Azure Data Factory 
Azure Data Factory is a cloud-based data integration service that orchestrates and automates the movement and transformation of data. You can create data integration solutions using the Data Factory service that can ingest data from various data stores, transform/process the data, and publish the result data to the data stores. 

Currently, there are two versions of the service: version 1 (V1) and version 2 (V2).

## Version 1 
Data Factory version 1 (V1) service allows you to create data pipelines that move and transform data, and then run the pipelines on a specified schedule (hourly, daily, weekly, etc.). It also provides rich visualizations to display the lineage and dependencies between your data pipelines, and monitor all your data pipelines from a single unified view to easily pinpoint issues and setup monitoring alerts.

See [V1 REST API reference](v1.md) for a list of operations supported by Data Factory V1. To learn about the service, see [Introduction to Data Factory V1](https://azure.microsoft.com/documentation/services/data-factory/v1/data-factory-introduction/). 

## Version 2
Data Factory version 2 (V2) builds upon the Data Factory V1 and supports a broader set of cloud-first data integration scenarios. The additional capabilities of Data Factory include: 

- Control flow: branching, looping and conditional processing
- Deploy and run SQL Server Integration Services (SSIS) packages in Azure.
- Support for virtual network (VNET) environments. 
- Scale out with on-demand processing power.
- Support for on-demand Spark cluster.
- Flexible scheduling to support incremental data loads. 
- Triggers for executing data pipelines.  

See [V2 REST API Reference](v2.md) for a list of operations supported by Data Factory V2. To learn about the service, see [Introduction to Data Factory V2](https://azure.microsoft.com/documentation/services/data-factory/introduction/).
