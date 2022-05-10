---
title: Azure Database Migration Service
description: Learn how Azure Database Migration Service is a fully managed service designed to enable seamless migrations from multiple database sources to Azure Data platforms.
ms.service: azure
---
# Azure Database Migration Service

Azure Database Migration Service is a fully managed service designed to enable seamless migrations from multiple database sources to Azure Data platforms with minimal downtime (online migrations). For a more detailed overview, see the [Azure Database Migration Service product page](https://azure.microsoft.com/services/database-migration/).

## REST Operation Groups

| Operation Group | Description |
|------|------|
| [Services](xref:management.azure.com.datamigration.services) | Provides operations for managing top-level resources that represent the Database Migration Service. |
| [Projects](xref:management.azure.com.datamigration.projects) | Provides operations for managing the nested resources representing stored migration projects. |
| [Tasks](xref:management.azure.com.datamigration.tasks) | Provides operations for managing the nested resources representing work performed by a DMS instance. This work includes migration, validation, etc. |
