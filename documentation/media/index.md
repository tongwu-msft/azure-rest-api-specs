---
ms.assetid: 381a2cde-b6d2-4482-8de9-4b6740ac3805
ms.title: Azure Media Services API Management
ms.service: media
author: Juliako	
ms.author: juliako	
ms.manager: erikre
---



# Azure Media Services API Management


Azure Media Services (AMS) resources may be created and managed programmatically using APIs provided by the AMS Resource Provider. The APIs are available through the Azure Resource Manager (ARM) REST API endpoints.

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|Create a Media Service|Creates a Media Service account and returns the new account.|
|Update a Media Service|Updates a Media Service account. |
|Get information about a Media Service|Returns the details about the Media Services account.
|List all Media Services in a resource group|Lists all of the Media Services accounts in a resource group.
|Delete a Media Service|Deletes a Media Service account.|
|Check name availability|Checks whether the Media Service resource name is available. The name must be globally unique.|
|List REST endpoint keys|Lists the keys for a Media Service account.|
|Regenerate a REST endpoint key|Regenerates the specified (primary or secondary) key for a Media Service account.|
|Sync storage account keys|Synchronizes storage account keys for a storage account associated with the Media Service account.|


