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
|2.13||  
|2.12|The following new types/properties were added:<br /><br /> FirstQuality<br /><br /> AssetFilter.FirstQuality<br /><br /> Filter.FirstQuality|  
|2.11|The following new entities were added:<br /><br /> [AssetFilter](../services/assetfilter.md)<br /><br /> [Filter](../services/filter.md)<br /><br /> [FilterTrackSelect](../services/filtertrackselect.md)<br /><br /> [PresentationTimeRange](../services/presentationtimerange.md)|  
|2.10|The following [Channel](../services/channel.md)’s properties were added to support live encoding with Media Services:<br /><br /> `EncodingType`<br /><br /> `Encoding`<br /><br /> `Slate`<br /><br /> You can also signal to start and end advertisement and hide and how a slate image.|  
|2.9|The `CdnEnabled` property was added to [StreamingEndpoint](../services/streamingendpoint.md).|  
|2.8|The following new entity was added: [EncodingReservedUnitType](../services/encodingreservedunittype.md).|  
|2.7|Breaking change: **Origin** was renamed to [StreamingEndpoint](../services/streamingendpoint.md). For more details, see [StreamingEndpoint](../services/streamingendpoint.md).<br /><br /> Updated properties: [Asset](../services/asset.md).<br /><br /> DeliveryPolicies.<br /><br /> New entities, complex types, and properties:<br /><br /> [AkamaiAccessControl](../services/streamingendpoint.md#AkamaiAccessControl)<br /><br /> [AkamaiSignatureHeaderAuthenticationKey](../services/streamingendpoint.md#AkamaiSignatureHeaderAuthenticationKey)<br /><br /> [AssetDeliveryPolicy](../services/assetdeliverypolicy.md)<br /><br /> [Channel](../services/channel.md)<br /><br /> [ChannelInput ComplexType](../services/channel.md#ChannelInput)<br /><br /> [ChannelInputAccessControl ComplexType](../services/channel.md#ChannelInputAccessControl)<br /><br /> [ChannelEndpoint ComplexType](../services/channel.md#ChannelEndpoint)<br /><br /> [ChannelOutput ComplexType](../services/channel.md#ChannelOutput)<br /><br /> [ChannelOutputHls ComplexType](../services/channel.md#ChannelOutputHls)<br /><br /> [ChannelPreview ComplexType](../services/channel.md#ChannelPreview)<br /><br /> [ChannelPreviewAccessControl ComplexType](../services/channel.md#ChannelPreviewAccessControl)<br /><br /> [ContentKeyAuthorizationPolicy](../services/contentkeyauthorizationpolicy.md)<br /><br /> [ContentKeyAuthorizationPolicyOption](../services/contentkeyauthorizationpolicyoption.md)<br /><br /> [ContentKeyAuthorizationPolicyRestriction ComplexType Properties](../services/contentkeyauthorizationpolicyoption.md#restrions)<br /><br /> [CrossSiteAccessPolicies](../services/crosssiteaccesspolicies.md)<br /><br /> `IPAccessControl`. See [IPAccessControl](../services/channel.md#IPAccessControl) and [StreamingEndpoint](../services/streamingendpoint.md#IPAccessControl).<br /><br /> `IPRange`. See [IPRange ComplexType](../services/channel.md#IPRange) and [StreamingEndpoint](../services/streamingendpoint.md#IPRange).<br /><br /> [Program](../services/program.md)<br /><br /> [StreamingEndpointAccessControl](../services/streamingendpoint.md#StreamingEndpointAccessControl)<br /><br /> [StreamingEndpointCacheControl](../services/streamingendpoint.md#StreamingEndpointCacheControl)|  
|2.6|Current.<br /><br /> No model updates.|  
|2.5|The `BytesUsed` property was added to [StorageAccount](../services/storageaccount.md).|  
|2.4|No model updates.|  
|2.3|The `AuthorizationPolicyId` property was added to [ContentKey](../services/contentkey.md).|  
|2.2|The following new entries were added to the model:<br /><br /> **Origin**<br /><br /> [StorageAccount](../services/storageaccount.md)<br /><br /> [Operation](../services/operation.md)<br /><br /> The following new properties were added to entities:<br /><br /> [Asset](../services/asset.md): Uri, StorageAccountName, and StorageAccount.<br /><br /> [Locator](../services/locator.md): Name.<br /><br /> [IngestManifest](../services/ingestmanifest.md): StorageAccountName and StorageAccount.|  
|2.1|The following new entries were added to the model:<br /><br /> [NotificationEndPoint](../services/notificationendpoint.md)<br /><br /> [JobNotificationSubscription](../services/jobnotificationsubscription.md)|  
|2.0|Initial public release.|  
  
## In This Section  
 [AccessPolicy](../services/accesspolicy.md)  
  
 [AssetDeliveryPolicy](../services/assetdeliverypolicy.md)  
  
 [AssetFile](../services/assetfile.md)  
  
 [Asset](../services/asset.md)  
  
 [Channel](../services/channel.md)  
  
 [ContentKey](../services/contentkey.md)  
  
 [ContentKeyAuthorizationPolicy](../services/contentkeyauthorizationpolicy.md)  
  
 [ContentKeyAuthorizationPolicyOption](../services/contentkeyauthorizationpolicyoption.md)  
  
 [CrossSiteAccessPolicies](../services/crosssiteaccesspolicies.md)  
  
 [ErrorDetail](../services/errordetail.md)  
  
 [IngestManifest](../services/ingestmanifest.md)  
  
 [IngestManifestAsset](../services/ingestmanifestasset.md)  
  
 [IngestManifestFile](../services/ingestmanifestfile.md)  
  
 [IngestManifestStatistics](../services/ingestmanifeststatistics.md)  
  
 [Job](../services/job.md)  
  
 [JobTemplate](../services/jobtemplate.md)  
  
 [Locator](../services/locator.md)  
  
 [MediaProcessor](../services/mediaprocessor.md)  
  
 [NotificationEndPoint](../services/notificationendpoint.md)  
  
 [Operation](../services/operation.md)  
  
 [Program](../services/program.md)  
  
 [StorageAccount](../services/storageaccount.md)  
  
 [StreamingEndpoint](../services/streamingendpoint.md)  
  
 [Task](../services/task.md)  
  
 [TaskHistoricalEvent](../services/taskhistoricalevent.md)  
  
 [TaskTemplate](../services/tasktemplate.md)  
  
 [REST API Functions](../services/rest-api-functions.md)  
  
## Reference  
  
## Related Sections