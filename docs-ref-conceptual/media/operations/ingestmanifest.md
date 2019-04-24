---
title: "IngestManifest"
ms.custom: ""
ms.date: "03/14/2018"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "media-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 4a3de109-6c13-4f6d-9c3c-fdf46c956eaf
caps.latest.revision: 24
author: "Juliako"
ms.author: "juliako"
manager: "erikre"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# IngestManifest
An IngestManifest represents a set of assets to be created through bulk ingesting along with their associated asset files. Bulk ingesting allows you to decouple the file upload process from asset creation. As a result, a high-performance file upload method can be used for large file sets during asset creation. Once an IngestManifestAssets is created, along with its associated IngestManifestFiles, Microsoft Azure Media Services watches the Blob storage container associated with the IngestManifest via the **BlobStorageUriForUpload** property. As each file upload to the Blob storage container completes, Microsoft Azure Media Services completes a new asset for the respective IngestManifestAsset that contains that file.  
  
 This article gives an overview of the `IngestManifest` entity and also demonstrates how to execute various operations with the Media Services REST API.  
  
-   [IngestManifest Entity Properties](../operations/ingestmanifest.md#ingestmanifest_entity_properties)  
  
-   [Create an IngestManifest](../operations/ingestmanifest.md#create_an_ingestmanifest)  
  
-   [List an IngestManifest](../operations/ingestmanifest.md#list_an_ingestmanifest)  
  
-   [Update an IngestManifest](../operations/ingestmanifest.md#update_an_ingestmanifest)  
  
-   [Delete an Ingest Manifest](../operations/ingestmanifest.md#delete_an_ingestManifest)  
  
> [!IMPORTANT]
> When accessing entities in Media Services, you must set specific header fields and values in your HTTP requests. <br/>For more information, see [Setup for Media Services REST API Development](https://docs.microsoft.com/azure/media-services/media-services-rest-how-to-use) and [Connecting to Media Services with the Media Services REST API](https://docs.microsoft.com/azure/media-services/media-services-use-aad-auth-to-access-ams-api).  

> [!NOTE]
>  Each IngestManifestAssetFile associated with an IngestManifest must have a unique filename in the manifest.  
  
##  <a name="ingestmanifest_entity_properties"></a> IngestManifest Entity Properties  
  
|Property|Type|Description|  
|--------------|----------|-----------------|  
|`Id`<br /><br /> Read-only. Set by Media Services at creation time.|Edm.String|Unique identifier.|  
|`Created`<br /><br /> Read-only. Set by Media Services at creation time.|Edm.DateTime|Represents the number of milliseconds since midnight Jan 1, 1970.|  
|`LastModified`<br /><br /> Read-only. Set by Media Services.|Edm.DateTime|This value is updated by Media Services after any property changes are made. It represents the number of milliseconds since midnight Jan 1, 1970.|  
|`Name`<br /><br /> Optional.|Edm.String|Friendly name for your IngestManifest.|  
|`State`<br /><br /> Read-only. Set by Media Services.|Edm.Int32|The current state of the manifest. This value can be one of the following:<br /><br /> -   **Inactive** = 0: No pending asset creations remain. All have either completed or encountered an error.<br />-   **Activating** = 1: The manifest is not yet ready to receive files uploaded to the Blob container.<br />-   **Active** = 2: There are IngestManifestAssets pending creations and the Blob container is being monitored.|  
|`BlobStorageUriForUpload`<br /><br /> Read-only. Set by Media Services.|Edm.String|This value is set by Media Services. This value specifies the Uri of the Blob storage container, which receives the file uploads needed to complete the IngestManifestAssets.|  
|`Statistics`<br /><br /> Read-only. Set by Media Services.|[IngestManifestStatistics](../operations/ingestmanifeststatistics.md)|This complex type contains statistic information to help determine the current progress of the creation of IngestManifestAssets based on all asset files related to the manifest.|  
|`IngestManifestAssets`<br /><br /> Read-only. Set by Media Services.|[IngestManifestAsset](../operations/ingestmanifestasset.md) entity set|Navigation property that can be accessed by referencing a specific IngestManifestAsset by Id value. The returned entity set contains all IngestManifestAssets contained in the IngestManifest.|  
|`PendingIngestManifestAssets`<br /><br /> Read-only. Set by Media Services.|[IngestManifestAsset](../operations/ingestmanifestasset.md) entity set|Navigation property that can be accessed by referencing a specific IngestManifestAsset by Id value. The returned entity set contains all IngestManifestAssets pending file upload or asset creation.|  
|`StorageAccountName`<br /><br /> Optional. Cannot be updated after the entity has been created.|Edm.String|Name of the storage account that contains the blob container where the files are uploaded.<br /><br /> If not specified at creation time, Media Services sets the default storage account name.<br /><br /> IngestManifestAsset.Asset has to use the same storage account as specified in the IngestManifest.|  
|`StorageAccount`<br /><br /> Read-only. Set by Media Services.|StorageAccount entity set.|The returned entity set contains all of the StorageAccount entities that are linked to the specified Asset.|  
  
##  <a name="create_an_ingestmanifest"></a> Create an IngestManifest  
 IngestManifests can be created by using an HTTP POST request and passing a request body that contains the name of the new IngestManifest.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|POST|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/IngestManifests|HTTP/1.1|  
  
### Sample Request  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
```  
POST https:// media.windows.net/API/IngestManifests HTTP/1.1  
Content-Type: application/json;odata=verbose  
Accept: application/json;odata=verbose  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
x-ms-version: 2.11  
Authorization: Bearer http%3a%2f%2fschemas.xmlsoap.org%2fws%2f2005%2f05%2fidentity%2fclaims%2fnameidentifier=070500D0-F35C-4A5A-9249-485BBF4EC70B&http%3a%2f%2fschemas.microsoft.com%2faccesscontrolservice%2f2010%2f07%2fclaims%2fidentityprovider=https%3a%2f%2fwamsprodglobal001acs.accesscontrol.windows.net%2f&Audience=urn%3aWindowsAzureMediaServices&ExpiresOn=1334275521&Issuer=https%3a%2f%2fwamsprodglobal001acs.accesscontrol.windows.net%2f&HMACSHA256=GxdBb%2fmEyN7iHdNxbawawHRftLhPFFqxX1JZckuv3hY%3d  
Host: media.windows.net  
Content-Length: 36  
Expect: 100-continue  
  
{ "Name" : "ExampleManifestREST" }  
  
```  
  
##  <a name="list_an_ingestmanifest"></a> List an IngestManifest  
 IngestManifests can be retrieved using an HTTP GET request. You can request an ingest manifest by its Id or request all manifests.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|GET|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/IngestManifests|HTTP/1.1|  
|GET|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/IngestManifests(‘IngestManifest Id’)|HTTP/1.1|  
  
### Sample Request  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
```  
GET https://<accountname>.restv2.<location>.media.azure.net/api/IngestManifests('nb:mid:UUID:a2f9a230-831e-5e40-bafa-fbf8decbee26') HTTP/1.1  
Content-Type: application/json;odata=verbose  
Accept: application/json;odata=verbose  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
x-ms-version: 2.11  
Authorization: Bearer http%3a%2f%2fschemas.xmlsoap.org%2fws%2f2005%2f05%2fidentity%2fclaims%2fnameidentifier=070500D0-F35C-4A5A-9249-485BBF4EC70B&http%3a%2f%2fschemas.microsoft.com%2faccesscontrolservice%2f2010%2f07%2fclaims%2fidentityprovider=https%3a%2f%2fwamsprodglobal001acs.accesscontrol.windows.net%2f&Audience=urn%3aWindowsAzureMediaServices&ExpiresOn=1334275521&Issuer=https%3a%2f%2fwamsprodglobal001acs.accesscontrol.windows.net%2f&HMACSHA256=GxdBb%2fmEyN7iHdNxbawawHRftLhPFFqxX1JZckuv3hY%3d  
Host: media.windows.net  
Content-Length: 0  
```  
  
##  <a name="update_an_ingestmanifest"></a> Update an IngestManifest  
 IngestManifests can be updated by referencing the IngestManifest Id with an HTTP MERGE request. The request body contains the properties to be updated.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|MERGE|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/IngestManifests(‘IngestManifest Id’)|HTTP/1.1|  
  
### Sample Request  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
```  
MERGE https:// media.windows.net /API/IngestManifests('nb:mid:UUID:076faa09-8f5d-ce41-9de3-32ba66190271') HTTP/1.1  
Content-Type: application/json;odata=verbose  
Accept: application/json;odata=verbose  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
x-ms-version: 2.11  
Authorization: Bearer http%3a%2f%2fschemas.xmlsoap.org%2fws%2f2005%2f05%2fidentity%2fclaims%2fnameidentifier=070500D0-F35C-4A5A-9249-485BBF4EC70B&http%3a%2f%2fschemas.microsoft.com%2faccesscontrolservice%2f2010%2f07%2fclaims%2fidentityprovider=https%3a%2f%2fwamsprodglobal001acs.accesscontrol.windows.net%2f&Audience=urn%3aWindowsAzureMediaServices&ExpiresOn=1334275521&Issuer=https%3a%2f%2fwamsprodglobal001acs.accesscontrol.windows.net%2f&HMACSHA256=GxdBb%2fmEyN7iHdNxbawawHRftLhPFFqxX1JZckuv3hY%3d  
Host: media.windows.net  
Content-Length: 43  
Expect: 100-continue  
  
{ "Name" : "ExampleManifestUpdated" }  
  
```  
  
##  <a name="delete_an_ingestManifest"></a> Delete an Ingest Manifest  
 IngestManifests can be deleted by referencing the IngestManifest Id value with an HTTP DELETE request.  
  
|Method|Request URI|HTTP Version|  
|------------|-----------------|------------------|  
|DELETE|https://&lt;accountname&gt;.restv2.&lt;location&gt;.media.azure.net/api/IngestManifests(‘IngestManifest Id’)|HTTP/1.1|  
  
### Sample Request  
  
 To get the latest `x-ms-version:`, see [Media Services REST](../operations/azure-media-services-rest-api-reference.md).  
  
```  
DELETE https://<accountname>.restv2.<location>.media.azure.net/api/IngestManifests('nb:mid:UUID:45ea3cd0-b3cf-994b-8e4d-03c9620c22da') HTTP/1.1  
Content-Type: application/json;odata=verbose  
Accept: application/json;odata=verbose  
DataServiceVersion: 3.0  
MaxDataServiceVersion: 3.0  
x-ms-version: 2.11  
Authorization: Bearer http%3a%2f%2fschemas.xmlsoap.org%2fws%2f2005%2f05%2fidentity%2fclaims%2fnameidentifier=070500D0-F35C-4A5A-9249-485BBF4EC70B&http%3a%2f%2fschemas.microsoft.com%2faccesscontrolservice%2f2010%2f07%2fclaims%2fidentityprovider=https%3a%2f%2fwamsprodglobal001acs.accesscontrol.windows.net%2f&Audience=urn%3aWindowsAzureMediaServices&ExpiresOn=1334275521&Issuer=https%3a%2f%2fwamsprodglobal001acs.accesscontrol.windows.net%2f&HMACSHA256=GxdBb%2fmEyN7iHdNxbawawHRftLhPFFqxX1JZckuv3hY%3d  
Host: media.windows.net  
Content-Length: 0  
  
```  
  
## See Also  
 [AccessPolicy](../operations/accesspolicy.md)   
 [AssetFile](../operations/assetfile.md)   
 [Asset](../operations/asset.md)   
 [ContentKey](../operations/contentkey.md)   
 [IngestManifestAsset](../operations/ingestmanifestasset.md)   
 [IngestManifestFile](../operations/ingestmanifestfile.md)   
 [IngestManifestStatistics](../operations/ingestmanifeststatistics.md)   
 [Job](../operations/job.md)   
 [JobTemplate](../operations/jobtemplate.md)   
 [Locator](../operations/locator.md)   
 [MediaProcessor](../operations/mediaprocessor.md)   
 [Task](../operations/task.md)   
 [TaskTemplate](../operations/tasktemplate.md)   
 [Quotas and Limitations](http://msdn.microsoft.com/en-us/82f7e538-6bdf-4883-aa50-24574cc4996e)