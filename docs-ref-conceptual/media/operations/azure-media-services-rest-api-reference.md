---
title: "Azure Media Services REST API Reference"
ms.custom: ""
ms.date: "2016-07-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "media-services"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 784dd5de-172d-4bf3-94e6-eb4499f51a82
caps.latest.revision: 23
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
# Media Services Operations REST API Reference

The Microsoft Azure Media Services REST API reference section describes the entities and functions that are used when creating, processing, managing, and delivering Assets.  
  
 The table below shows Media Services REST API versions. It also shows major modifications that were made in each version. To examine Media Services entities, entity properties, associations, functions, and so on, paste the following URI in a browser: https://media.windows.net/API/$metadata?api-version=2.x (where x is a version number).  
  
|x-ms-version|Description|  
|--------------------|-----------------|  
|2.15|Version and design updates were made to the **StreamingEndpoint**. For more information, see [StreamingEndpoint](../operations/streamingendpoint.md) and [Streaming endpoints overview](https://docs.microsoft.com/azure/media-services/media-services-streaming-endpoints-overview). Also, the following new properties: **CdnProvider**, **CdnProfile**, **FreeTrialEndTime**, **StreamingEndpointVersion** were added to **StreamingEndpoint**. |
|2.14|Internal changes|
|2.13|Telemetry related changes were added in this release: [MonitoringConfiguration](../operations/monitoringconfiguration.md). |  
|2.12|The following new types/properties were added:<br /><br /> FirstQuality<br /><br /> AssetFilter.FirstQuality<br /><br /> Filter.FirstQuality|  
|2.11|The following new entities were added:<br /><br /> [AssetFilter](../operations/assetfilter.md)<br /><br /> [Filter](../operations/filter.md)<br /><br /> [FilterTrackSelect](../operations/filtertrackselect.md)<br /><br /> [PresentationTimeRange](../operations/presentationtimerange.md)|  
|2.10|The following [Channel](../operations/channel.md)’s properties were added to support live encoding with Media Services:<br /><br /> `EncodingType`<br /><br /> `Encoding`<br /><br /> `Slate`<br /><br /> You can also signal to start and end advertisement and hide and how a slate image.|  
|2.9|The `CdnEnabled` property was added to [StreamingEndpoint](../operations/streamingendpoint.md).|  
|2.8|The following new entity was added: [EncodingReservedUnitType](../operations/encodingreservedunittype.md).|  
|2.7|Breaking change: **Origin** was renamed to [StreamingEndpoint](../operations/streamingendpoint.md). For more details, see [StreamingEndpoint](../operations/streamingendpoint.md).<br /><br /> Updated properties: [Asset](../operations/asset.md).<br /><br /> DeliveryPolicies.<br /><br /> New entities, complex types, and properties:<br /><br /> [AkamaiAccessControl](../operations/streamingendpoint.md#AkamaiAccessControl)<br /><br /> [AkamaiSignatureHeaderAuthenticationKey](../operations/streamingendpoint.md#AkamaiSignatureHeaderAuthenticationKey)<br /><br /> [AssetDeliveryPolicy](../operations/assetdeliverypolicy.md)<br /><br /> [Channel](../operations/channel.md)<br /><br /> [ChannelInput ComplexType](../operations/channel.md#ChannelInput)<br /><br /> [ChannelInputAccessControl ComplexType](../operations/channel.md#ChannelInputAccessControl)<br /><br /> [ChannelEndpoint ComplexType](../operations/channel.md#ChannelEndpoint)<br /><br /> [ChannelOutput ComplexType](../operations/channel.md#ChannelOutput)<br /><br /> [ChannelOutputHls ComplexType](../operations/channel.md#ChannelOutputHls)<br /><br /> [ChannelPreview ComplexType](../operations/channel.md#ChannelPreview)<br /><br /> [ChannelPreviewAccessControl ComplexType](../operations/channel.md#ChannelPreviewAccessControl)<br /><br /> [ContentKeyAuthorizationPolicy](../operations/contentkeyauthorizationpolicy.md)<br /><br /> [ContentKeyAuthorizationPolicyOption](../operations/contentkeyauthorizationpolicyoption.md)<br /><br /> [ContentKeyAuthorizationPolicyRestriction ComplexType Properties](../operations/contentkeyauthorizationpolicyoption.md#restrions)<br /><br /> [CrossSiteAccessPolicies](../operations/crosssiteaccesspolicies.md)<br /><br /> `IPAccessControl`. See [IPAccessControl](../operations/channel.md#IPAccessControl) and [StreamingEndpoint](../operations/streamingendpoint.md#IPAccessControl).<br /><br /> `IPRange`. See [IPRange ComplexType](../operations/channel.md#IPRange) and [StreamingEndpoint](../operations/streamingendpoint.md#IPRange).<br /><br /> [Program](../operations/program.md)<br /><br /> [StreamingEndpointAccessControl](../operations/streamingendpoint.md#StreamingEndpointAccessControl)<br /><br /> [StreamingEndpointCacheControl](../operations/streamingendpoint.md#StreamingEndpointCacheControl)|  
|2.6|Current.<br /><br /> No model updates.|  
|2.5|The `BytesUsed` property was added to [StorageAccount](../operations/storageaccount.md).|  
|2.4|No model updates.|  
|2.3|The `AuthorizationPolicyId` property was added to [ContentKey](../operations/contentkey.md).|  
|2.2|The following new entries were added to the model:<br /><br /> **Origin**<br /><br /> [StorageAccount](../operations/storageaccount.md)<br /><br /> [Operation](../operations/operation.md)<br /><br /> The following new properties were added to entities:<br /><br /> [Asset](../operations/asset.md): Uri, StorageAccountName, and StorageAccount.<br /><br /> [Locator](../operations/locator.md): Name.<br /><br /> [IngestManifest](../operations/ingestmanifest.md): StorageAccountName and StorageAccount.|  
|2.1|The following new entries were added to the model:<br /><br /> [NotificationEndPoint](../operations/notificationendpoint.md)<br /><br /> [JobNotificationSubscription](../operations/jobnotificationsubscription.md)|  
|2.0|Initial public release.|  
  
## In This Section  
 [AccessPolicy](../operations/accesspolicy.md)  
  
 [AssetDeliveryPolicy](../operations/assetdeliverypolicy.md)  
  
 [AssetFile](../operations/assetfile.md)  
  
 [Asset](../operations/asset.md)  
  
 [Channel](../operations/channel.md)  
  
 [ContentKey](../operations/contentkey.md)  
  
 [ContentKeyAuthorizationPolicy](../operations/contentkeyauthorizationpolicy.md)  
  
 [ContentKeyAuthorizationPolicyOption](../operations/contentkeyauthorizationpolicyoption.md)  
  
 [CrossSiteAccessPolicies](../operations/crosssiteaccesspolicies.md)  
  
 [ErrorDetail](../operations/errordetail.md)  
  
 [IngestManifest](../operations/ingestmanifest.md)  
  
 [IngestManifestAsset](../operations/ingestmanifestasset.md)  
  
 [IngestManifestFile](../operations/ingestmanifestfile.md)  
  
 [IngestManifestStatistics](../operations/ingestmanifeststatistics.md)  
  
 [Job](../operations/job.md)  
  
 [JobTemplate](../operations/jobtemplate.md)  
  
 [Locator](../operations/locator.md)  
  
 [MediaProcessor](../operations/mediaprocessor.md)  
  
 [NotificationEndPoint](../operations/notificationendpoint.md)  
  
 [Operation](../operations/operation.md)  
  
 [Program](../operations/program.md)  
  
 [StorageAccount](../operations/storageaccount.md)  
  
 [StreamingEndpoint](../operations/streamingendpoint.md)  
  
 [Task](../operations/task.md)  
  
 [TaskHistoricalEvent](../operations/taskhistoricalevent.md)  
  
 [TaskTemplate](../operations/tasktemplate.md)  
  
 [REST API Functions](../operations/rest-api-functions.md)  
  
## Reference  
  
## Related Sections
