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
|Farmers|Create, read, update and delete a Farmer resource.|
|Farms|Create, read, update and delete a Farm resource.|
|Fields|Create, read, update and delete a Field resource.|
|Boundaries|Create, read, update and delete a Boundary resource.|
|Seasonal Fields|Create, read, update and delete a Seasonal field resource.|
|Seasons|Create, read, update and delete a Season resource.|
|Crops|Create, read, update and delete a Crop resource.|
|Crop Varieties|Create, read, update and delete a Crop variety resource.|
|Attachments|Create, read, update and delete an Attachment resource.|

#### Satellite

| Operation group | Description |
|-----------------|-------------|
|Scenes|Ingest, query and download satellite scene images/data.|

#### Weather

| Operation group | Description |
|-----------------|-------------|
|Weather|Ingest, query download weather data.|

#### Farm operations

| Operation group | Description |
|-----------------|-------------|
|Farm Operations|Ingest farm operations data for various operations.|
|Application Data| Create, read, update and delete application data.|
|Harvest Data| Create, read, update and delete harvest data.|
|Planting Data| Create, read, update and delete planting data.|
|Tillage Data| Create, read, update and delete application data.|
|oAuth Providers|Create, read, update and delete oAuth provider.|
|oAuth Tokens|Create connection link and read access token information.|
|Image Processing| Create an image processing rasterization job.|

### Azure Resource Manager REST operation groups

| Operation group | Description |
|-----------------|-------------|
|Extensions|Install, uninstall, upgrade and weather extensions.|
|FarmBeats Extensions|Get all weather extensions available in FarmBeats.|
|FarmBeats Models| Create, read, update and delete a FarmBeats resource.|
|Locations|Checks the name availability of the resource with requested resource name.|
|Operations|Lists the available operations of Microsoft.AgFoodPlatform resource provider.|
