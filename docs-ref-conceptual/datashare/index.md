---
ms.title: Azure Data Share
ms.service: data-share
---

# Azure Data Share

[Azure Data Share](https://azure.microsoft.com/en-us/services/data-share/) is a cloud-based service which helps customers share data with other organizations. It provides centralized management, monitoring, and governance for sharing data from multiple Azure data sources. Using this service, you can quickly create shares which consist of multiple datasets from a variety of Azure data stores. You can invite your customers and external partners to access these shares through incremental snapshots of your data, and revoke access as needed.

Azure Data Share functionality is available through REST API endpoints which are detailed below.

## REST Operation Groups

| Operation Group | Description |
| --------------- | ----------- |
| [Accounts](./accounts) | Create, delete, get, list, or update accounts. |
| [Consumer Invitations](./consumerinvitations) | Get, list, or reject invitations. |
| [Consumer Source Data Sets](./consumersourcedatasets) | List the source data sets of a share subscription. |
| [Data Set Mappings](./datasetmappings) | Create, delete, get, or list data set mappings in a share subscription. |
| [Data Sets](./datasets) | Create, delete, get, or list data sets in a share. |
| [Invitations](./invitations) | Create, delete, get, or list invitations. |
| [Operations](./operations) | List the available REST API operations. |
| [Provider Share Subscriptions](./providersharesubscriptions) | Get, list, reinstate, or revoke share subscriptions in a provider share. |
| [Share Subscriptions](./sharesubscriptions) | Create, delete, get, or list share subscriptions. Initiate or cancel a synchronization, and list synchronizations, synchronization settings, and synchronization details. |
| [Share](./shares) | Create, delete, get, or list shares. List synchronizations and synchronization details of a share. |
| [Synchronization Settings](./synchronizationsettings) | Create, delete, get, or list synchronization settings in a share. |
| [Triggers](./triggers) | Create, delete, get, or list triggers in a share subscription. |
