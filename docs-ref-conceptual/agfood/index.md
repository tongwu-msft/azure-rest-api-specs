---
title: Azure FarmBeats REST API Reference
description: Overview of Azure FarmBeats REST APIs
author: vijakum
ms.topic: reference
ms.date: 5/19/2021
ms.author: vijakum
ms.service: azure-industry
---

# What is Azure FarmBeats?

Azure FarmBeats is a fully managed service that enables you to acquire, aggregate, and process agricultural data from various sources like farm operations, weather, satellite, sensor, and so on, to build digital agriculture solutions. By using Azure FarmBeats, agriculture businesses can focus on core value-adds instead of the undifferentiated heavy lifting of data engineering. Azure FarmBeats enables you to query and reason through data, present in standardized schemas in a consistent way. FarmBeats also enables users to fuse data between data sources, and generate insights by rapidly training and building AI/ML models across data sets.

> [!NOTE]
> Azure FarmBeats is currently in preview. For more information, see [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/). Azure FarmBeats is provided without a service level agreement. Write to us at FarmBeatsSupport@microsoft.com for any queries.

## Azure FarmBeats REST APIs
The Azure FarmBeats REST API provides programmatic access to Azure FarmBeats resources to create, update, read, and delete farm management, satellite, weather & farm operations resources. The following is a high-level overview of the services that Azure FarmBeats offers: 

### Data-plane REST operation groups

#### Farm Management

| Operation group | Description |
|-----------------|-------------|
|[Farmers](/rest/api/azurefarmbeats/farmers)|Create, read, update and delete a Farmer resource.|
|[Farms](/rest/api/azurefarmbeats/farms)|Create, read, update and delete a Farm resource.|
|[Fields](/rest/api/azurefarmbeats/fields)|Create, read, update and delete a Field resource.|
|[Boundaries](/rest/api/azurefarmbeats/boundaries)|Create, read, update and delete a Boundary resource.|
|[Seasonal Fields](/rest/api/azurefarmbeats/seasonal-fields)|Create, read, update and delete a Seasonal field resource.|
|[Seasons](/rest/api/azurefarmbeats/seasons)|Create, read, update and delete a Season resource.|
|[Crops](/rest/api/azurefarmbeats/crops)|Create, read, update and delete a Crop resource.|
|[Crop Varieties](/rest/api/azurefarmbeats/crop-varieties)|Create, read, update and delete a Crop variety resource.|
|[Attachments](/rest/api/azurefarmbeats/attachments)|Create, read, update and delete an Attachment resource.|

#### Satellite

| Operation group | Description |
|-----------------|-------------|
|[Scenes](/rest/api/azurefarmbeats/scenes)|Ingest, query and download satellite scene images/data.|

#### Weather

| Operation group | Description |
|-----------------|-------------|
|[Weather](/rest/api/azurefarmbeats/weather)|Ingest, query download weather data.|

#### Farm operations

| Operation group | Description |
|-----------------|-------------|
|[Farm Operations](/rest/api/azurefarmbeats/farm-operations)|Ingest farm operations data for various operations.|
|[Application Data](/rest/api/azurefarmbeats/application-data)| Create, read, update and delete application data.|
|[Harvest Data](/rest/api/azurefarmbeats/harvest-data)| Create, read, update and delete harvest data.|
|[Planting Data](/rest/api/azurefarmbeats/planting-data)| Create, read, update and delete planting data.|
|[Tillage Data](/rest/api/azurefarmbeats/tillage-data)| Create, read, update and delete application data.|
|[oAuth Providers](/rest/api/azurefarmbeats/o-auth-providers)|Create, read, update and delete oAuth provider.|
|[oAuth Tokens](/rest/api/azurefarmbeats/o-auth-tokens)|Create connection link and read access token information.|
|[Image Processing](/rest/api/azurefarmbeats/image-processing)| Create an image processing rasterization job.|

### Azure Resource Manager REST operation groups

| Operation group | Description |
|-----------------|-------------|
|[Extensions](/rest/api/azurefarmbeats/extensions)|Install, uninstall, upgrade and weather extensions.|
|[FarmBeats Extensions](/rest/api/azurefarmbeats/farm-beats-extensions)|Get all weather extensions available in FarmBeats.|
|[FarmBeats Models](/rest/api/azurefarmbeats/farm-beats-models)| Create, read, update and delete a FarmBeats resource.|
|[Locations](/rest/api/azurefarmbeats/locations)|Checks the name availability of the resource with requested resource name.|
|[Operations](/rest/api/azurefarmbeats/operations)|Lists the available operations of Microsoft.AgFoodPlatform resource provider.|
