---
title: Azure Migrate REST API
author: snehaamicrosoft
ms.author: snehaa
ms.date: 08/08/2019
ms.topic: reference
ms.service: Azure
ms.devlang: rest-api
service_description: To be added
---

# Azure Migrate REST API

Azure Migrate helps you to migrate to Azure. Azure Migrate provides a centralized hub to track discovery, assessment, and migration of on-premises infrastructure, applications, and data to Azure. The hub provides Azure tools for assessment and migration, as well as third-party independent software vendor (ISV) offerings. To learn more about Azure Migrate, see the [Azure Migrate documentation](https://docs.microsoft.com/azure/migrate/migrate-overview).

> [!NOTE]
> There are [two versions of Azure Migrate](https://docs.microsoft.com/azure/migrate/migrate-services-overview#azure-migrate-versions) and the above capability is available with the new version. However, the REST APIs for the new version are not avaible yet and the REST APIs documented here are applicable only for the previous version that helped customers in assessment of on-premises workloads for migration to Azure.

## REST Operation Groups

**Operation Group** | **Details**
--- | ---
[Projects](https://docs.microsoft.com/rest/api/migrate/projects) | Provides operations for managing Azure Migrate projects.
[Groups](https://docs.microsoft.com/rest/api/migrate/groups) | Provides operations for managing groups.
[Machines](https://docs.microsoft.com/rest/api/migrate/machines) | Provides operations for accessing discovered machines.
[Assessments](https://docs.microsoft.com/rest/api/migrate/assessments) | Provides operations for managing assessments.
[Assessed machines](https://docs.microsoft.com/rest/api/migrate/assessedmachines) | Provides operations for accessing machines that are assessed in Azure Migrate.
[Operations](https://docs.microsoft.com/rest/api/migrate/operations) | Lists all available REST APIs for Azure Migrate.
